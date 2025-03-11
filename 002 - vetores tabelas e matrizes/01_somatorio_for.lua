local n,x
local soma = 0

io.write("Digite um número para calcular a soma: ")
n = tonumber(io.read())

for x = 1, n, 1 do
  soma = soma + x
end

io.write("A soma dos números é: ", soma, "\n")