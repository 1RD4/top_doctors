# Analytics Engineer Test

This repository contains a DBT project, some queries and screenshots of visualizations built by Adrián Flórez Santalla in order to apply for the Analytics Engineer vacant at Top Doctors

## Installation

First, add the values needed to connect BigQuery with DBT in the profile.yml file. This way you would be able to choose the project, dataset and type of authenticaton to use the project

Create a dataset in the desired project with the exact name you used in the profiles.yml file

Once done, run the following command to check DBT connection

```
dbt test
```
If your connection succeeded, you are able to run the following ones

```
dbt seed
```
This would create the tables from the csv files in the seeds folder

```
dbt build
```

This would run the entire pipeline to create the final model

## Folder Tree Structure

```
└── 📁TOP_DOCTORS
    └── 📁top_doctors
        └── 📁analyses
        └── 📁macros
        └── 📁models
            └── 📁intermediate
            └── 📁marts
                └── 📁dim
                └── 📁fact
            └── 📁staging
        └── 📁seeds
        └── 📁snapshots
        └── 📁tests
```
