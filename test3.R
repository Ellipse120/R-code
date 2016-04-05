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
