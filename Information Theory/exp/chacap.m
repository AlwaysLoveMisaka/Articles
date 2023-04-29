function answer=chacap(Pt)
% Pt：信道矩阵
% 用matalb的eps代替信道矩阵内的元素0以避免对0取对数
% C：信道容量
[r,s]=size(Pt); % 确定输入和输出符号个数
Pi=ones(1,r)/r; % 行向量，输入分布初始化为等概
Cn=0; % C(n)初始化为0
Cn1=inf; % C'(n)初始化为无穷大
beta=ones(1,r); % 偏互信息的指数
I=1; % 互信息初始化为1
while abs(Cn-Cn1)>=1.0e-004 % 迭代误差限
    for k=1:r
        Pi(k)=Pi(k)*beta(k)/I; % 更新输入分布
    end        
    % 以下计算beta(k):
    Po=Pi*Pt ; % 输出概率
    for k=1:r
        bt=0; % 中间变量
        for j=1:s
            bt=bt+Pt(k,j)*log(Pt(k,j)/Po(j));
        end
        beta(k)=exp(bt);
    end
    I=Pi*beta'; % 各β的加权平均
    Cn=log(I); % 
    Cn1=log(max(beta)); % 各β的最大值
end
C=Cn*log2(exp(1)); % 比特
answer=sprintf('该信道的信道容量 C = %f 比特/信道符号',C);
