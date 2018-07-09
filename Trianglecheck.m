function [ s,type] = Trianglecheck( x0,y0 )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
    if (y0<=1.732*x0-0.6)&&(y0<=-1.732*x0+1.7)&&(y0>=0.2)
        s=1;
        type=1;
    elseif (y0>=1.732*x0-0.132)&&(y0>=-1.732*x0+1.032)&&(y0<=0.8)
        s=1;
        type=2;
    else
        s=0;
        type=0;
    end    

end

