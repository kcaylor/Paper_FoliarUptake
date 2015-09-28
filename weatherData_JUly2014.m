%CGerlein
%Weather data for experiment in teh summer
%Rained 2.55 on day 4, 1.2 on day 5 and 0.88 on day 17 (inches)
%http://www.ncdc.noaa.gov/cdo-web/quickdata
clear all
close all

Day = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 15 16 17 18 19 20];
DMonth = [11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30];
Tmax = [85 88 90 92 90 87 83 83 83 81 81 87 90 82 85 82 90 83 76 81];
Tmin = [63 61 64 67 69 64 58 53 55 59 58 60 64 58 60 63 65 57 53 54];
    
figure(1)
plot(DMonth, Tmax, 'color', 'r')
hold on
plot(DMonth, Tmin, 'color', 'b')
    
figure(2)
plot(Day, Tmax, 'color', 'r', 'LineWidth', 2)
hold on
plot(Day, Tmin, 'color', 'b', 'LineWidth', 2)
set(gca,'FontSize', 30,'FontName','Times')
box off
xlabel('Days','FontSize', 30,'interpreter','latex')
ylabel('Temperature (F)','FontSize', 30,'interpreter','latex')
legend('T_{max}', 'T_{min}','FontSize', 30,'interpreter','latex', 'Location', 'Best')
legend boxoff   
    