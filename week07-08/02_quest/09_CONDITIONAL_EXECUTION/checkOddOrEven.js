function checkOddOrEven(n) {
  if (n % 2 === 0) {
    console.log("Even");
  } else if (n % 2 === 1) {
    console.log("Odd");
  } else {
    console.log("Unable to check");
  }
}

checkOddOrEven(2)
checkOddOrEven(1)
checkOddOrEven(0)
checkOddOrEven("hoge")
checkOddOrEven(0.1)
