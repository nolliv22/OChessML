import numpy as np
from PIL import Image

def img_to_ocaml_array(filename, ext):
    img = Image.open(f"{filename}{ext}")
    
    I = np.array(img.convert("RGB"))
    J = np.array(img.convert("RGBA"))

    A = []

    for i in range(len(I)):
        A_ = []
        for j in range(len(I[0])):
            if np.all(J[i, j] == 0):
                A_.append(-1)
            else:
                pixel = I[i, j]
                r, g, b = pixel[0], pixel[1], pixel[2]
                A_.append(r*256*256 + g*256 + b)
        A.append(A_)

    with open(f"{filename}.ml", "w") as f:
        f.write('#load "graphics.cma";;\n')
        f.write('open Graphics;;\n')
        f.write(f"let {filename} = make_image\n")
        f.write("[|\n")
        for ligne in A:
            f.write(str(ligne).replace("[", "[|").replace("]", "|]").replace(",", ";").replace("'", ""))
            f.write(";\n")
        f.write("|];;")
        f.close()
    return f"Output : {filename}.ml"

import sys, os

filename, ext = os.path.splitext(sys.argv[1])
print(img_to_ocaml_array(filename, ext))
