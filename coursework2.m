rng('default')  % For reproducibility
X = gen_kmeansdata(10748078);
C = cov(X);
[R,s1] = corrcov(C);
opts=statset('Display','final');

for i=[3 4 5]
[idx,C]= kmeans(X,i,'Distance','cityblock','Replicates',5,'Disp','iter', ...
'Options',opts);
[silh,h] = silhouette(X,idx,'Euclidean');
figure;
xlabel('Silhouette Value')
ylabel('Cluster')
end

[idx,C] = kmeans(X,3);
mean_silh=mean(silh);
gscatter(X(:,1),X(:,2),idx,'bgr')
hold on
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3)
legend('Cluster 1','Cluster 2','Cluster 3','Centroids','Location','NW')
hold off;
for i=1:size(C, 1)
display(['Centroid ', num2str(i), ': X1 = ', num2str(C(i, 1)), '; X2 = ', ...
num2str(C(i, 2))]);
end