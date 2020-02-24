require('minitest/autorun')
require('minitest/reporters')
require_relative('../tour_agency')
require_relative('../vehicle')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestBankAccount < MiniTest::Test

  def test_get_company_name()
    tour_agency = TourAgency.new("Edinburgh Travel","Jun",["Jun","Sam"],["BMW","BENZS"],1000)
    assert_equal("Edinburgh Travel",tour_agency.company_name())
  end

  def test_get_drivers()
    tour_agency = TourAgency.new("Edinburgh Travel","Jun",["Jun","Sam"],["BMW","BENZS"],1000)
    assert_equal(["Jun","Sam"],tour_agency.drivers)
  end

  def test_get_cash()
    tour_agency = TourAgency.new("Edinburgh Travel","Jun",["Jun","Sam"],["BMW","BENZS"],1000)
    assert_equal(1000,tour_agency.cash)
  end

  def test_set_manager_name()
    tour_agency = TourAgency.new("Edinburgh Travel","Jun",["Jun","Sam"],["BMW","BENZS"],1000)
    tour_agency.manager_name = "Sam"
    assert_equal("Sam",tour_agency.manager_name)
  end

  def test_find_driver_by_name__in_company()
    tour_agency = TourAgency.new("Edinburgh Travel","Jun",["Jun","Sam"],["BMW","BENZS"],1000)
    driver = tour_agency.find_driver_by_name("Sam")
    assert_equal("Sam",driver)
  end

  def test_find_driver_by_name__not_in_company()
    tour_agency = TourAgency.new("Edinburgh Travel","Jun",["Jun","Sam"],["BMW","BENZS"],1000)
    driver = tour_agency.find_driver_by_name("John")
    assert_nil(driver)
  end


  def test_welcome_new_driver()
    tour_agency = TourAgency.new("Edinburgh Travel","Jun",["Jun","Sam"],["BMW","BENZS"],1000)
    tour_agency.welcome_new_driver("John")
    assert_equal(3,tour_agency.drivers.length)
  end

  def test_allow_driver_quit__driver_in_company()
    tour_agency = TourAgency.new("Edinburgh Travel","Jun",["Jun","Sam"],["BMW","BENZS"],1000)
    tour_agency.driver_quit("Sam")
    assert_equal(1,tour_agency.drivers.length)
  end

  def test_allow_driver_quit__driver_not_in_company()
    tour_agency = TourAgency.new("Edinburgh Travel","Jun",["Jun","Sam"],["BMW","BENZS"],1000)
    tour_agency.driver_quit("John")
    assert_equal(2,tour_agency.drivers.length)
  end

  def test_allow_driver_quit__driver_in_company_but_manager()
    tour_agency = TourAgency.new("Edinburgh Travel","Jun",["Jun","Sam"],["BMW","BENZS"],1000)
    tour_agency.driver_quit("Jun")
    assert_equal(2,tour_agency.drivers.length)
  end

  def test_buy_vechile__cash_enough()
    tour_agency = TourAgency.new("Edinburgh Travel","Jun",["Jun","Sam"],["BMW","BENZS"],20000)
    vechile = Vechile.new("SJ17FAL","Mecedes",19000)
    tour_agency.buy_vechile(vechile)
    assert_equal(1000,tour_agency.cash)
    assert_equal(3,tour_agency.vechiles.length)
  end

  def test_buy_vechile__cash_not_enough()
    tour_agency = TourAgency.new("Edinburgh Travel","Jun",["Jun","Sam"],["BMW","BENZS"],2000)
    vechile = Vechile.new("SJ17FAL","Mecedes",19000)
    tour_agency.buy_vechile(vechile)
    assert_equal(2000,tour_agency.cash)
    assert_equal(2,tour_agency.vechiles.length)
  end 

# #[Task:] Write getters for the balance and the type of account,
# # with tests first.
#   def test_get_balance()
#     bank_account = BankAccount.new("Chris",1000,'business')
#     assert_equal(1000,bank_account.balance())
#   end
#
#   def test_get_account_type()
#     bank_account = BankAccount.new("Chris",1000,'business')
#     assert_equal('business',bank_account.type())
#   end
#
#   def test_set_account_name()
#     bank_account = BankAccount.new("Chris",1000,'business')
#     bank_account.holder_name = 'Keith'
#     assert_equal("Keith",bank_account.holder_name())
#   end
#
#   def test_set_balance()
#     bank_account = BankAccount.new("Chris",1000,'business')
#     bank_account.balance = 5000
#     assert_equal(5000,bank_account.balance())
#   end
#
#   # def test_set_type()
#   #   bank_account = BankAccount.new("Chris",1000,'business')
#   #   bank_account.type = 'private'
#   #   assert_equal('private',bank_account.type())
#   # end
#
#   def test_pay_into_account()
#     bank_account = BankAccount.new("Chris",1000,'business')
#     bank_account.pay_in(1000)
#     assert_equal(2000,bank_account.balance())
#   end
#
#   def test_monthly_fee__business()
#     bank_account = BankAccount.new("Chris",1000,'business')
#     bank_account.pay_monthly_fee()
#     assert_equal(950,bank_account.balance())
#   end
#
#   def test_montyly_fee__personal()
#     bank_account = BankAccount.new("Sam",2000,'personal')
#     bank_account.pay_monthly_fee()
#     assert_equal(1990,bank_account.balance())
#   end

end
