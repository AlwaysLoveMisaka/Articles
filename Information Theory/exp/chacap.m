function answer=chacap(Pt)
% Pt���ŵ�����
% ��matalb��eps�����ŵ������ڵ�Ԫ��0�Ա����0ȡ����
% C���ŵ�����
[r,s]=size(Pt); % ȷ�������������Ÿ���
Pi=ones(1,r)/r; % ������������ֲ���ʼ��Ϊ�ȸ�
Cn=0; % C(n)��ʼ��Ϊ0
Cn1=inf; % C'(n)��ʼ��Ϊ�����
beta=ones(1,r); % ƫ����Ϣ��ָ��
I=1; % ����Ϣ��ʼ��Ϊ1
while abs(Cn-Cn1)>=1.0e-004 % ���������
    for k=1:r
        Pi(k)=Pi(k)*beta(k)/I; % ��������ֲ�
    end        
    % ���¼���beta(k):
    Po=Pi*Pt ; % �������
    for k=1:r
        bt=0; % �м����
        for j=1:s
            bt=bt+Pt(k,j)*log(Pt(k,j)/Po(j));
        end
        beta(k)=exp(bt);
    end
    I=Pi*beta'; % ���µļ�Ȩƽ��
    Cn=log(I); % 
    Cn1=log(max(beta)); % ���µ����ֵ
end
C=Cn*log2(exp(1)); % ����
answer=sprintf('���ŵ����ŵ����� C = %f ����/�ŵ�����',C);
