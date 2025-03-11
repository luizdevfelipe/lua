-- Soma dos elementos do vetor
local vetor = {3, 5, 1, 7, 9, 0, 1}
local soma = 0

for i = 1, #vetor, 1 do
  soma = soma + vetor[i]
end

io.write("A soma dos elementos do vetor é: ", soma, "\n")