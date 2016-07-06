require "account"

describe 'Account features' do

  it 'prints users transactions' do
    account = Account.new
    deposit1 = Time.local(2012,01,10)
    allow(Time).to receive(:now).and_return (deposit1)
    account.deposit(1000)
    deposit2 = Time.local(2012,01,13)
    allow(Time).to receive(:now).and_return (deposit2)
    account.deposit(2000)
    deposit3 = Time.local(2012,01,14)
    allow(Time).to receive(:now).and_return (deposit3)
    account.withdrawal(500)
    expect(account.statement.print_statement).to eq ("date || credit || debit || balance\n14/01/2012 || || 500 || 2500\n13/01/2012 || 2000 || || 3000\n10/01/2012 || 1000 || || 1000\n")
  end
end
