require './mainMethods.rb'

class CashMachine
  BALANCE = 'Lab5/balance.txt'

  def initialize
    if !File.exist?(BALANCE)
      @balance = 100.0
    else
      @balance = File.open(BALANCE, &:gets).to_f
    end
  end

  def balance
    @balance
  end

  def deposit(val)
    if float_arg?(val)
      return 'error'
    end
    dep = val.to_f
    
    if dep < 0 
      return 'incorrect'
    end

    @balance += dep
    save_balance
    'success'
  end

  def withdraw(val)
    if float_arg?(val)
      return 'error'
    end
    wd = val.to_f
    
    if wd < 0 || wd > @balance
      return 'incorrect'
    end
    @balance -= wd
    save_balance
    'success'
  end

  private
  def save_balance
    File.write(BALANCE, @balance, mode: "w")
  end
end