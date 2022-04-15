import("publish")

local description = [[
	LiSS webmapping applications.
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

            local link = "https://combinatronics.com/pedro-andrade-inpe/liss/"..
              cell.app.."/"..cell.app.."WebMap/index.html"

			report:addText("See the application <a href = \""..link.."\">here</a>")

			return report
		end
	}
}
