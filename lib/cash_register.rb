class CashRegister

  def initialize (employee_discount=nil)
      @total = 0
      @discount = employee_discount
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

  def add_item (title, price, quantity=1)
    @total += price*quantity
    quantity.times do
      @items << title
      @price << price
    end
  end

  def apply_discount
    if @discount
      total = @total
      discount = @discount.to_f/100
      amount_off = total*discount
      new_total = @total -= amount_off
      "After the discount, the total comes to $#{new_total.to_i}."
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
