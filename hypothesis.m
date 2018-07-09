function [ detector,detectornum ] = hypothesis( selfsample,selfnum,n,za,p,detectorradius)
%UNTITLED Summary of this function goes here
%��׼V-detector+ȥ�ص�
detectornum=0;
detector=0;
cover=0;
ma=0.9;
xn=0;
z=0;
while(1)                  
    N=0;
    x=0;
    candidatenum=0;
    xn=0;
    while(N~=n)
        x0= 0 + (1-0).*rand(1,1);
        y0= 0 + (1-0).*rand(1,1);
        dr=10;
        selfcover=0;
        for i=1:1:selfnum                     %�ж��Ƿ�������    
            dis2=(x0-selfsample(i,1))^2+(y0-selfsample(i,2))^2;
            dis=dis2^0.5-selfsample(i,3);
            if dis<=detectorradius/5
                selfcover=1;
                break;
            else
                selfcover=0;
                if(dis<dr)
                    dr=dis;
                end
            end
        end
        if selfcover==1
            continue;
        end
                N=N+1;
                for i=1:1:detectornum    
                    dist2=(detector(i,1)-x0)^2+(detector(i,2)-y0)^2;
                    dist=dist2^0.5;
                    if dist<=detector(i,3)
                        cover=1;
                        xn=xn+1;
                        break;
                    else 
                        cover=0;
                        xn=0;
                    end
                end 
                if(cover==0 && candidatenum>5)
                    for i=1:1:candidatenum-5    
                        dist2=(candidate(i,1)-x0)^2+(candidate(i,2)-y0)^2;
                        dist=dist2^0.5;
                        if dist<=candidate(i,3)
                            cover=1;
                            xn=xn+1;
                            break;
                        else 
                            cover=0;
                            xn=0;
                        end
                    end 
                end
                if cover==0
                        candidatenum=candidatenum+1;
                        candidate(candidatenum,1)=x0;
                        candidate(candidatenum,2)=y0;
                        candidate(candidatenum,3)=dr;  
                else
                      x=x+1;
                      z=x/(n*p*(1-p))^0.5-(n*p/(1-p))^0.5;
                      if z>za||xn>50
                         break;
                      end
                end    
    end 
    for i=1:1:candidatenum
        detectornum=detectornum+1;
        detector(detectornum,1)=candidate(i,1);
        detector(detectornum,2)=candidate(i,2);
        detector(detectornum,3)=candidate(i,3);    
    end
    if z>za||xn>50
        break;
    end 
end
end

