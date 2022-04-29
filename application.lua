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
	This webpage describes LiSS fieldworks in the Brazilian Amazonia. Each of these fieldworks was funded by a set of agencies, shown in the respective application. Please click in a box to see more information and to navigate through specific applications.<br>The toolkit to create this application was funded by FAPESP...
]]

Application{
    key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = "fieldworks.tview",
	description = description,
	base = "roadmap",
    zoom = 7,
	template = {navbar = "darkblue", title = "white"},
    display = false,
	fieldworks = View{
        color = "Set2",
		select = "title",
        description = "Trabalhos de campo.",
		report = function(cell)
			local report = Report{
				title = cell.title,
				author = "LiSS",
			}

            local link = "https://combinatronics.com/pedro-andrade-inpe/liss/main/"..
              cell.app.."/"..cell.app.."WebMap/index.html"

            report:addText(descriptions[cell.app].date)

			report:addText("See the application <a href = \""..link.."\" target=\"_blank\">here</a>.")

            forEachElement(descriptions[cell.app].photo, function(_, value)
              report:addImage("photos/"..value)
            end)

			return report
		end
	}
}
