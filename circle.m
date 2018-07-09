function [  ] = circle( x0,y0,r )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
alpha=0:pi/20:2*pi;
X=x0+r*cos(alpha);
Y=y0+r*sin(alpha);
  fill(X,Y,[0.6 0.6 0.13],'edgealpha',0);
  plot(x0,y0,'o','markersize',2);
end

