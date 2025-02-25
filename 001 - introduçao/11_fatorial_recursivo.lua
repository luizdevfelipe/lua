function fatorial(n)
  if (n == 1 or n == 0) then
    return 1
  end
  
  return n * fatorial(n-1)
end

local numero

io.write("Digite um número: ")
numero = tonumber(io.read())

numero = fatorial(numero)

io.write("O fatorial desse número é: ", numero, "\n")