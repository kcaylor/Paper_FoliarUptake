clear all 
close all
IRIS = [-3.6, 12.1, -0.9, -0.9, -11.1, -1.7, -1.2, -4.9, -16.3, -19.3];
IRMS = [-6.5, 6.5, -2.1, -2.5, -14.6, -4.3, -5.7, -7.8, -18.0, -21.8];

figure(1)
plot(IRIS, IRMS, 'o')
plotregression(IRIS,IRMS,'Regression')