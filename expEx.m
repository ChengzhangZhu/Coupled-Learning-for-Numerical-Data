% x = [5.5 4.2 1.4 0.2;5.0 3.4 1.5 0.2; 6.1 2.9 4.7 1.4; 6.2 2.2 4.5 1.5; 6.3 2.7 4.9 1.8; 6.0 2.2 5.0 1.5];
load('spambase.mat')
x = data(:,2:end);
y = data(:,1);
x = mapminmax(x')';
x = CR(x,2);
% 
data = [y x];
for i = 1 : 20
    Trn = data(index(i,:)>size(data,1)/3,:);
    Tst = data(index(i,:)<=size(data,1)/3,:);
[~,~,TrnACC(i), TstACC(i)] = elm_kernel(Trn, Tst, 1, 1, 'RBF_kernel', 1);
end
TrnACCMean = mean(TrnACC)
TstACCMean = mean(TstACC)
