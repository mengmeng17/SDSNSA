clc;
clear all;
close all;

selfnum = 3000;
selfradius = 0.02;
hc = 30;
for p = 0.9:0.01:0.99
    for n_ratio= 0:0.005:0.05 
        str = strcat('DSCNSA_n_3000_p',num2str(p),'noise',num2str(n_ratio),'hc',num2str(hc),'.mat');
        str2 = strcat('nDSCNSA_n_3000_p',num2str(p),'noise',num2str(n_ratio),'hc',num2str(hc),'.mat');
        str3 = strcat('aDSCNSA_n_3000_p',num2str(p),'noise',num2str(n_ratio),'hc',num2str(hc),'.mat');
        load(str);
        load(str2);
        execl40=execl;
        execl40(:,21:40)=execl20;
        save(str2,'execl40');
    end
end
