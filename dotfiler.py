#!/usr/bin/env python3

# Needed to print() errors if using Python 2.
from __future__ import print_function

import json
import os
import platform
import shutil
import subprocess
import sys

from datetime import datetime


class Version(object):
    ''' Represents a major.minor version. '''
    def __init__(self, major, minor):
        self.major = major
        self.minor = minor

    def __lt__(self, other):
        return (self.major < other.major
            or (self.major == other.major and self.minor < other.minor))

    def __str__(self):
        return '{}.{}'.format(self.major, self.minor)


MIN_PYTHON_VERSION = Version(3, 4)

BACKUPS_DIR_PATH = os.path.realpath('./backups')
FILES_DIR_PATH = os.path.realpath('./files')
CONFIG_DIR_PATH = os.path.realpath('./config')
TOOLS_DIR_PATH = os.path.realpath('./tools')

LINKS_FILE_NAME = 'links.json'
DEPS_FILE_NAME = 'dependencies.json'
NEXT_STEPS_FILE_NAME = 'next.json'

LINKS_FILE_PATH = os.path.join(CONFIG_DIR_PATH, LINKS_FILE_NAME)
DEPS_FILE_PATH = os.path.join(CONFIG_DIR_PATH, DEPS_FILE_NAME)
NEXT_STEPS_FILE_PATH = os.path.join(CONFIG_DIR_PATH, NEXT_STEPS_FILE_NAME)

class Backup(object):
    ''' A backup of files being replaced by running the dotfiler. '''
    def __init__(self):
        timestamp = datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
        self.name = '-'.join(['backup', timestamp])
        self.path = os.path.join(BACKUPS_DIR_PATH, self.name)

    def touch(self):
        ''' Create the backup directory. '''
        if not os.path.isdir(BACKUPS_DIR_PATH):
            os.mkdir(BACKUPS_DIR_PATH)
        os.mkdir(self.path)

    def move_to(self, path):
        ''' Move a file into this backup. '''
        shutil.move(path, self.path)

    def empty(self):
        ''' Check if there are any files in the backup. '''
        return len(os.listdir(self.path)) == 0

    def remove(self):
        ''' Delete the backup. '''
        shutil.rmtree(self.path)

def missing_dependencies(deps, system):
    ''' Generate a list of missing dependencies required for dotfile set up. '''
    missing_deps = []

    # System-independent dependencies.
    if 'all' in deps.keys():
        for dep in deps['all']:
            if not shutil.which(dep):
                missing_deps.append(dep)

    # System-dependent dependencies.
    if system in deps.keys():
        for dep in deps[system]:
            if not shutil.which(dep):
                missing_deps.append(dep)

    return missing_deps


def make_link(src, dest, backup=None, verbose=False):
    msg = 'Symlinking {} to {}.'.format(src, dest)

    src = os.path.join(FILES_DIR_PATH, src)
    dest = os.path.expanduser(dest)

    # Create necessary directory structure before creating the symlink.
    pardir = os.path.dirname(dest)
    if not os.path.isdir(pardir):
         os.makedirs(pardir)

    # If a file already exists at the destination, back it up if a backup
    # is provided. Otherwise, just remove it.
    if os.path.isfile(dest) or os.path.isdir(dest):
        # Don't bother backing up symlinks.
        if backup and not os.path.islink(dest):
            msg += ' Backed up to {}.'.format(backup.name)
            backup.move_to(dest)
        else:
            os.remove(dest)
    os.symlink(src, dest)

    if verbose:
        print(msg)


def make_links(items, backup=None, verbose=False):
    ''' Make required symlinks to the dotfiles. '''
    for src, dests in items.items():
        if type(dests) == list:
            for dest in dests:
                make_link(src, dest, backup, verbose)
        else:
            make_link(src, dests, backup, verbose)


def run_next_step(path):
    ''' Run a script specified by the next steps file. '''
    print('Running {}...'.format(path), end='')
    path = os.path.join(TOOLS_DIR_PATH, path)
    subprocess.call([path])
    print(' done.')


def main():
    # Check Python version is compatible.
    version = Version(sys.version_info.major, sys.version_info.minor)
    if version < MIN_PYTHON_VERSION:
        print('Your Python version, {}, is less than the required version, {}.'
                .format(version, MIN_PYTHON_VERSION))
        return 1

    system = platform.system().lower()

    # Check dependencies.
    if os.path.isfile(DEPS_FILE_PATH):
        with open(DEPS_FILE_PATH, 'r') as f:
            deps = json.load(f)
        missing_deps = missing_dependencies(deps, system)
        if len(missing_deps) > 0:
            print('Error: The following dependencies are missing:')
            for dep in missing_deps:
                print(dep)
            return 1

    # Make symlinks.
    if os.path.isfile(LINKS_FILE_PATH):
        with open(LINKS_FILE_PATH, 'r') as f:
             links = json.load(f)

        # Create a backup directory.
        backup = Backup()
        backup.touch()

        # System-independent symlinks.
        if 'all' in links.keys():
            make_links(links['all'], backup=backup, verbose=True)

        # System-dependent symlinks.
        if system in links.keys():
            make_links(links[system], backup=backup, verbose=True)

        # Remove backup if it is empty to avoid polluting the backups directory.
        if backup.empty():
            print('\nNothing backed up.')
            backup.remove()
    else:
        print('No {} file not found.'.format(LINKS_FILE_NAME))

    # Run additional configuration.
    if os.path.isfile(NEXT_STEPS_FILE_PATH):
        print('')
        with open(NEXT_STEPS_FILE_PATH, 'r') as f:
            next_steps = json.load(f)
        if 'all' in next_steps.keys():
            for step in next_steps['all']:
                run_next_step(step)
        if system in next_steps.keys():
            for step in next_steps[system]:
                run_next_step(step)


if __name__ == '__main__':
    main()
