# Cash register can:
# Add items of varying quantities and prices
# Calculate discounts
# Keep track of what's been added to it
# Void the last transaction

class CashRegister

  attr_accessor :total, :discount, :last_transaction_item, :last_item

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cost_per_item = []
    @items = []
    @transactions = []
  end

  # accepts a title and a price and increases the total
  # also accepts an optional quantity - ("book", 5.00, 3)
  # doesn't forget about the previous total
  def add_item(item, price, quantity = 1)
    @total += price * quantity
    @transactions << price
    i = quantity
    until i == 0 do
      @items << item
      i -= 1
    end
  end

  # applies the discount to the total price
  # returns success message with updated total
  # reduces the total
  # Returns a string error message that there is no discount to apply
  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    else self.total *= (1 - (self.discount.to_f / 100))
      return "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def items
    @items
  end

  # remove the last transaction from the total
  def void_last_transaction
    self.total = @total - @transactions.pop
    @items = self.last_item
  end


end
