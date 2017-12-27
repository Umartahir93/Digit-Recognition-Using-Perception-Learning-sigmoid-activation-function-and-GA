function [type] = calculateoutput(theta, weights , features, type1 , type2)
%Get the no of the columns here and each here each column represent
%either a feature or the respective weight 
size1 = size(weights , 2);
%variable used to store the sum
sum = 0;
%variable used to return the class type
type = 0;

%This loop will sum up all the features multiply by its
%weights. And I have stored bias weight at the last column 
%and my bias weight is -1
%it is satisfying equation sum = x*w[0]+y*w[1]...+biasweight
for i = 1:size1
    if i < size1
        %sum up all the weights*features till 784
    sum = sum + features(i)*weights(i);

    else
        %add the bias weight with the output here in my case bias weight is
        %at the 785
        sum = sum+weights(i);
        
    end
    %this if condition is for comparing sum with threshold value
    if(sum > theta)
        type = type1;
    else
        type = type2;
    end
end
%disp(sum);
return
end
