p = 0.001:0.001:1;
f1 = -log2(p);
f2 = -p .* log2(p);
figure(1)
subplot(1,2,1)
plot(p, f1);
axis([0 1 0 5]);
xlabel('p');
ylabel('-log2(p)');
subplot(1,2,2)
plot(p, f2);
axis([0 1 0 0.6]);
xlabel('p');
ylabel('-plog2(p)');