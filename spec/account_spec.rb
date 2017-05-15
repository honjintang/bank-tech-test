require 'account'

describe Account do

  subject(:account) { described_class.new(transactions) }
  let(:transactions) { [] }

  describe 'initialization' do
    it 'new accounts have a balance of 0' do
      expect(account.balance).to eq(0)
    end

    it 'new accounts are initialized with an empty statement' do
      expect(account.read_statement).to eq([])
    end
  end
end
