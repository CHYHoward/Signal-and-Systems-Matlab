%% 
% x[n]

clear
n = 1:1:100;
x = cos(0.1*pi*(n-1));
figure
plot(n,x)
title("(a)x[n] vs. n")
xlabel("n")
ylabel("x[n]")
%% 
% Filter #1
figure
[b,a] = butter(3,0.05,'low');
[H,w] = freqz(b,a,100);
subplot(3,3,1)
plot(w,20*log10(abs(H)))
title("(b)magnitude response in dB")
xlabel("w(rad/s)")
ylabel("dB")
subplot(3,3,2)
plot(w,unwrap(angle(H))*180/pi)
title("(b)phase response in degree")
xlabel("w(rad/s)")
ylabel("degree")
y = filter(b,a,x,[],2);
subplot(3,3,3)
plot(n,y)
title("(b)y[n] vs. n")

xlabel("n")
ylabel("y[n]")
%% 
% Filter #2

[b,a] = butter(7,0.05,'low');
[H,w] = freqz(b,a,100);
subplot(3,3,4)
plot(w,20*log10(abs(H)))
title("(c)magnitude response in dB")
xlabel("w(rad/s)")
ylabel("dB")
subplot(3,3,5)
plot(w,unwrap(angle(H))*180/pi)
title("(c)phase response in degree")
xlabel("w(rad/s)")
ylabel("degree")
y = filter(b,a,x,[],2);
subplot(3,3,6)
plot(n,y)
title("(c)y[n] vs. n")

xlabel("n")
ylabel("y[n]")
%% 
% Filter #3

[b,a] = butter(3,0.5,'low');
[H,w] = freqz(b,a,100);
subplot(3,3,7)
plot(w,20*log10(abs(H)))
title("(d)magnitude response in dB")
xlabel("w(rad/s)")
ylabel("dB")
subplot(3,3,8)
plot(w,unwrap(angle(H))*180/pi)
title("(d)phase response in degree")
xlabel("w(rad/s)")
ylabel("degree")
y = filter(b,a,x,[],2);
subplot(3,3,9)
plot(n,y)
title("(d)y[n] vs. n")

xlabel("n")
ylabel("y[n]")