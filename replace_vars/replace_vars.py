def inplace_change(filename, old_string, new_string):
        s=open(filename).read()
        if old_string in s:
            s=s.replace(old_string, new_string)
            f=open(filename, 'w')
            f.write(s)
            f.flush()
            f.close()

import os  
for fn in os.listdir('.'):
     if os.path.isfile(fn):
        inplace_change(fn, "hamburger","cheesecake")