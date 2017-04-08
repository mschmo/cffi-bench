#!/usr/bin/env python
import os
import sys

from cffi import FFI


ffi = FFI()
ffi.cdef('''
    void count_records(char *);
''')

if sys.platform == 'darwin':
    prefix = 'lib'
    ext = 'dylib'
elif sys.platform == 'win32':
    prefix = ''
    ext = 'dll'
else:
    prefix = 'lib'
    ext = 'so'

dylib_file = 'rust/cffi/target/release/{}cffi_rust_csv_parser.{}'.format(
    prefix,
    ext
)
path = os.path.dirname(os.path.abspath(__file__))
CAPI = ffi.dlopen(os.path.join(path, dylib_file))

c_filename = ffi.new('char[]', sys.argv[1])
CAPI.count_records(c_filename)
