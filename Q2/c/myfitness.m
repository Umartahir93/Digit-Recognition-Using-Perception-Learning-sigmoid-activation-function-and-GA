%fitness function
function fitness = myfitness(weights)
%Chromosome structure in my case is weights = (w1,w2,w3,w4....w783,w784,w785)
% 1<=w<=785
%Here I am finding chromosomes with the highest fitness
k = 2;
i = 1;
z = 1;
while k<=785
   p1(z) = weights(i)+weights(k);
   i = i+2;
   k = k+2;
   z = z+1;
end
k = 2;
i = 1;
z = 1;
while k<=392 
  p2(z) = p1(i) - p1(k);
  i = i+2;
  k = k+2;
  z = z+1;
end

%now for bias weight
bias = (1-weights(785))^2;
fitness= 0;
for j = 1:192
fitness = fitness+p2(j);
end
fitness = fitness+bias;

end