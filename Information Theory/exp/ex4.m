clear;   clc;
%����
G=input('���������ɾ���G,����:G=[1 0 0 0 1 0 1;0 1 0 0 1 1 0;0 0 1 0 0 1 1;0 0 0 1 1 1 1]\n G=');
[k,n]=size(G);
r=n-k;
m=input('�������贫����Ϣm,��m=[0 0 0 1 0 0 1 0 0 0 1 1 0 1 0 0]\n m=');
l=length(m);
if(mod(l,k))
   disp('�������Ϣ����');
else
    ge=l/k;
%����������ת���ɾ���m
temp1=[];
for i=1:ge
    temp1(i,:)=m(k*(i-1)+1:i*k);
end
m=temp1;
%��У�����H
c=mod(m*G,2);   A=G(:,k+1:n);
H=[A',eye(r)];
disp('У�����');H
disp('�������');c
end
disp('�ûس�������');   pause
%����
y=input('�����������y,��:y=[0 0 0 1 1 1 1 0 0 1 0 1 1 1 1 1 1 1 1 0 0 1 0 1 1 1 1 0]\n y=');
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
disp('���ͼ��'); e
disp('����ֵ'); cc
disp('��������'); sc
