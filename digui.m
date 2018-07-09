function [ temp1x,temp1y,r1 ] = digui(selfsample,selfnum,selfradius,temp1x,temp1y,near1,r1,detectornum,detector)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here     
    temp2x=temp1x*2-selfsample(near1,1);
    temp2y=temp1y*2-selfsample(near1,2);
    r2=10;
    cover=0;
    if ( 0<=temp2x )&&( temp2x<=1 )&&( 0<=temp2y )&&( temp2y<=1 )
        
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
        
        if cover==0
            for i=1:1:selfnum                     % pan duan shi fou shi zi wo     
                dis2=(temp2x-selfsample(i,1))^2+(temp2y-selfsample(i,2))^2;
                dis=dis2^0.5;
                if(dis<=selfradius)
                    break;
                else
                    if(dis<r2)
                        r2=dis;
                        near2=i;
                    end
                end
            end  
        
            if (i==selfnum)&&(r2>r1)&& ( (temp1x-temp2x)^2+(temp1y-temp2y)^2<=r2^2 )
                temp1x=temp2x;
                temp1y=temp2y;
                r1=r2;
                near1=near2;
                [temp1x,temp1y,r1]=digui(selfsample,selfnum,selfradius,temp1x,temp1y,near1,r1,detectornum,detector);
            end
        end
    end    
end

