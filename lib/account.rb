require 'statement'

class Account
  attr_reader :balance, :statement

  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    @statement.statement.unshift("#{current_time} || #{amount} || || #{@balance}\n")
  end

  def withdrawal(amount)
      fail 'You do not have enough funds' if amount > @balance
      @balance -= amount
      @statement.statement.unshift("#{current_time} || || #{amount} || #{@balance}\n")
  end

  private

  def current_time
    Time.now.strftime("%d/%m/%Y")
  end
end
