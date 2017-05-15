require './lib/transaction.rb'

describe Transaction do

  let(:current_date) { double :current_date }
   subject(:transaction) { described_class.new }

  describe "#initialize" do
    it "is initialized with transaction details" do
      expect(transaction.details).to eq({
                        credit: 0,
                        debit: 0,
                        balance: 0})
    end
  end

  describe "#update_credit" do
    it "updates transaction credit" do
    transaction.update_credit(100)
    expect(transaction.details[:credit]).to eq(100)
  end

  describe "#update_balance" do
    it "updates transaction with account balance" do
      transaction.update_balance(100)
      expect(transaction.details[:balance]).to eq(100)
    end
  end

  describe "#update_debit" do
    it 'updates transaction debit' do
      transaction.update_debit(100)
      expect(transaction.details[:debit]).to eq(100)
    end
  end

end

 end
