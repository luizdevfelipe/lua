player1 = {
  nome = "Jogador1",
  px = 100,
  py = 35,
  vidas = 3
}

io.write(player1.nome, "\n")
player1.nome = "Pedro"
player1.sexo = "Masc"
io.write("Vidas do ", player1.nome, ": ", player1.vidas, "\n\n")

for chave, valor in pairs(player1) do
    io.write(tostring(chave) .. ": ", valor, "\n")
end