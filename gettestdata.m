function [ testdata ] = gettestdata( testnum )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
m=1;
while(m<=testnum)
    x = 0 + (1-0).*rand(1,1);
    y = 0 + (1-0).*rand(1,1);
    testdata(m,1)=x;
    testdata(m,2)=y;
%      figure(3);
%      plot(x,y,'O','markersize',2);
%      hold on;
    m=m+1;
end
end

