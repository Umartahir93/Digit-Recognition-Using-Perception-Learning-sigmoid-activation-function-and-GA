%Compute the total weighted inputs
%X=I1w1+I2w2....Iw784+bias
function [X] = weightedsum(weights, features)
size1 = size(weights , 2);
X = 0;
for i = 1:size1
    if i ~=785
     X = X + features(i)*weights(i);
    else
        X = X +weights(i);
    end
end
return
end
