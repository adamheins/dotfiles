#!/usr/bin/env python

from __future__ import print_function

import os
import shutil
import sys
import time

USER_HOME_DIR_PATH = os.path.expanduser('~')
TRASH_DIR_NAME = '.trash'
TRASH_DIR_PATH = os.path.join(USER_HOME_DIR_PATH, TRASH_DIR_NAME)

MAX_TRASH_COUNT = 5

USAGE_TEXT = '''
Usage: trash [-r] [file]
       trash [-ehlw]
'''.strip()

HELP_TEXT = '''
A safer alternative to rm. Doesn't allow removal of certain important
directories, and keeps a copy of removed files for a time after deleting them.

  trash [-r] [file]
  trash [-ehlw]

Arguments:
  file  The file or directory to remove.

Options:
  -e, --empty      Empty the directory containing old trash.
  -h, --help       Print this help message.
  -l, --list       List trash saved in the old trash directory.
  -r, --recursive  Must be specified to remove a directory.
  -w, --where      Print the location of trash that has not yet been removed.
'''.strip()

DEFAULT_PROTECTED_PATHS = [
    '/',
    '/bin',
    '/boot',
    '/dev',
    '/etc',
    '/home',
    '/initrd',
    '/lib',
    '/lib32',
    '/lib64',
    '/proc',
    '/root',
    '/sbin',
    '/sys',
    '/usr',
    '/usr/bin',
    '/usr/include',
    '/usr/lib',
    '/usr/local',
    '/usr/local/bin',
    '/usr/local/include',
    '/usr/local/sbin',
    '/usr/local/share',
    '/usr/sbin',
    '/usr/share',
    '/usr/src',
    '/var']

# Add paths you want to protect here.
EXTRA_PROTECTED_PATHS = []

PROTECTED_PATHS = DEFAULT_PROTECTED_PATHS + EXTRA_PROTECTED_PATHS


def expand_path(path):
    ''' Expand a relative path to an absolute path, expanding tildes. '''
    return os.path.realpath(os.path.expanduser(path))


def get_oldest_file(dir_path):
    ''' Get the oldest file in a directory. '''
    oldest_path, oldest_time = None, time.time()

    for f in os.listdir(TRASH_DIR_PATH):
        path = os.path.join(TRASH_DIR_PATH, f)
        ctime = os.path.getctime(path)
        if ctime < oldest_time:
            oldest_path, oldest_time = path, ctime

    return oldest_path


def clean_trash(num_new_trash):
    ''' Clean out the oldest trash. '''
    if num_new_trash == MAX_TRASH_COUNT:
        empty_trash()
    while len(os.listdir(TRASH_DIR_PATH)) > MAX_TRASH_COUNT - num_new_trash:
        oldest = get_oldest_file(TRASH_DIR_PATH)
        if os.path.isdir(oldest):
            shutil.rmtree(oldest)
        else:
            os.remove(oldest)


def empty_trash():
    ''' Empty the trash directory. '''
    for f in os.listdir(TRASH_DIR_PATH):
        path = os.path.join(TRASH_DIR_PATH, f)
        if os.path.isdir(path):
            shutil.rmtree(path)
        else:
            os.remove(path)


def add_trash(path):
    ''' Add new trash to the trash directory. '''
    current_trash = os.listdir(TRASH_DIR_PATH)
    basename = os.path.basename(path)
    suffix = 1
    name = basename

    # Resolve name conflicts in the trash by appending a numeric suffix to
    # trash with the same name.
    while name in current_trash:
        name = '{}.{}'.format(basename, suffix)
        suffix += 1

    shutil.move(path, os.path.join(TRASH_DIR_PATH, name))


def parse_args(args):
    ''' Parse arguments into positional and optional arguments. '''
    pos_args = []
    opt_args = []
    for arg in args:
        if arg[0] == '-':
            opt_args.append(arg)
        else:
             pos_args.append(arg)
    return pos_args, opt_args


def main(args):
    if len(args) == 0:
        print(USAGE_TEXT)
        return 1

    # Make the trash directory if it does not exist.
    if not os.path.isdir(TRASH_DIR_PATH):
        os.mkdir(TRASH_DIR_PATH)

    if args[0] in ['-l', '--list']:
        for trash in os.listdir(TRASH_DIR_PATH):
            print(trash)
    elif args[0] in ['-e', '--empty']:
        empty_trash()
    elif args[0] in ['-h', '--help']:
        print(HELP_TEXT)
    elif args[0] in ['-w', '--where']:
        print(TRASH_DIR_PATH)
    else:
        pos_args, opt_args = parse_args(args)

        # Don't remove more trash than can be backed up.
        if len(pos_args) > MAX_TRASH_COUNT:
            print('Kindly refusing to delete more items than get backed up in the trash.')
            return 1

        paths = [expand_path(arg) for arg in pos_args]
        recursive = '-r' in opt_args or '--recursive' in opt_args

        paths_to_remove = []
        for path in paths:
            remove_path = True

            # Don't remove protected paths.
            if path in PROTECTED_PATHS:
                print('Kindly refusing to remove \'{}\'. This path is protected.'.format(path))
                remove_path = False

            # Require the recursive flag to remove directories.
            if os.path.isdir(path) and not recursive:
                print('Path \'{}\' is a directory. Use the --recursive flag to remove.'.format(path))
                remove_path = False

            if remove_path:
                paths_to_remove.append(path)

        # Make room for the new trash.
        clean_trash(len(paths_to_remove))

        # Move new trash into trash directory.
        for path in paths_to_remove:
            add_trash(path)


if __name__ == '__main__':
    main(sys.argv[1:])
