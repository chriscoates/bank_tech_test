class Statement

  HEADERS = "date || credit || debit || balance\n"

  attr_reader :statement

  def initialize
    @statement = []
  end

  def print_statement
    @statement.inject(HEADERS, :+)
  end

end
