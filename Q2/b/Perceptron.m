function [finalans] = Perceptron(FirstClass , SecondClass , type1, type2)

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
        X = weightedsum(weights , features);
        %Calculate the output using the logistic sigmoid activation function
        O = 1/(1+exp(-X));
        %Below this O its type 1 or above type2
        if(X<O)
            predicted_output = type1;
        else
            predicted_output = type2;
        end
        localerror = Orginal_output(k)-predicted_output;
        global_error = global_error + (localerror*localerror);
   end
        finalans = (global_error / c)*100;
        finalans = sqrt(finalans);        
end
return
end
