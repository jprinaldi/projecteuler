use reikna::continued_fraction::square_root;
use reikna::factor::perfect_square;
use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    let upper_bound = &args[1].parse::<u64>().unwrap();
    let mut total = 0;

    for n in 1..=*upper_bound {
        if !perfect_square(n) {
            if square_root(n).len() % 2 == 0 {
                total += 1;
            }
        }
    }

    println!("{}", total);
}
