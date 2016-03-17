def soma_total_mes(id, ano)
  TESTE.select("MONTH(DATA), sum(VALOR) as soma_total")
  .where("id = ? and extract(year from DATA) = ?", id, ano)
  .group("MONTH(DATA)")
end
