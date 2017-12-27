function [finalans] = Perceptron(FirstClass , SecondClass , type1, type2)
%Start of the code is quite similar to that of part a but in this 
%I am training weights by using genetics algorthium
Union_Class = horzcat(FirstClass,SecondClass);
a = size(FirstClass , 2);
c = size(Union_Class , 2);
Orginal_output = zeros(1 , c);
for i = 1:a
    Orginal_output(i) = type1;
end
for j = a+1:c
    Orginal_output(j) = type2;
end

%First I am giving random weights then I will train opmitize them using
%genetics algorithum
weights = rand( 1, 785);
weights(785) = -1;

iterations = 0;
global_error = 1;
while (iterations < 10 && global_error ~= 0) 
   iterations = iterations+1;
   global_error = 0;
   for k =1:c  
        B =  Union_Class(: ,k);
        features =  B.';
        predicted_output = calculateoutput(0, weights , features, type1 , type2);
        localerror = Orginal_output(k)- predicted_output;
       
        %I will pass reference of my fitness function to the ga and no of
       %variables too. As there are large no of variables so is taking
       %large amount of time to process it.
        fitness = myfitness(weights); 
        FitFcn= @myfitness;
        nvars = 785;
        [x ,fval] = ga(FitFcn ,nvars);
        weights = x;
       
         global_error = global_error + (localerror*localerror);
   end
        finalans = (global_error / c)*100;
        finalans = sqrt(finalans);        
end
return
end
