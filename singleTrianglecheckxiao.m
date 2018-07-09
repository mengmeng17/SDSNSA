function [ s,type] = singleTrianglecheckxiao( x0,y0 )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
    if (y0<=1.732*x0-0.2327)&&(y0<=-1.732*x0+1.5)&&(y0>=0.4333)
        s=1;
        type=1;
    else
        s=0;
        type=0;
    end    
end

