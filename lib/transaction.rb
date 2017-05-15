class Transaction
  attr_reader :details

  def initialize(date)
    @details = { date: date,
                      credit: 0,
                      debit: 0,
                      balance: 0}
  end

  def update_credit(amount)
    self.details[:credit] = amount
  end

  def update_balance(account_balance)
    self.details[:balance] = account_balance
  end

  def update_debit(amount)
    self.details[:debit] = amount
  end

  private
  attr_writer :details, :credit, :debit, :balance
  
end
