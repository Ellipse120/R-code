#复数运算和求函数极值
(2+4i)^-3.5 +(2i+4.5)*(-1.7-2.3i)/((2.6-7i)*(-4+5.1i)) #复数运算
(z<-complex(real = rnorm(10),imaginary = rnorm(10))) #一个10维复向量
complex(re=rnorm(3),im=rnorm(3)) #3维复向量
Re(z)
Im(z)
Mod(z) #模
Arg(z) #辐角
choose(3,2)
factorial(6)
#解方程
f=function(x) x^3-2*x -1
uniroot(f,c(0,2)) #迭代求根
#如果知道根为极值
f=function(x) x^2+2*x+1
optimize(f,c(-2,2))


#字符型向量
b = factor(letters[1:10])
b[3] = "w"
b = as.character(b)
b[3]
b;character(b)

#数据输入输出
#x1 = scan()
x1 = c(1.5,2.6,3.7,2.1,8.9,12.0,-1.2,-4.0)
w=read.table(file.choose(),header = T) #从列表选择有变量名的数据
setwd("f:/adf") set("f:\adf") #建立工作路径
(x2=rnorm(20))
write(x,"f:/adf/test.txt") 
y=scan(x,"f:/adf/test.txt") #扫描文件数值到y
y=iris;y[1:5];str(y)
write.table(y,"test.txt",row.names = F) #把数据写入文本文件
w=read.table("f:/adf/test.txt",header = T)
str(w)
write.csv(y,"test.csv")
v=read.csv("f:/adf/test.csv")
str(v)
data=read.table("clipboard")

