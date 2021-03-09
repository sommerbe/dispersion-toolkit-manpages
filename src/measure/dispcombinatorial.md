% DISP-COMBINATORIAL(1) 1.3.0 | Dispersion Toolkit Manuals
% Benjamin Sommer
% March 4, 2021

# NAME

disp-combinatorial - compute dispersion with a combinatorial algorithm (exhaustive search)

# SYNOPSIS

**disp-combinatorial** [**\--i** *FILE*] [**\--o** *FILE*] [**\--disp**] [**\--ndisp**] [**\--count-boxes**] [**\--boxes**] [**\--interior-boxes**] [**\--greatest-box**] [**\--box-area**] [**\--box-area-min**=*BINARY64*] [**\--box-area-max**=*BINARY64*] [**\--no-box-coordinates**] [**\--silent**]

# DESCRIPTION

Computes dispersion of a sequence (of size *m*) of point sets, each having varying cardinality *n* and dimension *d*=2.

The dispersion is based on greatest empty rectangles bounded by the problem domain, whereas each area is the multiplication of their side lengths. This measure is not on a torus.

Computed measures:

* dispersion
* *n* * dispersion
* number of greatest empty boxes (all boxes, interiour boxes, the fist greatest empty box)
* greatest empty boxes
* areas of greatest empty boxes

The algorithm employs a combinatorial search through all rectangles. This (unfortunate) situation leads to worst case O(*n*^5) in time, and any case O(*n*) in space.

The measures are written to *standard output*, or to the file given by **\--o** *FILE*.

# OPTIONS

**\--i** *FILE*, **\--i**=*FILE*
:   Retrieves a point set sequence (P_0, P_1, ..., P_i, ..., P_m) from *FILE*. Its absence is substituted by *stdin*. The end of a point set P_i, which equals the line #eos, starts the algorithm to emit the requested measure(s) applied on *P_i*.

**\--o** *FILE*, **\--o**=*FILE*
:   Redirects the measures to *FILE*, opened in overwrite mode (not appending mode). Without *FILE*, results are forwarded to *stdout*. Errors encountered during the program's execution are streamed into *stderr*, and not into either *stdout* or *FILE*.

**\--disp**
:   Computes dispersion of *P_i*.

**\--ndisp**
:   Computes dispersion of *P_i*, multiplied by the cardinality *n* of *P_i*.

**\--count-boxes**
:   Counts all empty boxes of *P_i*, including interiour and exteriour boxes.

**\--boxes**
:   Feeds all empty boxes of *P_i*, including interiour and exteriour boxes, to output. With the smallest point of a box *B* being (low_0 low_1), i.e. no other point of *B* has smaller coordinates, and with the upper point of *B* being (up_0 up_1), i.e. no other point of *B* has greater coordinates, *B* is formatted as a tuple (low_0 low_1 up_0 up_1) on a distinct line of the output.

**\--interior-boxes**
:   Similar to the option **\--boxes** with the exception of *B* being restricted to integriour boxes. A Box is integriour if it does not intersect with the domain boundary of *P_i*.

**\--greatest-box**
:   Similar to the option **\--boxes** with the exception of *B* being the first greatest empty box found during the exhaustive search.

**\--box-area**
:   Enables to return box areas. With this option, a box resembles a 5 dimensional point, with the 5th coordinate corresponding to its area. However, if **\--no-box-coordinates** is given, then a box resembles a d=1 dimensional point with the first and last coordinate representing the area of the box.

**\--box-area-min**=*BINARY64*
:   Restrict the return of boxes to those whose 

    area >= *BINARY64*

    By default, area >= - INFINITY.

**\--box-area-max**=*BINARY64*
:   Restrict the return of boxes to those whose 

    area < *BINARY64*

    By default, area < INFINITY.

**\--no-box-coordinates**
:   Disables the return of box coordinates. This option becomes only useful in combination with **\--box-area**. It is useful for subsequent computation of statistics of only the areas of the boxes. If  **\--box-area** is not given, no box is returned. Otherwise, see **\--box-area**.

**\--silent**
:   Suppress comments in the output stream, yielding only the computed value. The latter could be the point set or its cardinality.

# RETURN FORMAT

## Format of a box (rectangle)

A point set of cardinality *m* with each axis representing a coordinate of a box,

point set | low_0 | low_1 | up_0 | up_1
--- | --- | --- | --- | ---
P_0 | . | . | . | .
P_1 | . | . | . | .
... | . | . | . | .
P_m | . | . | . | . ,

where low_i is the smallest coordinate along axis i, and up_i the greatest one. This is the default return format of a box if neither **\--box-area** nor **\--no-box-coordinates** are given. The option **\--box-area** appends the area of each box as a 5th dimensional coordinate, leading to

point set | low_0 | low_1 | up_0 | up_1 | area
--- | --- | --- | --- | --- | ---
P_0 | . | . | . | . | .
P_1 | . | . | . | . | .
... | . | . | . | . | .
P_m | . | . | . | . | . .

The option **\--no-box-coordinates** hides the coordinates (low_0 low_1 up_0 up_1), resulting to

point set | area
--- | ---
P_0 | .
P_1 | .
... | .
P_m | . 

as long as **\--box-area** is given.

Notice that the first column is not returned. The header is returned as a commenting line.

## Dispersion and number of boxes

A point set of cardinality *m* with each axis representing a computed measure.

point set | disp | n*disp | #boxes
--- | --- | --- | ---
P_0 | . | . | .
P_1 | . | . | .
... | . | . | .
P_m | . | . | .

Notice that the first column is not returned either. The header is returned as a commenting line as well.

# LIMITATION

The algorithm requires a two-dimensional point sets sequence.