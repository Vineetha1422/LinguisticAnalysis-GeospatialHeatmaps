#install.packages("tidyverse")
library(tidyverse) 
library(stats) 

#creating pillai function
PillaiFun = function(data){
  (summary(manova(cbind(F1.50.,F2.50.) ~ new.vowel.class, data = data), test='Pillai')$stats)[1,2]
}

#Update path with dataset location
path = ""
Data = read.csv(path)
head(Data)

#subset to the vowels you want to run the pillai calculation on
LB_data = 
  Data %>%
  modify_if(is.character, as.factor) %>%
  filter(new.vowel.class %in% c("BAN","BAT"))

head(LB_data)

#running function to calculate Linguistic variable pillai score for each speaker
#Name of the variable changes as per the Linguistic variable
group_nest2 <- LB_data %>% 
  group_by(speaker)%>%
  nest() %>% 
  mutate(BanBat_pillai = map(data,PillaiFun)) %>% 
  select(-data) %>% 
  unnest(cols = c(BanBat_pillai))
View(group_nest2)

#adding pillai scores to original data file
data_pillai= Data %>%
  inner_join(group_nest2) 
head(data_pillai)

#Update outputPath with destination location
ouputPath = ""
write.csv(data_pillai,file= outputPath)
