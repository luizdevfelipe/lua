local media
io.write("Digite a sua média: ")
media = tonumber(io.read())

if (media >= 7) then
  io.write("Aprovado.\n")
elseif (media >= 3.5 and media < 7) then
  io.write("Está de exame final.\n")
else 
  io.write("Reprovado.\n")
end
