for i = 1:6
    cr = CR(data,i);
    d46(i) = pdist2(cr(4,:),cr(3,:));
    d56(i) = pdist2(cr(4,:),cr(6,:));
end
x = [1:6];
plot(x,d46,'-r');
hold on 
plot(x,d56,'-b');