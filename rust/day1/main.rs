use std::fs;


fn main () {
  let input: Vec<i32> = fs::read_to_string("input.txt").expect("Unable to read file").split("\n").map(|x| x.parse::<i32>().unwrap()).collect();
  println!("{}", part1(&input));
  println!("{}", part2(&input));
}

fn part1 (input: &Vec<i32>) -> i32 {
  let mut acc = 0;
  for i in 1..input.len() {
    if input[i] > input[i - 1] {
      acc += 1;
    }
  }
  acc
}

fn part2 (input: &Vec<i32>) -> i32 {
  let mut acc = 0;
  for i in 3..input.len() {
    let last3 = input[i] + input[i - 1] + input[i - 2];
    let last4 = input[i - 1] + input[i -2] + input[i - 3];

    if last3 > last4 {
      acc += 1;
    }
  }
  acc
}