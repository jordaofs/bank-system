class Bank
	require_relative "account.rb"

	def initialize
		@list_of_accounts  = []
		@account = Account.new(05312532363, 11, 1000)
		@list_of_accounts << @account
		File.open("Account#{@account.number}.txt", "w") {
			|file| file.write("CPF: #{@account.cpf}, Number: #{@account.number}, Balance: #{@account.balance}")
		}

	end

	def list_accounts
		@list_of_accounts.each do |account|
			puts account.cpf, account.number, account.balance
		end

	end

	def add_account(cpf, number, balance)
		account = Account.new(cpf,number,balance)
		@list_of_accounts << account
			File.open("Account#{account.number}.txt", "w") {
			|file| file.write("CPF: #{account.cpf}, Number: #{account.number}, Balance: #{account.balance}")
		}
		puts "Account created!"
	end

	def remove_account_from_the_bank(number)
		@list_of_accounts.include? @account.number
			@list_of_accounts.delete_if{|account| account.number == number}
			puts "Account deleted"

	end

	def transfer_between_accounts(account1, account2, valuetotransfer)
		@list_of_accounts.map do |account|
			if account.number == account1
				account.balance -= valuetotransfer
				open("Account#{account1}.txt", "a") { |f|  f.puts " \n-#{valuetotransfer}, balance: #{account.balance}"}
			end
			if account.number == account2
				account.balance += valuetotransfer
				open("Account#{account2}.txt", "a") { |f|  f.puts " \n+#{valuetotransfer}, balance: #{account.balance}"}
			end
		end
		puts "Value transfered between the accounts!"
	end

	def show_balance_of_the_account(account_number)
		puts "The balance of the account is: #{@balance}"

	end

	def whithdraw_from_account(account,value)
		@list_of_accounts.map do |account|
			account.balance -= value
		puts "It was whitdrawed from the account #{value}. The current balance of the account is #{account.balance}."
	end

	def insert_into_account(account,value)
		@list_of_accounts.map do |account|
			account.balance += value
			puts "It was inserted on the account #{value}. The current balance of the account is #{account.balance}."
	end

end
