class String
    def numeric?
      Float(self) != nil rescue false
    end
end

def sample
  puts 'Print word:'
  word = gets.chomp
  puts 'Print number:'
  number = gets.chomp
  if !number.numeric?
    puts 'Ошибка при вводе числа'
    return 'error'
  end
  number = gets.to_i
  if word[-2,2] == 'cs'
    res = 2**number
    puts res
  else
    res = word.reverse
    puts res
  end
  res
end

def addPokemonToArray
  print "Введите количество покемонов, которых хотите добавить: "
  poke_amount = gets
  if !poke_amount.numeric?
    puts "Ошибка при вводе числа"
    "error"
  else
    poke_amount = poke_amount.to_i 
    res = get_pokemons(poke_amount)
    put_pokemons(res)
    res
  end
end

def get_pokemons(count)
  res = []
  for i in (1..count)
    puts "Введите название покемона"
    name = gets.chomp
    puts "Введите цвет покемона"
    color = gets.chomp
    res.push({name: name, color: color})
  end
  res
end

def put_pokemons(poke_arr)
  puts "Pokemons in array"
  poke_arr.each do |pokemon|
    puts "name: #{pokemon[:name]}, color: #{pokemon[:color]}"
  end
end

#sample
#addPokemonToArray