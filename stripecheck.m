function [ s,type ] = stripecheck( x0,y0 )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
width=1/3;
l=0.5-width/2;
h=0.5+width/2;
    if  x0>=l&&x0<=h
        s=1;
        type=1;
    else
        s=0;
        type=0;
    end
end

