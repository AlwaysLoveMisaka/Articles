p=linspace(eps,1-eps,100);
q=linspace(eps,1-eps,100);
[P,Q]=meshgrid(p,q);
P_Q=P+Q;
for n=1:100
   for m=1:100
      if P_Q(n,m)>=1
         Q(n,m)=nan;
      end
   end
end
H=-P.*log2(P)-Q.*log2(Q)-(1-P-Q).*log2(1-P-Q);
mesh(P,Q,H)
title('三维熵函数的图形')
