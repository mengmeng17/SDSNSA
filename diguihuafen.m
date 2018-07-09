function [type] = diguihuafen(i)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global decision;
    if decision(i,5)==0
        j=decision(i,4);
        decision(i,5)=diguihuafen(j);
    end
    type=decision(i,5);
end

