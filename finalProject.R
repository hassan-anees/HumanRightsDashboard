## app.R ##
library(shinydashboard)
library(gtrendsR)


ui <- dashboardPage(
  skin = "black",
  dashboardHeader(title = "Xinjiang Re-education Camps", titleWidth=300),
  ## Sidebar content
  dashboardSidebar(
    width=350,
    sidebarMenu(
      menuItem("Impact of Re-Education Camps", tabName = "tab1", icon = icon("im1")),
      menuItem("Scale of Camp Growth", tabName = "tab2", icon = icon("im2")),
      menuItem("Distribution of Camp Growth", tabName = "tab3", icon = icon("im3")),
      menuItem("Google Trends", tabName = "tab5", icon = icon("im5")),
      menuItem("Literature Review", tabName = "tab6", icon = icon("im6"))
      
    )
  ),
  ## Body content
  dashboardBody(
    tabItems(
      # tab1 content
      tabItem(tabName = "tab1",
              h1("Glimpse inside China's Concentration Camps", style="text-align:center;"),
              verticalLayout(
                h3("The Problem at Hand", style="text-align:center;"),
                p("Chinese re-education camps in Xinjiang Region are an increasingly problematic human rights issue, with little coverage relative to the growing scale it operates at. 
                  It is systematic, wide-scale abuse against a minority population of Uighur Muslims in China, presenting an ignored and global challenge. 
                  Our time period is largely concerned with 2016 - 2020, where the most data is available.", style="text-align:center;"),
                h3("Questions to Ask", style="text-align:center;"),
                p("How much are the camps actually growing?", style="text-align:center;"),
                p("How are people distributed among these camps?", style="text-align:center;"),
                p("How aware are people on the issue regarding the re-education camps currently and how has the attention to that issue been changing over time?", style="text-align:center;"),
                h3("Methods Used", style="text-align:center;"),
                p("We used a few different methods to answer our questions. Included in them are linear regressions,
                  multi-linear regressions and a kernel density plot.", style="text-align:center;"),
                h3("Google Trends", style="text-align:center;"),
                p("For our Google Trends data, we used a simple multi-linear regression. The way this method will work is the user is given 3 input fields. Two controlled input fields for a search term related
                to our topic, and one for the period of time for comparison, between 30 days and 5 years. Then a second custom term that can be anything the user chooses. Once the data is submitted with the button, we pull all our data using the R library gTrendsR.
                  Our variables were the number of searches for our respective seacrh terms, over the given period of time. We then took those linear regressions
                  for each term and plotted them against each other using the R function plot(). The graph will then redner on the screen after a few seconds. The purpose of this method was to show the lack of awareness in the general public
                  on this topic. Especially for how serious it is. Our inspiration for this method was from a paper by Jun, Yun & Choi in 2018 on the impact
                  on using Google Trends data.", style="text-align:center;"),
                p("Jun, S., Yoo, H., & Choi, S. (2018). Ten years of research change using Google Trends: From the perspective of big data utilizations and applications. Technological Forecasting And Social Change, 130, 69-87. doi: 10.1016/j.techfore.2017.11.009", style="text-align:center;"),
                h3("Distribution of the Camps", style="text-align:center;"),
                p("For our camp distribution heat map, we used a kernel density plot. We then plotted the density against a map using Stanem Map to show
                  where the prisoners are distributed through the Xinjiang province. To build our kernel density plot it took a bit of data massaging. We took
                  most of our inspiration from ASPI as they built a similar style heat map, however we decided to build it for each year. First, we parsed out the data
                  set and created a python script to create 3 new csv files for each year of data. The data contained coordinate data for the camps, and to make it more accurate,
                  we added a coordinate entry for each prisoner in the camp divided by 1000. So if there were 7000 detainees, we had 7 entries for that camp. This is how we were able
                  to replicate which camps had larger densities. Once we had the data for each year, we plotted the coordinates with our kernel desnity estimate. We used stat_density2d
                  to build that. We then plotted the density over a map and generated it as an image in a seperate R script. That allowed us to just render the images onto the dashboard.
                  We then had a tab for each year which the user can toggle between. The idea of the heat maps was to show the growth and spread of the camps over the 3 years our data set covers. It is an issue that is still prevalent to this day and the
                  numbers have only been getting higher.", style="text-align:center;"),
                p("Danielle, R., Fergus, Ryan D. (2018). Mapping Xinjiang's 're-education' camps. Aspi.org.Au. https://www.aspi.org.au/report/mapping-xinjiangs-re-education-camps", style="text-align:center;")
              )
      ),
      # tab1 content
      tabItem(tabName = "tab2",
              h1("Scale of Camp Growth", style="text-align:center;"),
              verticalLayout(
                div(p("This page will give you a perspective of how many Uyghur's are actually being affected."), style="text-align:center;"),
                div(img(src="100detainees.png", width="210px", height="25px"), style="text-align:center;"),
                p("This icon represents 100 detainees in the camp", style="text-align:center;"),
                div(img(src="camp52016.png", width="325px", height="100px"), style="text-align:center;"),
                p("7000 detainees", style="text-align:center;"),
                div(img(src="camp52018.png", width="746px", height="200px"), style="text-align:center;"),
                p("99,000 detainees", style="text-align:center;"),
                div(img(src="camp132018.png", width="800px", height="459px"), style="text-align:center;"),
                p("217,000 detainees", style="text-align:center;"),
                div(img(src="currentcamps.png", width="972px", height="1000px"), style="text-align:center;"),
                p("As of 2018, there are 2.7 million detainees throughout all the camps", style="text-align:center;")
              )
      ),
      # tab1 content
      tabItem(tabName = "tab3",
              h1("Distribution of Camp Growth", style="text-align:center;"),
              tabBox(
                # The id lets us use input$tabset1 on the server to find the current tab
                id = "tabset1", height = "400px", width = "500px",
                tabPanel("2016", div(img(src="map2016.png", width = "615px", height="312px")), style="text-align:center;"),
                tabPanel("2017", div(img(src="map2017.png", width = "615px", height="312px")), style="text-align:center;"),
                tabPanel("2018", div(img(src="map2018.png", width = "615px", height="312px")), style="text-align:center;")
              ),
              p("Here we have curated heat maps of the distribution of the camp detainees throughout the province of Xinjiang", style="text-align:center;"),
              p("All data curated from Australian Strategic Policy Institute", style="text-align:center;")
      ),
    
      # tab1 content
      tabItem(tabName = "tab5",
              h1("Google Trends", style="text-align:center;"),
              p("This will let you choose a term related to the Xinjiang Re-Education Camps, and select any other term you want.", style="text-align:center;"),
              p("It will then let you choose a period of time and compare how many people were searching the Uyghur term, vs how many", style="text-align:center;"),
              p("people were searching your custom term", style="text-align:center;"),
              pageWithSidebar(
                headerPanel("Data Input"),
                sidebarPanel(
                  #textInput("t1", "Search Term 1", placeholder = NULL),
                  selectInput(
                    "t1",
                    "Search Term 1:",
                    choices = c("Uyghurs",
                                "China camps",
                                "Muslim camps",
                                "Chinese muslims",
                                "Chinese concentration camps"
                                
                    ),
                    selected = NULL,
                    multiple = FALSE,
                    selectize = TRUE,
                    width = NULL,
                    size = NULL
                  ),
                  textInput("t2", "Search Term 2", placeholder = NULL),
                  p("You can compare to other social justice issues (ex. Hong Kong protests, black lives matter..etc)"),
                  selectInput(
                    "t3",
                    "Date:",
                    choices = c("Past 30 Days",
                                "Past 90 Days",
                                "Past 12 Months",
                                "Last Five Years"
                    ),
                    selected = NULL,
                    multiple = FALSE,
                    selectize = TRUE,
                    width = NULL,
                    size = NULL
                  ),
                  br(),
                  actionButton("goButton", "Go!"),
                  p("Give it a few moments to display the data!")
                ),
                mainPanel(
                  plotOutput("googleplot")
                  #verbatimTextOutput("nText")
                  
                )
              )
      ),
      tabItem(tabName = "tab6",
              verticalLayout(
                h3("Abstract", style="text-align:center;"),
                p("The situation of Uyghur treatment in China has been discussed for years, but data and understanding beyond individual stories are hard to come by. This study looks at existing research on the situation and combines it in an easy to understand, visual way. More specifically, we're looking and graphing some of the various quantitative data available on the subject and helping more people understand the scale. Specific actions of abuse had also been documented beforehand through a number of reports. Many of those reports describing leaked documents that pertain to categorizing persons to be detained in a re-education camp. Specifically, the attributes that are used to categorize if someone will be detained. Many of the criteria revolved around religious beliefs and any association that represent those beliefs (Whiteman et al., 2020). The document for categorization is based on superficial features in order to detain a group that has an affiliation with a religious belief system (Whiteman et al., 2020). A few of the reasons for detention, having a long beard, wearing a veil, and making an unauthorized pilgrimage (Whiteman et al., 2020). There are many broader generalizations made through this article. There are assumptions that there are more criteria that makes the Chinese government determine if one is to be detained. Reports by news such sources from CNN and BBC go over how such actions of the Government revolve around ethnic cleansing. In addition to this, a new investigation demonstrates that protests and sanctions from the United States and other nations have not halted the actions of the Chinese government (Board, 2020). Through the use of extensive documentation of government policies and satellite imagery, it has been clear that China was forcing Uyghurs to go down a path of cultural genocide (Board, 2020).", style="text-align:center;"),
                h3("References", style="text-align:center;"),
                p("Danielle, R., Fergus, Ryan D. (2018). Mapping Xinjiang's 're-education' camps. Aspi.org.Au. https://www.aspi.org.au/report/mapping-xinjiangs-re-education-camps", style="text-align:center;"),
                p("Jun, S., Yoo, H., & Choi, S. (2018). Ten years of research change using Google Trends: From the perspective of big data utilizations and applications. Technological Forecasting And Social Change, 130, 69-87. doi: 10.1016/j.techfore.2017.11.009", style="text-align:center;"),
                p("McCandless, D. (2010, August 6). Wikipedia's Lamest Edit Wars - Information is Beautiful. Information Is Beautiful; Information is Beautiful. https://informationisbeautiful.net/visualizations/wikipedia-lamest-edit-wars/", style="text-align:center;"),
                p("Wood, J., & Dykes, J. (2011). City Research Online -  Spatially Ordered Treemaps. City.Ac.Uk. https://doi.org/https://openaccess.city.ac.uk/id/eprint/536/1/wood_spatially_2008.pdf", style="text-align:center;"),
                p("Steger, Isabella. On Xinjiang, Even Those Wary of Holocaust Comparisons Are Reaching for the Word 'Genocide.' Quartz, Quartz, 26 Aug. 2020, qz.com/1892791/a-consensus-is-growing-that-chinas-uyhgurs-face-genocide/.", style="text-align:center;"),
                p("Stone, Lewi. Quantifying the Holocaust: Hyperintense Kill Rates during the Nazi Genocide. Science Advances, American Association for the Advancement of Science, 1 Jan. 2019, advances.sciencemag.org/content/5/1/eaau7292.", style="text-align:center;"),
                p("Board, E. (2020, September 11). New evidence of China's concentration camps shows its hardening resolve to wipe out the Uighurs. Retrieved from https://www.washingtonpost.com/opinions/global-opinions/new-evidence-of-chinas-concentration-camps-shows-its-hardening-resolve-to-wipe-out-the-uighurs/2020/09/03/aeeb71b4-ebb2-11ea-99a1-71343d03bc29_story.html", style="text-align:center;"),
                p("Whiteman, H., Marsh, J., George S. (2020). Leaked Records Expose China's Xinjiang Camps. Retrieved from https://www.cnn.com/interactive/2020/02/asia/xinjiang-china-karakax-document-intl-hnk/", style="text-align:center;")
                
                
              )
      )
    )
  )
)



server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  output$tabset1Selected <- renderText({
    input$tabset1
  })
  
  
  # builds a reactive expression that only invalidates 
  # when the value of input$goButton becomes out of date 
  # (i.e., when the button is pressed)
  ntext <- eventReactive(input$goButton, {
    input$t1
    input$t2

    date <- ""
    if(input$t3 == "Past 30 Days"){
      date = "today 1-m"
    }
    else if(input$t3 == "Past 90 Days"){
      date = "today 3-m"
    }
    else if(input$t3 == "Past 12 Months"){
      date = "today 12-m"
    }
    else if(input$t3 == "Last Five Years"){
      date = "today+5-y"
    }else{
      date = "today 12-m"
    }
    
    paste(input$t1, input$t2, date, sep=",")
  })
  
  output$nText <- renderText({
    ntext()
  })

  output$googleplot <- renderPlot({
    userString <- ntext()
    print(userString)
    arrString <- unlist(strsplit(userString, ","))
    #res <- gtrends(c("Uyghurs", "Hong Kong Protests"), geo = c(""), time = "today 12-m")
    res <- gtrends(c(arrString[1], arrString[2]), geo = c(""), time = arrString[3])
    plot(res)
  })
  
}



shinyApp(ui, server)