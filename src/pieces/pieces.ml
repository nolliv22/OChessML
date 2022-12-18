#load "graphics.cma";;
open Graphics;;

(*Couleurs*)
let couleur0 = rgb 238 238 210;;
let couleur1 = rgb 118 150 86;;

type piece = {mutable nom: string;
      couleur: int;
      mutable image: Graphics.image;
      mutable pos: int * int;
      mutable posprec: int * int};;

(*PiÃ¨ces vides*)
let case0 =
	make_image (Array.make_matrix 40 40 couleur0);;

let case1 =
	make_image (Array.make_matrix 40 40 couleur1);;

let case_vide = 
	let color = rgb 255 255 255 in
	make_image (Array.make_matrix 40 40 color);;

let vide = {	nom = "vide";
				couleur = -1;
				image = case_vide;
				pos = (-1, -1);
				posprec = (-1, -1)};;

let non_def = {nom = "non defini";
				couleur = -1;
				image = case_vide;
				pos = (-1, -1);
				posprec = (-1, -1)};;
			
(*Pièces blanches*)		
let pion0_1 = {	nom = "pion";
				couleur = 0;
				image = pion0;
				pos = (6, 0);
				posprec = (-1, -1)};;
				
let pion0_2 = {	nom = "pion";
				couleur = 0;
				image = pion0;
				pos = (6, 1);
				posprec = (-1, -1)};;
				
let pion0_3 = {	nom = "pion";
				couleur = 0;
				image = pion0;
				pos = (6, 2);
				posprec = (-1, -1)};;
				
let pion0_4 = {	nom = "pion";
				couleur = 0;
				image = pion0;
				pos = (6, 3);
				posprec = (-1, -1)};;
				
let pion0_5 = {	nom = "pion";
				couleur = 0;
				image = pion0;
				pos = (6, 4);
				posprec = (-1, -1)};;

let pion0_6 = {	nom = "pion";
				couleur = 0;
				image = pion0;
				pos = (6, 5);
				posprec = (-1, -1)};;

let pion0_7 = {	nom = "pion";
				couleur = 0;
				image = pion0;
				pos = (6, 6);
				posprec = (-1, -1)};;
				
let pion0_8 = {	nom = "pion";
				couleur = 0;
				image = pion0;
				pos = (6, 7);
				posprec = (-1, -1)};;

let tour0_1 = {nom = "tour";
				couleur = 0;
				image = tour0;
				pos = (7, 0);
				posprec = (-1, -1)};;

let cavalier0_1 = {nom = "cavalier";
				couleur = 0;
				image = cavalier0;
				pos = (7, 1);
				posprec = (-1, -1)};;

let fou0_1 = {nom = "fou";
				couleur = 0;
				image = fou0;
				pos = (7, 2);
				posprec = (-1, -1)};;

let dame0_0 = {nom = "dame";
				couleur = 0;
				image = dame0;
				pos = (7, 3);
				posprec = (-1, -1)};;

let roi0_0 = {nom = "roi";
				couleur = 0;
				image = roi0;
				pos = (7, 4);
				posprec = (-1, -1)};;

let fou0_2 = {nom = "fou";
				couleur = 0;
				image = fou0;
				pos = (7, 5);
				posprec = (-1, -1)};;

let cavalier0_2 = {nom = "cavalier";
				couleur = 0;
				image = cavalier0;
				pos = (7, 6);
				posprec = (-1, -1)};;

let tour0_2 = {nom = "tour";
				couleur = 0;
				image = tour0;
				pos = (7, 7);
				posprec = (-1, -1)};;

(*Pièces noires*)

let pion1_1 = {	nom = "pion";
				couleur = 1;
				image = pion1;
				pos = (1, 0);
				posprec = (-1, -1)};;
				
let pion1_2 = {	nom = "pion";
				couleur = 1;
				image = pion1;
				pos = (1, 1);
				posprec = (-1, -1)};;
				
let pion1_3 = {	nom = "pion";
				couleur = 1;
				image = pion1;
				pos = (1, 2);
				posprec = (-1, -1)};;
				
let pion1_4 = {	nom = "pion";
				couleur = 1;
				image = pion1;
				pos = (1, 3);
				posprec = (-1, -1)};;
				
let pion1_5 = {	nom = "pion";
				couleur = 1;
				image = pion1;
				pos = (1, 4);
				posprec = (-1, -1)};;

let pion1_6 = {	nom = "pion";
				couleur = 1;
				image = pion1;
				pos = (1, 5);
				posprec = (-1, -1)};;

let pion1_7 = {	nom = "pion";
				couleur = 1;
				image = pion1;
				pos = (1, 6);
				posprec = (-1, -1)};;
				
let pion1_8 = {	nom = "pion";
				couleur = 1;
				image = pion1;
				pos = (1, 7);
				posprec = (-1, -1)};;

let tour1_1 = {nom = "tour";
				couleur = 1;
				image = tour1;
				pos = (0, 0);
				posprec = (-1, -1)};;

let cavalier1_1 = {nom = "cavalier";
				couleur = 1;
				image = cavalier1;
				pos = (0, 1);
				posprec = (-1, -1)};;

let fou1_1 = {nom = "fou";
				couleur = 1;
				image = fou1;
				pos = (0, 2);
				posprec = (-1, -1)};;

let dame1_1 = {nom = "dame";
				couleur = 1;
				image = dame1;
				pos = (0, 3);
				posprec = (-1, -1)};;

let roi1_1 = {nom = "roi";
				couleur = 1;
				image = roi1;
				pos = (0, 4);
				posprec = (-1, -1)};;

let fou1_2 = {nom = "fou";
				couleur = 1;
				image = fou1;
				pos = (0, 5);
				posprec = (-1, -1)};;

let cavalier1_2 = {nom = "cavalier";
				couleur = 1;
				image = cavalier1;
				pos = (0, 6);
				posprec = (-1, -1)};;

let tour1_2 = {nom = "tour";
				couleur = 1;
				image = tour1;
				pos = (0, 7);
				posprec = (-1, -1)};;
	
let reset_pieces () =
		pion0_1.nom <- "pion";
		pion0_1.image <- pion0;
		pion0_1.pos <- (6, 0);
		pion0_1.posprec <- (-1, -1);
		
		pion0_2.nom <- "pion";
		pion0_2.image <- pion0;
		pion0_2.pos <- (6, 1);
		pion0_2.posprec <- (-1, -1);
		
		pion0_3.nom <- "pion";
		pion0_3.image <- pion0;
		pion0_3.pos <- (6, 2);
		pion0_3.posprec <- (-1, -1);
		
		pion0_4.nom <- "pion";
		pion0_4.image <- pion0;
		pion0_4.pos <- (6, 3);
		pion0_4.posprec <- (-1, -1);
		
		pion0_5.nom <- "pion";
		pion0_5.image <- pion0;
		pion0_5.pos <- (6, 4);
		pion0_5.posprec <- (-1, -1);
		
		pion0_6.nom <- "pion";
		pion0_6.image <- pion0;
		pion0_6.pos <- (6, 5);
		pion0_6.posprec <- (-1, -1);

		pion0_7.nom <- "pion";
		pion0_7.image <- pion0;
		pion0_7.pos <- (6, 6);
		pion0_7.posprec <- (-1, -1);
		
		pion0_8.nom <- "pion";
		pion0_8.image <- pion0;
		pion0_8.pos <- (6, 7);
		pion0_8.posprec <- (-1, -1);

		tour0_1.nom <- "tour";
		tour0_1.image <- tour0;
		tour0_1.pos <- (7, 0);
		tour0_1.posprec <- (-1, -1);

		cavalier0_1.nom <- "cavalier";
		cavalier0_1.image <- cavalier0;
		cavalier0_1.pos <- (7, 1);
		cavalier0_1.posprec <- (-1, -1);

		fou0_1.nom <- "fou";
		fou0_1.image <- fou0;
		fou0_1.pos <- (7, 2);
		fou0_1.posprec <- (-1, -1);

		dame0_0.nom <- "dame";
		dame0_0.image <- dame0;
		dame0_0.pos <- (7, 3);
		dame0_0.posprec <- (-1, -1);

		roi0_0.nom <- "roi";
		roi0_0.image <- roi0;
		roi0_0.pos <- (7, 4);
		roi0_0.posprec <- (-1, -1);

		fou0_2.nom <- "fou";
		fou0_2.image <- fou0;
		fou0_2.pos <- (7, 5);
		fou0_2.posprec <- (-1, -1);

		cavalier0_2.nom <- "cavalier";
		cavalier0_2.image <- cavalier0;
		cavalier0_2.pos <- (7, 6);
		cavalier0_2.posprec <- (-1, -1);

		tour0_2.nom <- "tour";
		tour0_2.image <- tour0;
		tour0_2.pos <- (7, 7);
		tour0_2.posprec <- (-1, -1);

		pion1_1.nom <- "pion";
		pion1_1.image <- pion1;
		pion1_1.pos <- (1, 0);
		pion1_1.posprec <- (-1, -1);
		
		pion1_2.nom <- "pion";
		pion1_2.image <- pion1;
		pion1_2.pos <- (1, 1);
		pion1_2.posprec <- (-1, -1);
		
		pion1_3.nom <- "pion";
		pion1_3.image <- pion1;
		pion1_3.pos <- (1, 2);
		pion1_3.posprec <- (-1, -1);
		
		pion1_4.nom <- "pion";
		pion1_4.image <- pion1;
		pion1_4.pos <- (1, 3);
		pion1_4.posprec <- (-1, -1);
		
		pion1_5.nom <- "pion";
		pion1_5.image <- pion1;
		pion1_5.pos <- (1, 4);
		pion1_5.posprec <- (-1, -1);
		
		pion1_6.nom <- "pion";
		pion1_6.image <- pion1;
		pion1_6.pos <- (1, 5);
		pion1_6.posprec <- (-1, -1);
		
		pion1_7.nom <- "pion";
		pion1_7.image <- pion1;
		pion1_7.pos <- (1, 6);
		pion1_7.posprec <- (-1, -1);
		
		pion1_8.nom <- "pion";
		pion1_8.image <- pion1;
		pion1_8.pos <- (1, 7);
		pion1_8.posprec <- (-1, -1);
		
		tour1_1.nom <- "tour";
		tour1_1.image <- tour1;
		tour1_1.pos <- (0, 0);
		tour1_1.posprec <- (-1, -1);

		cavalier1_1.nom <- "cavalier";
		cavalier1_1.image <- cavalier1;
		cavalier1_1.pos <- (0, 1);
		cavalier1_1.posprec <- (-1, -1);

		fou1_1.nom <- "fou";
		fou1_1.image <- fou1;
		fou1_1.pos <- (0, 2);
		fou1_1.posprec <- (-1, -1);

		dame1_1.nom <- "dame";
		dame1_1.image <- dame1;
		dame1_1.pos <- (0, 3);
		dame1_1.posprec <- (-1, -1);

		roi1_1.nom <- "roi";
		roi1_1.image <- roi1;
		roi1_1.pos <- (0, 4);
		roi1_1.posprec <- (-1, -1);

		fou1_2.nom <- "fou";
		fou1_2.image <- fou1;
		fou1_2.pos <- (0, 5);
		fou1_2.posprec <- (-1, -1);

		cavalier1_2.nom <- "cavalier";
		cavalier1_2.image <- cavalier1;
		cavalier1_2.pos <- (0, 6);
		cavalier1_2.posprec <- (-1, -1);

		tour1_2.nom <- "tour";
		tour1_2.image <- tour1;
		tour1_2.pos <- (0, 7);
		tour1_2.posprec <- (-1, -1);
;;

let pieces_blanches tableau =
	let pieces = ref [] in
	for i=0 to 7 do
		for j=0 to 7 do
			let piece = !tableau.(i).(j) in
			if piece.couleur = 0 then pieces := !pieces@[piece];
		done;
	done;
	!pieces;;

let pieces_noires tableau =
	let pieces = ref [] in
	for i=0 to 7 do
		for j=0 to 7 do
			let piece = !tableau.(i).(j) in
			if piece.couleur = 1 then pieces := !pieces@[piece];
		done;
	done;
	!pieces;;