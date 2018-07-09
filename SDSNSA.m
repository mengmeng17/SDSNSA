function  [out]=SDSNSA(n_ratio,shape,p,selfnum,selfradius,hc)
% n_ratio=0.1;shape=1;p=0.99;selfnum=3000;selfradius=0.02;hc=20;
global decision;
za=1.96;
n=floor(max(5/p,5/(1-p)));
testnum=1000;  
noisenum=floor(n_ratio*selfnum);        %ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿?%,1%ï¿½ï¿½5%
if shape==1
    selfsample=fivecirclesample(selfnum,selfradius);
elseif shape==2
    selfsample=Trianglesample(selfnum,selfradius);
elseif shape==3
    selfsample=incrosssample(selfnum,selfradius);
elseif shape==4
    selfsample=starsample(selfnum,selfradius);
elseif shape==5
    selfsample=stripesample(selfnum,selfradius);
elseif shape==6
    selfsample=crosssample(selfnum,selfradius);
elseif shape==7
    selfsample=singleTrianglesample(selfnum,selfradius);
elseif shape==8
    selfsample=singlestarsample(selfnum,selfradius);
end

selfsample=addnoise(selfsample,selfnum,noisenum,shape,selfradius);
selfnum=selfnum+noisenum;

[self_detector,self_Detectornum]=cluster(selfsample,selfnum,0.02,hc,selfradius,n_ratio+0.2); 

[ detector,Detectornum ] = hypothesis( self_detector,self_Detectornum,n,za,p,selfradius);
% [detector1,Detectornum1 ] = V_NSA_Detector(self_Detectornum,self_detector,n,p,za,selfradius);
% figure(1);
% showselfdetector( self_detector,self_Detectornum );
% showdetector( detector,Detectornum );
% figure(2);
% showselfdetector( self_detector,self_Detectornum );
% showdetector( detector1,Detectornum1 );

% [out]= Test_nD(shape,testnum,detector,Detectornum,selfnum);
% [out1]= Test_nD(shape,testnum,detector1,Detectornum1,selfnum);
[out]= Test_sDnD(shape,testnum,detector,Detectornum,self_Detectornum,self_detector);
% [out3]= Test_sDnD(shape,testnum,detector1,Detectornum1,self_Detectornum,self_detector);
end