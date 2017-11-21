require "pry"
class CashRegister

  def initialize(discount=nil)
    @total = 0.0
    @discount = discount
    @items =[]
    @last_item_price = 0.0
  end

  def total
    @total
  end

  def items
    @items
  end

  def discount
    @discount
  end

  def total=(amount)
    @total=amount
  end

  def add_item(title, price, quantity = 1)
    @total += price*quantity
    quantity.times do
      @items<<title
    end
    @last_item_price = price
  end

  def apply_discount
    #binding.pry
    if @discount == nil
      "There is no discount to apply."
    else
      @total *= ((100.0-@discount.to_f)/100.0)
      return "After the discount, the total comes to $#{@total.round(0)}."
    end
  end

  def void_last_transaction
    @items.pop
    @total -= @last_item_price
    @total
  end


end
