#Carregar bibliotecas
library(NutrientData) #base de dados
library(dplyr)
library(tidyr)

#Data processing to create ABfull
InformacaoNutricional <- ABBREV %>%
        merge(select(FOOD_DES, NDB_No, FdGrp_Cd), by = "NDB_No") %>% #Junção Fd_Grp_cd da tabela FOOD_DES pela a chave NDB_No(código único id da tabela )
        merge(FD_GROUP, by = "FdGrp_Cd") %>% #junção da tabela FD_GROUP pela chave FdGrp_Cd(código único do grupo alimentar)
        select(
                `Food Group` = FdGrp_Desc,
                Food = Shrt_Desc,
                Calories = Energ_Kcal,
                Protein = `Protein_(g)`,
                Total_Lipids = `Lipid_Tot_(g)`,
                SatFat = `FA_Sat_(g)`,
                MUFAs = `FA_Mono_(g)`,
                PUFAs = `FA_Poly_(g)`,
                #Seleccionamos as colunas que queremos na nova tabela ao mesmo tempo que lhe damos outro nome
                Carbohydrates = `Carbohydrt_(g)`,
                Fiber = `Fiber_TD_(g)`,
                Sugar = `Sugar_Tot_(g)`,
                `Calcium_(mg)`,
                Iron = `Iron_(mg)`,
                Calcium = `Calcium_(mg)` ,
                VitB12 = `Vit_B6_(mg)`,
                VitC = `Vit_C_(mg)`,
                Portion = GmWt_1
        ) %>%
        gather("Nutrient", "Per 100g", 3:15) %>% #Transformação das colunas (da 3ª à 15ª inclusive) em linhas, a tabela fica em formato longo
        mutate(`Per Portion` = round(Portion * `Per 100g` / 100, 3)) #Criação de uma nova coluna com o cálculo das porções em gramas para porções standard
