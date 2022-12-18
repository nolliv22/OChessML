from PIL import Image

# Génère les images des pièces puis converti en Graphics.image

P = Image.open("pieces.png")
pieces = ["roi", "dame", "fou", "cavalier", "tour", "pion"]

for x, piece in zip(range(6), pieces):
    for y in range(2):
        p = P.crop((40*x, 40*y, 40*(x+1), 40*(y+1)))
        p.save(f"{piece}{y}.png")

import os

for p in os.listdir():
    if p not in ["ocaml_image.py", "pieces.png", "pieces.py"]:
        os.system(f"py ocaml_image.py {p}")
        os.remove(p)
