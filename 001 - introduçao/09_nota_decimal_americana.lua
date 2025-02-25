local nota

io.write("Insira a sua nota: ")
nota = tonumber(io.read())

if (nota >= 9) then
  nota = "A"
elseif (nota >= 8) then
  nota = "B"
elseif (nota >= 7) then
  nota = "C"
elseif (nota >= 5) then
  nota = "D"
else
  nota = "F"
end

io.write("A nota convertida em letra será: ", nota, "\n")