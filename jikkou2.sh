# python test.py ./config/sample.yaml --checkpoint_path ./saved_model/checkpoint/100.pth --chamfer --histgram --save_points
# python test.py ./config/sample.yaml --checkpoint_path ./saved_model/checkpoint/150.pth --chamfer --histgram --save_points
# python test.py ./config/sample.yaml --checkpoint_path ./saved_model/checkpoint/200.pth --chamfer --histgram --save_points
# python test.py ./config/sample.yaml --checkpoint_path ./saved_model/checkpoint/250.pth --chamfer --histgram --save_points
# python test.py ./config/sample.yaml --checkpoint_path ./saved_model/checkpoint/299.pth --chamfer --histgram --save_points

#python test.py ./config/sample.yaml --checkpoint_path ./data/calculated_features/model1_sofa/saved_model/checkpoint/299.pth --chamfer --histgram --save_points
#python test.py ./config/sample.yaml --checkpoint_path ./data/calculated_features/model1_sofa/saved_model/checkpoint/299.pth --chamfer --kldiv --histgram --save_points
#python test.py ./config/sample.yaml --checkpoint_path ./data/calculated_features/model1_sofa/saved_model/checkpoint/299.pth --emd --save_points


# python test.py ./config/sample.yaml --checkpoint_path ./saved_model/checkpoint/100.pth --chamfer --histgram --save_points --feat_save both --test_way half
# python test.py ./config/sample.yaml --checkpoint_path ./saved_model/checkpoint/150.pth --chamfer --histgram --save_points --feat_save both --test_way half
# python test.py ./config/sample.yaml --checkpoint_path ./saved_model/checkpoint/200.pth --chamfer --histgram --save_points --feat_save both --test_way half
# python test.py ./config/sample.yaml --checkpoint_path ./saved_model/checkpoint/250.pth --chamfer --histgram --save_points --feat_save both --test_way half
# python test.py ./config/sample.yaml --checkpoint_path ./saved_model/checkpoint/299.pth --chamfer --histgram --save_points --feat_save both --test_way half

# python test.py ./config/sample.yaml --checkpoint_path ./saved_model/checkpoint/100.pth --chamfer --histgram --save_points --feat_save both --test_way all
# python test.py ./config/sample.yaml --checkpoint_path ./saved_model/checkpoint/150.pth --chamfer --histgram --save_points --feat_save both --test_way all
# python test.py ./config/sample.yaml --checkpoint_path ./saved_model/checkpoint/200.pth --chamfer --histgram --save_points --feat_save both --test_way all
# python test.py ./config/sample.yaml --checkpoint_path ./saved_model/checkpoint/250.pth --chamfer --histgram --save_points --feat_save both --test_way all
# python test.py ./config/sample.yaml --checkpoint_path ./saved_model/checkpoint/299.pth --chamfer --histgram --save_points --feat_save both --test_way all

# python test.py ./config/val.yaml --checkpoint_path ./saved_model/checkpoint/100.pth --chamfer --histgram --save_points --feat_save both --test_way half
# python test.py ./config/val.yaml --checkpoint_path ./saved_model/checkpoint/150.pth --chamfer --histgram --save_points --feat_save both --test_way half
# python test.py ./config/val.yaml --checkpoint_path ./saved_model/checkpoint/200.pth --chamfer --histgram --save_points --feat_save both --test_way half
# python test.py ./config/val.yaml --checkpoint_path ./saved_model/checkpoint/250.pth --chamfer --histgram --save_points --feat_save both --test_way half
# python test.py ./config/val.yaml --checkpoint_path ./saved_model/checkpoint/299.pth --chamfer --histgram --save_points --feat_save both --test_way half

# python test.py ./config/train.yaml --checkpoint_path ./saved_model/checkpoint/100.pth --chamfer --histgram --save_points --feat_save both --test_way all
# python test.py ./config/train.yaml --checkpoint_path ./saved_model/checkpoint/150.pth --chamfer --histgram --save_points --feat_save both --test_way all
# python test.py ./config/train.yaml --checkpoint_path ./saved_model/checkpoint/200.pth --chamfer --histgram --save_points --feat_save both --test_way all
# python test.py ./config/train.yaml --checkpoint_path ./saved_model/checkpoint/250.pth --chamfer --histgram --save_points --feat_save both --test_way all
# python test.py ./config/train.yaml --checkpoint_path ./saved_model/checkpoint/299.pth --chamfer --histgram --save_points --feat_save both --test_way all


#!/bin/sh

# run python scripts repeatedly to make output file containg all the output texts.
# how to execute: sh 4SA_2022Sep24.sh

######################
# Setup block #######
#####################

# 使うepoc
pyfile="test.py"
yamlfile="./config/sample.yaml"
#pthdir="./data/calculated_features_random/model1_lamp/saved_model/checkpoint"
pthdir="./saved_model/checkpoint"

####################
# Main block #######
#####################
# 出力ファイル1/3
outfile="./data/calculated_features_random/model1_lamp/test_result/result_test_chamfer.txt"
if [ -e ${outfile} ]; then
rm ${outfile}
fi

x=1
while [ $x -ne 300 ] #1-299
do
pthfile=${pthdir}"/"${x}".pth"
if [ -e ${pyfile} ]; then
# Execute python script
python ${pyfile} ${yamlfile} --checkpoint_path ${pthfile} --chamfer --histgram --save_points > tmp_out.txt
cat tmp_out.txt
# add results to output file
cat tmp_out.txt >> ${outfile}    
fi
echo "x=$x finish..."
x=`echo "${x}" | awk '{print $1+1}'`
#x=`expr $x + 1` # another increment method
done

echo "Finish all the procedure"



outfile1="./data/calculated_features_random/model1_lamp/test_result/result_test_chamfer_kldiv.txt"
if [ -e ${outfile1} ]; then
rm ${outfile1}
fi

x=1
while [ $x -ne 300 ] #1-299
do
pthfile=${pthdir}"/"${x}".pth"
if [ -e ${pyfile} ]; then
# Execute python script
python ${pyfile} ${yamlfile} --checkpoint_path ${pthfile} --chamfer --kldiv --histgram --save_points > tmp_out.txt
cat tmp_out.txt
# add results to output file
cat tmp_out.txt >> ${outfile1}    
fi
echo "x=$x finish..."
x=`echo "${x}" | awk '{print $1+1}'`
#x=`expr $x + 1` # another increment method
done

echo "Finish all the procedure"


outfile2="./data/calculated_features_random/model1_lamp/test_result/result_test_emd.txt"
if [ -e ${outfile2} ]; then
rm ${outfile2}
fi

x=1
while [ $x -ne 300 ] #1-299
do
pthfile=${pthdir}"/"${x}".pth"
if [ -e ${pyfile} ]; then
# Execute python script
python ${pyfile} ${yamlfile} --checkpoint_path ${pthfile} --emd --histgram --save_points > tmp_out.txt
cat tmp_out.txt
# add results to output file
cat tmp_out.txt >> ${outfile2}    
fi
echo "x=$x finish..."
x=`echo "${x}" | awk '{print $1+1}'`
#x=`expr $x + 1` # another increment method
done

echo "Finish all the procedure"