def greeting
  puts 'Print name:'
  name = gets.chomp
  puts 'Print surname:'
  surname = gets.chomp
  puts 'Print age:'
  age = gets.to_i
  if age<=0
    puts "Ошибка в возрасте"
    return 'error'  
  end
  if age < 18
    puts "Привет, #{name} #{surname}. Тебе меньше 18, но научиться программировать никогда не поздно!"
    "Привет, #{name} #{surname}. Тебе меньше 18, но научиться программировать никогда не поздно!"
  else 
    puts "Привет, #{name} #{surname}. Самое время заняться делом!"
    "Привет, #{name} #{surname}. Самое время заняться делом!"
  end
end

def foobar
  puts "Hello! Please, print first number:"
  firstNum = gets.to_i
  puts "Please, print second number:"
  secondNum = gets.to_i
  if (firstNum == 20) or (secondNum == 20)
    puts "Well, the answer is #{secondNum}"
    "#{secondNum}"
  else
    summ = firstNum + secondNum
    puts "Great! None of the numbers are equal 20, so answer is sum: #{summ}"
    "#{summ}"
  end
end

greeting
foobar