clc,clear
%10个子函数构成目标函数
n = 10;
%待优化量初值
x = 0;
%可视化点集
x_step = [];
x_step(1) = x;
y_step = [];
%迭代步数
iter = 0;
%步长
stepsize = 0.01;
%Momentum method parameter beta
beta = 0.9;
%设置u(i)
u_perturb = normrnd(0,2,1,n);
u = u_perturb+5;
%初始化梯度值
v = 0;
%初始化Nesterov's method中间变量
state = 0;
%初始化梯度值
state = x-stepsize*beta*v;
g = 0;
for i=1:1:n
    g = g+2*(state-u(i));
end
v = beta*v+(1-beta)*g;
%梯度下降核心算法
while(norm(g,1)>10^-3)
    iter = iter+1;
    x=x-stepsize*v;
    x_step(iter) = x;
    y_step(iter) = 0;
    for i = 1:1:n
        y_step(iter) = y_step(iter)+(x_step(iter)-u(i))^2;
    end
    state = x-stepsize*beta*v;
    g = 0;
    for i=1:1:n
        g = g+2*(state-u(i));
    end
    v = beta*v + (1-beta)*g;
end
%可视化
y = 0;
x = -5:0.01:12;
for i=1:1:n
    y = y+(x-u(i)).^2;
end
plot(x,y,'k','LineWidth',3)
%梯度下降向量只绘制总步数的10%
for i = 1:1:0.1*(iter-1)
    arrow([x_step(i),y_step(i)],[x_step(i+1),y_step(i+1)]);
end