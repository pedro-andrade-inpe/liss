-------------------------------------------------------------------------------------------
-- TerraME - a software platform for multiple scale spatially-explicit dynamic modeling.
-- Copyright (C) 2001-2016 INPE and TerraLAB/UFOP -- www.terrame.org

-- This code is part of the TerraME framework.
-- This framework is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 2.1 of the License, or (at your option) any later version.

-- You should have received a copy of the GNU Lesser General Public
-- License along with this library.

-- The authors reassure the license terms regarding the warranties.
-- They specifically disclaim any warranties, including, but not limited to,
-- the implied warranties of merchantability and fitness for a particular purpose.
-- The framework provided hereunder is on an "as is" basis, and the authors have no
-- obligation to provide maintenance, support, updates, enhancements, or modifications.
-- In no event shall INPE and TerraLAB / UFOP be held liable to any party for direct,
-- indirect, special, incidental, or consequential damages arising out of the use
-- of this software and its documentation.
--
-------------------------------------------------------------------------------------------

-- @example Implementation of a simple Application using Arapiuns.
-- The data of this application were extracted from Escada et. al (2013) Infraestrutura,
-- Serviços e Conectividade das Comunidades Ribeirinhas do Arapiuns, PA. Relatório técnico, INPE.

import("publish")

local description = [[
	...
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

			report:addText("bla bla bla")
			return report
		end
	}
}
