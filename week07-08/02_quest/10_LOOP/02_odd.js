function odd(numbers) {
  let odd_numbers = [];
  
  if (Array.isArray(numbers) === false) {
    console.log(numbers + ": Invalid input");
    return;
  }
  
  for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 !== 0) {
      odd_numbers.push(numbers[i]);
    }
  }
  console.log(odd_numbers);
}

odd([1, 2, 3, 4, 5])
odd(1)
odd("hoge")
