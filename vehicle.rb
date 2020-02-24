class Vechile
  attr_accessor :price
  attr_reader :reg_no,:brand

  def initialize(reg_no,brand,price)
    @reg_no = reg_no
    @brand = brand
    @price = price
  end



end
