clc;
clear all;
close all;

selfnum = 3000;
selfradius = 0.02;
% hc = 30;
% for p = 0.99:0.01:0.99
%     for n_ratio= 0:0.005:0.005
%         for shape = 1:1:8
%             disp([shape,n_ratio,p]);
%             for time = 1:1:8
%                 [out]=SDSNSA(n_ratio,shape,p,selfnum,selfradius,hc);
%                 execl40(shape*8-4:shape*8,time)=out;
%             end
%         end
%         str = strcat('nSDSNSA_n_3000_p',num2str(p),'noise',num2str(n_ratio),'hc',num2str(hc),'.mat');
%         save (str,'execl40');
%     end
% end


p=0.99;
for hc = 0:3:30
    for n_ratio= 0.01:0.01:0.05
        for shape = 1:1:8
            disp([shape,n_ratio,p]);
            for time = 1:1:50
                [out]=SDSNSA(n_ratio,shape,p,selfnum,selfradius,hc);
                execl(shape*8-4:shape*8,time)=out;
            end
        end
        str = strcat('SDSNSA_n_3000_p',num2str(p),'noise',num2str(n_ratio),'hc',num2str(hc),'.mat');
        save (str,'execl');
    end
end