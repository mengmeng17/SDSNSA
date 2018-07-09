function   [detector,Detectornum]=V_NSA_Detector(selfnum,selfsample,n,p,za,detectorradius)
   cover=0;
   z=0;
   Detectornum=0;   
   while(1)
    N=0;
    x=0;
    candidatenum=0;
    while(N~=n)
        x0= 0 + (1-0).*rand(1,1);
        y0= 0 + (1-0).*rand(1,1);
        dr=10;
        selfcover=0;
        for i=1:1:selfnum                     %判断是否是自我    
            dis2=(x0-selfsample(i,1))^2+(y0-selfsample(i,2))^2;
            dis=dis2^0.5-selfsample(i,3);
            if dis<=detectorradius
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
                for i=1:1:Detectornum      %是否覆盖
                    dist2=(detector(i,1)-x0)^2+(detector(i,2)-y0)^2;
                    dist=dist2^0.5;
                    if dist<=detector(i,3)
                        cover=1;
                        break;
                    else 
                        cover=0;
                    end
                end 
                if(cover==0)%保存候选检测器
                    candidatenum=candidatenum+1;
                    candidate(candidatenum,1)=x0;
                    candidate(candidatenum,2)=y0;
                    candidate(candidatenum,3)=dr;   
                else               %是否结束生成检测器
                    x=x+1;
                    z=x/(n*p*(1-p))^0.5-(n*p/(1-p))^0.5;
                    if z>za
                         break;
                    end
                end   
    end 
    if(z>za)  
        break;
    end         
    for i=1:1:candidatenum
        Detectornum=Detectornum+1;
        detector(Detectornum,1)=candidate(i,1);
        detector(Detectornum,2)=candidate(i,2);
        detector(Detectornum,3)=candidate(i,3);    
    end   
   end
end