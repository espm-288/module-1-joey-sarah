# tabular-data-template
Module 1

## Tabular data summary

This module introduces high-performance workflows for working with large tabular datasets using DuckDB and the `duckdbfs` package. The case study uses EXIOBASE 3.8.1, a multi-regional input-output (MRIO) database (44 countries + 5 rest-of-world regions) covering 1995–2022, stored as cloud-optimized partitioned Parquet files. Exercises demonstrate connecting to remote data with `open_dataset()`, filtering large datasets before collecting into R (to stay memory-efficient), and querying environmental flows (e.g., CO2 emissions) to answer tasks like finding the top sectors by emissions for a given country and year. Required R packages include `duckdbfs` and `dplyr`.
