class CashRegister

attr_accessor :discount, :total, :items, :last_transaction

def initialize(discount=0)
  @total = 0
  @discount = discount
  @items = []
end

def add_item(item, price, quantity=1)
   self.total += (price * quantity)
    quantity.times do
     self.items << item
     end
    self.last_transaction = price * quantity
end

def apply_discount
  if discount == 0
    "There is no discount to apply."
  else
    self.total = (self.total * (1 - discount/100.to_f)).to_i
    "After the discount, the total comes to $#{self.total}."
  end
end

def void_last_transaction
   self.total -= self.last_transaction
 end

end
