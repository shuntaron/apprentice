def calculate(num1, num2, operator)
  # 四則演算子(+, -, *, /)ではない場合
  unless %w(+ - * /).include?(operator)
    raise RuntimeError
  end
  
  # num1、 num2が整数ではない場合
  if num1.to_i != num1 || num2.to_i != num2
    raise ArgumentError
  end
  
  case operator
  when '+'
    (num1 + num2).to_i
  when '-'
    (num1 - num2).to_i
  when '*'
    (num1 * num2).to_i
  when '/'
    raise ZeroDivisionError if num2 == 0
    (num1 / num2).to_i
  end
  
end

puts "1番目の整数を入力してください:"
num1 = gets.chomp.to_f

puts "2番目の整数を入力してください:"
num2 = gets.chomp.to_f

puts "演算子(+, -, *, /)を入力してください:"
operator = gets.chomp

begin
  result = calculate(num1, num2, operator)
  puts result
rescue ZeroDivisionError
  puts "ゼロによる割り算は許可されていません"
rescue ArgumentError
  puts "num1、 num2 には整数を入力してください"
rescue RuntimeError
  puts "演算子には  +、-、*、/ のいずれかを使用してください"
end
