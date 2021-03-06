#---
# Excerpted from "Everyday Scripting in Ruby"
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/bmsft for more book information.
#---

unless ARGV.length == 2 
  puts "Usage: differences.rb old-inventory new-inventory"
  exit
end

def contains?(line, string)
  line.chomp.split('/').include?(string)
end

def boring?(line, boring_words)
  boring_words.any? do | boring_word |
    contains?(line, boring_word)
  end
end

def inventory_from(filename)
  inventory = File.open(filename)  
  downcased = inventory.collect do | line | 
    line.downcase  # (1)
  end 
  downcased.reject do | line |   
    boring?(line, ['temp', 'recycler'])
  end
end


old_inventory = inventory_from(ARGV[0])
new_inventory = inventory_from(ARGV[1])

puts "The following files have been added:"
puts new_inventory - old_inventory

puts ""
puts "The following files have been deleted:"
puts old_inventory - new_inventory
