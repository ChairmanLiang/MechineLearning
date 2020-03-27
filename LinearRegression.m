clc,clear
% 待拟合参数数目；
n = 2;

%total data
m = 50;

% initial parameters
theta = zeros(1,n);

% data
w = 0.3;
x = 10*rand(m,n-1);
error = rand(m,1);
y = sum(bsxfun(@times, x, w),2)+error;

% iteration index
iter = 0;

% stepsize
alpha = 0.0001;

% predicted value
Y = zeros(m,1);
%initial gradient
h = zeros(1,n);
% gradient of parameter 1
for i = 1:1:m
    h(1) = h(1)+(theta(1)+x(i)*theta(2)-y(i));
end
% gradient of parameter 2
for i = 1:1:m
    h(2) = h(2)+(theta(1)+x(i)*theta(2)-y(i))*x(i);
end
h
while(iter<2000)
    theta = theta - alpha*h;
    h = zeros(1,n);
    iter = iter+1;
    % gradient of parameter 1
    for i = 1:1:m
        h(1) = h(1)+(theta(1)+x(i)*theta(2)-y(i));
    end
    % gradient of parameter 2
    for i = 1:1:m
        h(2) = h(2)+(theta(1)+x(i)*theta(2)-y(i))*x(i);
    end
end
h

figure(1)
t = 0:0.1:10;
plot(t,theta(1)+theta(2)*t,'k')
hold on
scatter(x,y,'k');
hold on
