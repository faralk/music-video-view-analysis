# Youtube Music Video View Analysis (2017-2024)

## Overview

This repo contains all materials regarding "The Slow Death of Music Videos on Youtube: An Analysis Using Negative Binomial Regression (2017-2024)" paper. This study analyzes the weekly view count of music videos hosted on Youtube by using Youtube Charts, a service created by Youtube which tracks many song metrics including music video views. We use a negative binomial regression model to find that music video views are gradually decreasing and discuss implications about this in the music industry.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from Youtube Charts.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains details about LLM chat interactions and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## Statement on LLM usage

Aspects of the code were written with the help of ChatGPT 3.5. In addition, some aspects of the paper were written with the help of ChatGPT. The entire chat history is available in other/llms/usage.txt.