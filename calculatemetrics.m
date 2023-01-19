function [acc,overall_precision,overall_recall,f1_score] = calculatemetrics(actual,predicted)
 
cm = confusionmat(actual, predicted);
cmt = cm';
 
diagonal = diag(cmt);
sum_of_rows = sum(cmt, 2);
 
acc =  sum(diagonal)/sum(sum(cmt));%Doğruluk
precision = diagonal ./ sum_of_rows;%Kesinlik
overall_precision = mean(precision);
 
sum_of_columns = sum(cmt, 1);
 
recall = diagonal ./ sum_of_columns';
overall_recall = mean(recall);%Duyarlılık
 
f1_score = 2*((overall_precision*overall_recall)/(overall_precision+overall_recall));%F1 skor 
 
end



