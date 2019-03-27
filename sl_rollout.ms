

rollout salo_ro "" width:250 height:80
(
	button btn1 "Save" pos:[5,10] width:100 height:30
	on btn1 pressed  do
	(
		
		
-- 		f_path = getSavePath caption:"Choose file directory"
-- 		if f_path != undefined then
-- 		(
-- 			f_path += "\\salo_information.txt"
-- 			f = createFile f_path
-- 			format  to:f
-- 			close f
-- 			free f
-- 		)
	)
	
	button btn2 "Load" pos:[130,10] width:100 height:30
	on btn2 pressed  do
	(
		info = #()
		
		f_path = getOpenFileName caption:"Open Saved:" types:"TXT (*.txt)|*.txt|All (*.*)|*.*|"
		if f_path != undefined then
		(
			file = openFile f_path
			num = 1
			while eof file == false do
			(
				
				
				num += 1
			)
		)
		
		
	)
)

if salo_rf != undefined do closeRolloutFloater salo_rf
salo_rf = newRolloutFloater "" 250 80 20 80
addRollout salo_ro	salo_rf
