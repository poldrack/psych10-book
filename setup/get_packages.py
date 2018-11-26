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
packages.append('bookdown')
packages.remove('fiftystater')
print('writing to package_installs.R')
with open('dockerfile_includes','w') as f:
    for p in packages:
       f.write('"%s", \\\n'%p) 
with open('package_installs.R','w') as f:
    for p in packages:
        f.write('if (!require("%s")) install.packages("%s",repos="https://cran.rstudio.com",dependencies=TRUE)\n'%(p,p))
    f.write('install.packages("https://cran.r-project.org/src/contrib/Archive/fiftystater/fiftystater_1.0.1.tar.gz",repos=NULL,dependencies=TRUE)\n')
