function coupledRepresent = CR(data, L)

%% power original data
coupledRepresent = zeros(size(data,1),L);
powerRepresent = zeros(size(data,1),size(data,2)*L);
for i = 1 : L
    for j = 1 : size(data,2)
        powerRepresent(:,L*(j-1)+i) = data(:,j).^i;
    end
end
for i = 1 : size(data,1)
    for j = 1 : size(data,2)
        coupledRepresent(i,L*(j-1)+1:L*j) = CV(powerRepresent,L,i,j);
    end
end
end

function coupledValue = CV(powerRepresent,L,k,j)
numOfFeature = size(powerRepresent,2)/L;
%% Intra-coupling
intraData = powerRepresent(:,L*(j-1)+1:L*j);
[intraCoupling,p] = corr(intraData); 
intraCoupling(p>0.05) = 0;

%% Inter-coupling
interData = powerRepresent;
interData(:,L*(j-1)+1:L*j) = [];
[interCoupling,p] = corr(intraData,interData);
interCoupling(p>0.05) = 0;

%% coupled representation for values
weight = ones(1,L);
for i = 1 : L
    weight(1,i) = 1/factorial(i);
end
coupledValue = (intraData(k,:).*weight)*intraCoupling' + (interData(k,:).*repmat(weight,1,(numOfFeature - 1)))*interCoupling';
end

