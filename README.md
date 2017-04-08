# Benching Python CFFI with Rust

### Running

Download and build:

```
$ git clone git@github.com:mschmo/cffi-bench.git
$ cd cffi-bench
$ sh build.sh
```

Then run bench tests with:

```
$ sh run.sh
```

This will generate a CSV at /tmp/cffi_bench.csv with 5 million rows. Then run `time` on the three row count implementations, output the results of the tests, and then remove the CSV.

### Results

Results are based on the process of counting the number of records in a 5M record CSV file.


On 16GB 1600 MHz DDR3, 2.8 GHz Intel Core i7 MacBook Pro:

```
$ sh run.sh
Generating test file at /tmp/cffi_bench.csv ...
5M record CSV created at /tmp/cffi_bench.csv

Pure rust implementation:

Records counted: 5000000

real	0m0.613s
user	0m0.577s
sys	0m0.032s


Python pandas implementation:

Records counted: 5000000

real	0m2.669s
user	0m2.177s
sys	0m0.469s


Python CFFI with rust implementation:

Records counted: 5000000

real	0m0.741s
user	0m0.689s
sys	0m0.049s


Cleaning up...
Complete

```

| Implementation | Time |
| --- | --- |
| Pure rust | 0.613s |
| Python2 CFFI with rust | 0.741s |
| Python2 pandas  | 2.669s |

### Todo

1. Do more than just count. Test processing like formatting rows, etc.
2. Output results
3. Expand beyond CSV
