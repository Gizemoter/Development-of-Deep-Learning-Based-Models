function kappa = cohensKappa(y, yhat)
    C = confusionmat(y, yhat); 
    n = sum(C(:)); 
    C = C./n; 
    r = sum(C,2); 
    s = sum(C); 
    expected = r*s; 
    po = sum(diag(C)); 
    pe = sum(diag(expected)); 
    kappa = (po-pe)/(1-pe); %Cohen kappa
end