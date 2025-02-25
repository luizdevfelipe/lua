local celsius, fahrenheit

io.write("Digite um valor em ºC ")
celsius = tonumber(io.read())

fahrenheit = 9*celsius/5 + 32

io.write("A temperatura de ", celsius, "ºC será de ", fahrenheit, "ºF \n")