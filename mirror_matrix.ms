
fn myFn =
(
	b1 = getnodebyname "Skirtc04"
	b2 = getnodebyname "Skirtd04"
	
	flipMatrix = scaleMatrix [1,-1,1]	-- flip Y
	mirrorMatrix = scaleMatrix [-1,1,1]	-- mirror across X
	b2.transform = flipMatrix*b1.transform*mirrorMatrix
	
	undefined
)
myFn()
