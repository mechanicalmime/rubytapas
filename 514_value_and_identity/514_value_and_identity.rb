class NewShoppingList
	attr_reader :name, :items

	def initialize(name, items)
		@name = name.freeze
		@items = items.freeze
	end

	def with_name(name)
		self.class.new(name, items)
	end

	def add_item(item)
		self.class.new(name, items + [item])
	end
end

#Template for a VALUE OBJECT in Ruby. 

#new_template_list = NewShoppingList.new('Template Name', ['Item1', 'Item2'])
#derived_list = new_template_list.with_name('Another Name').add_item('Item 3')
