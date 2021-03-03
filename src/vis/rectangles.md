% VIS-RECTANGLES.PY(1) 1.2.0 | Dispersion Toolkit Manuals
% Benjamin Sommer
% March 03, 2021

# NAME

vis-rectangles.py - visualise a sequence of a set of rectangles

# SYNOPSIS

**vis-rectangles.py** [**\--i** *FILE*] [**\--pts** *FILE*] [**\--delay**=*BINARY64*] [**\--image-path**=*PATTERN*] [**\--image-ppi**=*BINARY64*] [**\--colour-alpha-edge**=*BINARY64*] [**\--colour-rgba-edge**=*QUARTUPLE OF BINARY64*] [**\--colour-edge**=*STRING*] [**\--colour-alpha-fill**=*BINARY64*] [**\--colour-rgba-fill**=*QUARTUPLE OF BINARY64*] [**\--colour-fill**=*STRING*] [**\--fill**=*INTEGER*] [**\--colour-alpha-pts**=*BINARY64*] [**\--colour-rgba-pts**=*QUARTUPLE OF BINARY64*] [**\--colour-pts**=*STRING*] [**\--silent**]

# DESCRIPTION

Visualises a sequence of a set of rectangles, and how they change within this sequence.

# OPTIONS

**\--i**=*FILE*, **\--i** *FILE*
:   Retrieves a sequence of a set of rectangles from *FILE*, each as a 4 dimensional point set, whereas a point

    (coord_min_d0 coord_min_d1 coord_max_d0 coord_max_d1)

    corresponds to a rectangle with its smallest and greatest coordinates coord_min_d*d* and coord_max_d*d* along dimension *d*, respectively.

    The absence of *FILE* is substituted by *stdin*. The end of a point set, which equals the line #eos, updates the figure.

**\--pts**=*FILE*
:   Retrieves a 2 dimensional point set sequence from *FILE*. It is assumed that its sequence length equals the sequence length of the set of rectangles.

**\--delay**=*BINARY64*
:   The animation speed is slowed down by introducing a delay of *BINARY64* seconds between frame updates. A frame update corresponds to the end of point set within the sequence.

**\--image-path**=*PATTERN*
:   Each frame may be stored to a file as a realisation of formatting *PATTERN*. This *PATTERN* is required to contain *{i}* to be substituted by the current point set index within the sequence. For instance,

    python vis-rectangles.py \--image-path="./seq-{i}.png"

    reads the rectangles from *stdin* and stores the resulting figures to 

    ./seq-0.png ./seq-1.png ... ./seq-n.png

    for n+1 sets of rectangles given.

**\--image-ppi**=*BINARY64*
:   The resolution of the resulting images, pixel per inch (PPI) unit. Default value: 300.

**\--colour-alpha-edge**=*BINARY64*
:   Set the alpha channel of the RGBA colour of rectangle edges to be *BINARY64*, with 0 <= *BINARY64* <= 1.

**\--colour-rgba-edge**=*QUARTUPLE OF BINARY64*
:   Set the RGBA colour of rectangle edges to be 

    *QUARTUPLE OF BINARY64* = *BINARY64* *BINARY64* *BINARY64* *BINARY64*

    with 0 <= *BINARY64* <= 1.

**\--colour-edge**=*STRING*
:   Set the RGBA colour of rectangle edges interpreted from the literal *STRING* using matplotlib.colors.to_rgba(*STRING*). See also https://matplotlib.org/stable/tutorials/colors/colors.html.

**\--colour-alpha-fill**=*BINARY64*
:   Set the alpha channel of the RGBA colour of rectangle interiours to be *BINARY64*, with 0 <= *BINARY64* <= 1.

**\--colour-rgba-fill**=*QUARTUPLE OF BINARY64*
:   Set the RGBA colour of rectangle interiours to be 

    *QUARTUPLE OF BINARY64* = *BINARY64* *BINARY64* *BINARY64* *BINARY64*

    with 0 <= *BINARY64* <= 1.

**\--colour-fill**=*STRING*
:   Set the RGBA colour of rectangle interiours interpreted from the literal *STRING* using matplotlib.colors.to_rgba(*STRING*). See also https://matplotlib.org/stable/tutorials/colors/colors.html.

**\--fill**=*INTEGER*
:   Rectangles are filled with a colour as long as *INTEGER* != 0. If set to zero, specifying **\--colour-alpha-fill**, **\--colour-rgba-fill** and/or **\--colour-fill** will not have any effect.

**\--colour-alpha-pts**=*BINARY64*
:   Set the alpha channel of the RGBA colour of points specified with **\--pts** to be *BINARY64*, with 0 <= *BINARY64* <= 1.

**\--colour-rgba-pts**=*QUARTUPLE OF BINARY64*
:   Set the RGBA colour of points specified with **\--pts** to be 

    *QUARTUPLE OF BINARY64* = *BINARY64* *BINARY64* *BINARY64* *BINARY64*

    with 0 <= *BINARY64* <= 1.

**\--colour-pts**=*STRING*
:   Set the RGBA colour of points specified with **\--pts** interpreted from the literal *STRING* using matplotlib.colors.to_rgba(*STRING*). See also https://matplotlib.org/stable/tutorials/colors/colors.html.


**\--silent**
:   Suppress comments in the output stream, yielding only the computed value. The latter could be the point set or its cardinality.

# DYNAMIC DEPENDENCIES

* python3
* numpy
* matplotlib

# LIMITATION

The algorithm requires a two-dimensional point set sequence.