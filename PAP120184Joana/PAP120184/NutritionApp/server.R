library(shiny)

shinyServer(function(input, output, session) {
        output$DataInformation <- DT::renderDataTable({
              if (input$showNutrient == 'All') {
        InformacaoNutricional[, c('Food Group',
                                  'Food',
                                  'Per 100g',
                                  'Per Portion'), drop = F]
} else if (input$showNutrient != 'All' &&
           is.null(input$showGroup))
{
        InformacaoNutricional[, c('Food Group',
                                  'Food',
                                  'Per 100g',
                                  'Per Portion'), drop = F] %>%
                filter(InformacaoNutricional$Nutrient == input$showNutrient)
} else
{
        InformacaoNutricional[, c('Food Group',
                                  'Food',
                                  'Per 100g',
                                  'Per Portion'), drop = F] %>%
                filter(InformacaoNutricional$Nutrient == input$showNutrient) %>%
                filter(`Food Group` == input$showGroup)
}  
        })
})