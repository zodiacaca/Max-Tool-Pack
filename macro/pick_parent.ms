
clearListener()

macroScript setNewParent category:"Custom Tools"
(
	
pickParent_rc = undefined

if pick_parent_ro != undefined do DestroyDialog pick_parent_ro

rollout pick_parent_ro "Select Parent" width:220 height:242
(
	local bone_list
	local sel = 1
	
	comboBox list "" pos:[10,10] \
	width:200 height:15 \
	
	label lbl "" pos:[12,222] width:200 height:20
	
	fn bone_list =
	(
		bones = #()
		append bones "(world)"
		for obj in objects do
		(
			if classof obj == BoneGeometry then
			(
				append bones obj.name
			)
		)
		
		bones
	)
	
	on list selected pick do
	(
		sel = pick
	)
	
	on list rightClick do
	(
		popupMenu pickParent_rc
	)
	
	on pick_parent_ro open do
	(
		list.items = bone_list()
		bone = selection[1]
		if bone != undefined and classof bone == BoneGeometry then
		(
			lbl.text = bone.name
		)
	)
)

rcmenu pickParent_rc
(
	menuItem set_parent ""
	on set_parent picked do
	(
		oriTransforms = #()
		totalframes = animationrange.end as Integer/ticksperframe
		
		bone = selection[1]
		
		if bone != undefined and classof bone == BoneGeometry then
		(
			for t = 1 to (totalframes+1) do
			(
				at time (t-1)
				(
					append oriTransforms bone.transform
				)
			)
			
			if pick_parent_ro.sel == 1 then
			(
				bone.parent = undefined
			)
			else
			(
				bone.parent = getnodebyname pick_parent_ro.list.items[pick_parent_ro.sel]
			)
			
			for t = 1 to (totalframes+1) do
			(
				at time (t-1)
				(
					animate on
					(
						bone.transform = oriTransforms[t]
					)
				)
			)
		)
	)
	
	on pickParent_rc open do
	(
		set_parent.text = "Set \"" + pick_parent_ro.list.items[pick_parent_ro.sel] + "\" as parent"
	)
)

CreateDialog pick_parent_ro pos:mouse.screenpos 
)
