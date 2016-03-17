require 'date'
require 'minitest/autorun'

module Questao1
  def dia_final_proxima_quinzena(data)

    begin
      d = Date.parse(data)
    rescue
      puts "!!! DATA INVALIDA !!!"
    end

    if d.mday < 16
      new_date = d >> 1
      new_date - (d.mday + 1)
    else
      new_date = d + (15 - d.mday)
      new_date >> 1
    end
  end
end

class Test < MiniTest::Unit::TestCase
  include Questao1

  def test_dia_final_da_proxima_quinzena
    date_expected_one = Date.new(2016,03,15)
    date_expected_two = Date.new(2016,02,28)

    assert_equal date_expected_one, dia_final_proxima_quinzena('17 Feb')
    assert_equal date_expected_two, dia_final_proxima_quinzena('3 Feb')
  end
end
