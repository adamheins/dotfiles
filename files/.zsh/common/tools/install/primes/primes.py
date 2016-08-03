#!/usr/bin/env python

from __future__ import print_function

import math
import sys

args = sys.argv[1:]

# Argument parsing.
if len(args) == 1 and not (args[0] == '-h' or args[0] == '--help'):
    lower_bound = 2
    upper_bound = int(args[0])
elif len(args) == 2:
    upper_bound = int(args[1])
    if args[0] == '--':
        lower_bound = upper_bound
    else:
        lower_bound = int(args[0])
else:
    print('Usage: primes [lower] upper\n')
    print('Bounds are inclusive. If `--` is passed for the lower bound, only ')
    print('the upper bounding number is checked for primality.')
    exit()

# Error checking.
if lower_bound <= 1 or upper_bound <= 1:
    print('error: bounds must be integers greater than 1.')
    exit(1)

if upper_bound < lower_bound:
    print('error: upper bound must not be less than the lower bound.')
    exit(1)

lower_bound = max(2, lower_bound)
upper_bound = max(2, upper_bound)

nums = [0 for _ in xrange(upper_bound + 1)]

for i in xrange(2, int(math.ceil(math.sqrt(upper_bound + 1)))):
    if nums[i] == 0:
        for j in xrange(i * i, upper_bound + 1, i):
            nums[j] = i

found_primes = False
for i in xrange(lower_bound, upper_bound + 1):
    if nums[i] == 0:
        found_primes = True
        print(i)

# Print out the lowest divisor if we're looking at a single number and its not
# prime.
if lower_bound == upper_bound and not found_primes:
    print('/{}'.format(nums[lower_bound]))

# If no primes are found, exit with an error.
if not found_primes:
    exit(1)
