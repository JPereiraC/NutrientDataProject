---
title: "DataNutrient"
author: "Joana"
date: "August 22, 2016"
output: html_document
---

<!-- Load libraries and data -->
```{r libraries & data} 

library(NutrientData)
library(dplyr)
library(tidyr)
library(pander)


data("ABBREV")
data("FD_GROUP")
View(ABBREV)
View(FD_GROUP)
```


Which are the foods lowest in calories?  
```{r select data by energy}

  ABBREV %>%
  arrange(Energ_Kcal) %>% #Sort by calories per 100g
  select(Food = Shrt_Desc, Calories = Energ_Kcal) %>%
  filter(Calories > 0) %>%
  slice (1:20) %>%
  pander()

```

Which are the foods beverages lowest in calories?
```{r select data by water (g) }
   ABBREV %>%
  arrange(Energ_Kcal) %>% #Sort by calories per 100g
  select(Food = Shrt_Desc, Calories = Energ_Kcal, Sugar = `Sugar_Tot_(g)`) %>%
  filter(Calories > 0  ) %>%
  slice (1:20) %>%
  pander()
```


```{r one table for each nutrient}
select(ABBREV, Food = Shrt_Desc,  Calories = Energ_Kcal)
select(ABBREV, Food = Shrt_Desc, Protein = `Protein_(g)`)
select(ABBREV, Food = Shrt_Desc, Total_Lipids = `Lipid_Tot_(g)`)
select(ABBREV, Food = Shrt_Desc,  SatFat = `FA_Sat_(g)`)
select(ABBREV, Food = Shrt_Desc,  MUFAs = `FA_Mono_(g)`)
select(ABBREV, Food = Shrt_Desc,  PUFAs = `FA_Poly_(g)`)
select(ABBREV, Food = Shrt_Desc,  Carbohydrates = `Carbohydrt_(g)`)
select(ABBREV, Food = Shrt_Desc,  Fiber = `Fiber_TD_(g)`)
select(ABBREV, Food = Shrt_Desc,  Sugar = `Sugar_Tot_(g)`)
select(ABBREV, Food = Shrt_Desc, Calcium = `Calcium_(mg)`)
select(ABBREV, Food = Shrt_Desc,  Iron = `Iron_(mg)`)
select(ABBREV, Food = Shrt_Desc, VitB12 = `Vit_B6_(mg)`)
select(ABBREV, Food = Shrt_Desc,  VitC = `Vit_C_(mg)`)
```


```{r}
ABfull <- ABBREV %>% 
              merge(select(FOOD_DES, NDB_No, FdGrp_Cd), by = "NDB_No") %>%
              merge(FD_GROUP, by = "FdGrp_Cd")




```



```{r select nutrients of interest}
NutData <- ABfull %>%
  select(Food = Shrt_Desc, Calories = Energ_Kcal, Protein = `Protein_(g)`, Total_Lipids = `Lipid_Tot_(g)`, SatFat = `FA_Sat_(g)`, MUFAs = `FA_Mono_(g)`, PUFAs = `FA_Poly_(g)`, Carbohydrates = `Carbohydrt_(g)`, Fiber = `Fiber_TD_(g)`, Sugar = `Sugar_Tot_(g)`, `Calcium_(mg)`, Iron = `Iron_(mg)`, Calcium = `Calcium_(mg)` , VitB12 = `Vit_B6_(mg)`, VitC = `Vit_C_(mg)`, FdGrp_Desc) %>%
  mutate(Food = toupper(Food))
```
