import("publish")

local description = [[
	This webpage describes LiSS fieldworks in the Brazilian Amazonia. Please click in a box to see more information and to navigate through specific applications.
]]

Application{
    key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = "fieldworks.tview",
	description = description,
	base = "roadmap",
	template = {navbar = "darkblue", title = "white"},
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

			report:addText("See the application <a href = \""..link.."\" target=\"_blank\">here</a>")

			return report
		end
	}
}
