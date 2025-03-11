-- Cartela da megasena tem 60 números
-- Escolhem-se 6 ao acaso
-- S = C60,6 = 60! / (60-6)! . 6!
-- Se C60,6 é o evento certo P(S) = 100%
-- Se 1 cartela tem probabilidade P(1)
-- P(1) = 100.1 / C60,6
-- 0,000002%

function fatorial (num)
  if (num == 1 or num == 0) then
    return 1
  end

  return num * fatorial (num - 1)
end

local combinacao = fatorial(60) / (fatorial(6) * fatorial(54))

local probabilidade = 100 / combinacao

io.write("A probabilidade de ganhar na megasena com 1 cartela é: ", probabilidade, "%\n")
io.write("A quantidade de cartões do S é: ", combinacao, "\n")