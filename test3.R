ncol(cars);nrow(cars) #cars 的行列数
dim(cars) #cars 维数
lm(dist~speed,data = cars) #dist为因变量speed为自变量做OLS
cars$qspeed = cut(cars$speed,breaks = quantile(cars$speed),include.lowest = T) #增加定性变量qspeed,四分点位为分割点
names(cars)
cars[3]
table(cars[3]) #列表
is.factor(cars$speed)
plot(dist~speed,data = cars) #点出箱线图
(a=lm(dist~speed,data = cars)) #拟合线性模型，简单最小二乘回归
summary(a) 


###################################
x<-round(runif(20,0,20),digits = 2) #四舍五入
summary(x)
min(x);max(x);range(x)
median(x) #中位数
mean(x) #均值
var(x) #方差
sd(x) #标准差
sqrt(x) #平方根
rank(x) #秩
order(x) #升幂排列x下标
(x);length(x)
order(x,decreasing = T) #降序
x[order(x)] #same to sort(x)
sort(x,decreasing = T)
sum(x);length(x)
round(x);round(x,3)
fivenum(x)
quantile(x)
quantile(x,c(0,.33,.66,1))
mad(x) #median avg distance
cummax(x) #累积最大值
cummin(x) #累积最小值
cor(x,sin(x/20)) #线性相关系数correlation


