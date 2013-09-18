#---
# Excerpted from "Everyday Scripting in Ruby"
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/bmsft for more book information.
#---

def month_before(time)
  time = time - (28 * 24 * 60 * 60)
end

if $0 == __FILE__    #(1)
  subsystem_names = ['audit', 'fulfillment', 'persistence',    #(2)
                     'ui', 'util', 'inventory']
  start_date = month_before(Time.now)       #(3)

  puts header(start_date)                   #(4)
  subsystem_names.each do | name |
    puts subsystem_line(name, change_count_for(name)) #(5)  
  end
end
