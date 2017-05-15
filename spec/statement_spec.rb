require './lib/statement.rb'

describe Statement do

  subject(:statement) { described_class.new }
  let(:transaction) { double :transaction }

  describe "#initialize" do
    it 'initializes with no transactions' do
      expect(statement.transactions).to eq([])
    end
  end

  describe '#add_transaction' do
    it 'adds a transaction to the statement with timestamp' do
      statement.add_transaction(transaction)
      expect(statement.transactions.length).to eq(1)
    end

  end




end
