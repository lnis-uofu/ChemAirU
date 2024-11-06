% ========================================================================== 
% ECE6950 Research - The University of Utah
% Subject: Developing a Matlab code to seperate each chemical response 
%       into a seperate data set and analyize noise of the chemicals' 
%       responses on the ChemAirU sensor.
% Nov 6th, 2024
% ========================================================================== 

close all;
clear;

T = readtable('airdata_sample.csv');

t = T{:,2}'; % "Time" column, column 2, reading from the table T.

s1_we = T{:,3}; %Column 3 reading
s1_ae = T{:,4}; %Column 4 reading

s1=(s1_we-s1_ae)'; %sensor final voltage reading

s2_we = T{:,5}; %Column 5 reading
s2_ae = T{:,6}; %Column 6 reading

s2=(s2_we-s2_ae)'; %sensor final voltage reading

s3_we = T{:,7}; %Column 7 reading
s3_ae = T{:,8}; %Column 8 reading

s3=(s3_we-s3_ae)'; %sensor final voltage reading

s4_we = T{:,9}; %Column 9 reading
s4_ae = T{:,10};%Column 10 reading

s4=(s4_we-s4_ae)'; %sensor final voltage reading

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
stem(t,s1);
title('Air Sensor Chemical Responses (Subplots)');grid on
subplot(4,1,2); %
stem(t,s2);

subplot(4,1,3); %
stem(t,s3);
ylim([-inf 3.5])

subplot(4,1,4); %
stem(t,s4);

xlabel('Time, [ns]');
ylabel('Voltage, [V]');



fprintf('\n');
fprintf('Sensor 1 Voltage Reading =');
disp(s1);
fprintf('Sensor 2 Voltage Reading =');
disp(s2);
fprintf('Sensor 3 Voltage Reading =');
disp(s3);
fprintf('Sensor 4 Voltage Reading =');
disp(s4);











