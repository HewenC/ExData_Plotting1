library(sas7bdat)
x=read.sas7bdat('claim_unmatch1.sas7bdat',debug=TRUE)
write.table(x, file="wc_claim_unmatch1.txt", sep="\t",row.names = FALSE)


y=read.sas7bdat('froi_unmatch1.sas7bdat',debug=TRUE)
write.table(y, file="wc_froi_unmatch1.txt", sep="\t",row.names = FALSE)

write.table(x, file="wc_claim_unmatch1.csv", sep=",",append=F)
write.table(y, file="wc_froi_unmatch1.csv", sep=",",append=F)

write.csv(x,file='wc_claim_unmatch1.csv',row.names = FALSE)

x2=read.sas7bdat('claim_unmatch1.sas7bdat',debug=TRUE,colClasses=c('N_CO'='CHARACTER','N_CLM'='CHARACTER','I_POL_REC'='CHARACTER'))

X2 <- sapply(vector, function(x) paste0("'", x))
write.csv(X2,file='wc_claim_unmatch1.csv',row.names = FALSE)

x$N_CO = as.character(x$N_CO)
x$N_CLM= as.character(x$N_CLM)
x$I_POL_REC=as.character(x$I_POL_REC)
write.csv(x,file='wc_claim_unmatch1.csv',row.names = FALSE)
