function [out]= Test_sDnD(shape,testnum,detector,Detectornum,self_Detectornum,self_detector)
NN=0;%��ʵֵ�Ƿ�   �жϳɷ�
NS=0;%��ʵֵ�Ƿ�   �жϳ���
SS=0;
SN=0;
testdata=gettestdata(testnum);
for i=1:1:testnum         %test stage          
	ddis1=10;
	ddis2=10;
       if shape==1
        S=fivecirclecheck(testdata(i,1),testdata(i,2));
       elseif shape==2
         S=Trianglecheck(testdata(i,1),testdata(i,2));
       elseif shape==3
         S=incrosscheck(testdata(i,1),testdata(i,2));
       elseif shape==4
         S=starcheck(testdata(i,1),testdata(i,2));
       elseif shape==5
         S=stripecheck(testdata(i,1),testdata(i,2));
       elseif shape==6
         S=crosscheck(testdata(i,1),testdata(i,2));
       elseif shape==7
         S=singleTrianglecheck(testdata(i,1),testdata(i,2));
       elseif shape==8
         S=singlestarcheck(testdata(i,1),testdata(i,2));
       end
       
        for j=1:1:Detectornum       %�Ƿ��쳣�����cover��
            dis2= ( testdata(i,1)-detector(j,1) )^2+( testdata(i,2)-detector(j,2) )^2;
            dis=dis2^0.5;
            if  dis<=detector(j,3)
                ND=1;                                
                break;
            else 
                ND=0;
                k=dis-detector(j,3);
                if k<ddis1
                    ddis1=k;
                end      
            end      
        end
        
        if ND==1
            if S==1
                SN=SN+1;
            else
                NN=NN+1;
            end
        else  
            for j=1:1:self_Detectornum       %�Ƿ���������cover
                dis2= ( testdata(i,1)-self_detector(j,1) )^2+( testdata(i,2)-self_detector(j,2) )^2;
                dis=dis2^0.5;
                if  dis<=self_detector(j,3)
                    SD=1;                                
                    break;
                else 
                    SD=0;
                    k=dis-self_detector(j,3);
                    if k<ddis2
                        ddis2=k;
                    end      
                end      
            end
            if SD==1
                if S==1
                    SS=SS+1;
                else
                    NS=NS+1;
                end
            end  
            if SD==0   
                if ddis1>ddis2
                    if S==1
                        SS=SS+1;
                    else
                        NS=NS+1;
                    end
                else
                    if S==1
                        SN=SN+1;
                    else
                        NN=NN+1;
                    end
                end
            end        
        end
end
    out(1)=NN/(NS+NN);
    out(2)=SN/(SN+SS);
    out(3)=1-out(1)+out(2);
    out(4)=self_Detectornum;
    out(5)=Detectornum;
end