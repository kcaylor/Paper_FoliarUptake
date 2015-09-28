%CGerlein
%Dec 2nd 2014
%Plots d18O for drought leaf of July 30th as example of nearest neighbor
%interpolation


cd('/Users/cgerlein/Desktop/Summer2014/Foliar_Uptake/Foliar_Uptake_Experiment/Leaf_140730_Pot2')
leaf = imread('140730_Leaf_Pot2_Ready.png');
%veins_1 = imread('140730_Leaf_Pot2_Ready_Veins.png');
coord = xlsread('140730_Pot2_Summary.xls');
leafmask1 = open('Leafmask.mat');

leafmask = leafmask1.leafmask;

% Create a meshgrid of teh size of the original image
maxx = size(leaf,2); maxy = size(leaf,1);
[Xq, Yq] = meshgrid(1:maxx, 1:maxy);

clear leafmask1

%% Extrapolation + Interpolation of the isotope data, delta 18O, delta 2H and d-excess
d18O = scatteredInterpolant(coord(:,1),coord(:,2),coord(:,3),'nearest','nearest');
vq18O = d18O(Xq,Yq);



%% Create a mask of the leaf to supperpose to the extrapolated image

Final_leaf8O = vq18O.*leafmask;
Av_Leaf_Drought(time,1) = nanmean(nanmean(Final_leaf8O));

%% Plotting

figure(1)
imagesc(Final_leaf8O)
set(gca,'FontSize', 15,'FontName','Times','XTickLabel','')
colormap('jet')
caxis([15 30])
xlabel('$\delta ^{18}$O (permil)','FontSize', 15,'interpreter','latex')
daspect([1,1,1])
pbaspect([1,1,1])
ax = gca;
ax.YTick = [1, size(Final_leaf8O,1)/2, size(Final_leaf8O,1)];
ax.YTickLabel = {'0','22.5','45'};
ylabel('Scale (cm)','FontSize', 15,'interpreter','latex')
colorbar('location','southoutside')
set(gcf, 'PaperPosition', [-0 -1 3 7]); %Position the plot further to the left and down. Extend the plot to fill entire paper.
set(gcf, 'PaperSize', [3 5.5]); %Keep the same paper size
saveas(gcf, 'NearestNeighbor', 'pdf')

    
