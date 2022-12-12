-- santarem
import("publish")

local description = [[
Esta aplicação apresenta resultados obtidos durante o trabalho de campo em comunidades de terra firme da região do Planalto Santareno, municípios de Belterra, Mojuí dos Campos e Santarém, estado do Pará, realizado de 06 a 26 de setembro de 2013. Esse trabalho complementa os levantamentos de campo realizados anteriormente nas comunidades ribeirinhas do Tapajós e Arapiuns em 2009 e 2012, respectivamente. O objetivo principal identificar e caracterizar as comunidades em relação à infraestrutura, aos serviços de saúde e de educação, bem como os usos e coberturas da terra e a produção rural.<br>
Fonte: <a href="http://urlib.net/8JMKD3MGP3W34P/3PAAHQ5"  target="_blank">Dal'Asta et al. As Comunidades De Terra Firme Do Sudoeste Do Pará: População, Infraestrutura, Serviços, Uso Da Terra E Conectividades</a>.
]]

Application{
    key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = "santarem.tview",
	description = description,
	base = "roadmap",
	clean = true,
	template = {navbar = "darkblue", title = "white"},
    display = false,
    trajectory = View{
		description = "Route.",
		width = 3,
		border = "blue",
		icon = {
			path = "M150 0 L75 200 L225 200 Z",
			transparency = 0.2,
			time = 45
		}
	},
	points = View{
		description = "Assentamentos correspodem a agrovilas, vilas e comunidades.",
		select = {"COMUNIDADE", "micon2"},
		icon = {"yellow_home"},
		label = {"home"},
		report = function(cell)
			local mreport = Report{
				title = cell.COMUNIDADE,
				author = "Dal'Asta et. al (2015)"
			}

            if cell.Foto_CMM ~= "NO" then
                mreport:addImage("photos/Foto_CMM/"..cell.Foto_CMM..".jpg")
            end

            if cell.Foto_Uso ~= "NO" then
                mreport:addImage("photos/Foto_uso/"..cell.Foto_Uso..".jpg")
            end

			return mreport
		end
	}
}
