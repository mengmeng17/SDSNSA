function [ selfsample ] = addnoise( selfsample,selfnum,noisenum,shape,selfradius)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
i=1;
while(i<=noisenum)
    x = 0 + (1-0).*rand(1,1);
    y = 0 + (1-0).*rand(1,1);  
    if shape==1
        s=fivecirclecheck(x,y);
    elseif shape==2
        s=Trianglecheck(x,y);    
    elseif shape==3
        s=incrosscheck(x,y);  
    elseif shape==4
        s=starcheck(x,y);
    elseif shape==5
        s=stripecheck(x,y);
    elseif shape==6
        s=crosscheck(x,y);
    elseif shape==7
        s=singleTrianglecheck(x,y);
    elseif shape==8
        s=singlestarcheck(x,y);
    end   
    
    if s==0
    selfsample(selfnum+i,1)=x;
    selfsample(selfnum+i,2)=y;
    selfsample(selfnum+i,3)=selfradius;
    i=i+1;
    end  
end 
end

