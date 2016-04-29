from lib import confidential
import os

def inplace_change(filename, old_string, new_string):
    s=open(filename).read()
    if old_string in s:
        s=s.replace(old_string, new_string)
        f=open(filename, 'w')
        f.write(s)
        f.flush()
        f.close()

#for k, v in confidential.replacements.items():
    #print(k, v)

for fn in os.listdir('C:/Users/Cody/Documents/git_work/q2'):
    if os.path.isfile(fn):
        for k, v in confidential.replacements.items():
            inplace_change(fn, k,v)
            print('changed!')    

source = 'C:/Users/Cody/Documents/git_work/q2'

for subdir, dirs, files in os.walk(source):
    for f in files:
       for k, v in confidential.replacements.items():
            inplace_change(os.path.join(source, f), k,v)