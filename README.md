# Module 1: Tabular Data

Working with larger-than-RAM data using duckdbfs

## Overview

This module explores high-performance workflows for tabular data using `duckdbfs` to work with datasets that are larger than available RAM by leveraging DuckDB's streaming and remote file access capabilities.

## Case Study: Global Supply Chains

We analyze [EXIOBASE 3.8.1](https://source.coop/youssef-harby/exiobase-3), a global Multi-Regional Input-Output (MRIO) database that tracks economic transactions between sectors and regions, along with their environmental impacts (emissions, resource use, etc.).

**Dataset Features:**
- **Coverage**: 44 countries + 5 rest-of-world regions
- **Timeframe**: 1995–2022
- **Content**: Economic transactions (Z matrix), final demand (Y matrix), and environmental stressors (F matrix)
- **Format**: Cloud-optimized Parquet, partitioned by year and matrix type

## Learning Objectives

1. Connect to remote data without downloading it
2. Perform efficient filtering operations on large datasets
3. Analyze global supply chain data and environmental impacts

## Prerequisites

- R with `duckdbfs` and `dplyr` packages installed

## Files

- `tabular-data.qmd`: Main Quarto document with exercises and analysis
