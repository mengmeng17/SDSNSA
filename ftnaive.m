function [ selfdetector,selfdetectornum ] = ftnaive( detector,detectornum,p)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
selfdetectornum=0;
cover=0;
t=0;
selfdetector=0; % no jianceqit=0;
while(1)                   
    x0= 0 + (1-0).*rand(1,1);
    y0= 0 + (1-0).*rand(1,1);
    dr=10;
    k=0;
    for i=1:1:detectornum                     % 判断是否被异常检测器覆盖，并获得距离异常域的最短距离dr
            dis2=(x0-detector(i,1))^2+(y0-detector(i,2))^2;
            dis=dis2^0.5;
            if dis<=detector(i,3)
                tt=1;
                break;
            else
                tt=0;
                k=dis-detector(i,3);
                if  k<dr
                    dr=k;            
                end
            end
    end
        
    if (tt==0)
                for i=1:1:selfdetectornum    
                    dist2=(selfdetector(i,1)-x0)^2+(selfdetector(i,2)-y0)^2;
                    dist=dist2^0.5;
                    if dist<=selfdetector(i,3)
                        cover=1;
                        t=t+1;
                        break;
                    else 
                        cover=0;
                        
                    end
                end   
                
                if(cover==0)    
                     t=0;
%                      if dr>=(selfradius/10)
                        %[x0,y0,dr]=digui(selfsample,selfnum,selfradius,x0,y0,k,dr,detectornum,detector);%bian yuan bian cha                                   
                        selfdetectornum=selfdetectornum+1;
                        selfdetector(selfdetectornum,1)=x0;
                        selfdetector(selfdetectornum,2)=y0;
                        selfdetector(selfdetectornum,3)=dr;    
%                      end
                end
                if  t>=1/(1-p)
                     break;
                end       
     end            
end
end

