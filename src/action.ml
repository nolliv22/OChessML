type action = {nom : string;
					piecedep_av : piece;
					piecearv_av : piece;
					piecedep_ap : piece;
					piecearv_ap : piece;}

let aucune = {	nom = "aucune";
					piecedep_av = vide;
					piecearv_av = vide;
					piecedep_ap = vide;
					piecearv_ap = vide;}

(*Actions globales*)
let deplacement piece =
{	nom = "deplacement";
	piecedep_av = piece;
	piecearv_av = vide;	
	piecedep_ap = vide;
	piecearv_ap = piece;}

let prise piece i j =
{	nom = "prise";
	piecedep_av = piece;
	piecearv_av = !tableau.(i).(j);
	piecedep_ap = vide;
	piecearv_ap = piece;}

(*Actions particulières*)
let petit_roque roi =
	let tour = ref vide in
	if roi.couleur = 0 
	then tour := tour0_2
	else tour := tour1_2;
	
  {nom = "petit_roque";
	piecedep_av = vide;
	piecearv_av = vide;	
	piecedep_ap = roi;
	piecearv_ap = !tour;};;

let grand_roque roi =
	let tour = ref vide in
	if roi.couleur = 0 
	then tour := tour0_1
	else tour := tour1_1;
	
  {nom = "grand_roque";
	piecedep_av = vide;
	piecearv_av = vide;	
	piecedep_ap = roi;
	piecearv_ap = !tour;};;

let promotion pion i j =
  {nom = "promotion";
	piecedep_av = pion;
	piecearv_av = !tableau.(i).(j);
	piecedep_ap = vide;
	piecearv_ap = pion;};;
	
(********************************************************************************************************)
(*Génération d'un tableau des actions possibles*)
let case_autorisee i j piece = match i, j with
| i, j when i < 0 || i > 7 || j < 0 || j > 7 -> false;
| i, j when !tableau.(i).(j).couleur = piece.couleur -> false
| _, _ -> true;;

(*Pion*)
let actions_pion pion =
	let i, j = pion.pos and tableau_actions = ref (Array.make_matrix 8 8 aucune) in
	let (-+) a b =
		if pion.couleur = 0 then a - b else a + b 
	and couleur_ennemie =
		if pion.couleur = 0 then 1 else 0 
	and p = (*Case avant promotion*)
		if pion.couleur = 0 then 1 else 6 in

	if case_autorisee (i-+2) j pion && pion.posprec = (-1, -1) && !tableau.(i-+2).(j).nom = "vide"
	then !tableau_actions.(i-+2).(j) <- deplacement pion;				(*Pion avance de deux cases si premier déplacement*)

	if case_autorisee (i-+1) j pion && !tableau.(i-+1).(j).nom = "vide" then
		begin
		if i = p then !tableau_actions.(i-+1).(j) <- promotion pion (i-+1) j
		else !tableau_actions.(i-+1).(j) <- deplacement pion;			(*Pion avance d'une case*)
		end;
			
	if case_autorisee (i-+1) (j-1) pion && !tableau.(i-+1).(j-1).couleur = couleur_ennemie then
		begin
		if i = p then !tableau_actions.(i-+1).(j-1) <- promotion pion (i-+1) (j-1)
		else !tableau_actions.(i-+1).(j-1) <- prise pion (i-+1) (j-1);	(*Prise en diagonale à gauche*)
		end;
	
	if case_autorisee (i-+1) (j+1) pion && !tableau.(i-+1).(j+1).couleur = couleur_ennemie then
		begin
		if i = p then !tableau_actions.(i-+1).(j+1) <- promotion pion (i-+1) (j+1)
		else !tableau_actions.(i-+1).(j+1) <- prise pion (i-+1) (j+1);	(*Prise en diagonale à droite*)
		end;

	!tableau_actions;;

(*Tour*)
let actions_tour tour =
	let i, j = tour.pos and tableau_actions = ref (Array.make_matrix 8 8 aucune) in
			
	let n = ref 1 and quit_loop = ref false in
	while not !quit_loop do
		if not (case_autorisee (i + !n) j tour) 
		then quit_loop := true
		else
			begin
			if !tableau.(i + !n).(j).nom = "vide" 
				then !tableau_actions.(i + !n).(j) <- deplacement tour
				else 
					begin
					!tableau_actions.(i + !n).(j) <- prise tour (i + !n) j;
					quit_loop := true;
					end;
			end;
		if !n = 8 then quit_loop := true else n := !n + 1;
	done;

	let n = ref 1 and quit_loop = ref false in
	while not !quit_loop do
		if not (case_autorisee (i - !n) j tour) 
		then quit_loop := true
		else
			begin
			if !tableau.(i - !n).(j).nom = "vide" 
				then !tableau_actions.(i - !n).(j) <- deplacement tour
				else 
					begin
					!tableau_actions.(i - !n).(j) <- prise tour (i - !n) j;
					quit_loop := true;
					end;
			end;
		if !n = 8 then quit_loop := true else n := !n + 1;
	done;

	let n = ref 1 and quit_loop = ref false in
	while not !quit_loop do
		if not (case_autorisee i (j + !n) tour) 
		then quit_loop := true
		else
			begin
			if !tableau.(i).(j + !n).nom = "vide" 
				then !tableau_actions.(i).(j + !n) <- deplacement tour
				else 
					begin
					!tableau_actions.(i).(j + !n) <- prise tour (i) (j + !n);
					quit_loop := true;
					end;
			end;
		if !n = 8 then quit_loop := true else n := !n + 1;
	done;

	let n = ref 1 and quit_loop = ref false in
	while not !quit_loop do
		if not (case_autorisee i (j - !n) tour) 
		then quit_loop := true
		else
			begin
			if !tableau.(i).(j - !n).nom = "vide" 
				then !tableau_actions.(i).(j - !n) <- deplacement tour
				else 
					begin
					!tableau_actions.(i).(j - !n) <- prise tour (i) (j - !n);
					quit_loop := true;
					end;
			end;
		if !n = 8 then quit_loop := true else n := !n + 1;
	done;
	!tableau_actions;;

(*Fou*)
let actions_fou fou =
	let i, j = fou.pos and tableau_actions = ref (Array.make_matrix 8 8 aucune) in
			
	let n = ref 1 and quit_loop = ref false in
	while not !quit_loop do
		if not (case_autorisee (i + !n) (j + !n) fou) 
		then quit_loop := true
		else
			begin
			if !tableau.(i + !n).(j + !n).nom = "vide" 
				then !tableau_actions.(i + !n).(j + !n) <- deplacement fou
				else 
					begin
					!tableau_actions.(i + !n).(j + !n) <- prise fou (i + !n) (j + !n);
					quit_loop := true;
					end;
			end;
		if !n = 8 then quit_loop := true else n := !n + 1;
	done;

	let n = ref 1 and quit_loop = ref false in
	while not !quit_loop do
		if not (case_autorisee (i + !n) (j - !n) fou) 
		then quit_loop := true
		else
			begin
			if !tableau.(i + !n).(j - !n).nom = "vide" 
				then !tableau_actions.(i + !n).(j - !n) <- deplacement fou
				else 
					begin
					!tableau_actions.(i + !n).(j - !n) <- prise fou (i + !n) (j - !n);
					quit_loop := true;
					end;
			end;
		if !n = 8 then quit_loop := true else n := !n + 1;
	done;

	let n = ref 1 and quit_loop = ref false in
	while not !quit_loop do
		if not (case_autorisee (i - !n) (j - !n) fou) 
		then quit_loop := true
		else
			begin
			if !tableau.(i - !n).(j - !n).nom = "vide" 
				then !tableau_actions.(i - !n).(j - !n) <- deplacement fou
				else 
					begin
					!tableau_actions.(i - !n).(j - !n) <- prise fou (i - !n) (j - !n);
					quit_loop := true;
					end;
			end;
		if !n = 8 then quit_loop := true else n := !n + 1;
	done;

	let n = ref 1 and quit_loop = ref false in
	while not !quit_loop do
		if not (case_autorisee (i - !n) (j + !n) fou) 
		then quit_loop := true
		else
			begin
			if !tableau.(i - !n).(j + !n).nom = "vide" 
				then !tableau_actions.(i - !n).(j + !n) <- deplacement fou
				else 
					begin
					!tableau_actions.(i - !n).(j + !n) <- prise fou (i - !n) (j + !n);
					quit_loop := true;
					end;
			end;
		if !n = 8 then quit_loop := true else n := !n + 1;
	done;
	!tableau_actions;;

(*Cavalier*)
let actions_cavalier cavalier =
	let tableau_actions = ref (Array.make_matrix 8 8 aucune) in
	let i, j = cavalier.pos in
	let depl_cavalier = [(-2, -1); (-2, 1); (2, -1); (2, 1); (-1, 2); (-1, -2); (1, 2); (1, -2)] in
	
	for n=0 to (List.length depl_cavalier) - 1 do
		let i_, j_ = List.nth depl_cavalier n in
		if case_autorisee (i + i_) (j + j_) cavalier then
			begin
			if !tableau.(i + i_).(j + j_).nom = "vide" 
			then !tableau_actions.(i + i_).(j + j_) <- deplacement cavalier
			else !tableau_actions.(i + i_).(j + j_) <- prise cavalier (i + i_) (j + j_);
			end
	done;
	!tableau_actions;;

(*Dame*)
let actions_dame dame =
	let tableau_actions = ref (Array.make_matrix 8 8 aucune) in
	let actions_diagonales = actions_fou dame and actions_droites = actions_tour dame in
	
	for i=0 to 7 do
		for j=0 to 7 do
			if actions_diagonales.(i).(j).nom <> "aucune" then
			!tableau_actions.(i).(j) <- actions_diagonales.(i).(j);
			
			if actions_droites.(i).(j).nom <> "aucune" then
			!tableau_actions.(i).(j) <- actions_droites.(i).(j);
		done;
	done;
	!tableau_actions;;

(*Actions de toutes les pièces sauf le roi*)
let get_actions_sans_roi i j =
	let tableau_actions = ref (Array.make_matrix 8 8 aucune) in
	let piece = !tableau.(i).(j) in
		
	if piece.nom = "pion" then tableau_actions := actions_pion piece;
	if piece.nom = "tour" then tableau_actions := actions_tour piece;
	if piece.nom = "cavalier" then tableau_actions := actions_cavalier piece;
	if piece.nom = "fou" then tableau_actions := actions_fou piece;
	if piece.nom = "dame" then tableau_actions := actions_dame piece;
	!tableau_actions;;

(*Roi*)
let case_autorisee_roi i j roi =
	let flag = ref true in
	let pieces = ref [] in
	if roi.couleur = 0 then
		pieces := pieces_noires tableau
	else
		pieces := pieces_blanches tableau;
	
	if case_autorisee i j roi then
		begin
		for n = 0 to (List.length !pieces)-1 do
			let i_, j_ = (List.nth !pieces n).pos in
			let tableau_actions = get_actions_sans_roi i_ j_ in
			if tableau_actions.(i).(j).nom <> "aucune" then flag := false;
		done;
		end
	else flag := false;
	!flag;;	
	
let actions_roi roi =
	let i, j = roi.pos and tableau_actions = ref (Array.make_matrix 8 8 aucune) in
	
	for n = i-1 to i+1 do
		for m = j-1 to j+1 do
			if case_autorisee_roi n m roi then
				begin
				if !tableau.(n).(m).nom = "vide" 
				then !tableau_actions.(n).(m) <- deplacement roi
				else !tableau_actions.(n).(m) <- prise roi n m;
				end;
		done;
	done;
	
	let n = ref 0 in
	if roi.couleur = 0 then n := 7 else n := 0;
	
	if roi.posprec = (-1, -1) then
		begin
		if !tableau.(!n).(5).nom = "vide" 
		&& !tableau.(!n).(6).nom = "vide" 
		&& !tableau.(!n).(7).nom = "tour" 
		&& !tableau.(!n).(7).posprec = (-1, -1) 
		then !tableau_actions.(!n).(6) <- petit_roque roi;
		
		if !tableau.(!n).(3).nom = "vide"
		&& !tableau.(!n).(2).nom = "vide"
		&& !tableau.(!n).(1).nom = "vide" 
		&& !tableau.(!n).(0).nom = "tour" 
		&& !tableau.(!n).(0).posprec = (-1, -1) 
		then !tableau_actions.(!n).(2) <- grand_roque roi;
		end;		
	
	!tableau_actions;;

(*Calculs de toutes les actions avant vérification*)
let get_all_actions i j =
	let tableau_actions = ref (Array.make_matrix 8 8 aucune) in
	let piece = !tableau.(i).(j) in

	if piece.nom = "roi" 
	then tableau_actions := actions_roi piece
	else tableau_actions := get_actions_sans_roi i j;
	!tableau_actions;;

let en_echec roi =
	let flag = ref false in
	let pieces = if roi.couleur = 0 then pieces_noires tableau else pieces_blanches tableau in
	for n=0 to (List.length pieces)-1 do
		let piece = (List.nth pieces n) in
		let i,j = piece.pos in
		let tableau_actions = get_all_actions i j in
		for a=0 to 7 do
			for b=0 to 7 do
				let action = tableau_actions.(a).(b) in
				if action.nom = "prise" 
					&& action.piecearv_av.nom = "roi" 
					&& action.piecearv_av.couleur = roi.couleur
				then flag := true;
			done;
		done;
	done;	
	!flag;;

(*Dernière action*)
type last_action_type = {	mutable nature : string;
									mutable piecedep : piece;
									mutable piecearv : piece;
									mutable piecedep_pos : int*int;
									mutable piecearv_pos : int*int;
									mutable piecedep_posprec : int*int;
									mutable piecearv_posprec : int*int;
									};;

let last_action = {	nature = "aucune";
							piecedep = vide;
							piecearv = vide;
							piecedep_pos = (-1, -1);
							piecearv_pos = (-1, -1);
							piecedep_posprec = (-1, -1);
							piecearv_posprec = (-1, -1);
							};;

let reset_last_action () =
	last_action.nature <- "aucune";
	last_action.piecedep <- vide;
	last_action.piecearv <- vide;
	last_action.piecedep_pos <- (-1, -1);
	last_action.piecearv_pos <- (-1, -1);
	last_action.piecedep_posprec <- (-1, -1);
	last_action.piecearv_posprec <- (-1, -1);
();;
							
(*Executer l'action*)
let play_global_action action i j =
	last_action.nature <- "globale";
	last_action.piecedep <- action.piecedep_av;
	last_action.piecearv <- action.piecearv_av;
	last_action.piecedep_pos <- action.piecedep_av.pos;
	last_action.piecearv_pos <- (i, j);
	last_action.piecedep_posprec <- action.piecedep_av.posprec;
	last_action.piecearv_posprec <- action.piecearv_av.posprec;
	
	let i_, j_ = action.piecedep_av.pos in
	!tableau.(i).(j) <- action.piecearv_ap;
	action.piecearv_ap.pos <- (i, j);
	action.piecearv_ap.posprec <- (i_, j_);
	!tableau.(i_).(j_) <- action.piecedep_ap;
	();;

let undo_global_action () =
	let i, j = last_action.piecedep_pos and i_, j_ = last_action.piecedep_posprec in
	!tableau.(i).(j) <- last_action.piecedep;
	!tableau.(i).(j).pos <- (i, j);
	!tableau.(i).(j).posprec <- (i_, j_);

	let i, j = last_action.piecearv_pos and i_, j_ = last_action.piecearv_posprec in
	!tableau.(i).(j) <- last_action.piecearv;
	!tableau.(i).(j).pos <- (i, j);
	!tableau.(i).(j).posprec <- (i_, j_);
	();;

let play_roque action =
	let i = ref 0 in
	let roi = action.piecedep_ap and tour = action.piecearv_ap in
	if roi.couleur = 0 then i := 7 else i := 0;
	
	if action.nom = "petit_roque" then
		begin
		!tableau.(!i).(6) <- roi;
		roi.posprec <- roi.pos ;
		roi.pos <- (!i, 6);
		!tableau.(!i).(4) <- vide;
		
		!tableau.(!i).(5) <- tour;
		tour.posprec <- tour.pos ;
		tour.pos <- (!i, 5);
		!tableau.(!i).(7) <- vide;
		
		last_action.nature <- "petit_roque";
		end;

	if action.nom = "grand_roque" then
		begin
		!tableau.(!i).(2) <- roi;
		roi.posprec <- roi.pos ;
		roi.pos <- (!i, 2);
		!tableau.(!i).(4) <- vide;
		
		!tableau.(!i).(3) <- tour;
		tour.posprec <- tour.pos ;
		tour.pos <- (!i, 3);
		!tableau.(!i).(0) <- vide;
		
		last_action.nature <- "grand_roque";
		end;
	
	last_action.piecedep <- roi;
	last_action.piecearv <- tour;
	();;

let undo_roque () =
	let roi = last_action.piecedep and tour = last_action.piecearv in 
	let i = ref 0 in
	if roi.couleur = 0 then i := 7 else i := 0;
	
	if last_action.nature = "petit_roque" then
		begin
		!tableau.(!i).(6) <- vide;
		roi.posprec <- (-1, -1) ;
		roi.pos <- (!i, 4);
		!tableau.(!i).(4) <- roi;
		
		!tableau.(!i).(5) <- vide;
		tour.posprec <- (-1, -1) ;
		tour.pos <- (!i, 7);
		!tableau.(!i).(7) <- tour;
		end;

	if last_action.nature = "grand_roque" then
		begin
		!tableau.(!i).(2) <- vide;
		roi.posprec <- (-1, -1) ;
		roi.pos <- (!i, 4);
		!tableau.(!i).(4) <- roi;
		
		!tableau.(!i).(3) <- vide;
		tour.posprec <- (-1, -1) ;
		tour.pos <- (!i, 0);
		!tableau.(!i).(0) <- tour;
		end;
	();;

let play_promotion action i j piece =
	let forcer_typage = piece.couleur in
	
	last_action.nature <- "promotion";
	last_action.piecedep <- action.piecedep_av;
	last_action.piecearv <- action.piecearv_av;
	last_action.piecedep_pos <- action.piecedep_av.pos;
	last_action.piecearv_pos <- (i, j);
	last_action.piecedep_posprec <- action.piecedep_av.posprec;
	last_action.piecearv_posprec <- action.piecearv_av.posprec;
	
	let i_, j_ = action.piecedep_av.pos in
	!tableau.(i).(j) <- action.piecearv_ap;
	action.piecearv_ap.pos <- (i, j);
	action.piecearv_ap.posprec <- (i_, j_);
	!tableau.(i_).(j_) <- action.piecedep_ap;
	
	let pion = !tableau.(i).(j) in
	if piece.nom = "vide" then
		begin
		let nom, image = promotion_menu pion in
		pion.nom <- nom;
		pion.image <- image;
		end
	else
		begin
		let image_array = [|[|dame0_0.image; fou0; cavalier0; tour0|];
								[|dame1_1.image; fou1; cavalier1; tour1|]|] in
		let n = pion.couleur in
		
		if piece.nom = "dame" then 
			begin
			pion.nom <- "dame";
			pion.image <- image_array.(n).(0)
			end;
		if piece.nom = "fou" then
			begin
			pion.nom <- "fou";
			pion.image <- image_array.(n).(1)
			end;
		if piece.nom = "cavalier" then
			begin
			pion.nom <- "cavalier";
			pion.image <- image_array.(n).(2)
			end;
		if piece.nom = "tour" then
			begin
			pion.nom <- "tour";
			pion.image <- image_array.(n).(3)
			end;
		end;
	();;

let undo_promotion () =
	let i, j = last_action.piecedep_pos and i_, j_ = last_action.piecedep_posprec in
	let pion = last_action.piecedep in
	!tableau.(i).(j) <- last_action.piecedep;
	!tableau.(i).(j).pos <- (i, j);
	!tableau.(i).(j).posprec <- (i_, j_);
	!tableau.(i).(j).nom <- "pion";
	let pion_img = if pion.couleur = 0 then pion0 else pion1 in
	!tableau.(i).(j).image <- pion_img;

	let i, j = last_action.piecearv_pos and i_, j_ = last_action.piecearv_posprec in
	!tableau.(i).(j) <- last_action.piecearv;
	!tableau.(i).(j).pos <- (i, j);
	!tableau.(i).(j).posprec <- (i_, j_);
	();;

let play_action action i j = 
	if action.nom = "deplacement" || action.nom = "prise" then play_global_action action i j;
	if action.nom = "petit_roque" || action.nom = "grand_roque" then play_roque action;
	if action.nom = "promotion" then play_promotion action i j vide;
	plateau();
	();;
	
let undo_action () = 
	if last_action.nature = "globale" then undo_global_action ();
	if last_action.nature = "petit_roque" || last_action.nature = "grand_roque" then undo_roque ();
	if last_action.nature = "promotion" then undo_promotion ();
	plateau();
	();;



(*Calculs de toutes les actions après vérification*)
let get_valides_actions i j =
	let piece = !tableau.(i).(j) in
	let tableau_actions = get_all_actions i j in
	
	let roi = ref vide in
	if piece.couleur = 0
	then roi := roi0_0
	else roi := roi1_1;
	
	for i_=0 to 7 do
		for j_=0 to 7 do
			let action = tableau_actions.(i_).(j_) in
			
			if action.nom <> "aucune" && action.nom <> "promotion" then
				begin
				play_action action i_ j_;
				if en_echec !roi then tableau_actions.(i_).(j_) <- aucune;
				undo_action ();
				end;
			if action.nom = "promotion" then
				begin
				let pieces_promotions = [dame0_0; cavalier0_1; fou0_1; tour0_1] in
				for n=0 to (List.length pieces_promotions)-1 do
					let promotion = List.nth pieces_promotions n in
					play_promotion action i_ j_ promotion;
					if en_echec !roi then tableau_actions.(i_).(j_) <- aucune;
					undo_action ();
				done;
				end;
		done;
	done;
	tableau_actions;;

let mat () =
	let flag = ref true in
	for i=0 to 7 do
		for j=0 to 7 do
			if !tableau.(i).(j).couleur = jeu.tour then
			begin
			if not (Array.make_matrix 8 8 true = Array.map (fun liste -> Array.map (fun action -> action.nom="aucune") liste) (get_valides_actions i j))
			then flag := false;
			end;
		done;
	done;
	!flag;;

let pat () = ();;