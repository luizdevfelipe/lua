local vetor = {}
vetor[1] = 1000
vetor[2] = "Teste"
vetor[3] = 2000
vetor[4] = true

io.write("Vetor com itens adicionados: ")
for i=1, #vetor, 1 do
  io.write(tostring(vetor[i]), " ")
end
io.write("\n")


local vetor2 = {10, 20, 30, "Teste"}
io.write("Vetor com itens definidos na inicialização: ")
for i=1, #vetor2, 1 do
  io.write(tostring(vetor[i]), " ")
end
io.write("\n")