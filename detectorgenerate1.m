function [ detector,detectornum ] = detectorgenerate1( selfsample,selfnum,selfradius,za,m,f )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
detectornum=0;
cover=0;
pmax=za*( m*f*(1-f) )^0.5+m*f;
qmax=m-pmax;
while(1)                  
    p=0;
    q=0;
    candidatenum=0;
    while (q<=qmax)
        
        x0= 0 + (1-0).*rand(1,1);
        y0= 0 + (1-0).*rand(1,1);
        dr=10;
        for i=1:1:selfnum                     % pan duan shi fou shi zi wo     
            dis2=(x0-selfsample(i,1))^2+(y0-selfsample(i,2))^2;
            dis=dis2^0.5;
            if(dis<=selfradius)
                break;
            else
                if(dis<dr)
                    dr=dis;
                end
            end
        end   
        if (i==selfnum) %bu shi zi wo
                for i=1:1:detectornum    
                    dist2=(detector(i,1)-x0)^2+(detector(i,2)-y0)^2;
                    dist=dist2^0.5;
                    if dist<=detector(i,3)
                        cover=1;
                        break;
                    else 
                        cover=0;
                    end
                end 
                if  cover==0
                    q=q+1;
                    p=0;      
                    candidatenum=candidatenum+1;
                    candidate(candidatenum,1)=x0;
                    candidate(candidatenum,2)=y0;
                    candidate(candidatenum,3)=dr;   
                else
                    p=p+1;                 
                    if p>pmax
                         break;
                    end
                end
        end         
    end 
    if(p>pmax)
        break;
    end
    
    for i=1:1:candidatenum
        detectornum=detectornum+1;
        detector(detectornum,1)=candidate(i,1);
        detector(detectornum,2)=candidate(i,2);
        detector(detectornum,3)=candidate(i,3);    
    end
    
    
end

end

