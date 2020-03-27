clc,clear
%n个子函数构成目标函数
n = 10;
%待优化量初值
x = 0;
%迭代步数
iter = 0;
%步长
stepsize = 0.001;
%设置u(i)
u_perturb = normrnd(0,2,1,n);
u = u_perturb+10;
%初始化梯度值
g = 0;
for i=1:1:n
    g = g+2*(x-u(i));
end
%梯度下降核心算法
while(norm(g,1)>10^-2)&&(iter<10000)
    iter = iter+1;
    x=x-stepsize*g;
    g = 0;
    for i=1:1:n
        g = g+2*(x-u(i));
    end
end

save u.mat u;
save x.mat x;
save n.mat n;