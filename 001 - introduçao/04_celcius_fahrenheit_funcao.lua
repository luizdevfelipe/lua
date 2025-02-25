function celsius2Fah(cel)
  local fah
  fah = 9 * cel / 5 + 32
  return  fah
end

local c, f
io.write("Digite a temperatura em ºC: ")
c = tonumber(io.read())

f = celsius2Fah(c)

io.write("A temperatura convertida é de ", f, "ºF \n")