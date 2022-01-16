use divisors::get_divisors;
use primal::is_prime;

fn main() {
    let upper_bound: u64 = (10 as u64).pow(8);
    let mut total: u64 = upper_bound * (upper_bound + 1) / 2;
    for n in 1..=upper_bound {
        if !is_prime(n + 1) {
            total -= n;
        } else {
            let ds = get_divisors(n);
            for d in ds {
                if !is_prime(d + n / d) {
                    total -= n;
                    break;
                }
            }
        }
    }
    println!("{}", total);
}
