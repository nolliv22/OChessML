(*Dossier de travail*)
Sys.chdir WORKING_DIR;;

(*###Module Graphics###*)
#load "graphics.cma";;
open Graphics;;
open_graph " 520x320+500+200";;
set_window_title "OChessML";;
auto_synchronize false;;

(*Ecran de chargement*)
#directory "";;
#use "logo.ml";;
let chargement () =
	draw_image logo 160 140;
	moveto 180 140;
	set_color black;
	lineto 340 140;
	moveto 185 120;
	draw_string "Chargement en cours...";
	synchronize ();
	();;
chargement ();;

(*###Importation des pièces###*)
#directory "pieces";;

(*Importation des Graphics.image des pièces*)
#use "cavalier0.ml";;
#use "cavalier1.ml";;
#use "fou0.ml";;
#use "fou1.ml";;
#use "pion0.ml";;
#use "pion1.ml";;
#use "dame0.ml";;
#use "dame1.ml";;
#use "roi0.ml";;
#use "roi1.ml";;
#use "tour0.ml";;
#use "tour1.ml";;

(*Importation des données des pieces*)
#use "pieces.ml";;

(*###Génération du jeu d'échec###*)
(*Passage tableau-plateau*)
let j2x j = 40*j;; 
let i2y i = -40*(i-7);;

let x2j x = x/40;;
let y2i y = -y/40 + 7;;

(*Créer le tableau du jeu*)
let tableau = ref (Array.make_matrix 8 8 vide);;

let tableau_initial = 
	[|
	[|tour1_1; cavalier1_1; fou1_1; dame1_1; roi1_1; fou1_2; cavalier1_2; tour1_2|];
	[|pion1_1; pion1_2; pion1_3; pion1_4; pion1_5; pion1_6; pion1_7; pion1_8|];
	[|vide; vide; vide; vide; vide; vide; vide; vide|];
	[|vide; vide; vide; vide; vide; vide; vide; vide|];
	[|vide; vide; vide; vide; vide; vide; vide; vide|];
	[|vide; vide; vide; vide; vide; vide; vide; vide|];
	[|pion0_1; pion0_2; pion0_3; pion0_4; pion0_5; pion0_6; pion0_7; pion0_8|];
	[|tour0_1; cavalier0_1; fou0_1; dame0_0; roi0_0; fou0_2; cavalier0_2; tour0_2|];	
	|];;

let reset_tableau () =
	for i=0 to 7 do
		for j=0 to 7 do
			!tableau.(i).(j) <- tableau_initial.(i).(j);
		done;
	done;
();;

(*Créer le plateau de jeu*)
let plateau () =
	for i=0 to 7 do
		for j=0 to 7 do
			if i mod 2 = j mod 2
			then draw_image case0 (j2x j) (i2y i)
			else draw_image case1 (j2x j) (i2y i);
			
			let piece = !tableau.(i).(j) in
			if piece.nom <> "vide" then
			draw_image piece.image (j2x j) (i2y i);
		done;
	done;
	();;

(*Status définissant l'état du jeu*)
type status = { 	mutable tour : int;
						mutable preview : bool;
						mutable preview_pos : int*int;
						};;
						
let jeu = {	tour = 0;
				preview = false;
				preview_pos = (-1, -1)};;

let reset_jeu () =
	jeu.tour <- 0;
	jeu.preview <- false;
	jeu.preview_pos <- (-1, -1);
();;

(*Faire ressortir la case cliquée*)
let draw_rect x y h l =
	moveto x y;
	lineto (x+l) y;
	lineto (x+l) (y+h);
	lineto x (y+h);
	lineto x y;
	();;

let select_case i j color = 
	let x, y = j2x j, i2y i in
	set_color color;
	draw_rect x y 39 39;
	draw_rect (x+1) (y+1) 37 37;
	();;

(*Importation des actions et du menu*)
#directory "";;
#use "menu.ml";;
#use "action.ml";;

(*Preview des actions possibles*)
let preview_color = rgb 17 116 165;;

let preview_action i j =
	let tableau_actions = get_valides_actions i j in
	for i_=0 to 7 do
		for j_=0 to 7 do
		let action = tableau_actions.(i_).(j_) in
		if action.nom <> "aucune" then
			select_case i_ j_ preview_color;
		done;
	done;
	;;

let show_echec () =
	let roi = ref vide in
	if jeu.tour = 0 then roi := roi0_0 else roi := roi1_1;
	if en_echec !roi then 
	begin
	let r, s = !roi.pos in
	select_case r s red;
	end;
	();;

(*Clic*)
let on_click () =
	let status = wait_next_event [Button_down] in
	let x, y = status.mouse_x, status.mouse_y in
	if x >= 0 && x <= 320 && y >= 0 && y <= 320 then
	begin 
		let i, j = (y2i y, x2j x) in
		
		plateau();

		if jeu.preview = false then
			begin
			if jeu.tour = !tableau.(i).(j).couleur then preview_action i j;
			select_case i j preview_color;
			jeu.preview <- true;
			jeu.preview_pos <- (i, j);
			end
		else
			begin
			let i_, j_ = jeu.preview_pos in
			if jeu.tour = !tableau.(i_).(j_).couleur then
				begin
				let tableau_action = get_valides_actions i_ j_ in
				let action = tableau_action.(i).(j) in
				
				if action.nom <> "aucune" then 
					begin
						play_action action i j;
						if jeu.tour = 0 
						then jeu.tour <- 1
						else jeu.tour <- 0;
					end;
				end;
			plateau();
			jeu.preview <- false;
		end;
		show_echec ();
		synchronize ();
	end;
	;;

let rec play () =
	reset_tableau ();
	reset_pieces ();
	reset_jeu ();
	reset_last_action ();

	clear_graph ();
	plateau ();
	update_espace_droit ();
	
	while not (mat ()) do
		on_click ();
		sound 250 100;
		update_espace_droit ();
	done;
	rejouer ();
	play ();
	();;

play();;
