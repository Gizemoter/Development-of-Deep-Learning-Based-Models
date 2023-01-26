%SVM
Mdl = fitcsvm(trainingFeatures, y_train);
%2'li sınıflandırmalarda "fitcsvm" çoklu sınıflarda "fitcecoc"
%kullanılmıştır
predicted = predict(Mdl, testFeatures);
[acc_svm,precision_svm,recall_svm,f1_svm]=calculatemetrics(y_test,predicted);
[kappa_svm]=kappa(y_test,predicted);

 %KNN
Mdl= fitcknn(trainingFeatures, y_train,'NumNeighbors',5);
predicted = predict(Mdl, testFeatures);
[acc_knn,precision_knn,recall_knn,f1_knn]=calculatemetrics(y_test,predicted);
[kappa_knn]=kappa(y_test,predicted);
 
%BAYES
Mdl= fitcnb(trainingFeatures, y_train)
predicted = predict(Mdl, testFeatures);
[acc_cnb,precision_cnb,recall_cnb,f1_cnb]=calculatemetrics(y_test,predicted);
[kappa_cnb]=kappa(y_test,predicted);

%bagging
rng('default'); % For reproducibility
Mdl = TreeBagger(50,trainingFeatures,y_train,'Method','classification','NumPredictorsToSample',75);
predicted = predict(Mdl, testFeatures);
predicted = str2double(predicted);
[acc_bagger,precision_bagger,recall_bagger,f1_bagger]=calculatemetrics(y_test,predicted);
[kappa_bagger]=kappa(y_test,predicted);

