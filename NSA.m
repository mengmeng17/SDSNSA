clear all;
global decision;


shape=1;    %1为密度5圆，2为密度双三角，3为密度反十字，4为密度2圆+star,5为条纹，6为十字，7为圆环，8为三角形，9为五角星
selfnum=3000;
noisenum=300;        %噪声比例，1%，5%，10%


if shape==1
    selfsample=fivecirclesample(selfnum,0.02);
elseif shape==2
    selfsample=Trianglesample(selfnum);
elseif shape==3
    selfsample=incrosssample(selfnum);
elseif shape==4
    selfsample=starsample(selfnum);
elseif shape==5
    selfsample=stripesample(selfnum);
elseif shape==6
    selfsample=crosssample(selfnum);
elseif shape==8
    selfsample=singleTrianglesample(selfnum);
elseif shape==9
    selfsample=singlestarsample(selfnum);
end


selfsample=addnoise(selfsample,selfnum,noisenum,shape);
selfnum=selfnum+noisenum;

figure(1);
showdata(selfsample,selfnum);
axis([0,1,0,1]);
axis square;
set(gca,'xtick',[0:0.1:1]);
hold off;

[selfdetector,selfdetectornum]=cluster( selfsample,selfnum,0.02,20,0.02); 
                                                                                  

figure(7);
showdetector(selfdetector,selfdetectornum);
hold off;


p=0.99;
za=1.28;
%[detector,detectornum]=hyquchongdie_cluster(selfdetector,selfdetectornum,za,p);
[detector,detectornum]=hypothesis(selfdetector,selfdetectornum,za,p); 

figure(8);
showdetector(detector,detectornum);
hold off;

testnum=100;                                                                   
for ii=1:1:20              
    t1=0;    % t1=1,self 
    t2=0;    % detector cover
    tp=0;
    fp=0;
    testnonnum=0;
    testdata=gettestdata(testnum);
    for i=1:1:testnum         %test stage    
        
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
     for j=1:1:detectornum  
            dis2= ( testdata(i,1)-detector(j,1) )^2+( testdata(i,2)-detector(j,2) )^2;
            dis=dis2^0.5;
            if  dis<=detector(j,3)
                t2=1;                                
                break;
            else 
                t2=0;
            end      
     end
     
     if  (t1~=t2)&&(t1==0)               %t1为1是在五圆里，t2为1是被异常检测器激活
         tp=tp+1; 
     elseif (t1==1)&&(t2==1)
         fp=fp+1;
     end
     
    end
    tp=tp/testnonnum;
    fp=fp/(testnum-testnonnum);
    tps(ii)=tp;
    fps(ii)=fp;
end           
ftp=mean(tps);
ffp=mean(fps);










