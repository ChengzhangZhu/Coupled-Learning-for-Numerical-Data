function coupledRepresent = CRMINE(data)
%% calculate the correlationship between each feature-pair
corFeature = zeros(size(data,2),size(data,2));
for i  = 1 : size(data,2) - 1
    for j = i + 1 : size(data,2)
        mic = mine(data(:,i)',data(:,j)');
        corFeature(i,j) = mic.mic;
    end
end
corFeature = corFeature +corFeature' + eye(size(data,2));

coupledRepresent = data*corFeature;
end
