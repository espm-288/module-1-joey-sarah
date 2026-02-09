# Generate CO2 emissions plot
library(duckdbfs)
library(dplyr)
library(ggplot2)

# Install scales if needed
if (!requireNamespace("scales", quietly = TRUE)) {
  install.packages("scales")
}
library(scales)

# Connect to remote dataset
duckdbfs::duckdb_secrets(
  key = "",
  secret = "",
  endpoint = "s3.amazonaws.com",
  region = "us-west-2"
)
s3_url <- "s3://us-west-2.opendata.source.coop/youssef-harby/exiobase-3/4588235/parquet/**"
exio <- open_dataset(s3_url)

# Get CO2 data
co2 <- exio |>
  filter(matrix == "F_satellite") |>
  filter(grepl("CO2|carbon dioxide", stressor, ignore.case = TRUE))

# Get top 5 emitters in 2022
co2_top5 <- co2 |>
  filter(year == 2022) |>
  group_by(region) |>
  summarize(total_co2 = sum(value, na.rm = TRUE)) |>
  collect() |>
  arrange(desc(total_co2)) |>
  head(5)

print("Top 5 CO2 emitters in 2022:")
print(co2_top5)

# Get time series for top 5
co2_top5_filtered <- co2 |>
  filter(region %in% co2_top5$region) |>
  group_by(region, year) |>
  summarize(total_co2 = sum(value, na.rm = TRUE), .groups = "drop") |>
  collect()

# Create plot
p <- ggplot(co2_top5_filtered, aes(x = year, y = total_co2, color = region)) +
  geom_line(linewidth = 1) +
  labs(
    title = "Top 5 CO2 Emitters Over Time",
    x = "Year",
    y = "Total CO2 Emissions (kg)",
    color = "Region"
  ) +
  theme_minimal() +
  scale_y_continuous(labels = scales::comma)

# Save plot
ggsave(
  filename = "co2_top5_plot.png",
  plot = p,
  width = 10,
  height = 6,
  dpi = 150
)

cat("\n✓ Plot saved to: co2_top5_plot.png\n")
cat("Open it with: open co2_top5_plot.png\n")
