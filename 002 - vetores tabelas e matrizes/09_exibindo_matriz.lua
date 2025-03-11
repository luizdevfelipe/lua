local matriz = {}
matriz[1] = {1, 0, 0}
matriz[2] = {1, 1, 0}
matriz[3] = {1, 1, 1}

for i=1, #matriz, 1 do
  for j=1, #matriz[i], 1 do
    io.write(tostring(matriz[i][j]), " ")
  end
  io.write("\n")
end