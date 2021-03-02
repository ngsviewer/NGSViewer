<!--- The following README.md sample file was adapted from https://gist.github.com/PurpleBooth/109311bb0361f32d87a2#file-readme-template-md by Gabriella Mosquera for academic use ---> 
<!--- You may delete any comments in this sample README.md file. If needing to use as a .txt file then simply delete all comments, edit as needed, and save as a README.txt file --->

# Master of Digital Innovation
## DGIN 5201 Digital Transformation - Winter 2020/2021
## Instructors: Vlado Keselj & Colin Conrad
## Final Digital Innovation Project


In this project we wish to prototype NGSVIEWER a web based GUI tool for the identification of genomic variants  individual sequencing data. Using this software, we hope scientist  can perform sophisticated variant detection by simply configuring several parameters in a friendly graphical user interface.

Spark and MongoDB are a fantastic opportunity to enhance R with big-processing and big-data features - all in open source!. We present a walkthrough to setup a working environment which will put Spark's parallel
processing and Mongo's huge-data handling capabilities at your fingertips in R. We will discuss the main features of SparkR with MongoDB and provide a toy example.

* *Date Created*: 01/03/2021
* *Last Modification Date*: 01/03/2021

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
R version 4.0.3 (2020-10-10)
R studio 0.99.903

```


## Deployment

The prototype  of  [NGSVIewer](https://ngsviewer.shinyapps.io/NGSViewer/),is accessible for in its most updated version.

#### Authorization and authentication

For trial, two users have been created. The two users are authorized to access different resources.

**Staff:** This category of users represents the scientists who are able to view and edit the data e.g write the report. 
```
User:     Staff
Password: Staff1

```

**Learner:** This category of users represents the learners who are only able to **View** data with no possibility to editing.

```
User:     Learner
Password: Learner1

```
#### Tabs

The horizontal tabs represent the concepts as follows: 


**Staff portal**

```
1. Quality Control (QC) - did the sequencing perform appropriately?
2. Variants - small mutations (point mutation, small insertion or deletion)
3. Copy number variations (CNVs) - gene amplifications (+ deletions?), e.g. HER2
4. Fusions - gene fusions (e.g. BCR-ABL in CML; ALK, ROS1 in lung cancer)
5. "Bam links" - links to raw sequencing data
6. Report - interface for writing report (can search earlier reports)
```

**Learner portal**

```
1. Quality Control (QC) - did the sequencing perform appropriately?
2. Variants - small mutations (point mutation, small insertion or deletion)
3. Copy number variations (CNVs) - gene amplifications (+ deletions?), e.g. HER2
4. Fusions - gene fusions (e.g. BCR-ABL in CML; ALK, ROS1 in lung cancer)
5. "Bam links" - links to raw sequencing data
6. Report - interface for writing report (can search earlier reports)
```



## Built With

<!--- Provide a list of the frameworks used to build this application, your list should include the name of the framework used, the url where the framework is available for download and what the framework was used for, see the example below --->

* [R](https://www.r-project.org) - Develop functionality, data access and archiving.
* [Rstudio](https://rstudio.com) - Code editor used.
* [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS) - Used for page styling and formating.
* [HTML](https://html.com) - Building various page elements.




## Acknowledgments

* Dr. Vlado Keselj - Course Instructor

* Dr. Colin Conrad - Course Instructor 
