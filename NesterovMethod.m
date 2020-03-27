clc,clear
%10���Ӻ�������Ŀ�꺯��
n = 10;
%���Ż�����ֵ
x = 0;
%���ӻ��㼯
x_step = [];
x_step(1) = x;
y_step = [];
%��������
iter = 0;
%����
stepsize = 0.01;
%Momentum method parameter beta
beta = 0.9;
%����u(i)
u_perturb = normrnd(0,2,1,n);
u = u_perturb+5;
%��ʼ���ݶ�ֵ
v = 0;
%��ʼ��Nesterov's method�м����
state = 0;
%��ʼ���ݶ�ֵ
state = x-stepsize*beta*v;
g = 0;
for i=1:1:n
    g = g+2*(state-u(i));
end
v = beta*v+(1-beta)*g;
%�ݶ��½������㷨
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
%���ӻ�
y = 0;
x = -5:0.01:12;
for i=1:1:n
    y = y+(x-u(i)).^2;
end
plot(x,y,'k','LineWidth',3)
%�ݶ��½�����ֻ�����ܲ�����10%
for i = 1:1:0.1*(iter-1)
    arrow([x_step(i),y_step(i)],[x_step(i+1),y_step(i+1)]);
end