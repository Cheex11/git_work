from lib import confidential
from lib import confidential_tuples
import os

def inplace_change(filename, old_string, new_string):
    s=open(filename).read()
    if old_string in s:
        s=s.replace(old_string, new_string)
        f=open(filename, 'w')
        f.write(s)
        f.flush()
        f.close()

source = 'C:/Users/Cody/Documents/git_work/q2'

for subdir, dirs, files in os.walk(source):
    for f in files:
        for i, (k, v) in enumerate(confidential_tuples.tups):
            inplace_change(os.path.join(subdir, f), k,v)
    
