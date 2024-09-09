Dataset<-read.csv("E:/Midterm_Project_Dataset_section(B).csv")
print(Dataset)
colSums(is.na(Dataset))
Dataset$age <- ifelse(is.na(Dataset$age), mean(Dataset$age, na.rm = TRUE), Dataset$age)
Dataset$sibsp <- ifelse(is.na(Dataset$sibsp), mean(Dataset$sibsp, na.rm = TRUE), Dataset$sibsp)
Dataset$parch <- ifelse(is.na(Dataset$parch), mean(Dataset$parch, na.rm = TRUE), Dataset$parch)
Dataset$alone <- ifelse(is.na(Dataset$alone), mean(Dataset$alone, na.rm = TRUE), Dataset$alone)
print(Dataset)


Dataset[,1]

print(max(Dataset$Gender))
Dataset <- edit(Dataset)
Dataset[,1]
print(Dataset)

Dataset$age <-as.numeric(format(round(Dataset$age,0)))
print(Dataset)

plot(Dataset$age,col=4)
plot(Dataset$fare,col=6)

mean(Dataset$age)
mode(Dataset$age)
median(Dataset$age)

mean(Dataset$alone)
mode(Dataset$alone)
median(Dataset$alone)

print(Dataset)


# outliers
Q1 <- quantile(Dataset$age, 0.25)
Q3 <- quantile(Dataset$age, 0.75)
IQR <- Q3 - Q1
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Identify outliers
outliers <- Dataset$age[Dataset$age < lower_bound | Dataset$age > upper_bound]
print(outliers)


