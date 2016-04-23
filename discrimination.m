function [ f ] = discrimination( grup)
% Calculate the variation of each group
f=0;
col=size(grup,2);
for n=1:col-1
     f=f+abs(grup(n)-grup(n+1));
     %f= f+ (grup(n)-grup(n+1))^2;

end
%f= sqrt(f);

