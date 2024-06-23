
%% 
% x[n]
n = -500:1:500;
x = sincc(0.4*n);
figure
plot(n,x)
xlabel("n")
ylabel("x")
title("(a) x[n]")

%% 
% FFT
omega = n * 2 * pi / 1001;
x_fft = fft(x);
x_fft_abs = abs(x_fft);
x_fft_abs_shift = [x_fft_abs(501:1:1001) x_fft_abs(1:1:500)];
figure
plot(omega, x_fft_abs_shift)
xlabel("omega")
ylabel("X(exp(j omega))")
title("(b) FFT")

%% 
% FT - equation (1)
n1 = -500:1:500;
k1 = -500:1:500;
x1 = sincc(0.4*n1);
e2= (k1-1)' * (n1-1);
e1 = x1*exp(-1i*2*e2*pi/1001);
figure
plot(k1*2*pi/1001,abs(e1))
xlabel("omega")
ylabel("X(exp(j omega))")
title("(c) FT using equation (1)")

%% 
% window function w[n]
n2 = -500:1:500;
n2_window = -125:1:125;
w = [zeros(1,375) 0.5*(1+cos(0.008*pi*abs(n2_window))) zeros(1,375)];
figure
plot(n2,w)
xlabel("n")
ylabel("w")
title("(d) w[n]")

%% 
% new signal y[n]
y = w.*x;
figure
plot(n2,y)
xlabel("n")
ylabel("y")
title("(e) y[n]")

%% 
% FFT of new signal
omega2 = n2 * 2 * pi / 1001;
y_fft_abs = abs(fft(y));
y_fft_abs_shift = [y_fft_abs(501:1:1001) y_fft_abs(1:1:500)];
figure
plot(omega2, y_fft_abs_shift)
xlabel("omega")
ylabel("Y(exp(j omega))")
title("(f) Y(exp(j omega))")

%%
function y = sincc(x)
y = sin(pi*x)./(pi*x);
y(x==0) = 1;
end