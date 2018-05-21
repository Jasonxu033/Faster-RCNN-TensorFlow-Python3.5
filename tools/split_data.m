%%  
%�ô�����������ɵ�xml������VOC2007���ݼ��е�trainval.txt;train.txt;test.txt��val.txt  
%trainvalռ�����ݼ���70%��testռ�����ݼ���30%��trainռtrainval��90%��valռtrainval��10%��  
%������ռ�ٷֱȿɸ����Լ������ݼ��޸ģ�������ݼ��Ƚ��٣�test��val����һЩ  
%%  
%ע���޸������ĸ�ֵ  
xmlfilepath='D:\7-xpj\github\Faster-RCNN-TensorFlow-Python3.5-master\data\VOCdevkit2007\VOC2007\Annotations\';  
txtsavepath='D:\7-xpj\github\Faster-RCNN-TensorFlow-Python3.5-master\data\VOCdevkit2007\VOC2007\ImageSets\Main\';  
trainval_percent=0.90;%trainvalռ�������ݼ��İٷֱȣ�ʣ�²��־���test��ռ�ٷֱ�  
train_percent=1.00;%trainռtrainval�İٷֱȣ�ʣ�²��־���val��ռ�ٷֱ�  
  
  
%%  
xmlfile=dir(xmlfilepath);  
numOfxml=length(xmlfile)-2;%��ȥ.��..  �ܵ����ݼ���С  
  
  
trainval=sort(randperm(numOfxml,floor(numOfxml*trainval_percent)));  
test=sort(setdiff(1:numOfxml,trainval));  
  
  
trainvalsize=length(trainval);%trainval�Ĵ�С  
train=sort(trainval(randperm(trainvalsize,floor(trainvalsize*train_percent))));  
val=sort(setdiff(trainval,train));  
  
  
ftrainval=fopen([txtsavepath 'trainval.txt'],'w');  
ftest=fopen([txtsavepath 'test.txt'],'w');  
ftrain=fopen([txtsavepath 'train.txt'],'w');  
fval=fopen([txtsavepath 'val.txt'],'w');  
  
  
for i=1:numOfxml  
    if ismember(i,trainval)  
        fprintf(ftrainval,'%s\n',xmlfile(i+2).name(1:end-4));  
        if ismember(i,train)  
            fprintf(ftrain,'%s\n',xmlfile(i+2).name(1:end-4));  
        else  
            fprintf(fval,'%s\n',xmlfile(i+2).name(1:end-4));  
        end  
    else  
        fprintf(ftest,'%s\n',xmlfile(i+2).name(1:end-4));  
    end  
end  
fclose(ftrainval);  
fclose(ftrain);  
fclose(fval);  
fclose(ftest);  

