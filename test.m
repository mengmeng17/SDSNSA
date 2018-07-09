clear all;
selfradius=0.05;
selfnum=1000;
testnum=100;
p=0.99; 
za=2;
n=max(5/p,5/(1-p));
n=fix(n);
detectornum=0;             
sampleshape=1;     % 1.star 2.stripe 3.cross 4.triangle 5.ring 6.intersection
                   % 7.incross 8.instar 9.instripe 10.intriangle 11.inring
                   % 12.inintersection
%get sample and plot in hanshu 
if sampleshape==1
    selfsample=starsample(selfnum,selfradius);
elseif sampleshape==2
    selfsample=stripesample(selfnum,selfradius,1/3);
elseif sampleshape==3
    selfsample=crosssample(selfnum,selfradius);
elseif sampleshape==4
    selfsample=Trianglesample(selfnum,selfradius);
elseif sampleshape==5
    selfsample=ringsample(selfnum,selfradius);
elseif sampleshape==6
    selfsample=Intersectionsample(selfnum,selfradius,0.5,0.5,2/9,2/9);
elseif sampleshape==7
    selfsample=incrosssample(selfnum,selfradius);
elseif sampleshape==8
    selfsample=instarsample(selfnum,selfradius);
elseif sampleshape==9
    selfsample=instripesample(selfnum,selfradius,1/3);
elseif sampleshape==10
    selfsample=inTrianglesample(selfnum,selfradius);
elseif sampleshape==11
    selfsample=inringsample(selfnum,selfradius);
elseif sampleshape==12
    selfsample=inIntersectionsample(selfnum,selfradius,0.5,0.5,2/9,2/9);    
end
    
                                                                                                                                        
[detector,detectornum]=hypothesisquchongdie(selfsample,selfnum,selfradius,za,n,p);