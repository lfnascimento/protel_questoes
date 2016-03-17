require 'minitest/autorun'

class String
  def eliminar_numericos
    self.gsub(/(\d*)/, '')
  end
end

class Test < MiniTest::Unit::TestCase
  def test_eliminar_numericos
     assert_equal "luisfnano", "671luis7f7nan9o".eliminar_numericos
  end
end
