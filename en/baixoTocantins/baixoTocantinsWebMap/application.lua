-- baixo tocantins

import("publish")

local description = [[
This application describes the fieldwork activities carried out in the region of Baixo
Tocantins, Cametá micro-region in the state of Pará, in the years 2018 and
2019. These activities aimed to collect data to characterize the
region in two ways. The first aspect concerns the different forms
of land use and occupation and the main production methods associated
to agricultural and agroforestry extractive activities. The second aspect is the
distribution and type of urban infrastructure, as well as access to services
in populational areas.<br>
Source: <a href = "http://urlib.net/8JMKD3MGP3W34T/44STMLE" target="_blank">Souza et al. Paisagens e Uso da Terra em Nucleos Populacionais e Estabelecimentos Rurais da Regiao do Baixo Tocantins - Para</a>.
]]

Application{
    key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = "baixoTocantins.tview",
	description = description,
	base = "roadmap",
--	clean = true,
	template = {navbar = "darkblue", title = "white"},
    display = false,
--[[
    trajectory = View{
		description = "Route on the BR230.",
		width = 3,
		border = "blue",
		icon = {
--			path = "M150 0 L75 200 L225 200 Z",
			transparency = 0.2,
			time = 20
		}
	},
    --]]
    -- [[
	points = View{
		description = "Settlements correspond to agrovilas, villages, and communities.",
		select = {"name", "micon2"},
		icon = {"yellow_home"},
		label = {"home"},
		report = function(cell)
			local mreport = Report{
				title = cell.name,
				author = "Souza et al. (2017)"
			}
-- [[
			local text = "The "..cell.name.." community was founded "..math.floor(cell.idd).." years ago. "..
                         "In 2013, there were around "..math.floor(cell.nfam).." families, "

            if math.floor(cell.bfam) == 0 then
               text = text.." none received a family allowance. "
            else
               text = text..math.floor(cell.bfam).." of them received a family allowance. "
            end

            if cell.energia == 1 then
                text = text.."Electric energy was provided by a regular transmission line since "..cell.data..". "
            else
                text = text.."There was no regular electricity transmission line. "
            end

            if cell.il_pub == 1 then
                text = text.." It has street lightning. "
            end

            if cell.AGUA == 0 then
                text = text.."It has an artesian well and/or river. "
            else
                text = text.."It has an artesian well and/or piped. "
            end

            local infra = {}
            if cell.MERC == 1 then table.insert(infra, "market") end
            if cell.BAR  == 1 then table.insert(infra, "bar") end
            if cell.CFUT == 1 then table.insert(infra, "soccer field") end
            if cell.PSAU == 1 then table.insert(infra, "health center") end
            if cell.IG_CAT == 1 or cell.IG_EV == 1 then table.insert(infra, "religious temple") end


            if #infra > 0 then
              text = text.."In the community there are "..table.concat(infra, ", ")..". "
            end
--]]
-- [[
            local atec_translate = {
                ["agricultura"] = "agriculture",
                ["produção de açaí"] = "acai",
                ["produção de farinha"] = "cassava flour",
            }

            cell.ATEC_TIPO = atec_translate[cell.ATEC_TIPO]
--]]
-- [[
            if cell.AT_ECON == 1 then
                text = text.."The "..cell.English.." is the main economic activity of the community. "
            end

            local production = {}
            if cell.ARROZ   == 1 then table.insert(production, "rice") end
            if cell.FARINHA == 1 then table.insert(production, "farinha") end
            if cell.FRUTAS  == 1 then table.insert(production, "fruits") end
            if cell.ACAI    == 1 then table.insert(production, "acai") end

            if #production > 0 then
              text = text.."In the community they produce "..table.concat(production, ", ")..". "
            end

            if cell.pesca == 1 then
                text = text.."Fishing is also an important activity in the community. "
            end

            if cell.AT_ECON == 2 then
                text = text.." The main economic activities of the community are "..cell.English..". "
            end

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
--]]
			return mreport
		end
	}
        --]]
}
