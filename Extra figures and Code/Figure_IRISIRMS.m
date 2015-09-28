%December 2nd 2014
%C Gerlein
%Plots the 10 sampels of Colocasia esculenta that were run on both the
%Picarro and on Todd Dawson's mass spec

clear all 
close all

IRISO = [7.4, 13.0, 3.3, 3.6, 4.0, 8.2, 8.1, 6.3, -1.6, -2.1];
IRMSO = [5.21, 9.62, 2.93, 2.96, 1.73, 6.69, 5.45, 4.54, -2.78, -3.45];

pO = polyfit(IRISO,IRMSO,1);
xO=[min(IRISO)-1:0.001:max(IRISO)+1];
yO = pO(1).*xO+pO(2);


IRISD = [-3.6, 12.1, -0.9, -0.9, -11.1, -1.7, -1.2, -4.9, -16.3, -19.3];
IRMSD = [-6.5, 6.5, -2.1, -2.5, -14.6, -4.3, -5.7, -7.8, -18.0, -21.8];

pD = polyfit(IRISD,IRMSD,1);
xD=[min(IRISD)-1:0.001:max(IRISD)+1];
yD = pD(1).*xD+pD(2);

figure(1)
subplot(1,2,1)
plot(IRISO, IRMSO, 'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'white', 'MarkerSize', 12)
hold on
plot(xO,yO,'-', 'Color', 'k', 'LineWidth', 2)
set(gca,'FontSize', 20,'FontName','Times')
axis([-3 14 -4 10])
xlabel('$\delta^{18}$O on IRIS (permil)','FontSize', 20,'interpreter','latex')
ylabel('$\delta^{18}$O on IRMS (permil)','FontSize', 20,'interpreter','latex')
str1 = '$\delta^{18}$O$_{\bf{IRMS}}$ = 0.87 $\delta^{18}$O$_{\bf{IRIS}}$ - 1.04';
text(-2.5,9,str1,'FontSize', 20,'interpreter','latex')
str2 = 'R$^2$ = 0.97';
text(-1,8,str2,'FontSize', 20,'interpreter','latex')


subplot(1,2,2)
plot(IRISD, IRMSD, 'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'white', 'MarkerSize', 12)
hold on
plot(xD,yD,'-', 'Color', 'k', 'LineWidth', 2)
set(gca,'FontSize', 20,'FontName','Times')
axis([-20 13 -23 9])
xlabel('$\delta$D on IRIS (permil)','FontSize', 20,'interpreter','latex')
ylabel('$\delta$D on IRMS (permil)','FontSize', 20,'interpreter','latex')
str1 = '$\delta$D$_{\bf{IRMS}}$ = 0.92 $\delta$D$_{\bf{IRIS}}$ - 3.3';
text(-19,7,str1,'FontSize', 20,'interpreter','latex')
str2 = 'R$^2$ = 0.98';
text(-16,4.5,str2,'FontSize', 20,'interpreter','latex')


set(gcf, 'PaperPosition', [-1 -0 16 6.5]); %Position the plot further to the left and down. Extend the plot to fill entire paper.
set(gcf, 'PaperSize', [14 6.5]); %Keep the same paper size
saveas(gcf, 'IRMSIRIS_R2_Plot', 'pdf')