#Matrix
x=sample(1:100,12);x
all(x>0);all(x!=0);any(x>0);(1:10)[x>0]
diff(x) #差分
diff(x,lag = 2)
x=matrix(1:20,4,5);x
x=matrix(1:20,4,5,byrow = T);x #矩阵构造，按行构造
t(x) #转置
x=matrix(sample(1:100,20),4,5);x
2*x
x+5
y=matrix(sample(1:100,20),5,4);y
x+t(y)
(z=x%*%y)
z1=solve(z) #solve(a,b)可解方程ax=b
z1
round(z1%*%z,14) #四舍五入
b=solve(z,1:4);b

#####
nrow(x);ncol(x);dim(x) #行列数目
x=matrix(rnorm(24),4,6)
x
x[c(2,1),] #第2和第1行
x[,c(1,3)] #第1和第3列
x[2,1] #####自己会进位
x[x[,1]>0,1] #第1列大于0的元素
sum(x[,1]<=0) #第1列<=0的元素个数
sum(x[,1]>0) #第1列大于0的元素个数
x[,-c(1,3)] #没有第1列第3列的x
diag(x)
diag(1:5) #以1:5为对角线，其它元素为0的对角线矩阵
diag(5) # E5
x[-2,-c(1,3)] #没有第2行，第1,3列的x
x
x[x[,1]>0&x[,3]<=1,1] #第1列大于0且第3列小于等于第1列元素
x[x[,2]>0|x[,1]<3,1] #第2列大于0或者第1列小于3的第1列元素
x[!x[,2]<3,1] #第1列中相应于第2列中大于等于3的元素
apply(x, 1, mean) #对行(第1维)求均值
apply(x, 2, sum) #对列求和
x=matrix(rnorm(24),4,6)
x
x[lower.tri(x)]=0;x #上三角
x[upper.tri(x)]=0;x 


##########高维数组
x=array(runif(24),c(4,3,2)) #用24个均匀分布样本点构造4*3*2维数组
is.matrix(x)
x=array(1:24,c(4,3,2)) 
x
x[c(1,3),,]
apply(x, 1, mean) #对部分维求均值
apply(x, 1:2, sum) #对部分维数求和
#apply(x, c(1,3), prob) #对部分维数求乘积

####矩阵与向量之间的运算
x=matrix(1:20,5,4)
x
sweep(x,1,1:5,"*") #把向量1:5的每个元素乘到每一行
sweep(x,2,1:4,"+") #把向量1:4的每个元素加到每一列
x*1:5 #把向量1:5的每个元素乘到每一行
x
(x=matrix(sample(1:100,24),6,4));(x1=scale(x))
(x2=scale(x,scale=F))
(x3=scale(x,center=F))
round(apply(x1,2,mean),14)
apply(x1, 2, mean)
round(apply(x2, 2, mean),14);apply(x2, 2, sd)
round(apply(x3, 2, mean),14);apply(x3, 2, sd)

######缺失值、数据的合并
airquality #有缺失值（NA）的R自带数据
complete.cases(airquality) #判断每行有没有缺失值
which(complete.cases(airquality)==F) #有缺失值的行号
sum(complete.cases(airquality)) #完整观测值的行数
na.omit(airquality) #删去缺失值的数据
#附加，横或竖合并数据：append，cbind，rbind
x=1:10;x[12]=3  #
(x1=append(x,77,after=5))  #在第5项后面添加 77
cbind(1:5,rnorm(5))  #
rbind(1:5,rnorm(5))  #
cbind(1:3,4:6);rbind(1:3,4:6)  #
#去掉矩阵重复的行
(x=rbind(1:5,runif(5),1:5,7:11))  #
x[!duplicated(x),] #
unique(x) #

####list
z=list(1:3,Tom=c(1:2,a=list("R",LETTERS[1:5]),W="hi"))
z[[1]];z[[2]]
z$T
z$T$a2
z$T[[3]]
z$T$w

#条形图和表
x=scan()
#ex:input 3 3 3 4 1 4 2 1 3 2 5 3 1 2 5 2 3 4 2 2 5 3 1 4 2 2 4 3 5 2 
barplot(x)
table(x)
barplot(table(x))
barplot(table(x)/length(x))
table(x)/length(x)

#生成表格
library(MASS) #载入软件包MASS
quine #MASS所带数据
attach(quine) #把数据变量的名字放入内存
#下面是从该数据得到的各种表格
table(Age) #
table(Sex,Age); #
tab=xtabs(~Sex+Age,quine); #
unclass(tab) #
tapply(Days,Age,mean) #
tapply(Days,list(Sex,Age),mean) #
detach(quine) #attach的逆运行

####################写函数
ss=function(n=100){
  z=2;
  for(i in 2:n)
    if(any(i%%2:(i-1)==0)==F)
      z=c(z,i);
    return(z)
} #求n以内的素数
fix(ss) #用来修改任何函数或者编写一个新函数
ss() #计算100以内的素数
t1=Sys.time() #纪录系统时间点
ss(10000) #计算10000以内的素数
Sys.time()-t1 #费了多少时间
system.time(ss(10000)) #计算执行ss（10000）所用时间
#函数可以不写return，这时最后一个值为return的值
#为了输出多个值最好使用list输出


##########画图
x=seq(-3,3,len=20); y=dnorm(x)#产生数据
w=data.frame(x,y) #合并x和y，生成w
par(mfcol=c(2,2)) #准备画4个图的地方
plot(y~x,w,main="正态密度函数")
plot(y~x,w,type="l",main="正态密度函数")
plot(y~x,w,type="o",main="正态密度函数")
plot(y~x,w,type="b",main="正态密度函数")
par(mfcol=c(1,1)) #取消par(mfcol=c(2,2))

############色彩和符合等的调节
plot(1,1,xlim=c(1,7.5),ylim=c(0,5),type="n")#画出框架
#在plot命令后面追加点（如要追加线可用lines函数）
points(1:7,rep(4.5,7),cex=seq(1,4,l=7),col=1:7,pch=0.6) 
text(1:7,rep(3.5,7),labels=paste(0:6,letters[1:7]),cex=seq(1,4,l=7),col=1:7)
#在指定位置加文字
points(1:7,rep(2,7),pch=(0:6)+7)#点出符号7到13
text((1:7)+0.25,rep(2:7),paste((0:6)+7)) #加符号号码
points(1:7,rep(1:7),pch=(0:6)+14) #点出符号14到20
text((1:7)+0.25,rep(1:7),paste((0:6)+14))#加符号号码
#这些关于符号形状，大小，颜色，以及其它画图选项的说明可用 “？par”查看
