function [ s,type ] = singlestarcheck( x0,y0 )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
if (y0<=3.07823*x0-0.7058)&&(y0<=-3.07823*x0+2.37245)&&(y0>=0.7271*x0+0.009)
        s=1;
        type=1;
elseif (y0>=-0.7271*x0+0.73606)&&(y0<=-3.07823*x0+2.37245)&&(y0<=0.603) 
           s=1;
           type=1;
elseif(y0<=0.603)&&(y0>=0.7271*x0+0.009)&&(y0>=-3.07823*x0+2.37245)
           s=1;
           type=1;
else
    s=0;
    type=0;
end
end


