# Benching Python CFFI with Rust

### Running

Download and build:

```
$ git clone <this_git_repo>
$ cd <git-repo-path>
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

real	0m0.773s
user	0m0.651s
sys	0m0.101s


Python pandas implementation:

Records counted: 5000000

real	0m3.088s
user	0m2.330s
sys	0m0.584s


Python CFFI with rust implementation:

Records counted: 5000000

real	0m0.737s
user	0m0.676s
sys	0m0.050s


Cleaning up...
Complete

```

| Implementation | Time |
| --- | --- |
| Pure rust | 0.629s |
| Python2 CFFI with rust | 0.752s |
| Python2 pandas  | 2.770s |

### Todo

1. Do more than just count. Test processing like formatting rows, etc.
2. Output results
3. Expand beyond CSV
