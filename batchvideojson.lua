#!/usr/bin/env lua5.3
function fileToArray(arquivo)
    assert(not(arquivo == nil), "Nenhum nome de arquivo foi informado para função fileToArray.")
    arquivo = io.open(arquivo, "r")
    assert(not(arquivo == nil), "Arquivo nao encontrado.")
    resultado = {}
    l = arquivo:read "*l"
    while not(l == nil) do
        table.insert(resultado, l)
        l = arquivo:read "*l"
    end
    arquivo:close()
    return resultado
end

function retBoolDot(S,y)
  y = y * -1
  if string.sub(S, y, y) == "." then return true else return false end
end

os.execute("ls >> templist")
listaDeArquivos = fileToArray("templist")
os.execute("rm templist")

for i,x in ipairs(listaDeArquivos) do
  indexCommand = "mediajson "..string.gsub(x, " ", "\\ ").." "..string.gsub(arg[1], " ","\\ ")
  if retBoolDot(x, 5) or retBoolDot(x, 4) or retBoolDot(x, 3) then
    print(indexCommand)
    os.execute(indexCommand)
end
