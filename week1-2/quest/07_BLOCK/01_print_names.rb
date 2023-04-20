def print_names(names)
  names.each_with_index do |name, i|
    puts "#{i+1}. #{name}"
  end
end

print_names(['上田', '田仲', '堀田'])
