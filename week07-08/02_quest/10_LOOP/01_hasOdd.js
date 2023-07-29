function hasOdd(numbers) {
  if (Array.isArray(numbers) === false) {
    console.log(numbers + ": Invalid input");
    return;
  }
  
  for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 !== 0) {
      console.log(numbers[i] + ": true");
    } else if (numbers[i] % 2 === 0) {
      console.log(numbers[i] + ": false");
    } else {
      console.log("Invalid input");
    }
  }
}

hasOdd([1, 2, 3, 4, 5])
hasOdd(1)
hasOdd("hoge")
