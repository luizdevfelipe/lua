function printMatriz (matriz)
  for i=1, #matriz, 1 do
    for j=1, #matriz[i], 1 do
        io.write(matriz[i][j], " ")
    end
    io.write("\n")
  end
end

function somaMatriz (matriz1, matriz2)
  if #matriz1 ~= #matriz2 then 
    return {}
  end
  
  for i=1, #matriz1, 1 do
    for j=1, #matriz1[i], 1 do
        matriz1[i][j] = matriz1[i][j] + matriz2[i][j]
    end
  end
  return matriz1
end
  
local valores = {
  {0,0,3},
  {1,1,1},
}

local valores2 = {
  {1,1,1},
  {1,1,1},
}

local soma = somaMatriz(valores, valores2)
printMatriz(soma)
