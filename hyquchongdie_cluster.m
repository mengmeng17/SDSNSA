function [detector,detectornum ] = hyquchongdie_cluster(selfsample,selfnum,za,p)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
detectornum=0;
cover=0;
ma=10;
ma=(ma-1)/(ma+1);
z=0;
q=1-p;
n=max(5/p,5/(1-p));
n=fix(n);
detector=0; % no jianceqi
while(1)                  
    N=0;
    x=0;
    candidatenum=0;
    while(N~=n)
        x0= 0 + (1-0).*rand(1,1);
        y0= 0 + (1-0).*rand(1,1);
        dr=10;
        k=0;
        chongdie=0;
        for i=1:1:selfnum                     % pan duan shi fou shi zi wo     
            dis2=(x0-selfsample(i,4))^2+(y0-selfsample(i,5))^2;
            dis=dis2^0.5;
            if(dis<=selfsample(i,2))
                break;
            else
                k=dis-selfsample(i,2);
                if(k<dr)
                    dr=k;
                end
            end
        end
        
        if (i==selfnum) %bu shi zi wo
                N=N+1;
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
                
                if(cover==0)                   
                    %[x0,y0,dr]=digui(selfsample,selfnum,selfradius,x0,y0,k,dr,detectornum,detector);%ตÝน้                                          
                    for i=1:1:candidatenum    
                        dist2=(candidate(i,1)-x0)^2+(candidate(i,2)-y0)^2;
                        dist=dist2^0.5;
                            if dist<=candidate(i,3)
                                chongdie=1;
                                break;
                            else 
                                chongdie=0;
                            end
                    end  
                    
                    if chongdie==0
                        candidatenum=candidatenum+1;
                        candidate(candidatenum,1)=x0;
                        candidate(candidatenum,2)=y0;
                        candidate(candidatenum,3)=dr;   
                    end
                    
                else
                    x=x+1;
                    z=x/(n*p*q)^0.5-(n*p/q)^0.5;
                    if z>za
                         break;
                    end
                end
        end
    end
    if(z>za)
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

