
clearListener()

fn findZAxis pos1 pos2 =
(
	nor = normalize (pos2 - pos1)
	
	x = random -100.0 100
	y = random -100.0 100
	z = (-nor.x*(x-pos1.x)-nor.y*(y-pos1.y))/nor.z + pos1.z
	
	normalize [x,y,z]
)

fn myFn =
(
	b1 = getnodebyname "SkirtA01"
	b2 = getnodebyname "SkirtA02"
	
	pos1 = b1.position
	pos2 = b2.position
	
	b3 = BoneSys.createBone pos1 pos2 (findZAxis pos1 pos2)
	b3.name = b1.name
	b3.wirecolor = red
	
	undefined
)
myFn()
