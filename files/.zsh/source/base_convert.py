#!/usr/bin/env python

import sys

if __name__ == '__main__':
    cmd = sys.argv[1]
    nums = sys.argv[2:]
    res = []
    for num in nums:
        if cmd == 'dec':
            i = int(num)
        elif cmd == 'hex':
            i = int(num, 16)
        elif cmd == 'bin':
            i = int(num, 2)
        elif cmd == 'oct':
            i = int(num, 8)
        res.append('dec {0:d}\nbin {0:b}\nhex {0:x}\noct {0:o}'.format(i, i, i, i))
    print '\n\n'.join(res)
