require "pry"

class CashRegister

  attr_accessor :total
  attr_reader :discount, :items

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item (title, price, quantity = 1)
    quantity.times { self.items << title }
    self.total += price * quantity
  end

  def apply_discount
    return "There is no discount to apply." if discount == nil

    self.total = ((self.discount / 100.0 * self.total) - self.total) * -1
    "After the discount, the total comes to $#{self.total.to_i}."
  end

  def void_last_transaction
    @total = 0
  end

end
