dataset = xlsread('Report_320.xlsx',1,'C1:C18');           % Reading data from the Excel file.
y_axis = dataset(:,1);                                      % Taking area as the y-axis
x_axis = (1 :18);                                           % Taking patient no as the x-axis
p1 = plot (x_axis, y_axis,'--o');                           % plot the graph between x-axis and y-axis
hold on
xlabel('Patient No')                                          % Labelling x-axis as Patient No
ylabel('Area of Superficial Choroid')                         % Labelling y-axis as area
title('Superficial Choroid');                               % Title of the plot is  Superficial Choroid
s = sum(y_axis);
% fprintf ('%f\n',s)
mean = s/18;                                                    % Calculating Mean 
fprintf ('Mean of all areas  =  %f\n',mean)             
p2 = plot ([0,18],[mean,mean]);                     % Ploting the mean line in the plot
hold off
legend([p1 p2],'Exact Areas','Mean')                % Labels the different lines 
