#!/usr/bin/env bash

TEST_CSV=/tmp/cffi_bench.csv
PYTHON_EX=env/bin/python

echo "Generating test file at ${TEST_CSV} ...";
for i in $(seq 1 5000000); do
    echo 'This,"is a"," ",123,null,test,"!"';
done > ${TEST_CSV}

echo "5M record CSV created at ${TEST_CSV}\n"

echo "Pure rust implementation:\n"
time src/rust/pure/target/release/pure_rust_csv_parser ${TEST_CSV}
echo "\n"

echo "Python pandas implementation:\n"
time ${PYTHON_EX} src/python_pandas.py < ${TEST_CSV}
echo "\n"

echo "Python CFFI with rust implementation:\n"
time ${PYTHON_EX} src/python_cffi.py ${TEST_CSV}
echo "\n"

echo "Cleaning up..."
rm ${TEST_CSV}

echo "Complete";
