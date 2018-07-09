clear all;
%1000p
for shape=1:1:8
    r=0;
    n=1000;
    for i=1:1:10
        p=0.89+0.01*i;
    for j=1:1:20
        [execl(i*4-2,j),execl(i*4-1,j),execl(i*4,j)]=NSALab(p,r,n,shape);
    end
    end
if shape==1
    xlswrite('execl1',execl,'1000p','D1');%������ּ�����
elseif shape==2
    xlswrite('execl1',execl,'1000p','D101');%������ּ�����
elseif shape==3
    xlswrite('execl1',execl,'1000p','D201');%������ּ�����
elseif shape==4
    xlswrite('execl1',execl,'1000p','D301');%������ּ�����
elseif shape==5
    xlswrite('execl1',execl,'1000p','D401');%������ּ�����
elseif shape==6
    xlswrite('execl1',execl,'1000p','D501');%������ּ�����
elseif shape==7
    xlswrite('execl1',execl,'1000p','D601');%������ּ�����
elseif shape==8
    xlswrite('execl1',execl,'1000p','D701');%������ּ�����
end
end

%3000p
for shape=1:1:8
    r=0;
    n=3000;
    for i=1:1:10
        p=0.89+0.01*i;
    for j=1:1:20
        [execl(i*4-2,j),execl(i*4-1,j),execl(i*4,j)]=NSALab(p,r,n,shape);
    end
    end
if shape==1
    xlswrite('execl1',execl,'3000p','D1');%������ּ�����
elseif shape==2
    xlswrite('execl1',execl,'3000p','D101');%������ּ�����
elseif shape==3
    xlswrite('execl1',execl,'3000p','D201');%������ּ�����
elseif shape==4
    xlswrite('execl1',execl,'3000p','D301');%������ּ�����
elseif shape==5
    xlswrite('execl1',execl,'3000p','D401');%������ּ�����
elseif shape==6
    xlswrite('execl1',execl,'3000p','D501');%������ּ�����
elseif shape==7
    xlswrite('execl1',execl,'3000p','D601');%������ּ�����
elseif shape==8
    xlswrite('execl1',execl,'3000p','D701');%������ּ�����
end
end

%r
for shape=1:1:8
    p=0;
    n=0;
    for i=1:1:10
       r=0.01*i;
    for j=1:1:20
        [execl(i*4-2,j),execl(i*4-1,j),execl(i*4,j)]=NSALab(p,r,n,shape);
    end
    end
if shape==1
    xlswrite('execl1',execl,'r','D1');%������ּ�����
elseif shape==2
    xlswrite('execl1',execl,'r','D101');%������ּ�����
elseif shape==3
    xlswrite('execl1',execl,'r','D201');%������ּ�����
elseif shape==4
    xlswrite('execl1',execl,'r','D301');%������ּ�����
elseif shape==5
    xlswrite('execl1',execl,'r','D401');%������ּ�����
elseif shape==6
    xlswrite('execl1',execl,'r','D501');%������ּ�����
elseif shape==7
    xlswrite('execl1',execl,'r','D601');%������ּ�����
elseif shape==8
    xlswrite('execl1',execl,'r','D701');%������ּ�����
end
end


%n
for shape=5:1:8
    p=0;
    r=0;
    for i=1:1:6
       n=1000*i;
    for j=1:1:20
        [execl(i*4-2,j),execl(i*4-1,j),execl(i*4,j)]=NSALab(p,r,n,shape);
    end
    end
if shape==1
    xlswrite('execl1',execl,'n','D1');%������ּ�����
elseif shape==2
    xlswrite('execl1',execl,'n','D101');%������ּ�����
elseif shape==3
    xlswrite('execl1',execl,'n','D201');%������ּ�����
elseif shape==4
    xlswrite('execl1',execl,'n','D301');%������ּ�����
elseif shape==5
    xlswrite('execl1',execl,'n','D401');%������ּ�����
elseif shape==6
    xlswrite('execl1',execl,'n','D501');%������ּ�����
elseif shape==7
    xlswrite('execl1',execl,'n','D601');%������ּ�����
elseif shape==8
    xlswrite('execl1',execl,'n','D701');%������ּ�����
end
end