function [] = showdetector( detector,n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
alpha=0:pi/20:2*pi;
for i=1:1:n
   X=detector(i,1)+detector(i,3)*cos(alpha);
   Y=detector(i,2)+detector(i,3)*sin(alpha);
   fill(X,Y,'y','edgealpha',0),hold on;
%   plot(X,Y,'y'),hold on;
   plot(detector(i,1),detector(i,2),'ro','markersize',1),hold on;
end
axis([0,1,0,1]);
axis square;
set(gca,'xtick',[0:0.1:1]);
end

