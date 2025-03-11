-- Calcula a soma de números, de N até 1

io.write("Digite um número para ser somado repetidamente: ")
local n = tonumber(io.read())

local soma = 0

repeat 
  soma = soma + n
  n = n - 1
until n < 1

io.write("A soma dos números é: ", soma, "\n")

