clear;   clc;
%编码
G=input('请输入生成矩阵G,例如:G=[1 0 0 0 1 0 1;0 1 0 0 1 1 0;0 0 1 0 0 1 1;0 0 0 1 1 1 1]\n G=');
[k,n]=size(G);
r=n-k;
m=input('请输入需传送信息m,如m=[0 0 0 1 0 0 1 0 0 0 1 1 0 1 0 0]\n m=');
l=length(m);
if(mod(l,k))
   disp('输入的信息有误');
else
    ge=l/k;
%将输入序列转化成矩阵m
temp1=[];
for i=1:ge
    temp1(i,:)=m(k*(i-1)+1:i*k);
end
m=temp1;
%求校验矩阵H
c=mod(m*G,2);   A=G(:,k+1:n);
H=[A',eye(r)];
disp('校验矩阵');H
disp('编码矩阵');c
end
disp('敲回车键继续');   pause
%解码
y=input('输入接收序列y,如:y=[0 0 0 1 1 1 1 0 0 1 0 1 1 1 1 1 1 1 1 0 0 1 0 1 1 1 1 0]\n y=');
temp2=[];
for i=1:ge
    temp2(i,:)=y(1,n*(i-1)+1:i*n);
end
y=temp2
s=mod(y*H',2);
e=s*pinv(H');
for i=1:ge
    for j=1:n
        if(e(i,j)>0.5-eps)
           e(i,j)=1;
        else
            e(i,j)=0;
        end
    end
end
cc=mod(y+e,2);
sc=cc(:,1:4);
disp('差错图样'); e
disp('估计值'); cc
disp('译码序列'); sc
