# Bank Tech Test

### Instructions

* Clone this repository by running the following command in terminal:
```
git clone git@github.com:honjintang/bank-tech-test.git
```
* Interact with the programme in IRB or Pry:
```
[1] pry(main)> require './lib/transaction.rb'
=> true
[2] pry(main)> require './lib/account.rb'
=> true
[3] pry(main)> require './lib/statement.rb'
=> false
[4] pry(main)> account = Account.new(Statement.new)
=> #<Account:0x007ffee140de58
 @balance=0,
 @statement=#<Statement:0x007ffee140dea8 @transactions=[]>>
 ```
* You can make deposits, withdrawals, and read your statements:

  ```
  [5] pry(main)> account.deposit(100)
  => [{:timestamp=>"15/05/2017",
   :transaction=>
    #<Transaction:0x007ffee13c6670
     @details={:credit=>100, :debit=>0, :balance=>100}>}]
  [6] pry(main)> account.withdraw(50)
  => [{:timestamp=>"15/05/2017",
   :transaction=>
    #<Transaction:0x007ffee13c6670
     @details={:credit=>100, :debit=>0, :balance=>100}>},
  {:timestamp=>"15/05/2017",
   :transaction=>
    #<Transaction:0x007ffedf9a7de8
     @details={:credit=>0, :debit=>50, :balance=>50}>}]
  [7] pry(main)> account.read_statement
  date || credit || debit || balance
  15/05/2017 || 100 || 0 || 100

  15/05/2017 || 0 || 50 || 50
  ```

### Requirements

* You should be able to interact with the your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
