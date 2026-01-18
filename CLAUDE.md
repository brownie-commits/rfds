# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Exercises and examples from "R for Data Science" (2nd edition) by Hadley Wickham & Garrett Grolemund. Covers tidyverse fundamentals including data visualization, transformation, and iteration.

## Project Structure

```
rfds/
├── code/
│   ├── RforDataScience.R    # Main chapter exercises
│   ├── iteration.R          # Chapter on iteration/loops
│   ├── vectors.R            # Vectors chapter
│   └── R/                   # Additional R scripts
└── data/                    # Datasets for exercises
```

## Key Commands

```bash
# Run individual chapter scripts
Rscript code/RforDataScience.R
Rscript code/iteration.R
```

## R Dependencies

- tidyverse (core package for the book)
- ggplot2 (visualization)
- dplyr (data manipulation)
- purrr (iteration)

## Book Reference

R for Data Science (2e): https://r4ds.hadley.nz/

## Key Topics Covered

- **Data Visualization**: ggplot2 basics, aesthetics, geoms, facets
- **Data Transformation**: filter, select, mutate, summarize, group_by
- **Iteration**: map functions, list columns, purrr patterns
- **Vectors**: atomic vectors, lists, augmented vectors
