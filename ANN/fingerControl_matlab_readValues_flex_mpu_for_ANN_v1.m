%% Read data fom arduino to determine min and max values
%0=closed
%1=leftr
%2=bqckforft
%3=closmvt
%4=closed
% serialportlist("available");
close all
clear all
clc

%%
arduinoObj = arduino("COM4","Mega2560","Libraries","I2C");

imuObj = mpu6050(arduinoObj);

maxSamples = 1000;
className = 'ferme';
classNumber = 9;

data = zeros(maxSamples,5); % flex, accX, accY, accZ, class#
for i=1:1:maxSamples
    flex_pos1 = readVoltage(arduinoObj,'A1');
    accelReadings = readAcceleration(imuObj);
    data(i,:) = [flex_pos1 accelReadings classNumber];
    disp(["Flex: ", flex_pos1, " -- IMU (accel): ", accelReadings]);
end

save(['glovemvt' num2str(classNumber)], 'data', 'classNumber', 'className')
disp("done")
release(imuObj);

clear arduinoObj;
clear imuObj