function [ selfsample ] = incrosssample( selfnum,r )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
m=selfnum*0.5;
n=selfnum-m;
i=1;
while(i<=m)
    x = 0 + (1-0).*rand(1,1);
    y = 0 + (1-0).*rand(1,1);  
    [s,type]=incrosscheck(x,y);          
    if(s==1)    
        selfsample(i,1)=x;
        selfsample(i,2)=y;
        if(r==0)
        selfsample(i,3)=0.03;
        else
         selfsample(i,3)=r;
        end
%          circle(x,y,selfradius);     
%          hold on;  
        i=i+1;  
    end
end
i=1;
while(i<=n)
    x = 0 + (1-0).*rand(1,1);
    y = 0 + (1-0).*rand(1,1);  
    [s,type]=incrosscheckxiao(x,y);          
    if(s==1)    
        selfsample(m+i,1)=x;
        selfsample(m+i,2)=y;
                if(r==0)
        selfsample(i+m,3)=0.03;
        else
         selfsample(i+m,3)=r;
        end
%         circle(x,y,selfradius);      
%          hold on; 
        i=i+1;     
    end
end

end

