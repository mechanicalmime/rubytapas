require 'forwardable'

class User
	extend Forwardable

	attr_reader :account

	def_delegators :account, :first_name, :last_name, :email
	#def_delegators :@account, :first_name, :last_name, :email
	#Makes the delegators private instance variables

	def initialize(account)
		@account = account
	end

	def full_name
		"#{first_name} #{last_name}"
	end
end

GithubAccount = Struct.new(:login, :first_name, :last_name, :email)
FacebookAccount = Struct.new(:uid, :first_name, :last_name, :email)

mime = User.new(GithubAccount.new('mechmime', 'Guillermo', 'Garza', 'mechanical.mime@gmail.com'))

puts mime.full_name

class Store
	extend Forwardable

	def_delegator '@owner.account', :email_address, :owner_email

	def initialize(owner)
		@owner = owner
	end
end

