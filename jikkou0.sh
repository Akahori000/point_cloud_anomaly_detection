python test.py ./config/sample.yaml --checkpoint_path ./data/calculated_features/model1_airplane/saved_model/checkpoint/299.pth --chamfer --histgram --save_points
python test.py ./config/sample.yaml --checkpoint_path ./data/calculated_features/model1_airplane/saved_model/checkpoint/299.pth --chamfer --kldiv --histgram --save_points
python test.py ./config/sample.yaml --checkpoint_path ./data/calculated_features/model1_airplane/saved_model/checkpoint/299.pth --emd --save_points
