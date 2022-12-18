let write string x y =
	moveto x y;
	set_color black;
	draw_string string;
	();;
	
let gris = rgb 195 195 195;;

let init_espace_droit () =
	draw_image logo 320 240;
	set_color gris;
	fill_rect 320 0 520 240;
	set_color black;
	moveto 320 0;
	lineto 320 320; 

	write "Au tour de :" 380 205;
	draw_image pion0 360 160;
	draw_image pion1 440 160;
	();;

let update_espace_droit () =
	init_espace_droit ();
	
	if jeu.tour = 0 then
		begin
		set_color black;
		draw_rect 360 160 39 39;
		set_color gris;
		draw_rect 440 160 39 39;
		end
	else
		begin
		set_color black;
		draw_rect 440 160 39 39;
		set_color gris;
		draw_rect 360 160 39 39;
		end;
	
	synchronize();
	();;

let promotion_menu pion =
	let nom = ref "" and image = ref case_vide in
	
	write "Promotion :" 380 90;
	draw_rect 340 40 39 159;
	
	let image_array = [|[|dame0_0.image; fou0; cavalier0; tour0|];
							[|dame1_1.image; fou1; cavalier1; tour1|]|] in
	
	let n = if pion.couleur = 0 then 0 else 1 in
	
	draw_image image_array.(n).(0) 340 40;
	draw_image image_array.(n).(1) 380 40;
	draw_image image_array.(n).(2) 420 40;
	draw_image image_array.(n).(3) 460 40;

	synchronize ();
	
	let x = ref 0 and y = ref 0 in
	let loop = ref true in
	while !loop do
		let status = wait_next_event [Button_down] in
		x := status.mouse_x;
		y := status.mouse_y;
		if !x > 340 && !x < 500 && !y > 40 && !y < 80 then loop := false;
	done;

	if !x < 380 then 
		begin
		nom := "dame";
		image := image_array.(n).(0)
		end
	else if !x < 420 then
		begin
		nom := "fou";
		image := image_array.(n).(1)
		end
	else if !x < 460 then
		begin
		nom := "cavalier";
		image := image_array.(n).(2)
		end
	else if !x < 500 then
		begin
		nom := "tour";
		image := image_array.(n).(3)
		end;
	(!nom, !image);;

let rejouer () =	
	if jeu.tour = 1 then
		begin
		write "Echec et mat :" 370 100;
		write "Victoire des blancs" 350 85;
		end
	else
		begin
		write "Echec et mat :" 370 100;
		write "Victoire des noirs" 350 85;
		end;
	synchronize();
	
	set_color white;
	fill_rect 360 40 120 40;
	write "Rejouer" 395 50;
	synchronize();

	let x = ref 0 and y = ref 0 in
	let loop = ref true in
	while !loop do
		let status = wait_next_event [Button_down] in
		x := status.mouse_x;
		y := status.mouse_y;
		if !x > 360 && !x < 480 && !y > 40 && !y < 80 then loop := false;
	done;
	();;
	
