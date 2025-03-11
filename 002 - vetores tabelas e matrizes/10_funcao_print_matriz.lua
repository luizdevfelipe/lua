function printMatriz (matriz)
  for i=1, #matriz, 1 do
    for j=1, #matriz[i], 1 do
        io.write(matriz[i][j], " ")
    end
    io.write("\n")
  end
end
  
local valores = {
  {0,0,0},
  {1,1,1},
}

printMatriz(valores)