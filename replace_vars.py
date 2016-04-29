import replace_vars import confidential
import os  

for fn in os.listdir(path='.'):
     if os.path.isfile(fn):
        if fn != 'confidential.py':
            print(fn)
            #for k, v in confidential.replacements.items():
                #print(k, v)
                #inplace_change(fn, k,v)	