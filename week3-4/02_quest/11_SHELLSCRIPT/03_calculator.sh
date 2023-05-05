#!/bin/bash
echo "Enter two numbers:"
read number1
read number2

if [[ $number1 =~ ^[0-9]+$ ]] && [[ $number2 =~ ^[0-9]+$ ]]; then
  :
else
  echo "The number entered is invalid."
  exit
fi

echo "Choose an arithmetic operation (+, -, *, /):"
read operation

case "$operation" in
  "+" )
    result=$((number1 + number2))
    ;;
  "-" )
    result=$((number1 - number2))
    ;;
  "*" )
    result=$((number1 * number2))
    ;;
  "/" )
    if [[ $number2 -eq 0 ]]; then
      echo "division by zero is impossible."
      exit
    fi
    result=$((number1 / number2))
    ;;
  *)
    echo "operation is invalid."
    exit
    ;;
esac

echo "The result:$result"
