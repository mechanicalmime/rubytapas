ShoppingList = Struct.new(:name, :items)

MASTER_LIST = ShoppingList.new('Master List', ['Bread', 'Milk', 'Beer'])

MASTER_LIST.freeze

cloned_today_list = MASTER_LIST.clone
#clone_today_list.name = "Another Name...RuntimeError, a cloned object also clones its frozen state."
#cloned_today_list.items is not fronzen

#Difference between dup and clone in Ruby
dup_today_list = MASTER_LIST.clone
dup_today_list.frozen? #false
cloned_today_list.frozen? #true

#When in doubt use dup

