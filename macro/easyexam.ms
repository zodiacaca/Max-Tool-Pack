
macroScript toggleSceneState category:"Custom Tools"
(
RC_toggleObjectProperties = undefined
rcmenu RC_toggleObjectProperties
(
	local oneInBox
	local inBoxMode = oneInBox()
	
	menuItem boxMode "Box Mode" checked:inBoxMode
	on boxMode picked do
	(
		for obj in objects do
		(
			if (classOf obj) == BoneGeometry then
			(
				obj.boxMode = not inBoxMode
			)
		)
	)
	
	separator sprt1
	
	menuItem hideBone "Hide Bones" checked:false
	on hideBone picked do
	(
		for obj in objects do
		(
			if (classOf obj) == BoneGeometry then
			(
				hide obj
			)
		)
	)
	
	menuItem unhideBone "Unhide Bones" checked:false
	on unhideBone picked do
	(
		for obj in objects do
		(
			if (classOf obj) == BoneGeometry then
			(
				unhide obj
			)
		)
	)
	
	separator sprt2
	
	local impl = NitrousGraphicsManager.GetActiveViewportSetting()
	
	menuItem shadowMode "Shadow" checked:impl.ShadowsEnabled
	on shadowMode picked do
	(
		impl.ShadowsEnabled = not impl.ShadowsEnabled
	)
	
	fn oneInBox =
	(
		box = false
		
		for obj in objects do
		(
			if (classOf obj) == BoneGeometry then
			(
				if obj.boxMode then
				(
					box = true
				)
			)
		)
		
		box
	)
)

fn toggleScene =
(
	popUpMenu RC_toggleObjectProperties
)
toggleScene()
)
