function [ s,type ] = incrosscheck( x0,y0 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    if  (x0>=0)&&(x0<=1/3)&&(y0>=0)&&(y0<=1/3)
        s=1;
        type=1;
    elseif  (x0>=0)&&(x0<=1/3)&&(y0>=2/3)&&(y0<=1)
        s=1;
        type=2;
    elseif  (x0>=2/3)&&(x0<=1)&&(y0>=0)&&(y0<=1/3)
        s=1;
        type=3;
    elseif  (x0>=2/3)&&(x0<=1)&&(y0>=2/3)&&(y0<=1)
        s=1;
        type=4;
    else
        s=0;
        type=0;
    end

end

