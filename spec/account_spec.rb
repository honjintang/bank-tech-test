require 'account'

describe Account do

  subject(:account) { described_class.new(transactions) }
  let(:transactions) { [] }

  describe '#initialize' do
    it 'new accounts have a balance of 0' do
      expect(account.balance).to eq(0)
    end

    it 'new accounts are initialized with an empty statement' do
      expect(account.read_statement).to eq([])
    end
  end

  context "user has positive balance" do

    before do
      account.deposit(100)
    end

    describe '#deposit' do
      it 'allows user to deposit an amount into their account' do
        account.deposit(100)
        expect(account.balance).to eq(200)
      end
    end

    describe '#withdraw' do
      it 'allows user to withdraw an amount from their account' do
        account.withdraw(50)
        expect(account.balance).to eq(50)
      end
    end

  end

end
