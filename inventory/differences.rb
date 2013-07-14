old_inventory = File.open('old-inventory.txt').readlines
new_inventory = File.open('new-inventory.txt').readlines

puts "The following files have been added:"
puts new_inventory - old_inventory

puts ""

puts "The following files have been deleted:"
puts old_inventory - new_inventory 

puts ""

added_files = (new_inventory - old_inventory)
puts added_files.length
puts "new files have been added to the new inventory"

removed_files = (old_inventory - new_inventory)
puts removed_files.length
puts "old files have been removed from the old inventory"

puts ""

puts new_inventory.length - added_files.length 
puts "files were not changed"
