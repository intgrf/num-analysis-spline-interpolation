clc
clear
h = 1;
x = 1 : h: 10;
y = sin(x);
[a, b, c, d] = cubic_spline(x, y);

n = length(x);
t = 0: 0.001*h : h;
for i = 1 : n-1
    s = [a(i) b(i) c(i) d(i)];
    g = polyval(s, t);
    plot(t + x(i), g, 'r', x, y, 'black.'); hold on; grid on;
end
x_ = 1 : 0.001*h : 10;
y_ = sin(x_);
plot(x_, y_, 'b'); hold on; grid on;
