###:-------r_graph.r--------:###
#Basic statistical analysis and plots for listicles


if(!file.exists("2014.csv")) {
print("Error")
} else {
data=read.csv(file="2014.csv", header=FALSE,
col.names=c("counts", "list_size"))
#Order data by list_size column
data=data[with(data, order(list_size)),]

total=sum(data[,"counts"])
data[,"counts"] = data[,"counts"]/total

#Mean number of list items
mu = sum(data[,"counts"] * data[,"list_size"])
#std dev
std.dev = sd(data[,"counts"])

#Plot
jpeg("listicles_plot.jpeg")
plot(data[,"list_size"], data[,"counts"], xlim=c(0,100))
lines(data[,"list_size"], data[,"counts"], xlim=c(0,100))
dev.off() 
}
