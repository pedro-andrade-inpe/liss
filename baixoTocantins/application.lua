-- baixo tocantins

import("publish")

local description = [[
...
Source: <a href = "http://urlib.net/8JMKD3MGP3W34T/44STMLE">Souza et al. Paisagens e Uso da Terra em Nucleos Populacionais e Estabelecimentos Rurais da Regiao do Baixo Tocantins - Para. São José dos Campos: INPE, 2017</a>.
]]

Application{
    key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = "baixoTocantins.tview",
	description = description,
	base = "roadmap",
	clean = true,
	template = {navbar = "darkblue", title = "white"},
    display = false,
--[[
    trajectory = View{
		description = "Route on the BR230.",
		width = 3,
		border = "blue",
		icon = {
			path = "M150 0 L75 200 L225 200 Z",
			transparency = 0.2,
			time = 20
		}
	},
    --]]
    -- [[
	points = View{
		download = true,
		description = "Settlements corresponded to agrovilas, villages and communities.",
		select = {"name", "micon2"},
		icon = {"home"},
		label = {"home"},
		report = function(cell)
			local mreport = Report{
				title = cell.name,
				author = "Souza et al. (2017)"
			}

--            mreport:addImage("photos/"..cell.Nome..".JPG")

			local text = "The community "

			mreport:addText(text)

            if cell.pic_path ~= "NO" then
                mreport:addImage(cell.pic_path)- referencia ao endereço da imagem representativa de campo (em bd_pic_field_201x - sendo x o ano em questão);
		name - nome da comunidade;
		drone_path - referencia ao endereço da imagem de drone (em bd_pic_drone_2019, imagens drone disponíveis apenas para 2019);
		Uso

			return mreport
		end
	}
        --]]
}
