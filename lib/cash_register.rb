class CashRegister

attr_writer :discount, :total
attr_reader :discount, :total

def initialize(discount=0)
  @total = 0
  @discount = discount
end

def add_item(item, price, quantity=1)
   self.total += (price * quantity)
end

def apply_discount
  self.total = self.total.to_i * (1-discount/100)
end

end
