class Account
  attr_reader :balance, :transactions
  MAX_DAILY_WITHDRAWAL = 500

  def initialize(transactions)
    @balance = 0
    @transactions = transactions
  end

  def deposit(amount)
    self.balance += amount
  end

  def withdraw(amount)
    fail "You cannot have a negative balance" if self.balance - amount < 0
    fail "You cannot withdraw more than #{MAX_DAILY_WITHDRAWAL} per day" if amount > MAX_DAILY_WITHDRAWAL
    self.balance -= amount

  end

  def read_statement
    self.transactions
  end


  private
  attr_writer :balance
end
