require_relative 'client'
require_relative 'stock'
require_relative 'portfolio'
require_relative 'bank'

ez_bank = Bank.new
ez_bank.new_client("Gandalf", 1000000)
ez_bank.new_client("God", 20)
ez_bank.clients.each {|key, value| puts value.name}


#client_1 = Client.new("Gandalf", 1000000)
#client_2 = Client.new("God", 20)
