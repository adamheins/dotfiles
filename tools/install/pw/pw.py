#!/usr/bin/env python

from __future__ import print_function

import argparse
import subprocess

import pyperclip


def generate_password(length, include_symbols):
    ''' Generate the password using the `pwgen` tool. '''
    # We always want random passwords, so we give the -s flag by default. If we
    # want symbols as well, the -y flag is added.
    cmd = ['pwgen', '-s', length]
    if include_symbols:
        cmd.append('-y')
    return subprocess.check_output(cmd).strip()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('length', help='The length of the password to generate.')
    parser.add_argument('-s', '--symbols',
                        help='Include at least one symbolic character in the password.',
                        action='store_true')
    parser.add_argument('-c', '--copy',
                        help='Copy the generated password to the clipboard rather than stdout.',
                        action='store_true')
    args = parser.parse_args()

    password = generate_password(args.length, args.symbols)

    if args.copy:
        pyperclip.copy(password)
    else:
        print(password)

if __name__ == '__main__':
    main()

