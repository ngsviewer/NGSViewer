<!--- The following README.md sample file was adapted from https://gist.github.com/PurpleBooth/109311bb0361f32d87a2#file-readme-template-md by Gabriella Mosquera for academic use ---> 
<!--- You may delete any comments in this sample README.md file. If needing to use as a .txt file then simply delete all comments, edit as needed, and save as a README.txt file --->

# Master of Digital Innovation
## DGIN 5201 Digital Transformation - Winter 2020/2021
## Instructors: Vlado Keselj & Colin Conrad
## Final Digital Innovation Project: Creating graphical user interface for Next Generation Sequencing data.

In this project we wish to prototype NGSVIEWER a web based GUI tool for NGS data. Using this software, we hope scientists  can perform various actions by simply configuring several parameters in a friendly graphical user interface. 


The aim is to give a platform for the selection of the true mutations in the dataset.

* *Date Created*: 01/03/2021
* *Last Modification Date*: 03/17/2021

## Contributors

* [Rasheedat Ajayi](Rasheedat.Ajayi@dal.ca) - *(Developer/Author)*
* [Edwin Kagereki](Kagereki@dal.ca) - *(Developer/Author)*


<!---* [Edwin M. Kagereki](Kagereki@dal.ca) - *(Role)*
* [Name](email@dal.ca) - *(Role)*
* [Name](email@dal.ca) - *(Role)*
* [Name](email@dal.ca) - *(Role)*
* [Name](email@dal.ca) - *(Role)*--->




## Goals

1) Create a platform to perform  variant detection by simply configuring several parameters in a friendly graphical user interface.

2) Create a report writing tool for pathological interpretation of NGS.

3) Facilitate  data archiving and retrieval.

3) Enable visualization for teaching learners (med students, residents) about NGS, mutations, etc.


## Execution Environment

The prototype will be developed in virtual machine instance with the following hardware and software configuration.

#### Hardware


```
4 CPUS (Intel Xeon CPUs ranging 2.0GHz)
RAM 8GB
160GB SSD
5TB Transfer

```

#### Software

```
Operating System Linux Mint Cinnamon 18 (Ubuntu 16.04 LTS)
Mongodb 3.2
Oracle Java 1.8.0
Spark 2.0.1 Prebuilt for Hadoop 2.7
R version 4.0.3 (2020-10-10) and the Various R packages.
R studio 0.99.903

```


## Deployment

The prototype  of  [NGSVIewer](https://ngsviewer.shinyapps.io/NGSViewer/),is accessible for in its most updated version.


#### Authorization and authentication

Two factor authorization - using password and email is implemented. 



#### Tabs

The horizontal tabs represent the concepts as follows: 


```
**User Interface**


1. Quality Control (QC) - did the sequencing perform appropriately?
2. Variant identification - small mutations (point mutation, small insertion or deletion)
3. Copy number variations (CNVs)
4. Fusions - gene fusions 
5. Knowledge base 
6. Report 

```


## Built With

<!--- Provide a list of the frameworks used to build this application, your list should include the name of the framework used, the url where the framework is available for download and what the framework was used for, see the example below --->

* [R](https://www.r-project.org) - Develop functionality, data access and archiving.

R packages:



* shiny

Winston Chang, Joe Cheng, JJ Allaire, Carson Sievert, Barret Schloerke, Yihui Xie, Jeff
Allen, Jonathan McPherson, Alan Dipert and Barbara Borges (2021). shiny: Web
Application Framework for R. R package version 1.6.0.
https://CRAN.R-project.org/package=shiny

* shinyjs

Dean Attali (2020). shinyjs: Easily Improve the User Experience of Your Shiny Apps in
Seconds. R package version 2.0.0. https://CRAN.R-project.org/package=shinyjs

*  DT

Yihui Xie, Joe Cheng and Xianying Tan (2021). DT: A Wrapper of the JavaScript Library
'DataTables'. R package version 0.17. https://CRAN.R-project.org/package=DT

* shinydashboard

Winston Chang and Barbara Borges Ribeiro (2018). shinydashboard: Create Dashboards with
'Shiny'. R package version 0.7.1. https://CRAN.R-project.org/package=shinydashboard

*  sodium

Jeroen Ooms (2017). sodium: A Modern and Easy-to-Use Crypto Library. R package version
1.1. https://CRAN.R-project.org/package=sodium

*  rhandsontable

Jonathan Owen (2018). rhandsontable: Interface to the 'Handsontable.js' Library. R
package version 0.3.7. https://CRAN.R-project.org/package=rhandsontable

*  data.table

Matt Dowle and Arun Srinivasan (2021). data.table: Extension of `data.frame`. R package
version 1.14.0. https://CRAN.R-project.org/package=data.table

*  formattable

Kun Ren and Kenton Russell (2021). formattable: Create 'Formattable' Data Structures. R
package version 0.2.1. https://CRAN.R-project.org/package=formattable

*  shinyWidgets

Victor Perrier, Fanny Meyer and David Granjon (2021). shinyWidgets: Custom Inputs
Widgets for Shiny. R package version 0.6.0.
https://CRAN.R-project.org/package=shinyWidgets

*  g3viz

Xin Guo (2021). g3viz: Interactively Visualize Genetic Mutation Data using a
Lollipop-Diagram. R package version 1.1.4. https://CRAN.R-project.org/package=g3viz

* rtracklayer

M. Lawrence, R. Gentleman, V. Carey: "rtracklayer: an {R} package for interfacing with
  genome browsers". Bioinformatics 25:1841-1842.

* trackViewer

Ou J. Zhu L. trackViewer: a Bioconductor package for interactive and integrative
visualization of multi-omics data. Nature Methods 16, 453–454 (2019)


* tidyverse

Wickham et al., (2019). Welcome to the tidyverse. Journal of Open Source Software,
4(43), 1686, https://doi.org/10.21105/joss.01686

* stringi

Gagolewski M. and others (2020). R package stringi: Character string processing
facilities. http://www.gagolewski.com/software/stringi/.

*  stringr

Hadley Wickham (2019). stringr: Simple, Consistent Wrappers for Common String
Operations. R package version 1.4.0. https://CRAN.R-project.org/package=stringr

*  karyoploteR
 
Gel B, Serra E (2017). "karyoploteR : an R / Bioconductor package to plot customizable
genomes displaying arbitrary data." _Bioinformatics_, *33*(19), 3088-3090. doi:
  10.1093/bioinformatics/btx346 (URL: https://doi.org/10.1093/bioinformatics/btx346).

*  BiocManager

Martin Morgan (2019). BiocManager: Access the Bioconductor Project Package Repository.
R package version 1.30.10. https://CRAN.R-project.org/package=BiocManager

*  mongolite

Ooms J (2014). “The jsonlite Package: A Practical and Consistent Mapping Between JSON Data 
and R Objects.” arXiv:1403.2805 [stat.CO]. https://arxiv.org/abs/1403.2805.

* [Rstudio](https://rstudio.com) - Code editor used.
* [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS) - Used for page styling and formating.
* [HTML](https://html.com) - Building various page elements.


## Acknowledgments

* Dr. Vlado Keselj - Course Instructor

* Dr. Colin Conrad - Course Instructor 
