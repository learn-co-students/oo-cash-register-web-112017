class CashRegister

  def initialize(employe_discount=nil)
    @total = 0
    @discount = employe_discount
    @items = []
    @price = []
  end

  def discount
    @discount
  end

  def total
    @total
  end

  def total= (new_total)
    @total = new_total
  end

  def add_item(item, price, quantity=1)
    @total += price * quantity
      quantity.times do
      @items << item
      @price << price
    end
  end

  def apply_discount
    if @discount
      @discount = @discount.to_f / 100.to_f
      @total = @total - @total * @discount
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
     @items
  end

  def void_last_transaction
    @total -= @price.last
  end

end
