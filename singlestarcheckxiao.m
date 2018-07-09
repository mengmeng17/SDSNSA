function [ s,type ] = singlestarcheckxiao( x0,y0 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
d=0.06;
d1=3.2366*d;
d2=1.2364*d;
if (y0<=3.07823*x0-0.7058-d1)&&(y0<=-3.07823*x0+2.37245-d1)&&(y0>=0.7271*x0+0.009+d2)
        s=1;
        type=1;
elseif (y0>=-0.7271*x0+0.73606+d2)&&(y0<=-3.07823*x0+2.37245-d1)&&(y0<=0.603-d) 
           s=1;
           type=1;
elseif(y0<=0.603-d)&&(y0>=0.7271*x0+0.009+d2)&&(y0>=-3.07823*x0+2.37245-d1)
           s=1;
           type=1;
else
    s=0;
    type=0;
end


end


