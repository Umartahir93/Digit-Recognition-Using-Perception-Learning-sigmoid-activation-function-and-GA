function [finalans] = Perceptron(FirstClass , SecondClass , type1, type2)

% Create a 2d array such that array[features][total_Instances_of_BothClasses] 
%Here each column contains one Instance that is one image per column.
Union_Class = horzcat(FirstClass,SecondClass);

%no of columns of Array one
a = size(FirstClass , 2);

%no of columns of Union Classes
c = size(Union_Class , 2);

%Create an array of the original output of size of the no of instances  
Orginal_output = zeros(1 , c);


%Copy original label of first class to the original output
for i = 1:a
    Orginal_output(i) = type1;
end

%Copy original label of the second class to the original output
for j = a+1:c
    Orginal_output(j) = type2;
end

%Now create an array of weights. Its size will be one greater then the no of
%features that is 785. Where last index represent the Bias weight.
%Also Initialize weights with the random values at the start(weights will
%be initialized in b/w 0 and 1 range)
weights = rand( 1, 785);
weights(785) = -1;

% I wanted to apply do while here with ending condition global_error !=0 &&
% iterations < MAX. As there is no do while in matlab I am initializing
% global_error with 1 before while as soon as I enter the while loop I will
% initialize it with 0 so that we can get behaviour of while as similar to
% do while.
iterations = 0;
global_error = 1;
%I have put Max iterations is equal to 10 you can put it to any no to
%increase the likelyhood

while (iterations < 10 && global_error ~= 0) 
   iterations = iterations+1;
   global_error = 0;
   %loop through all instances
   
   for k =1:c  
        B =  Union_Class(: ,k);
        features =  B.';
        %calculate predicted output by calling calculateoutput(theta, weights , features, type1 ,type2 );
        predicted_output = calculateoutput(0, weights , features, type1 , type2);
        %difference between predicted and acutal output value
        localerror = Orginal_output(k)- predicted_output;
        %Update weights and bias
        for l = 1:785
            %Here i am updating weights
            if l <785
           weights(l) = weights(l) + (0.8 *localerror * features(l));
           %Here i am updating bias
           else 
                weights(l) = weights(l)+(0.8*localerror);
           end
        end
        %Summation of error(error value for all instances)
         global_error = global_error + (localerror*localerror);
   end
        %mean square error
        finalans = (global_error / c)*100;
        finalans = sqrt(finalans);        
end
return
end
