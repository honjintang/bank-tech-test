require 'date'
require './lib/transaction.rb'
require './lib/statement.rb'

class Account
  attr_reader :balance, :statement
  MAX_DAILY_WITHDRAWAL = 500

  def initialize(statement)
    @balance = 0
    @statement = statement
  end

  def deposit(amount)
    self.balance += amount
    update_statement_credit(amount)
  end

  def withdraw(amount)
    fail "You cannot have a negative balance" if self.balance - amount < 0
    fail "You cannot withdraw more than #{MAX_DAILY_WITHDRAWAL} per day" if amount > MAX_DAILY_WITHDRAWAL
    self.balance -= amount
    update_statement_debit(amount)
  end

  def read_statement
    self.statement
  end


  private
  attr_writer :balance

  def update_statement_credit(amount)
    transaction = Transaction.new
    transaction.update_credit(amount)
    transaction.update_balance(self.balance)
    self.statement.add_transaction(transaction)
  end

  def update_statement_debit(amount)
    transaction = Transaction.new
    transaction.update_debit(amount)
    transaction.update_balance(self.balance)
    self.statement.add_transaction(transaction)
  end


  # def update_statement_credit(amount)
  #   transaction = Transaction.new(DateTime.new)
  #   transaction.update_credit(amount)
  #   transaction.update_balance(self.balance)
  #   statement << transaction
  # end

  # def update_statement_debit(amount)
  #   transaction = Transaction.new(DateTime.new)
  #   transaction.update_debit(amount)
  #   transaction.update_balance(self.balance)
  #   statement << transaction
  # end

end
