clear all;
%读取数据
[X,textdata]=xlsread('li8_15.xls');             %从Excel文件中读取数据
%返回一个逻辑向量，非缺失观测对应元素1,缺失观测对应元素0
row=~any(isnan(X),2);  
X=X(row,:);                           %删除缺失数据，提取非缺失数据
countryname=textdata(3:end,1);     %国家或地区名称，countryname为字符元胞数组
countryname=countryname(row);        %删除缺失数据所对应的国家或地区名称

%将剔除缺失数据后的数据进行标准化
>> X=zscore(X);                     %数据标准化，即减去均值，然后除以标准差
%选取初始凝聚点
>> startdat=X([8,26,41],:);            %选取第8，第26及第41个观测为初始凝聚点
idx=kmeans(X,3,'Start',startdat);               %设置初始凝聚点，进行K均值聚类
%绘制轮廓图
>> [S,h]=silhouette(X,idx);      %绘制轮廓图，并返回轮廓向量S及图形句柄值h

%查看聚类结果
>> countryname(idx==1)                  %查看第1类所包含的国家或地区

>> countryname(idx==2)           %查看第2类所包含的国家或地区

>> countryname(idx==3)                 %查看第3类所包含的国家或地区