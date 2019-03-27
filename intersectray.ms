
clearListener()

unregisterRedrawViewsCallback v_display
v_display = undefined

fn v_display =
(
	coordSysTM = Inverse(getViewTM())
	viewDir = -coordSysTM.row3
	viewPt = coordSysTM.row4
	r = ray viewPt viewDir
	i = (intersectray $ r)	
	
	if i != undefined then
	(
		gw.Marker i.position #circle color:red
		print i.position
	)
)

fn myFn =
(
-- 	registerRedrawViewsCallback v_display
	
	undefined
)
myFn()
