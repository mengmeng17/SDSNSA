function [ s,type ] = incrosscheckxiao( x0,y0  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if  (x0>=1/12)&&(x0<=1/4)&&(y0>=1/12)&&(y0<=1/4)
        s=1;
        type=1;
    elseif  (x0>=1/12)&&(x0<=1/4)&&(y0>=3/4)&&(y0<=11/12)
        s=1;
        type=2;
    elseif  (x0>=3/4)&&(x0<=11/12)&&(y0>=1/12)&&(y0<=1/4)
        s=1;
        type=3;
    elseif  (x0>=3/4)&&(x0<=11/12)&&(y0>=3/4)&&(y0<=11/12)
        s=1;
        type=4;
    else
        s=0;
        type=0;
    end

end

