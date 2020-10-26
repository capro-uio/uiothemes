
<!-- README.md is generated from README.Rmd. Please edit that file -->

# uiothemes

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/uiothemes)](https://CRAN.R-project.org/package=uiothemes)
[![R build
status](https://github.com/Athanasiamo/uiothemes/workflows/R-CMD-check/badge.svg)](https://github.com/Athanasiamo/uiothemes/actions)
[![Travis build
status](https://travis-ci.com/Athanasiamo/uiothemes.svg?branch=master)](https://travis-ci.com/Athanasiamo/uiothemes)
<!-- badges: end -->

The goal of uiothemes is to provide branded templates for the University
of Oslo for commonly used R markdown packages. Currently the package
contains:

  - Presentation template for the
    [xaringan](https://slides.yihui.org/xaringan/#1)-package  
  - Tutorial template for the
    [learnr](https://rstudio.github.io/learnr/)-package  
  - Website template for the
    [distill](https://rstudio.github.io/distill/website.html)-package  
  - Article template for the
    [distill](https://rstudio.github.io/distill/basics.html)-package  
  - Themes for the [ggplot2](https://ggplot2.tidyverse.org/)-package  
  - Colour and fill scales for the
    [ggplot2](https://ggplot2.tidyverse.org/)-package

## Installation

You can install uiothemes from github

``` r
# install.packages("remotes")
remotes::install_github("Athanasiamo/uiothemes")
```

<!-- You can install the released version of uiothemes from [CRAN](https://CRAN.R-project.org) with: -->

<!-- ``` r -->

<!-- install.packages("uiothemes") -->

<!-- ``` -->

## Basic use

xaringan presentation, learnr tutorial and distill article templates
with UiO branding can be access easily using the RStudio IDE, by
selecting `File` -\> `R markdown ...` -\> `From Template`.

<img src="man/figures/README-template.png" width="50%" />

Distill website template can be access most easily through the RStudio
IDE to create a new project. `File` -\> `New project...` -\> `New
Directory` -\> `UiO Distill Website`

<img src="man/figures/README-project.png" width="50%" />

**Previews**

<div style="text-align: center;">

<div class="figure">

<img src="man/figures//preview-article.png" alt="Distill article" width="50%" />

<p class="caption">

Distill article

</p>

</div>

<div class="figure">

<img src="man/figures//preview-presentation.png" alt="Xaringan presentation" width="50%" />

<p class="caption">

Xaringan presentation

</p>

</div>

<div class="figure">

<img src="man/figures//preview-tutorial.png" alt="Learnr tutorial" width="50%" />

<p class="caption">

Learnr tutorial

</p>

</div>

<div class="figure">

<img src="man/figures//preview-website.png" alt="Distill website" width="50%" />

<p class="caption">

Distill website

</p>

</div>

</div>

### ggplot2 branding

The ggplot branding is applied through themes and scales.

``` r
library(uiothemes)
library(ggplot2)

ggplot(mtcars, aes(mpg, disp, colour = cyl)) +
  geom_point(size = 5) +
  scale_colour_uio(discrete = FALSE) +
  theme_uio() +
  labs(title = "The fonts and colours are UiO specific",
       subtitle = "and can provide coherent plot branding")
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

``` r

ggplot(mtcars, aes(mpg, disp, colour = cyl)) +
  geom_point(size = 5) +
  scale_colour_uio(palette = "redwhite", discrete = FALSE) +
  theme_uio_dark() +
  labs(title = "The fonts and colours are UiO specific",
       subtitle = "and can provide coherent plot branding")
```

<img src="man/figures/README-unnamed-chunk-6-2.png" width="100%" />
