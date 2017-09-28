
  
  library(dplyr)
library(RSQLite)
head(prescriber1)
install.packages("RMySQL")
library("RMySQL")
install.packages("RSQLite")
is.character(prescriber1)
attach(prescriber1)
myDB <- "kari.db"
myConn <- dbConnect(drv = SQLite(), dbname= myDB)
dbListTables(myConn)
dbWriteTable(myConn,"prescriberr1",prescriber1)
dbListTables(myConn)
a=dbGetQuery(myConn,"SELECT Specialty,count(OpioidPrescriber) from prescriberr1 where OpioidPrescriber=1 group by Specialty order by count(OpioidPrescriber) desc" )
a
plot(a)

abc=a[1:25,]
dev.new()
barplot(abc$`count(OpioidPrescriber)`,names.arg = abc$Specialty,las=3,col=c("darkblue","red","green","orange","yellow"))
lablist <- as.vector(colnames(abc))
a=dbGetQuery(myConn,"SELECT Gender,count(OpioidPrescriber) from prescriberr1 where OpioidPrescriber=1 group by Gender order by count(OpioidPrescriber) desc" )
a
plot(a)

barplot(a$`count(OpioidPrescriber)`,names.arg = a$Gender,col=c("darkblue","red"))

R Code:
  barplot(overdoses$Ratiopercentage,names.arg = overdoses$State,las=2,col=c("darkblue","red"))




R Code:
  aaaa=dbGetQuery(myConn,"SELECT State,count(OpioidPrescriber) from prescriberr1 where OpioidPrescriber=1 group by State order by count(OpioidPrescriber) desc" )
abcd=aaaa[1:25,]
barplot(abcd$`count(OpioidPrescriber)`,names.arg = abcd$State,las=2,col=c("darkblue","red","yellow","orange","green"))


SAS Code:
  data drugoverdose;
set work.prescriber1;

run;
proc logistic descending 
data= drugoverdose; 
class Gender	State	Credentials	Specialty;
model OpioidPrescriber= NPI Gender	State	Credentials	Specialty;

run;  







