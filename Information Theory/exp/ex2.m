clc;
clear;
disp('�����ŵ�ת�ƾ���Ϊ��[1/3 1/3 1/6 1/6;1/6 1/3 1/6 1/3]���ٶ�����ֲ���[3/4 1/4]');
disp('�������ŵ�ת�ƾ���');
Pb_a=input('Pba=');
disp('���������ֲ���');
Pa0=input('Pa0=');
[r,s]=size(Pb_a);
[r0,s0]=size(Pa0);

while(s0~=r)
      Px0=input('�������������������ʼ�ֲ�����');
      [r0,s0]=size(Px0);
end
disp('�����Ҫ��ľ��ȣ�');
e=input('����Ϊ��');
Cn=0;
Cn1=10;
Pa=Pa0;

while abs(Cn1-Cn)>e
      for k=1:s0
          Md=0;
          for j=1:s
              Me=0;
              for i=1:r
                 Me=Me+Pa(i)*Pb_a(i,j);
              end;
              Md=Md+Pb_a(k,j)*log2(Pb_a(k,j)/Me);
          end;
      Mb(k)=exp(Md);
      end;
for k=1:s0
    Mc=0;
    for i=1:r;
        Mc=Mc+Pa(i)*Mb(i);
    end;
    Pa(k)=Pa(k)*Mb(k)/Mc;
end;

M_Cn=0;
for j=1:r;
    M_Cn=M_Cn+Pa(j)*Mb(j);
end;
Cn=log(M_Cn);
Cn1=log(max(Mb));

end;

C=Cn;
disp('�ŵ�����Ϊ');
disp(C);
disp('�������ֲ�Ϊ');
Pa