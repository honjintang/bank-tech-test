require 'date'

class Statement

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(transaction)
    self.transactions << {timestamp: Time.now.strftime("%d/%m/%Y"),
                          transaction: transaction }
  end

  private
  attr_writer :transactions

end
