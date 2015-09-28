%December 1st 2014
%C Gerlein
% plots bar plots of dD and d18O obtained from different methods: Induction
% Module, IRIS and IRMS
clear all
close all

Vein =[-3.9	-35.0;-3.9	-35 ;-1.7	-16.4 ;-1.6	-16.3 ;-2.1	-19.3];
IRIS = [7.4	-3.6 ;5.3	-8.5 ;4.0	-11.1 ;7.2	-3.3 ;6.9	-6.8];
IM = [20.03	24.15 ;15.34 20.32 ;13.31	-1.55 ;13.37	-2.67 ;23.02	15.13];

%% Correcting back to IRMS
%IRMS_dD = 0.9232*IRIS-3.2768
%IRMS_d18O = =0.865*IRMS-1.0394

Vein_IRMS(:,1) = 0.865.*Vein(:,1)-1.0394;
Vein_IRMS(:,2) = 0.9232.*Vein(:,2)-3.2768;

IRIS_IRMS(:,1) = 0.865.*IRIS(:,1)-1.0394;
IRIS_IRMS(:,2) = 0.9232.*IRIS(:,2)-3.2768;

IM_IRMS(:,1) = 0.865.*IM(:,1)-1.0394;
IM_IRMS(:,2) = 0.9232.*IM(:,2)-3.2768;

%% Correcting for leaf water
perc = 60.52;
IM_Vein = (1-perc/100)*Vein+(perc/100)*IM;
IM_IRMS_Vein_IRMS=(1-perc/100)*Vein_IRMS+(perc/100)*IM_IRMS;

%% Discrepancies
IRIS_IM = IRIS-IM;
IRIS_IM(6,:) = [NaN NaN]; IRIS_IM(7,:) = nanmean(IRIS_IM);

IRMS_IM = IRIS_IRMS-IM;
IRMS_IM(6,:) = [NaN NaN]; IRMS_IM(7,:) = nanmean(IRMS_IM);

IRMS_IMCorr_IRMS = IRIS_IRMS-IM_IRMS;
IRMS_IMCorr_IRMS(6,:) = [NaN NaN]; IRMS_IMCorr_IRMS(7,:) = nanmean(IRMS_IMCorr_IRMS);

IRIS_IMCorrVein = IRIS-IM_Vein;
IRIS_IMCorrVein(6,:) = [NaN NaN]; IRIS_IMCorrVein(7,:) = nanmean(IRIS_IMCorrVein);

IRMS_IMCorrVein_IRMS = IRIS_IRMS-IM_IRMS_Vein_IRMS;
IRMS_IMCorrVein_IRMS(6,:) = [NaN NaN]; IRMS_IMCorrVein_IRMS(7,:) = nanmean(IRMS_IMCorrVein_IRMS);

%% Plotting

dO_all=[IRIS_IM(1:5,1) IRMS_IMCorr_IRMS(1:5,1) IRMS_IMCorrVein_IRMS(1:5,1)];
dD_all=[IRIS_IM(1:5,2) IRMS_IMCorr_IRMS(1:5,2) IRMS_IMCorrVein_IRMS(1:5,2)];

figure(1)
subplot(1,2,1)
bar(dO_all)
set(gca,'FontSize', 20,'FontName','Times')
xlabel('Leaf #')
ylabel('Discrepancy in $\delta ^{18}$O (permil)','FontSize', 20,'interpreter','latex')
legend('IRMS - IM', 'IRMS - IM corr (IRMS)', 'IRMS - IM corr (IRMS + vein)', 'FontSize', 10,'interpreter','latex', 'Location','southwest')
legend('boxoff')
% %legend('IRIS - IM', 'IRIS - IM corrected for vein water', 'FontSize', 20,'interpreter','latex', 'Location','southwest')
% %legend('boxoff')
% subplot(1,2,2)
% bar(dD)
% set(gca,'FontSize', 20,'FontName','Times')
% xlabel('Leaf #')
% ylabel('Discrepancy in $\delta$D (permil)','FontSize', 20,'interpreter','latex')

subplot(1,2,2)
bar(dD_all)
set(gca,'FontSize', 20,'FontName','Times')
xlabel('Leaf #')
ylabel('Discrepancy in $\delta$D (permil)','FontSize', 20,'interpreter','latex')

set(gcf, 'PaperPosition', [-1 -0 16 6.5]); %Position the plot further to the left and down. Extend the plot to fill entire paper.
set(gcf, 'PaperSize', [14 6.5]); %Keep the same paper size
saveas(gcf, 'IRMS_Discrep_Plot', 'pdf')

%% Vein water 
dO_Vein = [IRIS_IM(1:5,1) IRIS_IMCorrVein(1:5,1)];
dD_Vein = [IRIS_IM(1:5,2) IRIS_IMCorrVein(1:5,2)];

figure(2)
subplot(1,2,1)
bar(dO_Vein)
set(gca,'FontSize', 20,'FontName','Times')
xlabel('Leaf #')
ylabel('Discrepancy in $\delta ^{18}$O (permil)','FontSize', 20,'interpreter','latex')
legend('IRIS - IM', 'IRIS - IM corrected for vein water', 'FontSize', 20,'interpreter','latex', 'Location','southwest')
legend('boxoff')
subplot(1,2,2)
bar(dD_Vein)
set(gca,'FontSize', 20,'FontName','Times')
xlabel('Leaf #')
ylabel('Discrepancy in $\delta$D (permil)','FontSize', 20,'interpreter','latex')

set(gcf, 'PaperPosition', [-1 -0 16 6.5]); %Position the plot further to the left and down. Extend the plot to fill entire paper.
set(gcf, 'PaperSize', [14 6.5]); %Keep the same paper size
saveas(gcf, 'Vein_Discrep_Plot', 'pdf')
