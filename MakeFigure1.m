clc
clear

deltaChi=2:2:12;

myfolder1='C:\Users\xcheng17\Documents\MATLAB\Betastudy\BetaAll\mouse3\'; % where everything is saved
%mouseindex=3;  % this is an integer number 1-6 


%mousefolder1=[myfolder1,'data/mouse',num2str(mouseindex),'/']; 
%savefolder=[mousefolder1,'results/'];
%addpath(myfolder1,mousefolder1,[myfolder1,'code'],[myfolder1,'code/femcore'],[myfolder1,'code/iso2mesh']);
savefolder=myfolder1;
B0=1.5;
TE='30';Gx='50';
cmro2 = 5;
VesselDiPercent=0;




%figure
deltaChi=2:2:12;

for ii=1:length(deltaChi)
    Chi=deltaChi(ii);
     load([savefolder,'Beta_MCBOLD','_',num2str(Chi),'_',num2str(VesselDiPercent),'_',num2str(cmro2),'_',num2str(B0),'.mat'],'BOLD_GE');
    
    %BOLD_GE=max(signal_GE(echo_index-10:echo_index));
    R2star(ii)=abs(log(BOLD_GE))/30;
    
    
end
deltaChi=deltaChi*10^(-6);
hold on

plot(log(deltaChi(2:end)-deltaChi(1)),log(R2star(2:end)-R2star(1)),'bo')


xlabel('ln \Delta\chi')
ylabel('ln \Delta R2*')

set(gcf, 'unit', 'inches')
   set(gcf, 'position',[1,1,4,3])
   set(gca,'box','on','Fontsize',14)
   
   f=polyfit(log(deltaChi(2:end)-deltaChi(1)),log(R2star(2:end)-R2star(1)),1);
   xplot=[-13.5:0.1:-11.5];
   P=polyval(f,xplot);
   
   hold on
   plot(xplot,P,'k')
   legend('B_0=1.5 T','\beta=1.39')