class Account
	attr_accessor :cpf, :number, :balance
	
	def initialize(cpf, number, balance)
		@cpf = cpf
		@number = number
		@balance = balance
	end
end
