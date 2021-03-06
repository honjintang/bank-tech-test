require './lib/account.rb'

describe Account do

  subject(:account) { described_class.new(statement) }
  let(:statement) { Statement.new}
  let(:max_daily_withdrawal) { 500 }
  let(:transaction) { double :transaction }

  context "user has an empty balance" do
    describe '#initialize' do
      it 'new accounts have a balance of 0' do
        expect(account.balance).to eq(0)
      end

      it 'new accounts are initialized with an empty statement' do
        expect(account.statement).to eq(statement)
      end
    end

    describe '#withdraw' do

      it 'does not allow user to withdraw into a negative balance' do
        expect{ account.withdraw(100) }.to raise_error('You cannot have a negative balance')
      end
    end

  end


  context "user has positive balance" do

    before do
      account.deposit(1000)
    end

    describe '#deposit' do
      it 'allows user to deposit an amount into their account' do
        account.deposit(100)
        expect(account.balance).to eq(1100)
      end

      it 'adds transaction to statement after deposit' do
        expect(account.statement.transactions.length).to eq(1)
      end
    end

    describe '#withdraw' do
      it 'allows user to withdraw an amount from their account' do
        account.withdraw(100)
        expect(account.balance).to eq(900)
      end

      it 'does not allow user to withdraw more than the max daily allowance' do
        amount = max_daily_withdrawal + 1
        expect{ account.withdraw(amount) }.to raise_error("You cannot withdraw more than #{max_daily_withdrawal} per day")
      end

      it 'adds transaction to statement after withdrawal' do
        expect{ account.withdraw(100) }.to change { account.statement.transactions.length }.from(1).to(2)
      end

    end
  end


end
