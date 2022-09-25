#!/bin/sh

# run python scripts repeatedly to make output file containg all the output texts.
# how to execute: sh 4SA_2022Sep24.sh

######################
# Setup block #######
#####################
outfile="./data/calculated_features/model1_rifle/result_test.txt"
if [ -e ${outfile} ]; then
rm ${outfile}
fi

pyfile="test.py"
yamlfile="./config/sample.yaml"
pthdir="./saved_model/checkpoint"

####################
# Main block #######
#####################
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



outfile1="./data/calculated_features/model1_rifle/result_test_chamfer_kldiv.txt"
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


outfile2="./data/calculated_features/model1_rifle/result_test_emd.txt"
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