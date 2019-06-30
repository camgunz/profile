#!/usr/bin/env python

import sys

def main():
    total = 0
    for file_name in sys.argv[1:]:
        with open(file_name, 'r') as fobj:
            line_count = len([ln for ln in fobj.readlines() if ln.strip()])
            print('%s: %s' % (file_name, line_count))
            total += line_count
    print('------------------------------')
    print(f'Total: {total}')

main()
