clear,clc, close all
datapath='C:\Users\gizem\Desktop\Seminer Covid-19\Dataset_8';
%SqueezeNet ile çıkarılan özniteliklerin kaydedildiği yerin dosya yolu
feature_extractor='squeezenet.mat';
load(feature_extractor, 'trainingFeatures')
load(feature_extractor, 'trainingLabels')
load(feature_extractor, 'testFeatures')
load(feature_extractor, 'testLabels')
%Gerekli parametrelerin yüklenmesi
traindata = trainingFeatures';
testdata  = testFeatures';
%trainingFeatures ve testFeaturesların transpozesi alındı.
y_train = trainingLabels;
y_test = testLabels;
ncaMdl = fscnca(traindata,y_train,'FitMethod','exact','Verbose',1, ...
'Solver','lbfgs','IterationLimit',100);
tol = 0.02;% Eşik değeri belirlendi
subset = find(ncaMdl.FeatureWeights > tol*max(1,ncaMdl.FeatureWeights));
%Öznitelik ağırlıkları ve eşik değeri kullanılarak NCA ile öznitelik seçilmesi
trainingFeatures = traindata(:,subset);
testFeatures = testdata(:,subset);
