-- baixo tocantins

import("publish")

local description = [[
The report presents the methodology and results obtained during fieldwork in Upland communities in the Planalto Santareno region, municipalities of Belterra, Mojuí dos Campos, and Santarém, state of Pará, from September 6th to 26th in 2013. This work complements the fieldwork carried out previously in the riverside communities of Tapajós and Arapiuns in 2009 and 2012, respectively. The main objective is to identify and characterize communities regarding infrastructure, health and education services, as well as land uses and land cover, and rural production.
Source: DAL’ASTA, A. P.; SOUZA, A. R. DE; PINHO, C. M. D. DE; SOARES, F. DA R.; REGO, G. F. DE J.; SIQUEIRA, J. M. DE; ESCADA, M. I. S.; BRIGATTI, N.; AMARAL, S.; CAMILOTTI, V. L.; DÓRIA, V. E. M.; COSTA, L. C. DA. As Comunidades De Terra Firme Do Sudoeste Do Pará: População, Infraestrutura, Serviços, Uso Da Terra E Conectividades. São José dos Campos: INPE, 2017. Disponível em: http://urlib.net/8JMKD3MGP3W34P/3PAAHQ5
]]

Application{
    key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = "santarem.tview",
	description = description,
	base = "roadmap",
	clean = true,
	template = {navbar = "darkblue", title = "white"},
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
	points2 = View{
		download = true,
		description = "Settlements corresponded to agrovilas, villages and communities.",
		select = {"name", "micon2"},
		icon = {"home"},
		label = {"home"},
		report = function(cell)
         print("REPORT")
			local mreport = Report{
				title = cell.COMUNIDADE,
				author = "Dal'Asta et. al (2015)"
			}

--            mreport:addImage("photos/"..cell.Nome..".JPG")

			local text = "The community "

			mreport:addText(text)

			return mreport
		end
	}
        --]]
}
