"""
get a list of package installation commands
for all of the R/Rmd files in the repo
"""

import os,glob


files=glob.glob('../*.Rmd') 
packages=[]
for file in files:
    with open(file) as f:
        lines=[i.strip().split('(')[1].replace(')','') for i in f.readlines() if i.find('library')==0 or i.find('require')==0]
    packages=packages+lines
packages=list(set(packages))
print('writing to package_installs.R')
with open('package_installs.R','w') as f:
    for p in packages:
        f.write('install.packages("%s",dependencies=TRUE)\n'%p)
