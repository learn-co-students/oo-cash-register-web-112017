require "pry"

class CashRegister
  attr_reader :discount, :total, :items, :last
  attr_writer :discount, :total, :items, :last

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last = 0
  end

  def add_item(title, price, quantity=1)
    self.last = quantity.to_f * price
    items.concat(Array.new(quantity, title))
    self.total += quantity.to_f * price
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      self.total *= ((100.0 - discount.to_f)/100.0)
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    items.pop
    self.total -= self.last
  end
end

# reggie = CashRegister.new(20)
# reggie.add_item("Macbook", 2, 3.5)
