function(input, output, session) {

  values <- reactiveValues(start = NULL)
  
  ##### Switch Views ------------------

    observeEvent(input$go_to_register, {
    shinyjs::show("register_panel", anim = TRUE, animType = "fade")
    shinyjs::hide("sign_in_panel")
  }, ignoreInit = TRUE)

  observeEvent(input$go_to_sign_in, {
    shinyjs::hide("register_panel")
    shinyjs::show("sign_in_panel", anim = TRUE, animType = "fade")
  }, ignoreInit = TRUE)

  # switch between auth sign in/registration and app for signed in user
  observeEvent(session$userData$current_user(), {
    current_user <- session$userData$current_user()

    if (is.null(current_user)) {
      shinyjs::show("sign_in_panel")
      shinyjs::hide("dashboard_page_ui")

      shinyjs::hide("verify_email_view")
    } else {
      shinyjs::hide("sign_in_panel")
      shinyjs::hide("register_panel")

      if (current_user$emailVerified == TRUE) {
        shinyjs::show("dashboard_page_ui")

        shinyjs::hide("sign_in_panel")
        shinyjs::hide("register_panel")
        shinyjs::hide("verify_email_view")
        } else {
        shinyjs::show("verify_email_view")
      }

    }

  }, ignoreNULL = FALSE)


  # Signed in user --------------------
  # the `session$userData$current_user()` reactiveVal will hold information about the user
  # that has signed in through Firebase.  A value of NULL will be used if the user is not
  # signed in
  session$userData$current_user <- reactiveVal(NULL)
   # input$sof_auth_user comes from front end js in "www/sof-auth.js"
  observeEvent(input$sof_auth_user, {
   # set the signed in user
    session$userData$current_user(input$sof_auth_user)
  }, ignoreNULL = FALSE)

  # We make teh start.values to be reactive ------This value is reactive
  start.values <- reactive({
    if (is.null(input$task)) {
      return(c(0))
    } else {
      return(input$task)
    } 
  })
  
 
## We read the data depending on what we intend to do.
  
observeEvent(input$initiate,{
if(start.values() == "Review"){
  #source("mongoSaving.R", local = TRUE)$value ## This will read the data from Cassandra  - ?? Check the LInk to the server.
  
  ## This will be deleted when we start reading from MongoDB
  data<-read.csv("decision.csv", sep=",", h=T) ## Data already saved in the database
  #data_display<-data %>% select(UI,Sample,Gene, Chrom,Start,End,Impact,Ref,Alt,AA,Clinvar.Disease,Num.Times.in.Database)
  #data_display$OUtcome<-ifelse(data_display$UI==0, FALSE, TRUE)
}
else{
  data<-read.csv("chrom.csv", sep=",", h=T)
  #source("cassandra.R", local = TRUE)$value ## This will read the data from Cassandra  - ?? Check the LInk to the server.
  ##  ###THis will help in the selection of the selection of the  column for the decision making

 # data_display<-data %>% select(UI,Sample,Gene, Chrom,Start,End,Impact,Ref,Alt,AA,Clinvar.Disease,Num.Times.in.Database)
 # data_display$OUtcome<-ifelse(data_display$UI==0, FALSE, TRUE)
  }
})
  

  
output$secondSelection <- renderUI({
  selectInput("Gene", "Select Gene:", choices = as.list(data[data$Chrom==input$Chromosome,"Gene"]))
})


  chrom.values <- reactive({
    if (is.null(input$Chromosome)) {
      return(c(0))
    } else {
      return(input$Chromosome)
    } 
  })
  
  filteredChrome <- reactive({
    return(data %>% filter(Chrom %in% chrom.values()))
  })
  

  gene.values <- reactive({
    if (is.null(input$Gene)) {
      return(c(0))
    } else {
      return(input$Gene)
    } 
  })
  
  filtered.gene <- reactive({
    return(data %>% filter(Chrom %in% chrom.values(),
                                 Gene %in% gene.values()))
  })
  
 
  output$selected.genes<-renderDataTable(
    filtered.gene()
  )

  
  
  data4 <-  reactive({
  data3
  })
  ##### App for signed in user
  signed_in_user_df <- reactive({
    req(session$userData$current_user())

    out <- session$userData$current_user()
    out <- unlist(out)
    data.frame(
      name = names(out),
      value = unname(out)
    )
 })
  
  case.values <- reactive({
    if (is.null(input$case)) {
      return(c(0))
    } else {
      return(input$case)
    } 
  })
  
  filtered.Karyo <- reactive({
    return(data %>% filter(data %in% case.values()
))
}) 

  output$Karyotype <- renderPlot({
  #data <- filtered.Karyo()
  #data<-data %>% filter(data %in% case.values())
  data <- data[ which(data$UI==case.values()), ]
  data$name<-c("chr")
  data$chr <- paste(data$name,data$Chrom)
  data$chr<-str_replace_all(string=data$chr, pattern=" ", repl="")
  data$test <- paste(data$chr,data$Start,data$End)
  gains2 <- toGRanges(data.frame(chr=data$chr, start=data$Start,
                                   end=data$End))
    kp <- plotKaryotype(genome="hg19")
    kp <- plotKaryotype(genome="hg19", plot.type=1, chromosomes=unique(data$chr))
    
    kpPlotRegions(kp, gains2, col="#FF0000")
     })
  output$mutation <- renderPlot({
     SNP <- c(10, 12, 1400, 1402)
     sample.gr <- GRanges("chr1", IRanges(SNP, width=1, names=paste0("snp", SNP)))
     features <- GRanges("chr1", IRanges(c(1, 501, 1001), 
                                         width=c(120, 400, 405),
                                         names=paste0("block", 1:3)))
     lolliplot(sample.gr, features)
     features$fill <- c("#FF8833", "#51C6E6", "#DFA32D")
     lolliplot(sample.gr, features)
     sample.gr$color <- sample.int(6, length(SNP), replace=TRUE)
     sample.gr$border <- sample(c("gray80", "gray30"), length(SNP), replace=TRUE)
     lolliplot(sample.gr, features)
   })
 

  output$banking.df_data<-renderDataTable(
  data[ which(data$UI==case.values()), ],
    selection = 'none', editable = TRUE, 
    rownames = TRUE,
    #extensions = 'Buttons',
    options = list(
      columnDefs = list(list(width = '700px',targets = c(5,6,13,15,17,19))),
      columnDefs = list(list(width = '300px',targets = c(12,14,16,18,20,26,29))),
      columnDefs = list(list(className = 'dt-left', targets = '_all')),
      ordering = TRUE,
      paging = TRUE,
      searching = TRUE,
      fixedColumns = TRUE,
      autoWidth = TRUE,
      ordering = TRUE,
        searching = TRUE,
  pageLength = 10,
  lengthMenu = c(5, 10, 15, 20), 
  scrollY = "400px",
  scrollX = T,
      dom = 'Bfrtip'
    ),
  class = "display"
  )
  
  
  #dom = 'Bftsp',
  #buttons = c('copy', 'csv', 'excel'),

  
  #table<-biomartr::getGO(organism = "Homo sapiens", 
 #                        genes    = "PIK3CA",
 #                        filters  = "hgnc_symbol") 
  #names(table)[names(table) == "hgnc_symbol"] <- "Gene"
 # names(table)[names(table) == "goslim_goa_description"] <- "Description"
 # names(table)[names(table) == "goslim_goa_accession"] <- "Link"

  #table$Link <- sapply(table$Link, function(x)
  #  toString(tags$a(href = paste("https://www.ebi.ac.uk/QuickGO/term/",x, sep=""),x)))
  
# output$GO<-renderFormattable(
 #   formattable(table,list())
#)
  
  observeEvent(input$banking.df_data_cell_edit, {
    d1[input$banking.df_data_cell_edit$row,input$banking.df_data_cell_edit$col] <<- input$banking.df_data_cell_edit$value
  })
  
  view_fun<-eventReactive(input$viewBtn,{
    if(is.null(input$saveBtn)||input$saveBtn==0)
    {
      returnValue()
    }
    else
    {
    DT::datatable(d1,selection = 'none')
    }
    })
  
  observeEvent(input$saveBtn,{
    write.csv(d1,'test.csv')
    # Here we save the document to the MongoDB
    #  source("mongoSaving.R", local = TRUE)$value,

  })
 output$updated.df<-renderDataTable({
    view_fun()
  })
 output$user_out <- DT::renderDT({
    datatable(
      signed_in_user_df(),
      rownames = FALSE,
      options = list(
        dom = "tp",
        editable = 'cell',
        scrollX = TRUE
      )
    )
  })
}
