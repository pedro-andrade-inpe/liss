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
-- [[
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

			local text = "The community "

			mreport:addText(text)

            if cell.drone_path ~= "NO" then
                mreport:addImage("photos/bd_pic_drone/"..cell.drone_path..".jpg")
            end

            if cell.pic_path ~= "NO" then
                mreport:addImage("photos/bd_pic_field/"..cell.pic_path..".jpg")
            end

            if cell.Uso ~= "NO" then
                mreport:addImage("photos/Uso/"..cell.Uso..".jpg")
            end

			return mreport
		end
	}
        --]]
}
