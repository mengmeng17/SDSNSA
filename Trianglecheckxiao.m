function [ s,type ] = Trianglecheckxiao( x0,y0 )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
  if (y0<=1.732*x0-0.7)&&(y0<=-1.732*x0+1.6)&&(y0>=0.25)
        s=1;
        type=1;
    elseif (y0>=1.732*x0-0.032)&&(y0>=-1.732*x0+1.132)&&(y0<=0.75)
        s=1;
        type=2;
    else
        s=0;
        type=0;
    end     

end

