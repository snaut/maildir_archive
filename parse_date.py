#!/usr/bin/python3

import email.utils
import sys

# read from stdin
# call email.utils.parsedate on each line
# format and print
for line in sys.stdin:
    my_date = email.utils.parsedate(line)
    if my_date is not None:
        sys.stdout.write(format(my_date[0], "04") + "." + format(my_date[1], "02") + "\n")
