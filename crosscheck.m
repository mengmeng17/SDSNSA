function [ s,type ] = crosscheck( x0,y0 )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
l=0.5-1/6;
h=0.5+1/6;
    if  (x0>=l)&&(x0<=h)
        s=1;  
        type=1;
    elseif  (y0>=l)&&(y0<=h)
        s=1;
         type=1;
    else
        s=0;
         type=0;
    end
end

