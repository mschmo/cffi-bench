#!/usr/bin/env python
import sys

import pandas as pd


df = pd.read_csv(sys.stdin, header=None)
print('Records counted: {}'.format(len(df.index)))
