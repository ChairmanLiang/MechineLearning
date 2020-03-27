clc,clear
% 待拟合参数数目；
n = 3;

%total data
m = 50;

% initial parameters
theta = zeros(1,n);

% data
w = [0.3 0.5];
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
    h(1) = h(1)+(theta(1)+x(i,1)*theta(2)+x(i,2)*theta(3)-y(i));
end
% gradient of parameter 2
for i = 1:1:m
    h(2) = h(2)+(theta(1)+x(i,1)*theta(2)+x(i,2)*theta(3)-y(i))*x(i,1);
end
% gradient of parameter 3
for i = 1:1:m
    h(3) = h(3)+(theta(1)+x(i,1)*theta(2)+x(i,2)*theta(3)-y(i))*x(i,2);
end

while(iter<5000)
    theta = theta - alpha*h;
    h = zeros(1,n);
    iter = iter+1;
    % gradient of parameter 1
    for i = 1:1:m
        h(1) = h(1)+(theta(1)+x(i,1)*theta(2)+x(i,2)*theta(3)-y(i));
    end
    % gradient of parameter 2
    for i = 1:1:m
        h(2) = h(2)+(theta(1)+x(i,1)*theta(2)+x(i,2)*theta(3)-y(i))*x(i,1);
    end
    % gradient of parameter 3
    for i = 1:1:m
        h(3) = h(3)+(theta(1)+x(i,1)*theta(2)+x(i,2)*theta(3)-y(i))*x(i,2);
    end
end


figure(1)
[x1,y1] = meshgrid(0:0.1:10);
z1 = theta(1)+theta(2).*x1+theta(3).*y1;
mesh(x1,y1,z1),xlabel('x'),ylabel('y'),zlabel('z')
hold on
%调用'MarkerFaceColor'可以将散点图的空心点转化为实心点
scatter3(x(:,1),x(:,2),y, 'k');
hold on
