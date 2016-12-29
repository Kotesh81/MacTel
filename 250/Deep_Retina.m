dataset = xlsread('Report_250.xlsx',1, 'B1:B18');
y_axis = dataset(:,1);
x_axis = (1 :18);
p1 = plot (x_axis, y_axis,'--o');
hold on
xlabel('Patient No')
ylabel('Area of Deep Retina')
title('Deep Retina');
s = sum(y_axis);
% fprintf ('%f\n',s)
mean = s/18; 
fprintf ('Mean of all areas  = %f\n',mean)
p2 = plot ([0,18],[mean,mean]);
hold off
legend([p1 p2],'Exact Areas','Mean')