import confidential
import os  

def inplace_change(filename, old_string, new_string):
        s=open(filename).read()
        if old_string in s:
            s=s.replace(old_string, new_string)
            f=open(filename, 'w')
            f.write(s)
            f.flush()
            f.close()

for fn in os.listdir(path='.'):
     if os.path.isfile(fn):
        if fn != 'confidential.py':
            print(fn)
            #for k, v in confidential.replacements.items():
                #print(k, v)
                #inplace_change(fn, k,v)	