require 'pry'

class CashRegister
  attr_accessor :discount, :total, :items, :last_transaction

  def initialize(discount=0)
    @discount = discount
    @total = 0
    @items = []
  end


  def add_item(item, price, quantity=1)
    @total += price*quantity
    quantity.times do
      self.items << item
    end
    self.last_transaction = price*quantity
  end

  def apply_discount
    if @discount <= 0
      "There is no discount to apply."
    else
      @total = (@total.to_f - (@total.to_f * @discount.to_f/100)).to_i
      "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    @total -= self.last_transaction
  end


end
