function Part()
load('D:\Semester 9\Artifical Intelligence\Matlab workspace\MATLABDATA.mat');
net=fitnet(10, 'trainlm');
net.divideParam.trainRatio=.7;
net.divideParam.valRatio=.15;
net.divideParam.testRatio=.15;
%Sir has given the array AllExamples when I used this as input to campare
%it with target it gives error "cant calculate because you are exceeding
%maximum size of arrays which matlab can support for builtin function". I have attached screen
%shot of the maximum array limit matlab can give you as prrof.

 [net,pr] = train(net, Four', Five');
 Output= net(Sample')';
 
 
end