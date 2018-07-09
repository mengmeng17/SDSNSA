function [ s,type ] = starcheck( x0,y0 )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
if (y0<=3.07823*x0-0.7058-0.15)&&(y0<=-3.07823*x0+2.37245-0.15)&&(y0>=0.7271*x0+0.009-0.15)
        s=1;
        type=1;
elseif (y0>=-0.7271*x0+0.73606-0.15)&&(y0<=-3.07823*x0+2.37245-0.15)&&(y0<=0.603-0.15) 
           s=1;
           type=1;
elseif(y0<=0.603-0.15)&&(y0>=0.7271*x0+0.009-0.15)&&(y0>=-3.07823*x0+2.37245-0.15)
           s=1;
           type=1;
elseif (x0-0.75)^2+(y0-0.75)^2<=0.01
        s=1;
        type=2;
elseif (x0-0.25)^2+(y0-0.75)^2<=0.01
        s=1;
        type=3;
else
    s=0;
    type=0;
end



end

