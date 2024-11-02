%% example of ANN for hand gesture recognition
close all
clear all
clc
%% Load and prepare data
numClasses = 5;
maxSamplesPerClass = 1000;
allData = zeros(0, numClasses);
sensorData = zeros(0, numClasses-1);
targetData = zeros(0, 1);

for i=1:1:numClasses
    temp = load(['glovemvt9',num2str(i),'.mat']);
    sensorData = cat(1, sensorData, temp.data(:,1:numClasses-1));
    targetData = cat(1, targetData, temp.data(:,end));
    allData = cat(1, allData, temp.data);
end

%% Create training and testing datasets
%rng("default") % For reproducibility of the partition
cvp = cvpartition(targetData,"Holdout",0.30);
XTrain = sensorData(training(cvp),:);
YTrain = targetData(training(cvp));
XTest = sensorData(test(cvp),:);
YTest = targetData(test(cvp));

%% define ANN architecture
% two hidden layers of 10 neurons each
Mdl = fitcnet(XTrain,YTrain, "LayerSizes", [10 10 5])%, "IterationLimit",10000)

%% Define error function and training history
testError = loss(Mdl,XTest,YTest,"LossFun","classiferror")

accuracy = 1 - testError

iteration = Mdl.TrainingHistory.Iteration;
trainLosses = Mdl.TrainingHistory.TrainingLoss;
valLosses = Mdl.TrainingHistory.ValidationLoss;

figure(1);
plot(iteration,trainLosses,iteration,valLosses)
legend(["Training"])
xlabel("Iteration")
ylabel("Loss")


%% Validate the trained model with the test dataset
label = predict(Mdl, XTest);

figure(2);
confusionchart(YTest,label)
%%

label = predict(Mdl,allData(4300,1:4))

%% save the model
save(['testfinal'], 'Mdl');
