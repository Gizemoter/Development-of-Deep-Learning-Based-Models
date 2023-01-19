clear,clc, close all
datapatclear,clc, close all
datapath='Data';%Veri seti yüklendi
imds=imageDatastore(datapath, ...  
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
All_samples=countEachLabel(imds)
net =squeezenet(); %Kullanacağımız ağ mimarisi
net.Layers(1)%İlk katmanın girdi boyutlarını verir
net.Layers(end)%Son katmanın girdi boyutlarını verir 
numel(net.Layers(end).ClassNames) %Çıkış katmanında bulunan toplam sınıf sayısı
[testSet,trainingSet] = splitEachLabel(imds, 0.2, 'randomize');%Veri seti %20 test %80 eğitim olarak ayrıldı
imageSize = net.Layers(1).InputSize;
augmentedTrainingSet = augmentedImageDatastore(imageSize, trainingSet, 'ColorPreprocessing', 'gray2rgb');
%Yeniden boyutlandırmak için eğitim ve test kümesinden
%augmentedImageDatastore oluşturuldu
augmentedTestSet = augmentedImageDatastore(imageSize, testSet, 'ColorPreprocessing', 'gray2rgb');
featureLayer = 'pool10'; 
% " SqueezeNet'in sondan 3. olan "pool10" katmanı kullanılarak öznitelik çıkarımı yapıldı
testFeatures = activations(net, augmentedTestSet, featureLayer, ...
    'MiniBatchSize', 16, 'OutputAs', 'columns');% CNN  kullanarak test özniteliklerini çıkartıldı
testLabels = testSet.Labels; % Sınıf etiketleri alındı.
tore(datapath, ...  
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
All_samples=countEachLabel(imds)
net =squeezenet(); %Kullanacağımız ağ mimarisi
net.Layers(1)%İlk katmanın girdi boyutlarını verir
net.Layers(end)%Son katmanın girdi boyutlarını verir 
numel(net.Layers(end).ClassNames) %Çıkış katmanında bulunan toplam sınıf sayısı
[testSet,trainingSet] = splitEachLabel(imds, 0.2, 'randomize');%Veri seti %20 test %80 eğitim olarak ayrıldı
imageSize = net.Layers(1).InputSize;
augmentedTrainingSet = augmentedImageDatastore(imageSize, trainingSet, 'ColorPreprocessing', 'gray2rgb');
%Yeniden boyutlandırmak için eğitim ve test kümesinden
%augmentedImageDatastore oluşturuldu
augmentedTestSet = augmentedImageDatastore(imageSize, testSet, 'ColorPreprocessing', 'gray2rgb');
featureLayer = 'pool10'; 
% " SqueezeNet'in sondan 3. olan "pool10" katmanı kullanılarak öznitelik çıkarımı yapıldı
testFeatures = activations(net, augmentedTestSet, featureLayer, ...
    'MiniBatchSize', 16, 'OutputAs', 'columns');% CNN  kullanarak test özniteliklerini çıkartıldı
testLabels = testSet.Labels; % Sınıf etiketleri alındı.
