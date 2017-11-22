require 'pry'

class CashRegister

attr_accessor :title, :price, :quantity, :total, :items, :discount, :last_transaction


  def initialize(discount=0)
    @total = 0
    @discount = discount
    @title = title
    @items = []
  end

  def add_item(title, price, quantity=1)
    items_list = {}
    items_list[title] = price
    @total += (items_list[title] * quantity)

    quantity.times do
      @items << title
    end
    @last_transaction = (items_list[title] * quantity)
  end

  def apply_discount
      if discount != 0
        @total = (total * ((100.0 - discount.to_f)/100)).to_i
        "After the discount, the total comes to $#{self.total}."
      else
        "There is no discount to apply."
      end
    end

    def void_last_transaction
        @total = @total - @last_transaction
      end



end

# item_one = CashRegister.new
# item_one.add_item("socks", 3, 2)
