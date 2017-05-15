class Account
  attr_reader :balance, :transactions

  def initialize(transactions)
    @balance = 0
    @transactions = transactions
  end

  def read_statement
    self.transactions
  end

  private
  attr_writer :balance
end
