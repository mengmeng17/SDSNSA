function [] = showdata( A,n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
for i=1:1:n;      
   plot(A(i,1),A(i,2),'ko','markersize',2),hold on
end
end

