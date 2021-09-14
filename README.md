# Data irregularities across five implicit learning articles: Comments on Lola and Tzetzis (2021), Lola and Tzetzis (2020), Tzetzis and Lola (2015), Lola, Tzetzis, and Zetou (2012), and Tzetzis and Lola (2010)

## Usage
To reproduce the analyses, you will need to have R (https://cran.r-project.org/) and RStudio (https://www.rstudio.com/products/rstudio/download/#download) installed on your computer.

To get a copy of the repository on your machine, click the green Code button then choose Download zip. Save to your machine and extract. After extraction, double click the `comm_lola-tzetzis-data-irregularities.Rproj` file in the root directory which will automatically open RStudio. This will ensure all paths work on your system as the working directory will be set to the location of the `.Rproj` file.

## Repository tree
```bash
├── comm_lola-tzetzis-data-irregularities.Rproj
├── data
│   ├── abbey
│   │   ├── 2010
│   │   │   └── f-stats.csv
│   │   ├── 2012
│   │   │   ├── data_ac.csv
│   │   │   ├── data_rt.csv
│   │   │   └── f-stats.csv
│   │   ├── 2015
│   │   │   ├── data_ac.csv
│   │   │   ├── data_rt.csv
│   │   │   └── f-stats.csv
│   │   ├── 2020
│   │   │   ├── data_mp.csv
│   │   │   ├── data_se.csv
│   │   │   └── f-stats.csv
│   │   └── 2021
│   │       ├── data_ac.csv
│   │       ├── data_csai.csv
│   │       ├── data_mac.csv
│   │       ├── data_rt.csv
│   │       └── f-stats.csv
│   └── brad
│       ├── 2010
│       │   └── problems_Tzetzis_Lola_2010.xlsx
│       ├── 2012
│       │   ├── data_ac.csv
│       │   ├── data_rt.csv
│       │   ├── effect_sizes
│       │   │   ├── exp_con_ac
│       │   │   ├── exp_con_rt
│       │   │   ├── exp_imp_ac
│       │   │   ├── exp_imp_rt
│       │   │   ├── exp_seq_ac
│       │   │   ├── exp_seq_rt
│       │   │   ├── imp_con_ac
│       │   │   ├── imp_con_rt
│       │   │   ├── imp_seq_ac
│       │   │   ├── imp_seq_rt
│       │   │   ├── seq_con_ac
│       │   │   └── seq_con_rt
│       │   └── effects_Lola-Tzetzis_2012.xlsx
│       ├── 2015
│       │   ├── data_ac.csv
│       │   ├── data_rt.csv
│       │   ├── effect-sizes
│       │   │   ├── ana_con
│       │   │   ├── ana_con_ac
│       │   │   ├── ana_imp
│       │   │   ├── ana_imp_ac
│       │   │   ├── exp_ana
│       │   │   ├── exp_ana_ac
│       │   │   ├── exp_con
│       │   │   ├── exp_con_ac
│       │   │   ├── exp_imp
│       │   │   ├── exp_imp_ac
│       │   │   ├── imp_con
│       │   │   └── imp_con_ac
│       │   └── effects_Lola-Tzetzis_2014.xlsx
│       ├── 2020
│       │   ├── data_mp.csv
│       │   ├── data_se.csv
│       │   ├── effect_sizes
│       │   │   ├── ana_con
│       │   │   ├── ana_con_se
│       │   │   ├── ana_imp
│       │   │   ├── ana_imp_se
│       │   │   ├── exp_ana
│       │   │   ├── exp_ana_se
│       │   │   ├── exp_con
│       │   │   ├── exp_con_se
│       │   │   ├── exp_imp
│       │   │   ├── exp_imp_se
│       │   │   ├── imp_con
│       │   │   └── imp_con_se
│       │   └── effects_Lola-Tzetzis_2020.xlsx
│       └── 2021
│           ├── 0081DD10
│           ├── data_ac.csv
│           ├── data_csai.csv
│           ├── data_mac.csv
│           ├── data_rt.csv
│           ├── effect_sizes
│           │   ├── analogy_control_Err
│           │   ├── analogy_control_Mc
│           │   ├── analogy_control_RT
│           │   ├── analogy_explicit_Err
│           │   ├── analogy_explicit_Mc
│           │   ├── analogy_explicit_RT
│           │   ├── explicit_control_Err
│           │   ├── explicit_control_Mc
│           │   ├── explicit_control_RT
│           │   ├── implicit_analogy_err
│           │   ├── implicit_analogy_est_sd
│           │   ├── implicit_analogy_Mc
│           │   ├── implicit_analogy_RT
│           │   ├── implicit_control_Err
│           │   ├── implicit_control_Mc
│           │   ├── implicit_control_RT
│           │   ├── implicit_explicit_Err
│           │   ├── implicit_explicit_Mc
│           │   └── implicit_explicit_RT
│           └── effects_Lola-Tzetzis_2021.xlsx
├── docs
│   ├── manuscript
│   │   ├── manuscript.pdf
│   │   ├── manuscript.Rmd
│   │   └── manuscript.tex
│   ├── references.bib
│   └── r-references.bib
├── figs
│   └── fig1.pdf
├── README.md
└── scripts
    ├── main.R
    ├── simulations.R
    ├── wrangle_2012.R
    ├── wrangle_2015.R
    ├── wrangle_2020.R
    └── wrangle_2021.R
```
