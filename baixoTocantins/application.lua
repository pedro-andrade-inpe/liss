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
--	clean = true,
	template = {navbar = "darkblue", title = "white"},
    display = false,
-- [[
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
		description = "Settlements corresponded to agrovilas, villages and communities.",
		select = {"name", "micon2"},
		icon = {"home"},
		label = {"home"},
		report = function(cell)
			local mreport = Report{
				title = cell.name,
				author = "Souza et al. (2017)"
			}

			local text = "A comunidade "..cell.name.." teve origem há "..cell.idd.." anos. "..
                         "Em 2013, na comunidade residiam cerca de "..cell.nfam.." famílias, das quais "..
                         cell.bfam.." recebiam bolsa família. "


            if cell.energia == 1 then
                text = text.."A energia elétrica é provida por linha regular de transmissão desde "..cell.data..". "
            else
                text = text.."Não possui linha regular de transmissão de energia elétrica. "
            end

            if cell.il_pub == 1 then
                text = text.." Possui iluminação pública. "
            end

            if cell.AGUA == 0 then
                text = text.."Possui poço e/ou rio. "
            else
                text = text.."Possui poço artesiano e/ou encanada. "
            end

            local infra = {}
            if cell.MERC == 1 then table.insert(infra, "mercado") end
            if cell.BAR  == 1 then table.insert(infra, "bar") end
            if cell.CFUT == 1 then table.insert(infra, "campo de futebol") end
            if cell.PSAU == 1 then table.insert(infra, "posto de saúde") end
            if cell.IG_CAT == 1 or cell.IG_EV == 1 then table.insert(infra, "templo religioso") end


            if #infra > 0 then
              text = text.."Na comunidade há "..table.concat(infra, ", ")..". "
            end

            if cell.AT_ECON == 1 then
                text = text.."A "..cell.ATEC_TIPO.." é a principal atividade econômica da comunidade. "
            end

            local production = {}
            if cell.ARROZ   == 1 then table.insert(production, "arroz") end
            if cell.FARINHA == 1 then table.insert(production, "farinha") end
            if cell.FRUTAS  == 1 then table.insert(production, "frutas") end
            if cell.ACAI    == 1 then table.insert(production, "acai") end

            if #production > 0 then
              text = text.."Na comunidade há produção de "..table.concat(production, ", ")..". "
            end

            if cell.pesca == 1 then
                text = text.."A pesca também é uma atividade importante na comunidade."
            end

            if cell.AT_ECON == 2 then
                text = text.." As principais atividades econômicas da comunidade são "..cell.ATEC_TIPO..". "
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

			return mreport
		end
	}
        --]]
}
