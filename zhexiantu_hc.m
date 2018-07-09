clc;
close all;
clear all;
p =0.99;
selfnum = 3000;

for shape = 1:1:8
n = 0; 
for hc = 0:3:30
    n = n+1;
    m = 0;
for noise = 0:0.01:0.05
    m = m+1;
    str2 = strcat('mDSCNSA_n_3000_p',num2str(p),'noise',num2str(noise),'hc',num2str(hc),'.mat');
    load (str2);
    meanall = mean (execl,2);
    meanall = meanall';
    TP(n,m) = meanall(shape*8-4);
    FP(n,m) = [meanall(shape*8-3)];
    ER(n,m) = [meanall(shape*8-2)];
    selfnumer(n,m) = [meanall(shape*8-1)];
    nonselfnumber(n,m) = [meanall(shape*8)];
end
end

%% ×Ô¶¯±£´æ
% xname={'p'}; % p
% number = [0.9:0.01:0.99];  % p
% str0 = strcat('algorithm-p-num',num2str(selfnum),'-shape',num2str(shape)); % p
xname={'hc'}; % num
number = [0:3:30];  % num
str0 = strcat('hc-shapee',num2str(shape)); % num

nameTP = strcat(str0,'-TP','.png');
nameFP = strcat(str0,'-FP','.png');
nameER = strcat(str0,'-ER','.png');
nameSNum = strcat(str0,'-SNum','.png');
nameNSNum = strcat(str0,'-NSNum','.png');
nameall = strcat(str0,'-all','.png');

set(gca,'FontSize',20);
set(get(gca,'YLabel'),'Fontsize',20);

set(0,'DefaultAxesLineStyleOrder','remove');
set(0,'DefaultAxesColorOrder','remove');
set(0,'DefaultAxesLineStyleOrder',{'-p',':s','--+','-^','-o','-h','-*'});
set(0,'DefaultAxesColorOrder',[0.4,0.4,0.4]);
set(gca,'FontSize',10);
set(get(gca,'YLabel'),'Fontsize',10) 
set(gcf,'Position',[100 100 260 220]);
% subplot(221);

plot(number,TP); 
ylabel('TP');
xlabel(xname);    
axis([0 30 0.9 1.005]); 
set(gca,'FontSize',10);
set(get(gca,'YLabel'),'Fontsize',10) 
% saveas(gcf,nameTP);

plot(number,FP); 
legend('noise 0','noise 0.01','noise 0.02','noise 0.03','noise 0.04','noise 0.05',1);
ylabel('FP');
xlabel(xname);    
axis([0 30 0 0.9]); 
set(gca,'FontSize',10);
set(get(gca,'YLabel'),'Fontsize',10) 
% saveas(gcf,nameFP);

plot(number,ER); 
ylabel('ER');
xlabel(xname);    
axis([0 30 0 0.8]); 
set(gca,'FontSize',10);
set(get(gca,'YLabel'),'Fontsize',10) 
% saveas(gcf,nameER);

plot(number,selfnumer); 
ylabel('self-detector number');
xlabel(xname);    
axis([0 30 0 600]); 
set(gca,'FontSize',10);
set(get(gca,'YLabel'),'Fontsize',10) 
% saveas(gcf,nameSNum);

plot(number,nonselfnumber); 
ylabel('nonself-detector number');
xlabel(xname);    
axis([0 30 0 350]); 
set(gca,'FontSize',10);
set(get(gca,'YLabel'),'Fontsize',10) 
% saveas(gcf,nameNSNum);
end
