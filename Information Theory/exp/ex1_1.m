p=0.00001:0.001:0.99999;
h=-p.*log2(p)-(1-p).*log2(1-p);
plot(p,h);
title('二进熵函数曲线');
ylabel('H(p,1-p)')
