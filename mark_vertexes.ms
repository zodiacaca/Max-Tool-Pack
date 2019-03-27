
unregisterRedrawViewsCallback GW_display
GW_display = undefined

fn GW_display =
(
	verts = getVertSelection $
	verts = verts as array
	
	for i = 1 to verts.count do
	(
		gw.Marker (getVert $ verts[i]) #bigBox color:red
	)
)

registerRedrawViewsCallback GW_display
