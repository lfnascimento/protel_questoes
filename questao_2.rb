require 'minitest/autorun'

module Questao2
  def mult(digito)
    a = digito.to_s.split(//)
    $m = 2
    a.reverse_each.map {|e| x = e.to_i * $m; if $m < 6 then $m+=1 else $m=2 end; x}
  end
end

#assert_equal mult(1234) == [8, 9, 8, 5]

class Test < MiniTest::Unit::TestCase
  include Questao2

  def test_mult
    assert_equal [8, 9, 8, 5], mult(1234)
  end
end
