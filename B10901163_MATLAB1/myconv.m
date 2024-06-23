x1 = [1:1:20 19:-1:1];
x2 = ones(1,10);
x3 = zeros(length(x1)+length(x2)-1,length(x2));
for i = 1:length(x1)+length(x2)-1
    for j = 1:length(x2)
        if i - j <= length(x1)-1 && i - j >= 0
            x3(i,j) = x1(i-j+1);
        end
    end
end
y1 = conv(x1,x2);
figure1 = figure();
stem(x1);
figure2 = figure();
stem(x2);
figure3 = figure();
stem(y1);
y2 = x3*x2';
figure4 = figure();
stem(y2);



x4 = [3,9,27];
x5 = [2,4,8,16,32];
y3 = conv(x4,x5);

x6 = zeros(length(x4)+length(x5)-1,length(x5));
for i = 1:length(x4)+length(x5)-1
    for j = 1:length(x5)
        if i - j <= length(x4)-1 && i - j >= 0
            x6(i,j) = x4(i-j+1);
        end
    end
end
y4 = x6*x5';
figure5 = figure();
stem(x4);
figure6 = figure();
stem(x5);
figure7 = figure();
stem(y3);
figure8 = figure();
stem(y4);
