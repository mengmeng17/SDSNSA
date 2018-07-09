function [ ftp,ffp,detectornum,selfdetectornum] = NSALab(p,r,n,shape)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% clear all; 
% close all;
%����50
%1Ϊ�ܶ�5Բ0.015��2Ϊ�ܶ�˫����0.01��3Ϊ�ܶȷ�ʮ��0.02(30)��4Ϊ�ܶ�2Բ+star0.01
%5Ϊ����0.01��6Ϊʮ��0.02(������25)����7ΪԲ����8Ϊ������0.01��9Ϊ�����0.01
p=0;
n=0;
shape=4;
r=0;
nnum=[325,425,375,350,750,550,375,370];
if(p==0)
p=0.99;
end
if(n==0)
n=nnum(shape);
end
global decision;
selfnum=411;
% noisenum=0*selfnum;        %����������0%,1%��5%
Rs=0.015;
aa=20*Rs;
if shape==1
    selfsample=fivecirclesample(selfnum,r);
elseif shape==2
    selfsample=Trianglesample(selfnum,r);
elseif shape==3
    selfsample=incrosssample(selfnum,r);
elseif shape==4
    selfsample=starsample(selfnum,r);
elseif shape==5
    selfsample=stripesample(selfnum,r);
elseif shape==6
    selfsample=crosssample(selfnum,r);
elseif shape==8
    selfsample=singleTrianglesample(selfnum,r);
elseif shape==9
    selfsample=singlestarsample(selfnum,r);
end


% selfsample=addnoise(selfsample,selfnum,noisenum,shape);
% selfnum=selfnum+noisenum;
% 
% for i=1:1:selfnum
%     selfsample(i,3)=Rs;
% end
% figure(1);
% showdata(selfsample,selfnum);
% axis([0,1,0,1]);
% set(gca,'xtick',[0:0.1:1]);
% hold off;

% [selfdetector,selfdetectornum]=cluster( selfsample,selfnum,0.02,Rs);

% figure(6);
% showdetector(selfdetector,selfdetectornum);
% hold off;

% p=0.99;
za=1.96;
[detector,detectornum]=hypothesis(selfsample,selfnum,za,p); %�Ľ�V-d
figure(6);
showdetector(detector,detectornum);
hold off;

ftp=0.99;
[selfdetector,selfdetectornum]=ftnaive(detector,detectornum,ftp);%��׼FtNSA�����ϵ�Ft�㷨
figure(7);
showdetector(selfdetector,selfdetectornum);
hold off;


testnum=100;   
for ii=1:1:10               %fttest ,gettp,p
    t1=0;    % t1=1,self 
    t2=0;    % detector cover
    t3=0;
    tp=0;
    fp=0;
    testnonnum=0;
    
    testdata=gettestdata(testnum);
    for i=1:1:testnum         %test stage          
        ddis1=10;
        ddis2=10;
        
       if shape==1
        t1=fivecirclecheck(testdata(i,1),testdata(i,2));
       elseif shape==2
         t1=Trianglecheck(testdata(i,1),testdata(i,2));
       elseif shape==3
         t1=incrosscheck(testdata(i,1),testdata(i,2));
       elseif shape==4
         t1=starcheck(testdata(i,1),testdata(i,2));
       elseif shape==5
         t1=stripecheck(testdata(i,1),testdata(i,2));
       elseif shape==6
         t1=crosscheck(testdata(i,1),testdata(i,2));
       elseif shape==8
         t1=singleTrianglecheck(testdata(i,1),testdata(i,2));
       elseif shape==9
         t1=singlestarcheck(testdata(i,1),testdata(i,2));
       end
     
        if t1==0
            testnonnum=testnonnum+1;
        end
     
        for j=1:1:detectornum       %�Ƿ��쳣�����cover������t2Ϊ1,������t2Ϊ0�����õ�ddis1
            dis2= ( testdata(i,1)-detector(j,1) )^2+( testdata(i,2)-detector(j,2) )^2;
            dis=dis2^0.5;
            if  dis<=detector(j,3)
                t2=1;                                
                break;
            else 
                t2=0;
                k=dis-detector(j,3);
                if k<ddis1
                    ddis1=k;
                end      
            end      
        end
        
        if t2==1
            if t1==1
                fp=fp+1;
            else
                tp=tp+1;
            end
        else  
            for j=1:1:selfdetectornum       %�Ƿ���������cover������t3Ϊ1,������t3Ϊ0�����õ�ddis2
                dis2= ( testdata(i,1)-selfdetector(j,1) )^2+( testdata(i,2)-selfdetector(j,2) )^2;
                dis=dis2^0.5;
                if  dis<=selfdetector(j,3)
                    t3=1;                                
                    break;
                else 
                    t3=0;
                    k=dis-selfdetector(j,3);
                    if k<ddis2
                        ddis2=k;
                    end      
                end      
            end
            
            if t3==0   %t2=0,t3=0
                if ddis1>aa*ddis2
                    if t1==1
                        fp=fp+1;
                    else
                        tp=tp+1;
                    end
                end
            end        
        end
    end
    tp=tp/testnonnum;
    fp=fp/(testnum-testnonnum);
    tps(ii)=tp;
    fps(ii)=fp;
end
ftp=mean(tps);
ffp=mean(fps);
                                                               

end

