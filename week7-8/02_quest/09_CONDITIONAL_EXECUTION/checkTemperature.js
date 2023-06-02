function checkTemperature(t) {
  if (t >= 30) {
    console.log("Hot");
  } else if (t >= 15 && t < 30) {
    console.log("Warm");
  } else {
    console.log("Cold");
  }
}

checkTemperature(30)
checkTemperature(15)
checkTemperature(14)
