#!/usr/bin/env python

from __future__ import print_function

import subprocess
import sys

MIN_WINDOW_INDEX = 1

def get_tmux_windows():
    ''' Get a list of the current tmux windows. '''
    out = subprocess.check_output(['tmux', 'list-windows'])
    return out.strip().split('\n')

def is_current_window(window):
    ''' Returns True if the window is the current tmux window. '''
    return window.split(' ')[1][-1] == '*'

def lower_all_windows(windows):
    ''' Lower all tmux windows so all window indexes are minimized. '''
    expected_count = MIN_WINDOW_INDEX
    for window in windows:
        num = int(window.split(':')[0])
        if num > expected_count:
            subprocess.call(['tmux', 'move-window', '-s', str(num), '-t',
                             str(expected_count)])
        if is_current_window(window):
            current_window = expected_count
        expected_count += 1
    subprocess.call(['tmux', 'select-window', '-t', str(current_window)])

def lower_current_window(windows):
    ''' Lower the current tmux window to the lowest available index. '''
    expected_count = MIN_WINDOW_INDEX
    dest_index = -1
    for window in windows:
        num = int(window.split(':')[0])
        if num > expected_count:
            dest_index = expected_count
            break
        if is_current_window(window):
            break
        expected_count += 1
    if dest_index > -1:
        subprocess.call(['tmux', 'move-window', '-t', str(dest_index)])

def main():
    windows = get_tmux_windows()

    if len(sys.argv) > 1 and sys.argv[1] == '--all':
        lower_all_windows(windows)
    else:
        lower_current_window(windows)

if __name__ == '__main__':
    main()
