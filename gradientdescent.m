clc,clear
%n���Ӻ�������Ŀ�꺯��
n = 10;
%���Ż�����ֵ
x = 0;
%��������
iter = 0;
%����
stepsize = 0.001;
%����u(i)
u_perturb = normrnd(0,2,1,n);
u = u_perturb+10;
%��ʼ���ݶ�ֵ
g = 0;
for i=1:1:n
    g = g+2*(x-u(i));
end
%�ݶ��½������㷨
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