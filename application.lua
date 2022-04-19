-- aplicacao geral

import("publish")

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
		select = "app",
        description = "Trabalhos de campo.",
		report = function(cell)
			local report = Report{
				title = cell.app,
				author = "LiSS",
			}

            local link = "https://combinatronics.com/pedro-andrade-inpe/liss/main/"..
              cell.app.."/"..cell.app.."WebMap/index.html"

			report:addText("See the application <a href = \""..link.."\" target=\"_blank\">here</a>.")

			return report
		end
	}
}
