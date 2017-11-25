class CashRegister

  attr_reader :discount, :items
  attr_accessor :total

  def initialize (employee_discount=nil)
      @total = 0
      @discount = employee_discount
      @items = []
      @price = []
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
      @total = @total - @total * @discount/100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end

  end

  def void_last_transaction
    @total -= @price.last
  end

end
