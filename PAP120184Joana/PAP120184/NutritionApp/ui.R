library(shiny)
library(ggplot2)

shinyUI(fluidPage(titlePanel = 'Examples of DataTables',
                  sidebarLayout(
                          sidebarPanel(
                                  selectInput('showNutrient', 'Select a nutrient',
                                              c("All", sort(
                                                      unique(InformacaoNutricional$Nutrient)
                                              )), selected =  F),
                                  selectizeInput(
                                          'showGroup',
                                          'Columns in groups to show:',
                                          unique(sort(InformacaoNutricional$`Food Group`)),
                                          multiple = T
                                  )
                          ),
                          mainPanel(id = 'dataset', DT::dataTableOutput('DataInformation'))
                  )))
