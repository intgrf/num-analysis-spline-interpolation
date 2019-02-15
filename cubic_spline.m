function [a, b, c, d] = cubic_spline(x, y)

n = length(x);

h = x(2) - x(1);
dy = zeros(n-1, 1);
for i = 1 : n-1
    dy(i) = y(i+1) - y(i);
end

d = y';
e = ones(n-2, 1);
M = spdiags([e 4*e e], [-1 0 1], n-2, n-2);
%ddy = (3/h^2)*(dy(1:n-2));
ddy = zeros(n-2, 1);
for k = 1 : n-2
   ddy(k) = dy(k+1) - dy(k); 
end
ddy = (3/h^2) * ddy;
sol = M\ddy;
b = [0; sol; 0];
c = zeros(n-1, 1);
for k =  1 : n-1
   c(k) = dy(k)/h - ((b(k+1) + 2*b(k))*h)/3;
end
%c = dy/h - (2*b(1:n) + b(1:n-1))*(h/3);
a = zeros(n-1, 1);
for k = 1 : n-1
   a(k) = (b(k+1) - b(k))/(3*h);
end
%a = (b(2:n) - b(1:n-1))/(3*h);

end