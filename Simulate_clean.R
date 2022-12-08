################################################################################
#
#Date: 2022-12-01
#CDM
#Data simulation
#
################################################################################


install.packages("randomNames")
library("randomNames")

install.packages("uuid")
library("uuid")

install.packages("nomisr")
library("nomisr")

set.seed(19809809)

################################
# Generate basics
#################################


names<-randomNames(500)

sampleid<-UUIDgenerate(n=500)

dataset<-cbind.data.frame(names,sampleid)



############################
#Age distribution
############################

age_group<-c('0-4',
             '5-9',
             '10-14',
             '15-19',
             '20-24',
             '25-29',
             '30-34',
             '35-39',
             '40-44',
             '45-49',
             '50-54',
             '55-59',
             '60-64',
             '65-69',
             '70-74',
             '75-79',
             '80-84',
             '85-89',
             '90 and over')

N<-c(
  3239447,
  3539458,
  3435579,
  3115871,
  3472522,
  3771493,
  3824652,
  3738209,
  3476303,
  3638639,
  3875351,
  3761782,
  3196813,
  2784300,
  2814128,
  2009992,
  1449189,
  885343,
  521067)


min<-seq(from=0, to=90, by=5)
max<-seq(from=5, to=95, by=5)






age_distribution<-as_tibble(cbind.data.frame(age_group,N,proportion=N/sum(N),min=min,max=max))

age_distribution<-age_distribution %>% mutate(sample_n=round(500*proportion,0))

adjustment<-500-sum(age_distribution[,"sample_n"])

age_distribution[min==90, "sample_n"]<-age_distribution[min==90, "sample_n"]+adjustment



###############################
#Simulate Age
##############################

age_distribution2<-data.frame(age_distribution)

simulated_age<-unlist(apply(age_distribution2,1,function(x) {
  runif(as.numeric(x[6]),as.numeric(x[4]),as.numeric(x[5]))
}))

simulated_age<-sample(simulated_age, size=500, replace=FALSE)



#############
#Merge dataset
##############

dataset<-cbind.data.frame(dataset,age=simulated_age)





