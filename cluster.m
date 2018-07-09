function [selfdetector,selfdetectornum] = cluster( A,n,t,hc,selfradius,pp) 
                        %t�Ǿ���dc����Ҫ����
                       
guige=5;   %10*10��դ��
xjiange=1/guige;
yjiange=1/guige;

ylow=zeros(guige,guige);   %ÿ�������y����
yhigh=zeros(guige,guige);   %ÿ�������y����   
maxzhi=zeros(guige,guige);     %ÿ������Ĺ�һ��cgema����?  
junfang=zeros(guige,guige); %ÿ������Ĺ�һ��cgema��ֵ
geshu=zeros(guige,guige);   %ÿ���������ж��ٵ�
location=zeros(n,2);            %��¼ÿ���������һ��դ��?
cenfangge=zeros(guige,guige);  %��ʶ��Щ������ĵ��Ǿ�������?

for i=1:1:guige              %��׼��10*10���֮������?
    for j=1:1:guige
        ylow(guige+1-i,j)=yjiange*(i-1);
        yhigh(guige+1-i,j)=yjiange*i;
    end
end

M=n*(n-1)/2;
k=M*t;
k=fix(k);  %ȡ��
dis_matrix=zeros(n,n);           %n*n�������?
dis_vector=zeros(1,M);           %��������ľ�������?
rho_vector=zeros(n,2);           %�ڶ�������������ܶ�����?��һ��Ϊ��ţ�����centerrhomin��
cgema_vector=zeros(n,2);         %�ڶ������������cgema����,��һ��Ϊ���?


global decision;
decision=zeros(n,6);             %��һ��Ϊrho���ڶ���Ϊcgema,������Ϊ���ֵݹ�����
                                 %��5��Ϊ��������
                                  %��6�����core��halo��1��ʾhalo��0��ʾcore
                                 %��7��  ��Ե          
centersnum=0;
selfdetectornum=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dis=0;
kk=0;
for i=1:1:n
    dis_matrix(i,i)=0;
end
for i=1:1:n
    for j=i+1:1:n   
        dis=( A(i,1)-A(j,1) )^2+(  A(i,2)-A(j,2) )^2;
        dis=dis^0.5;
        dis_matrix(i,j)=dis;
        dis_matrix(j,i)=dis;
        kk=kk+1;
        dis_vector(kk)=dis;    
    end
end
dis_vector=sort(dis_vector);   %��������
dc=dis_vector(k);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:1:n-1                     %����ָ���ܶ�
    for j=i+1:1:n   
        dis=dis_matrix(i,j)/dc;
        decision(i,1)=decision(i,1)+exp(-dis*dis);
        decision(j,1)=decision(j,1)+exp(-dis*dis);
    end
end
for i=1:1:n
    rho_vector(i,1)=i;
    rho_vector(i,2)=decision(i,1);
end
rho_vector=sortrows(rho_vector,-2);  %rho_vector(1,2)Ϊ�ܶ�����?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:1:n                   % ����di����õݹ������ݹ���Ϊ������?
        decision(i,2)=dis_vector(M);
        for j=1:1:n      
            if  i~=j
                if  decision(j,1)>decision(i,1)  
                    if dis_matrix(i,j)<decision(i,2)
                        decision(i,2)=dis_matrix(i,j);    
                        decision(i,4)=j;
                    end
                end  
            end
        end 
end
for i=1:1:n
    cgema_vector(i,1)=i;
    cgema_vector(i,2)=decision(i,2);
end
cgema_vector=sortrows(cgema_vector,-2);  %cgema_vector(1,2)Ϊcgema���ֵ������Զ��һ�Ծ���?
%% cigma_rho ͼƬ
for i=1:1:n          %cgema,rho��һ��
    decision(i,1)=decision(i,1)/rho_vector(1,2);
    decision(i,2)=decision(i,2)/cgema_vector(1,2);
end
hc1=rho_vector(floor((1-pp)*n),2)/rho_vector(1,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
adjust=1;
%% cigma_rho ��һ��
while adjust==1              %�ҵ�����ʵ������ʽ����ȡcgemaƽ��ֵ���󣬸������?
      adjust=0;
    check=zeros(n);
    geshu=zeros(guige,guige);   %ÿ���������ж��ٵ�
    for i=1:1:guige       %��
        for j=1:1:guige       %��
            xmax=xjiange*j;
            xmin=xmax-xjiange;
            ymax=yhigh(guige+1-i,j);
            ymin=ylow(guige+1-i,j);
            for ii=1:1:n
                if check(ii)==0
                    if decision(ii,1)<=xmax&&decision(ii,1)>xmin
                        if decision(ii,2)<=ymax&&decision(ii,2)>ymin
                            location(ii,1)=i;
                            location(ii,2)=j;
                            geshu(guige+1-i,j)=geshu(guige+1-i,j)+1;
                            check(ii)=1;
                        end
                    end
                end
            end
        end
    end

    check=zeros(n);        %����ÿ�������ڹ�һ��cgema��ƽ��ֵ�����ֵ�����������ֵ��ƽ��ֵ��ܶ࣬��������?
    for i=1:1:guige
        for j=1:1:guige
            qiujunfangshuzu=zeros(1,1);
            xxxxxnum=0;
            for ii=1:1:n
                if check(ii)==0
                    if location(ii,1)==i&&location(ii,2)==j
                        xxxxxnum=xxxxxnum+1;
                        qiujunfangshuzu(xxxxxnum)=decision(ii,2);
                        check(ii)=1;
                    end
                end
            end
            junfang(guige+1-i,j)=mean(qiujunfangshuzu);  
            maxzhi(guige+1-i,j)=max(qiujunfangshuzu);
        
        
            if maxzhi(guige+1-i,j)-junfang(guige+1-i,j)>yjiange/2
                qiujunfangshuzu=sort(qiujunfangshuzu,'descend');
                s=0;
                for xx=1:1:xxxxxnum-1
                    if qiujunfangshuzu(xx)-qiujunfangshuzu(xx+1)>yjiange/2
                        s=1;
                        break;
                    end
                end
                if s==1
                    yhigh(guige+1-i,j)=qiujunfangshuzu(xx+1)+0.01;
                    ylow(guige-i,j)=qiujunfangshuzu(xx+1)+0.01;
                    adjust=1;
                end
            end    
        end
    end
end   
for i=guige-1:1:guige    %���Ϸ���4���������Ǿ�������
    for j=guige-1:1:guige
        cenfangge(guige+1-i,j)=1;
    end
end

for j=2:1:guige                    %��Ϊ��һ�к͵�һ�еĵ�һ�����Ǿ�������
    for i=2:1:guige
        if geshu(guige+1-i,j)~=0
            beishu=i*(junfang(guige+1-i,j)-junfang(guige,j))^2;
            beishu=1/beishu;
            sjbs=geshu(guige,j)/geshu(guige+1-i,j);
            if sjbs>beishu
                cenfangge(guige+1-i,j)=1;
            end
        end
        if cenfangge(guige+1-i,j)==1
            for ii=1:1:n
                if location(ii,1)==i&&location(ii,2)==j
                    centersnum=centersnum+1;
                    result(1,centersnum)=ii;   %result������Ϊ��ĸ����һ�о������ĵı�ţ�decisionδ����                                              
                    decision(ii,5)=centersnum;         
                end
            end
        end  
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:1:n             %�ݹ黮��
    if  decision(i,5)==0
        j=decision(i,4);
        decision(i,5)=diguihuafen(j);
    end
end    
for i=1:1:n             %���Ա߽�
    if decision(i,1)<hc1
        decision(i,7)=1;
    end
end    
%% ��������ʾ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rhoofclusters=0;
check=zeros(n);
for i=1:1:centersnum
    nn=0;
    for j=1:1:n
        if check(j)==0
            if decision(j,5)==i
                nn=nn+1;
                rhoofclusters(nn,i)=decision(j,1);
                check(j)=1;     
            end
        end
    end
end


pb=zeros(1,centersnum);  %pbΪ������ı߽��ܶ��Ͻ磬�±�Ϊ���
for i=1:1:n  %����߽��ܶ��Ͻ�?
    ci=decision(i,5);
    pi=decision(i,1);
    for j=i+1:1:n
        if(i~=j)&&( dis_matrix(i,j)<dc )             
            cj=decision(j,5);
            if  ci~=cj              
                pj=decision(j,1);
                p_average=(pi+pj)/2;
                if p_average>pb(ci)
                    pb(ci)=p_average;
                elseif p_average>pb(cj)
                    pb(cj)=p_average;
                end
            end
        end
    end
end    

for i=1:1:centersnum
    if pb(i)==0
        pb(i)=min(rhoofclusters(:,i));
    end
        pimax=decision(result(1,i),1);
        ppi=pimax-pb(i);
        pb(i)=ppi/hc+pb(i);
end

for i=1:1:n              % 1��ʾ���е�halo��0��ʾ���е�core
    c=decision(i,5);
    if decision(i,1)<=pb(c)
        decision(i,6)=1;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %�Ծ�������ΪԲ�ģ��Ծ������ĵ������Լ���ĺڵ�ľ���Ϊ�뾶�����һ�������������
for i=1:1:centersnum            %ÿ������halo�ĵ���ɳ��뾶��������?
    cenxh=result(1,i);          %�Ծ�������ΪԲ�ģ��Ծ������ĵ������Լ���ĺڵ�ľ���Ϊ�뾶�����һ�������������
    dis=10;                     %���ڴ���������ĳ��뾶������ߵ������ҳ��뾶�����Ҳȥ�ص�?
    for j=1:1:n
        if decision(j,5)==i&&decision(j,7)==1
            if dis_matrix(cenxh,j)<dis
                dis=dis_matrix(cenxh,j);
            end
        end
    end
    selfdetectornum=selfdetectornum+1;
    selfdetector(selfdetectornum,1)=A(cenxh,1);
    selfdetector(selfdetectornum,2)=A(cenxh,2);
    selfdetector(selfdetectornum,3)=dis;
    selfdetector(selfdetectornum,4)=cenxh;
    selfdetector(selfdetectornum,5)=i;
    for j1=1:1:n
        j=rho_vector(j1,1);
        if decision(j,5)==i &&decision(j,6)==0
                for ii=1:1:selfdetectornum
                    if dis_matrix(j,selfdetector(ii,4))<selfdetector(ii,3)-selfradius/2
                        s=1;
                        break;
                    else
                        s=0;
                    end
                end 
                if s==0
                    dis=10;
                    for j3=j1:1:n
                         j2=rho_vector(j3,1);
                        if decision(j2,5)==i&&decision(j2,7)==1
                            if dis_matrix(j,j2)<dis
                                dis=dis_matrix(j,j2);
                            end
                            if dis<selfradius
                               dis=selfradius;
                               break;
                            end
                        end
                    end
                    selfdetectornum=selfdetectornum+1;
                    selfdetector(selfdetectornum,1)=A(j,1);
                    selfdetector(selfdetectornum,2)=A(j,2);
                    selfdetector(selfdetectornum,3)=dis;
                    selfdetector(selfdetectornum,4)=j;
                    selfdetector(selfdetectornum,5)=i;
                end
        end
    end
end

end









