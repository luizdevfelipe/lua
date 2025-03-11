-- É possível escolher até 15 números em uma cartela
-- Se comparado com 6 números temos C15,6
-- 

function fatorial (num)
  local result = 1
  while num > 0 do
    result = result * num
    num = num -1
  end
  return result
end

io.write("*-* Cálculo de probabilidade de ganhar na MegaSenha *-*\n")
io.write("Digite quantos números serão preenchidos em uma cartela: ")
local num = tonumber(io.read())

combinacao = fatorial(60) / (fatorial(6) * fatorial(54))

cartoes = fatorial(num) / (fatorial(6) * fatorial(num-6))
  
probabilidade = 100*cartoes / combinacao
  
io.write("A probabilidade de ganhar jogando com ", num, " numeros em um cartão é de: ", probabilidade, "%\n")

