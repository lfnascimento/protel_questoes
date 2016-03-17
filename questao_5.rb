module Questao5
  def descontar_imposto(salario)
    @imposto = 0
    if salario <= 1903.98
      return @imposto
    end

    tabela_de_imposto = {1903.99..2826.65 => 0.075,
                         2826.66..3751.05 => 0.15,
                         3751.06..4664.68 => 0.225,
                         4664.69..salario => 0.275
                         }

    tabela_de_imposto.each {|faixa, percentual|
                            unless faixa.max == nil
                              if faixa.include?(salario) || salario > faixa.max
                                @imposto += (faixa.max - faixa.min) * percentual
                              else
                                break
                              end
                            end
                            }
    @imposto.round(2)
  end
end

require 'minitest/autorun'

class Test < MiniTest::Unit::TestCase

  include Questao5

  # Testando os limites das faixas
  def test_descontar_imposto
    assert_equal 1880.63, descontar_imposto(10000)
    assert_equal 0, descontar_imposto(1903.98)
    assert_equal 69.2, descontar_imposto(1903.99)
    assert_equal 69.2, descontar_imposto(2826.65)
    assert_equal 207.86, descontar_imposto(2826.66)
    assert_equal 207.86, descontar_imposto(3751.05)
    assert_equal 413.42, descontar_imposto(3751.06)
    assert_equal 413.42, descontar_imposto(4664.68)
    assert_equal 413.42, descontar_imposto(4664.69)
  end

end
