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

            local link = "https://cdn.rawgit.org/cdn.jsdelivr.net/gh/pedro-andrade-inpe/liss@master/"..
              cell.app.."/"..cell.app.."WebMap/index.html"

            report:addText(link)

			report:addText("bla bla bla<a href = \"www.terrame.org\">here</a>")

			return report
		end
	}
}
