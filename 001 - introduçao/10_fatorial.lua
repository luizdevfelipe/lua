local valor
local result = 1

io.write("Digite um valor: ")
valor = tonumber(io.read())

while(valor > 0) do
  result = result * valor
  valor = valor - 1
end

io.write("O fatorial desse número é: ", result, "\n")