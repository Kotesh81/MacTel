dataset = xlsread('Report_Centre.xlsx',1, 'A1:A17');    % Reading data from the Excel file.
y_axis = dataset(:,1);                % Taking area as the y-axis
x_axis = (1 :17);                   % Taking patient no as the x-axis
p1 = plot (x_axis, y_axis,'--o');       % plot the graph between x-axis and y-axis
hold on
xlabel('Patient No')                    % Labelling x-axis as Patient No
ylabel('Area of Superficial Retina')    % Labelling y-axis as area
title('Superficial Retina');            % Title of the plot is  Superficial Retina
s = sum(y_axis);                       
% fprintf ('%f\n',s)
mean = s/17;                            % Calculating Mean 
fprintf ('Mean of all areas  = %f\n',mean)
p2 = plot ([0,17],[mean,mean]);              % Ploting the mean line in the plot
hold off                 
legend([p1 p2],'Exact Areas','Mean')         % Labels the different lines 


