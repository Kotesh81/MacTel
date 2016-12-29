dataset = xlsread('Report_Centre.xlsx',1, 'B1:B17');
y_axis = dataset(:,1);
x_axis = (1 :17);
p1 = plot (x_axis, y_axis,'--o');
hold on
xlabel('Patient No')
ylabel('Area of Deep Retina')
title('Deep Retina');
s = sum(y_axis);
% fprintf ('%f\n',s)
mean = s/17; 
fprintf ('Mean of all areas  = %f\n',mean)
p2 = plot ([0,17],[mean,mean]);
hold off
legend([p1 p2],'Exact Areas','Mean')