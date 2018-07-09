function [ s,type ] = fivecirclecheck( x0,y0 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    if (x0-0.25)^2+(y0-0.75)^2<=0.01
        s=1;
        type=1;
    elseif (x0-0.25)^2+(y0-0.25)^2<=0.01
        s=1;
        type=2;
    elseif (x0-0.75)^2+(y0-0.25)^2<=0.01
        s=1;
        type=3;
    elseif (x0-0.75)^2+(y0-0.75)^2<=0.01
        s=1;
        type=4;
    elseif (x0-0.5)^2+(y0-0.5)^2<=0.01
        s=1;
        type=5;
    else
        s=0;
        type=0;
    end
end

