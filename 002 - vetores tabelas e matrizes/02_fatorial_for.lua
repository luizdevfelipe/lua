local num
local result = 1

io.write("Digite um número para calcular o fatorial: ")
num = tonumber(io.read())

for i = num, 1, -1 do
  result = result * i
end

io.write("O resultado é: ", result, "\n")