class Guest
  attr_reader :name, :cash

def initialize(name, cash)
  @name = name
  @cash = cash
end

def pay_fee(fee)
  @cash -= fee
end

def can_afford(cost)
  @cash >= cost
end




end
