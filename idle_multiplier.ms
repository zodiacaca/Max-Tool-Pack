
totalframes = animationrange.end as Integer/ticksperframe
totalframes += 1

ctrArray = #()

r_upperarm = getnodebyname "r_upperarm"
r_upperarm_c = r_upperarm.rotation.controller
append ctrArray r_upperarm_c

r_forearm = getnodebyname "r_forearm"
r_forearm_c = r_forearm.rotation.controller
append ctrArray r_forearm_c

r_wrist = getnodebyname "r_wrist"
r_wrist_c = r_wrist.rotation.controller
append ctrArray r_wrist_c

l_upperarm = getnodebyname "l_upperarm"
l_upperarm_c = l_upperarm.rotation.controller
append ctrArray l_upperarm_c

l_forearm = getnodebyname "l_forearm"
l_forearm_c = l_forearm.rotation.controller
append ctrArray l_forearm_c

l_wrist = getnodebyname "l_wrist"
l_wrist_c = l_wrist.rotation.controller
append ctrArray l_wrist_c

oriRotations = #()

at time 0
(
	for b = 1 to ctrArray.count do
	(
		ang = [ 0, 0, 0 ]
		ang.x = ctrArray[b].x_rotation
		ang.y = ctrArray[b].y_rotation
		ang.z = ctrArray[b].z_rotation
		append oriRotations ang
	)
)

animate ON
(
	for t = 1 to totalframes do
	(
		at time t
		(
			for b = 1 to ctrArray.count do
			(
				ctrArray[b].x_rotation = (ctrArray[b].x_rotation - oriRotations[b].x) * 10 + oriRotations[b].x
				ctrArray[b].y_rotation = (ctrArray[b].y_rotation - oriRotations[b].y) * 10 + oriRotations[b].y
				ctrArray[b].z_rotation = (ctrArray[b].z_rotation - oriRotations[b].z) * 10 + oriRotations[b].z
			)
		)
	)
)
