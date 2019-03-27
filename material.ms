
clearlistener()

rollout mat_ro "" width:250 height:80
(
	struct materials
	(
		diff,
		bump,
		glos,
		alpha
	)
	
	local mats = #()
	
	button btn1 "Save" pos:[5,10] width:100 height:30
	on btn1 pressed  do
	(
		mats = #()
		for sMat in sceneMaterials do
		(
			for i = 1 to sMat.count do
			(
				if sMat[i] != undefined then
				(
					m = materials()
					if sMat[i].diffuseMap != undefined then
					(
						m.diff = sMat[i].diffuseMap.fileName
					)
					if sMat[i].bumpMap != undefined then
					(
						m.bump = sMat[i].bumpMap.fileName
					)
					if sMat[i].glossinessMap != undefined then
					(
						m.glos = sMat[i].glossinessMap.fileName
					)
					if sMat[i].opacityMap != undefined then
					(
						m.alpha = sMat[i].opacityMap.fileName
					)
					
					append mats m
				)
			)
		)
		
		XmlDoc = dotNetObject "System.Xml.XmlDocument"
		root = XmlDoc.createElement "sceneMaterials"
		XmlDoc.appendChild root
		
		for i = 1 to mats.count do
		(
			newElement = XmlDoc.createElement "Materials"
			
			newElement.setAttribute "Diffuse" mats[i].diff
			if mats[i].bump != undefined do
				newElement.setAttribute "Bump" mats[i].bump
			if mats[i].glos != undefined do
				newElement.setAttribute "Glossiness" mats[i].glos
			if mats[i].alpha != undefined do
				newElement.setAttribute "Opacity" mats[i].alpha
			
			root.appendChild newElement
		)
		
		f_path = getSavePath caption:"Choose file directory"
		if f_path != undefined then
		(
			f_path += "\\mat_information.xml"
			XmlDoc.save f_path
		)
	)
	
	button btn2 "Load" pos:[130,10] width:100 height:30
	on btn2 pressed  do
	(
		info = #()
		
		f_path = getOpenFileName caption:"Open Saved:" types:"XML (*.xml)|*.xml|All (*.*)|*.*|"
		if f_path != undefined then
		(
			XmlDoc = dotNetObject "System.Xml.XmlDocument"
			XmlDoc.Load f_path
			docEle = XmlDoc.documentElement
			if docEle != undefined and docEle.name == "sceneMaterials" then
			(
				for i = 0 to docEle.childNodes.count - 1 do
				(
					diff_file = (docEle.childNodes.itemOf[i].attributes.getNamedItem "Diffuse").value
					if (docEle.childNodes.itemOf[i].attributes.getNamedItem "Bump") != undefined do
						bump_file = (docEle.childNodes.itemOf[i].attributes.getNamedItem "Bump").value
					if (docEle.childNodes.itemOf[i].attributes.getNamedItem "Glossiness") != undefined do
						glos_file = (docEle.childNodes.itemOf[i].attributes.getNamedItem "Glossiness").value
					if (docEle.childNodes.itemOf[i].attributes.getNamedItem "Opacity") != undefined do
						alpha_file = (docEle.childNodes.itemOf[i].attributes.getNamedItem "Opacity").value
					
					for sMat in sceneMaterials do
					(
						for ii = 1 to sMat.count do
						(
							if sMat[ii] != undefined then
							(
								if sMat[ii].diffuseMap.fileName == diff_file then
								(
									if bump_file != undefined then
									(
										tex = bitmaptexture()
										tex.filename = bump_file
										sMat[ii].bumpMap = tex
									)
									if glos_file != undefined then
									(
										tex = bitmaptexture()
										tex.filename = glos_file
										sMat[ii].glossinessMap = tex
									)
									if alpha_file != undefined then
									(
										tex = bitmaptexture()
										tex.filename = alpha_file
										sMat[ii].opacityMap = tex
										sMat[ii].opacityMap.monoOutput = 1
									)
								)
							)
						)
					)
				)
			)
		)
		
		
	)
)

if mat_rf != undefined do closeRolloutFloater mat_rf
mat_rf = newRolloutFloater "" 250 80 20 80
addRollout mat_ro	mat_rf
