
conda env create -f=emd_env.yml

conda activate emd_env

pip install addict==2.4.0 dataclasses==0.6 efficientnet-pytorch==0.7.0 future==0.18.2 torch==1.7.0 typing-extensions==3.7.4.3 wandb

cd libs/emd

python setup.py install

cd ../../


