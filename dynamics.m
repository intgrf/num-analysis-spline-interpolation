clc
clear
h_beg = 1;
h_end = 0.01;
h_step = -0.001;
num = length(h_beg : h_step : h_end);
max_deviations = zeros(num, 1);
points_num = zeros(num, 1);
i = 1;
for h = h_beg : h_step : h_end
    x = 1 : h : 10;
    y = sin(x);
    n = length(x);
    points_num(i) = n;
    
    [a, b, c, d] = cubic_spline(x, y);
    
    t = 0 : 0.001*h : h;
    cur_max = 0;
    for k = 1 : n-1
        s = [a(k) b(k) c(k) d(k)];
        s_val = polyval(s, t);
        x_ = x(k) : 0.001*h : x(k+1);
        sin_val = sin(x_);
        deviations = abs(sin_val - s_val);
        max_dev = max(deviations);
        if max_dev > cur_max
            cur_max = max_dev;
        end
    end
    max_deviations(i) = cur_max;
    i = i + 1;
end

plot(points_num, max_deviations, 'r.'); grid