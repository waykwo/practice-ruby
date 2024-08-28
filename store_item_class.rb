class Store_item
  attr_reader :name, :colour, :price

  def initialize(input_name, input_colour, input_price)
    @name = input_name
    @colour = input_colour
    @price = input_price
  end

  def volume_pricing
    p "100 units will cost $#{@price * 0.9 * 100}"
  end

  def tax_in
    p "Price with tax is $#{@price *= 1.05}"
  end
end

gummy_bears = Store_item.new("gummy_bears", "multi", 0.10)
pp gummy_bears
pp gummy_bears.volume_pricing
pp gummy_bears.tax_in
pp gummy_bears