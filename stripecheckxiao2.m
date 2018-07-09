function [ s,type ] = stripecheckxiao2(  x0,y0 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
width=1/12;
l=0.5-width/2;
h=0.5+width/2;
    if  x0>=l&&x0<=h&&y0>=0.4&&y0<=0.6
        s=1;
        type=1;
    else
        s=0;
        type=0;
    end

end
