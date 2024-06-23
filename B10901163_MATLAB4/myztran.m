%% 
% plotting poles and zeros

clear
a = [1 -0.8 0.39 -0.062 0.005];
b = [0.09 0 -0.18 0 0.09];
subplot(3,3,1)
zplane(b,a)
title("(a) poles and zeros")
%% 

% real h[n]


n = 0:1:20;
[r,p,k] = residuez(b,a);
j = 2*abs(r(1))*(abs(p(1)).^n).*cos(angle(r(1))+n*angle(p(1)));
l = 2*abs(r(3))*(abs(p(3)).^n).*cos(angle(r(3))+n*angle(p(3)));

H = j+l;
H(1)=H(1)+18;
subplot(3,3,2)
stem(n,H)
title("(b) h[n] to n")
xlabel("n")
ylabel("h[n]")
%% 
% magnitude and phase respond

[h1,w] = freqz(b,a,2001);
subplot(3,3,3)
plot(w,20*log10(abs(h1)))
title("(c)-1 magnitude response")
xlabel("w")
ylabel("magnitude(dB)")

subplot(3,3,4)
plot(w,angle(h1)*180/pi)
title("(c)-2 phase response")
xlabel("w")
ylabel("phase(degree)")
%% 
% zp2sos

z = [1,1,-1,-1];
sos = zp2sos(z,p,0.09);
%% 
% H1(z), H2(z)

[H1,w] = freqz(sos(1,1:3),sos(1,4:6),2001);
[H2,w] = freqz(sos(2,1:3),sos(2,4:6),2001);

subplot(3,3,5)
plot(w,20*log10(abs(H1)))
title("(e)-1 H1 magnitude")
xlabel("w")
ylabel("magnitude(dB)")

subplot(3,3,6)
plot(w,20*log10(abs(H2)))
title("(e)-2 H2 magnitude")
xlabel("w")
ylabel("magnitude(dB)")

subplot(3,3,7)
plot(w,20*log10(abs(H1))+20*log10(abs(H2)))
title("(e)-3 H1*H2 magnitude")
xlabel("w")
ylabel("magnitude(dB)")
%% 
% filter y[n]

x = zeros(1,21);
x(1) = 1;
y = filter(b,a,x,[],2);
subplot(3,3,8)
stem(n,y)
title("(f) y[n] to n")
xlabel("n")
ylabel("y[n]")