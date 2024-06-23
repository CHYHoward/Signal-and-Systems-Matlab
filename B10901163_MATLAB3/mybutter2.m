%% 
% x[n]
figure
n = 1:1:1000;
x = cos(0.004*pi*(n-1))+2*cos(0.4*pi*(n-1));
subplot(3,1,1)
plot(n,x)
title("(a)x[n] vs. n")
xlabel("n")
ylabel("x[n]")
%% 
% Filter #1 

[b,a] = butter(16,0.08,"low")
y = filter(b,a,x,[],2);
subplot(3,1,2)
plot(n,y)
title("(b)y[n] vs. n")

xlabel("n")
ylabel("y[n]")
%% 
% Filter #2 

[b,a] = butter(16,[0.3,0.5],"bandpass")
y = filter(b,a,x,[],2);
subplot(3,1,3)
plot(n,y)
title("(c)y[n] vs. n")

xlabel("n")
ylabel("y[n]")
