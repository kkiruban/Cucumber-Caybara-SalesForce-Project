def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

puts fibonacci(6)

x = [1, 2, 3, 4, 5]

for i in x do
  puts i
end

puts "Done!"