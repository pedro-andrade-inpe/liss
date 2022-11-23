-- aplicacao geral

import("publish")

descriptions = {
    arapiuns = {
        date = "Realizado no período de 4 a 15 de junho de 2012.",
        photo = {"Arapiuns.jpg"},
    },
    baixoTocantins = {
        date = "Realizado nos anos de 2018 e 2019.",
        photo = {"Baixo Tocantins 2018.jpg", "Baixo Tocantins 2019.jpg"},
    },
    BR230 = {
        date = "Realizado no período de 6 a 18 de outubro de 2014.",
        photo = {"BR230.jpg"}
    },
    santarem = {
        date = "Realizado no período de 6 a 26 de setembro de 2013.",
        photo = {"Santarem.jpg"}
    }
}

local description = [[
    (An English version of this application is available <a href="https://pedro-andrade-inpe.github.io/liss/en/fieldworkWebMap/index.html">here</a>)<br><br>
	Esta página descreve os trabalhos de campo do laboratório  <a href="https://www.lissinpe.com.br/" target="_blank">LiSS</a> na Amazônia Brasileira. Clique em um retângulo no mapa para ter mais informações e navegar por uma aplicação específica. <br>
    Cada um dos trabalhos de campo aqui descritos foi fomentado por diferentes fontes, descritas nas respectivas aplicações. A ferramenta para criar esta aplicação foi parcialmente fomentada pelo projeto <a href="http://nexus.ccst.inpe.br/" target="_blank">Nexus</a>, processo FAPESP #2017/22269-2.
]]

Application{
    key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = "fieldwork.tview",
	description = description,
	base = "roadmap",
    zoom = 7,
	template = {navbar = "darkblue", title = "white"},
    display = false,
	campos = View{
        color = "Set2",
		select = "title",
        description = "Trabalhos de campo.",
		report = function(cell)
			local report = Report{
				title = cell.title,
				author = descriptions[cell.app].date
			}

            local link = "https://pedro-andrade-inpe.github.io/liss/pt/"..
              cell.app.."/"..cell.app.."WebMap/index.html"

			report:addText("Veja a aplicação <a href = \""..link.."\" target=\"_blank\">aqui</a>.")

            forEachElement(descriptions[cell.app].photo, function(_, value)
              report:addImage("photos/"..value)
            end)

			return report
		end
	}
}
