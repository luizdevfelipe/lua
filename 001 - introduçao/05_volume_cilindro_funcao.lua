function volumeCilindro(raio, altura)
  local volume = math.pi * raio ^2 * altura
  return volume
end

local r, a, vol

io.write("Digite o raio do cilindro: ")
r = tonumber(io.read())

io.write("Digite a altura do cilindro: ")
a = tonumber(io.read())

vol = volumeCilindro(r, a)

io.write("O volume do cilindro de raio ", r, " e altura ", a," é de: ", vol, "\n")
