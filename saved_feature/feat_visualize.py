import numpy as np
import pandas as pd
import torch
import os
import glob
import matplotlib; matplotlib.use("Agg")
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.axes3d import Axes3D


from sklearn.manifold import TSNE
import yaml
from addict import Dict

fl_num = len(glob.glob('./saved_feature/feature/*'))
features = np.zeros((fl_num, 512))
names = np.zeros(fl_num)
cnt = 0
name = np.arange(7)

for j in name:
    files = glob.glob('./saved_feature/feature/class' + str(name[j]) + '*')
    print(len(files))
    for i, f in enumerate(files):
        features[cnt + i] = pd.read_csv(f)
    
    names[cnt:(cnt + len(files))] = np.full(len(files), j)
    cnt += len(files)

f = pd.DataFrame(features)
f.to_csv('./saved_feature/features_processed.csv',)
f = pd.DataFrame(names)
f.to_csv('./saved_feature/names_processed.csv',)

feat_reduced = TSNE(n_components=2).fit_transform(features)
plt.scatter(feat_reduced[:, 0], feat_reduced[:, 1], c=names)
plt.savefig(os.path.join('./saved_feature/', "feat_tsne.png"))
plt.close()

feat_reduced = TSNE(n_components=3).fit_transform(features)
fig3 = plt.figure(figsize=(10.0, 10.0))
ax = Axes3D(fig3)
ax.scatter(feat_reduced[:72, 0], feat_reduced[:72, 1], feat_reduced[:72, 2], marker='.', c='blue') 
ax.scatter(feat_reduced[72:(72+68), 0], feat_reduced[72:(72+68), 1], feat_reduced[72:(72+68), 2], marker='.', c='green') 
ax.scatter(feat_reduced[(72+68):(72+68+61), 0], feat_reduced[(72+68):(72+68+61), 1], feat_reduced[(72+68):(72+68+61), 2], marker='.', c='purple') 
ax.scatter(feat_reduced[(72+68+61):(72+68+61+25), 0], feat_reduced[(72+68+61):(72+68+61+25), 1], feat_reduced[(72+68+61):(72+68+61+25), 2], marker='.', c='gray') 
ax.scatter(feat_reduced[(72+68+61+25):(72+68+61+25+33), 0], feat_reduced[(72+68+61+25):(72+68+61+25+33), 1], feat_reduced[(72+68+61+25):(72+68+61+25+33), 2], marker='.', c='yellow') 
ax.scatter(feat_reduced[(72+68+61+25+33):(72+68+61+25+33+29), 0], feat_reduced[(72+68+61+25+33):(72+68+61+25+33+29), 1], feat_reduced[(72+68+61+25+33):(72+68+61+25+33+29), 2], marker='.', c='red') 
ax.scatter(feat_reduced[(72+68+61+25+33+29):, 0], feat_reduced[(72+68+61+25+33+29):, 1], feat_reduced[(72+68+61+25+33+29):, 2], marker='.', c='red') 
plt.savefig(os.path.join('./saved_feature/', "feat_tsne1.png"))
plt.close()



#fig = plt.figure(figsize=(10.0, 10.0))
#ax = Axes3D(fig)
#ax.scatter(X_reduced[:, 0], X_reduced[:, 1], X_reduced[:, 2], marker='.', c='blue') # cone
#plt.show()
