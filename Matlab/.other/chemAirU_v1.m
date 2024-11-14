% ========================================================================== 
% ECE6950 Research - The University of Utah
% Subject: Developing a Matlab code to seperate each chemical response 
%       into a seperate data set and analyize noise of the chemicals' 
%       responses on the ChemAirU sensor.
% Nov 6th, 2024
% ========================================================================== 

close all;
clear;

T = readtable('chem-date_final.csv');

t = T{:,2}'; % "Time" column, column 2, reading from the table T.

t_len = length(t);%length of the time data

fprintf('\n');
fprintf('Length of the time data, t_len =');
disp(t_len);

s1_we = T{:,3}; %Column 3 reading
s1_ae = T{:,4}; %Column 4 reading

s1=(s1_we-s1_ae)'; %sensor final voltage reading


s1_len = length(s1);%length of the data
fprintf('\n');
fprintf('Length of the Sensor 1 data reading =');
disp(s1_len);

s2_we = T{:,5}; %Column 5 reading
s2_ae = T{:,6}; %Column 6 reading

s2=(s2_we-s2_ae)'; %sensor final voltage reading

s2_len = length(s2);%length of the data
fprintf('\n');
fprintf('Length of the Sensor 2 data reading  =');
disp(s2_len);

s3_we = T{:,7}; %Column 7 reading
s3_ae = T{:,8}; %Column 8 reading

s3=(s3_we-s3_ae)'; %sensor final voltage reading

s3_len = length(s3);%length of the data
fprintf('\n');
fprintf('Length of the Sensor 3 data reading =');
disp(s3_len);

s4_we = T{:,9}; %Column 9 reading
s4_ae = T{:,10};%Column 10 reading

s4=(s4_we-s4_ae)'; %sensor final voltage reading

s4_len = length(s4);%length of the data
fprintf('\n');
fprintf('Length of the Sensor 4 data reading =');
disp(s4_len);

figure (1);
clf; % clears the figures
plot(t,s1);
title('Air Sensor Chemical Responses');grid on

xlabel('Time, [ns]');
ylabel('Voltage, [V]');
hold on

plot(t,s2);
plot(t,s3);
plot(t,s4);

hold off


figure (2);
clf; % clears the figures

subplot(4,1,1); %
stem(t,s1);ylabel('Voltage, [V]');
title('Air Sensor1 Chemical Response');grid on
subplot(4,1,2); %

stem(t,s2);ylabel('Voltage, [V]');
title('Air Sensor2 Chemical Response');grid on

subplot(4,1,3); %
stem(t,s3);ylabel('Voltage, [V]');
title('Air Sensor3 Chemical Response');grid on
ylim([-inf 3.5])

subplot(4,1,4); %
stem(t,s4);
title('Air Sensor4 Chemical Response');grid on

xlabel('Time, [ns]');
ylabel('Voltage, [V]');


%Sensor Reading Data Console Display
fprintf('\n');
fprintf('Sensor 1 Voltage Reading =');
disp(s1);
fprintf('Sensor 2 Voltage Reading =');
disp(s2);
fprintf('Sensor 3 Voltage Reading =');
disp(s3);
fprintf('Sensor 4 Voltage Reading =');
disp(s4);











