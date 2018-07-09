function [ selfsample ] = stripesample( selfnum,r)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here      最大范围50%，中间范围30%,最小范围20%
m=selfnum*0.5;
n=selfnum*0.3;
q=selfnum*0.2;
i=1;
while(i<=m)
    x = 0 + (1-0).*rand(1,1);
    y = 0 + (1-0).*rand(1,1);  
    [s,type]=stripecheck(x,y);          
    if(s==1)    
        selfsample(i,1)=x;
        selfsample(i,2)=y;
        if(r==0)
        selfsample(i,3)=0.02;
        else
         selfsample(i,3)=r;
        end
        i=i+1;  
    end
end
i=1;
while(i<=n)
    x = 0 + (1-0).*rand(1,1);
    y = 0 + (1-0).*rand(1,1);  
    [s,type]=stripecheckxiao(x,y);          
    if(s==1)    
        selfsample(m+i,1)=x;
        selfsample(m+i,2)=y;
        if(r==0)
        selfsample(i+m,3)=0.02;
        else
         selfsample(i+m,3)=r;
        end
        i=i+1;     
    end
end
i=1;
while(i<=q)
    x = 0 + (1-0).*rand(1,1);
    y = 0 + (1-0).*rand(1,1);  
    [s,type]=stripecheckxiao2(x,y);          
    if(s==1)    
        selfsample(m+n+i,1)=x;
        selfsample(m+n+i,2)=y;
        selfsample(m+n+i,3)=0.02;
        i=i+1;     
    end
end
end

