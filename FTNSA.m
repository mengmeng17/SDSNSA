function  [out1,out2]=FTNSA(n_ratio,shape,p,selfnum,selfradius)
za=1.96;
n=floor(max(5/p,5/(1-p)));
testnum=100;  
noisenum=floor(n_ratio*selfnum);        %ÔëÉù±ÈÀý£¬0%,1%£¬5%
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


[Detectornum,detector]=V_NSA_Detector(selfnum,selfsample,n,p,za,selfradius);
[self_Detectornum,self_detector]=V_NSA_Detector(Detectornum,detector,n,p,za,selfradius);


[out1]= Test_nD(shape,testnum,detector,Detectornum,selfnum);
[out2]= Test_sDnD(shape,testnum,detector,Detectornum,self_Detectornum,self_detector);

end