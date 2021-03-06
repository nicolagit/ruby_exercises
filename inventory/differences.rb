def input_check
  unless ARGV.length == 2
    puts "Usage: differences.rb old-inventory new-inventory"
    exit
  end
end

def boring_word_detected?(line)
  line.split('/').include?('temp') or
    line.split('/').include?('recycler')
end

def load_file(input_file)
  inventory = File.open(input_file)
  downcased_chomped_row = inventory.collect do | files_row |
    files_row.chomp.downcase
  end
  downcased_chomped_row.reject do | files_row |
    boring_word_detected?(files_row)
  end
end

def compare_inventory_files(old_file, new_file)
  old_inventory = load_file(old_file)
  new_inventory = load_file(new_file)

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
end

if $0 == __FILE__
  input_check
  compare_inventory_files(ARGV[0], ARGV[0])
end

