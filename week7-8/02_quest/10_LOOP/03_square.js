function square(numbers) {
  let square_numbers = [];
  if (Array.isArray(numbers) === false) {
    console.log(numbers + ": Invalid input");
    return;
  }
  
  for (let i = 0; i < numbers.length; i++) {
    square_numbers.push(numbers[i] * numbers[i]);
  }
  console.log(square_numbers);
}

square([1, 2, 3, 4, 5])
square(1)
square("hoge")
