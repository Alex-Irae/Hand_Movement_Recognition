%% example of ANN for hand gesture recognition
% serialportlist("available");
close all
clear all
clc

%% connect to Arduino, sensors and motor
arduinoObj = arduino("COM4","Mega2560","Libraries",{"I2C","Servo"});
imuObj = mpu6050(arduinoObj);
servo1 = servo(arduinoObj,'D2');

%% Load learned ANN regression model
Mdl = load('learedAnnClassificationModel_test.mat');
Mdl = Mdl.Mdl;

%% Read data and predict gesture
for i=1:1:5000
    flex_pos1 = readVoltage(arduinoObj,'A1');
    accelReadings = readAcceleration(imuObj);

    label = predict(Mdl, [flex_pos1 accelReadings]);

    if( label == 1 ) %left to riht fing
        motorPosition = 0; % define the motor position
    elseif( label == 6 ) %still
        motorPosition = 0; % define the motor position
    elseif( label == 9 )%closed
        motorPosition = 180; % define the motor position
    elseif( label == 10 )%lr
        motorPosition = 0; % define the motor position
    elseif( label == 90 ) %closing
        motorPosition = 180; % define the motor position
    end

    disp(["sensor: ", flex_pos1, ", Accel: ", accelReadings,...
          " Class: ", label, " -- motor position: ", motorPosition])
    
    writePosition(servo1,motorPosition/180);
    pause(0.50);
end

%% release objects
release(imuObj);

clear arduinoObj;
clear imuObj
