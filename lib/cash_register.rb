class CashRegister
  attr_accessor :total

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @bag = []
  end

  def add_item(item, price, quantity = 1)
    @item = item
    @price = price
    @quantity = quantity
    @total += @price * @quantity
    quantity.times { @bag << @item }
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      @total = @total - @total * @discount/100
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def items
    @bag
  end

  def void_last_transaction
    @total -= @price
  end
end
