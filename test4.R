#简单图
x=rnorm(200)
hist(x,col = "light blue") #直方图histogram
rug(x) #在直方图下面加上实际点大小
stem(x) #茎叶图
x<-rnorm(500)
y <- x+rnorm(500) 
plot(y~x) #散点图
a=lm(y~x) #做回归
abline(a,col="red") #加拟合线
abline(lm(y~x),col="blue") #加拟合线
paste("x的最小值=",min(x))
demo(graphics)
