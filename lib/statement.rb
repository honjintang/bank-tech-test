require 'date'

class Statement

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(transaction)
    self.transactions << {timestamp: DateTime.new,
                          transaction: transaction }
  end

  private
  attr_writer :transactions
  
end
