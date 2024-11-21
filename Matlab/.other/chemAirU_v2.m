% ========================================================================== 
% ECE6950 Research - The University of Utah
% Subject: Developing a Matlab code to seperate each chemical response 
%       into a seperate data set and analyize noise of the chemicals' 
%       responses on the ChemAirU sensor.
% Nov 6th, 2024
% ========================================================================== 

close all;
clear;

T = readtable('chem-date.csv');

% ============ENTER THE OFFSET VOLTAGE, [V]========================

offset_voltage = 0.0025; %[V]

% ============ENTER THE DESIRED ZOOM-IN RANGE========================

% Zomm-in to analyze data according to a specific range of time

% Extract the row values where the "Time" column of the "T" table values
% are between the indicated range below

% Enter the time value for STARTing Range after the ".. >=" below (inclusive).
% Enter the the time value for ENDing Range after the ".. <=" below (inclusive).

rowsNeeded = T{:,2} >= 0.153454465 & T{:,2} <= 0.161600191;
zoom_in_data_table = T(rowsNeeded, :);

% T is the name of the original table from the ".csv" file.
% In the above code, T(:,2) represents the values in the second column 
% of the table. The logical expression T(:, 2) > x & T(:,2) < y 
% creates a logical index of rows where the second column values satisfy 
% the condition between x to y. Then, 'subsetData' stores the subset 
% of data that meets this criterion, including all columns.

% ===================ORIGINAL DATA TABLE ANALYSIS==============================

t = T{:,2}';  % "Time" column, column 2, reading from the table T.

t_len = length(t); % length of the time data

fprintf('\n');
fprintf('Length of the time data, t_len =');
disp(t_len);

relay = T{:,3}; % Column 3, "relay" reading

s1_we = T{:,4}-offset_voltage; %Column 3 reading and extracting the offset value
s1_ae = T{:,5}-offset_voltage; %Column 4 reading and extracting the offset value

s1_c=(s1_we-s1_ae)'; % Corrected final values of the Sensor 1.

%s1_c = T{:,4}; % Column 4 reading. 

s1_len = length(s1_c); % Length of the data
fprintf('\n');
fprintf('Length of the Sensor 1 data reading =');
disp(s1_len);

s2_c = T{:,5}; % Column 5 reading. Corrected final values of the Sensor 2.

s2_len = length(s2_c);% Length of the data
fprintf('\n');
fprintf('Length of the Sensor 2 data reading  =');
disp(s2_len);

s3_c_z = T{:,6}; % Column 6 reading. Corrected final values of the Sensor 3.

s3_len = length(s3_c_z);% Length of the data
fprintf('\n');
fprintf('Length of the Sensor 3 data reading =');
disp(s3_len);

s4_c = T{:,7}; % Column 7 reading. Corrected final values of the Sensor 4.

s4_len = length(s4_c);% Length of the data
fprintf('\n');
fprintf('Length of the Sensor 4 data reading =');
disp(s4_len);

% The First Figure
figure('Name','All Sensor Data Plots');
% figure (1);
clf; % Clears the figures
plot(t,s1_c);
title('Air Sensor Chemical Responses');grid on

xlabel('Time, [ns]');
ylabel('Voltage, [V]');
hold on

% plot(t,relay);
plot(t,s2_c);
plot(t,s3_c_z);
plot(t,s4_c);

hold off


figure('Name','Individual Data In Subplots');
clf; % Clears the figures

subplot(4,1,1); %
stem(t,s1_c);ylabel('Voltage, [V]');
% hold on;
% stem(t,relay);

title('Air Sensor1 Chemical Response');grid on
% ylim([-0.00025 0.003])

subplot(4,1,2); %
stem(t,s2_c);ylabel('Voltage, [V]');
title('Air Sensor2 Chemical Response');grid on
% ylim([-0.00025 0.003])

subplot(4,1,3); %
stem(t,s3_c_z);ylabel('Voltage, [V]');
title('Air Sensor3 Chemical Response');grid on
% ylim([-0.00025 0.003])

subplot(4,1,4); %
stem(t,s4_c);
title('Air Sensor4 Chemical Response');grid on
% ylim([-0.00025 0.003])

xlabel('Time, [ns]');
ylabel('Voltage, [V]');


%Sensor Reading Data Console Display
fprintf('\n');
fprintf('Sensor 1 Voltage Reading =');
disp(s1_c);
fprintf('Sensor 2 Voltage Reading =');
disp(s2_c);
fprintf('Sensor 3 Voltage Reading =');
disp(s3_c_z);
fprintf('Sensor 4 Voltage Reading =');
disp(s4_c);

% ===================ZOOM-IN DATA TABLE ANALYSIS==============================

t_z = zoom_in_data_table{:,2}';  % "Time" column, column 2, reading from the zoom in table

t_len_z = length(t_z); % length of the time data from the zoom-i9n data table

fprintf('\n');
fprintf('Zoom-In Table: Length of the time data, t_len_z =');
disp(t_len_z);

relay_z = zoom_in_data_table{:,3}; % Column 3, "relay" reading

s1_c_z = zoom_in_data_table{:,4}; % Column 4 reading. Corrected final values of the Sensor 1.

s1_len_z = length(s1_c_z); % Length of the data
fprintf('\n');
fprintf('Zoom-In Table: Length of the Sensor 1 data reading =');
disp(s1_len_z);

s2_c_z = zoom_in_data_table{:,5}; % Column 5 reading. Corrected final values of the Sensor 2.

s2_len_z = length(s2_c_z);% Length of the data
fprintf('\n');
fprintf('Zoom-In Table: Length of the Sensor 2 data reading  =');
disp(s2_len_z);

s3_c_z = zoom_in_data_table{:,6}; % Column 6 reading. Corrected final values of the Sensor 3.

s3_len_z = length(s3_c_z);% Length of the data
fprintf('\n');
fprintf('Zoom-In Table: Length of the Sensor 3 data reading =');
disp(s3_len_z);

s4_c_z = zoom_in_data_table{:,7}; % Column 7 reading. Corrected final values of the Sensor 4.

s4_len_z = length(s4_c_z);% Length of the data
fprintf('\n');
fprintf('Zoom-In Table: Length of the Sensor 4 data reading =');
disp(s4_len_z);

% The First Figure
figure('Name','Zoom-In Table: All Sensor Data Plots');
% figure (1);
clf; % Clears the figures
plot(t_z,s1_c_z);
title('Zoom-In Table: Air Sensor Chemical Response Plot Results');grid on

xlabel('Time, [ns]');
ylabel('Voltage, [V]');
hold on

% plot(t,relay);
plot(t_z,s2_c_z);
plot(t_z,s3_c_z);
plot(t_z,s4_c_z);

hold off


figure('Name','Zoom-In Table: Individual Data In Subplots');
clf; % Clears the figures

subplot(4,1,1); %
stem(t_z,s1_c_z);ylabel('Voltage, [V]');
% hold on;
% stem(t,relay);

title('Zoom-In Table: Air Sensor1 Chemical Response');grid on
% ylim([-0.00025 0.003])

subplot(4,1,2); %
stem(t_z,s2_c_z);ylabel('Voltage, [V]');
title('Zoom-In Table: Air Sensor2 Chemical Response');grid on
% ylim([-0.00025 0.003])

subplot(4,1,3); %
stem(t_z,s3_c_z);ylabel('Voltage, [V]');
title('Zoom-In Table: Air Sensor3 Chemical Response');grid on
% ylim([-0.00025 0.003])

subplot(4,1,4); %
stem(t_z,s4_c_z);
title('Zoom-In Table: Air Sensor4 Chemical Response');grid on
% ylim([-0.00025 0.003])

xlabel('Time, [ns]');
ylabel('Voltage, [V]');


%Sensor Reading Data Console Display
fprintf('\n');
fprintf('Zoom-In Table: Sensor 1 Voltage Reading =');
disp(s1_c_z);
fprintf('Zoom-In Table: Sensor 2 Voltage Reading =');
disp(s2_c_z);
fprintf('Zoom-In Table: Sensor 3 Voltage Reading =');
disp(s3_c_z);
fprintf('Zoom-In Table: Sensor 4 Voltage Reading =');
disp(s4_c_z);










