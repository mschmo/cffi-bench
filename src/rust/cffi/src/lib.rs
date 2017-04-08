extern crate csv;

use std::ffi::{CStr};
use std::os::raw::c_char;


#[no_mangle]
pub extern "C" fn count_records(filename: *const c_char) {
    let slice = unsafe { CStr::from_ptr(filename) };
    let path: &str = slice.to_str().unwrap();
    let mut rdr = csv::Reader::from_file(path).unwrap().has_headers(false);
    let mut count = 0;
    loop {
        match rdr.next_bytes() {
            csv::NextField::Data(_) => {},
            csv::NextField::EndOfRecord => count += 1,
            csv::NextField::EndOfCsv => break,
            csv::NextField::Error(err) => panic!("{}", err),
        }
    }
    println!("Records counted: {}", count);
}
