require ('pry-byebug')

class TourAgency
  attr_accessor :manager_name,:drivers,:vechiles,:cash
  attr_reader :company_name

  def initialize(company_name,manager_name,drivers,vechiles,cash)
    @company_name = company_name
    @manager_name = manager_name
    @drivers = drivers
    @vechiles = vechiles
    @cash = cash
  end

  def find_driver_by_name(name)
#    binding.pry
    driver_find = nil
    for driver in @drivers
       if(driver == name)
         driver_find = driver
       end
    end
    return driver_find
  end

  def welcome_new_driver(new_driver)
    @drivers.push(new_driver)
  end

  def driver_quit(name)
    # binding.pry
    driver_find = find_driver_by_name(name)
    if (driver_find != nil)
      if(name != @manager_name)
        @drivers.delete(name)
      end
    end
  end

  def buy_vechile(vechile)
#    binding.pry
    if(@cash >= vechile.price)
      @cash -= vechile.price
      vechiles.push(vechile)
    end
  end
end
