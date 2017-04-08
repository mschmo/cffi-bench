extern crate csv;


fn main() {
    let path = ::std::env::args().nth(1).unwrap();
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
