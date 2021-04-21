% DISP-DUMITRESCU2017(1) 1.3.0 | Dispersion Toolkit Manuals
% Benjamin Sommer
% April 21, 2020

# NAME

disp-dumitrescu2017 - compute dispersion with algorithm of Dumitrescu and Jiang, 2017

# SYNOPSIS

**disp-dumitrescu2017** **\--epsilon** *BINARY64* [**\--i** *FILE*] [**\--o** *FILE*] [**\--disp**] [**\--ndisp**] [**\--count-boxes**] [**\--silent**]

**disp-dumitrescu2017** **\--epsilon** *BINARY64* **\--graph-layout** [**\--i** *FILE*] [**\--o** *FILE*] [**\--disp**] [**\--ndisp**] [**\--count-boxes**] [**\--silent**]

# DESCRIPTION

Computes dispersion, *n* * dispersion, and/or the number of RRs considered of a given point set with cardinality *n*, almost according to Dumitrescu and Jiang, 2017 (https://doi.org/10.1007%2Fs00454-017-9871-1). Instead of using the 2-dimensional algorithm of Aggarwal und Suri, 1987 (https://doi.org/10.1145%2F41958.41988) as described in the publication of Dumitrescu and Jiang, the implementation uses the simpler while computationally more expensive algorithm published by Naamad et. al. 1984 ().

Computational complexity: O(epsilon^(-2) n^(-2/3) n^2),

Memory complexity: O(n).

The measures are written to *standard output*, or to the file given by **\--o** *FILE*.

# OPTIONS

**\--i** *FILE*, **\--i**=*FILE*
:   Retrieves a point set sequence (P_0, P_1, ..., P_i, ..., P_m) from *FILE*. Its absence is substituted by *stdin*. The end of a point set P_i, which equals the line #eos, starts the algorithm to emit the requested measure(s) applied on *P_i*.

**\--o** *FILE*, **\--o**=*FILE*
:   Redirects the measures to *FILE*, opened in overwrite mode (not appending mode). Without *FILE*, results are forwarded to *stdout*. Errors encountered during the program's execution are streamed into *stderr*, and not into either *stdout* or *FILE*.

**\--epsilon** *BINARY64*
:   Sets the approximation parameter *epsilon*, with 0 <= *epsilon* <= 1. In the limit *epsilon* -> 0, the algorithm would theoretically compute an exact result. It is also known as (1 - *epsilon*) approximation. Here, *epsilon* specifies the width of the slabs within which greatest empty rectangles (in d=2 dimensions) are found, to be projected back into d=3 using the slab width.

**\--disp**
:   Computes dispersion of *P_i*.

**\--ndisp**
:   Computes dispersion of *P_i*, multiplied by the cardinality *n* of *P_i*.

**\--count-boxes**
:   Counts all empty boxes of *P_i*, considered as RRs in the publication.

**\--graph-layout**
:   Reads the arguments of point set P_i, stored in its file header, and streams the first argument out of this list as the argument to a function mapping to dispersion, n*dispersion and/or number of boxes.

**\--silent**
:   Suppress comments in the output stream, yielding only the computed value. The latter could be the point set or its cardinality.

# RETURN FORMAT

## Dispersion, number of boxes

A point set of cardinality *m* with each axis representing a computed measure.

point set | disp | n*disp | #RR boxes
--- | --- | --- | ---
P_0 | . | . | .
P_1 | . | . | .
... | . | . | .
P_m | . | . | .

Notice that the first column is not returned.

## Graph layout with dispersion and number of boxes

A point set of cardinality *m* with the first axis representing the argument used to generate the point set P_i, and with each other axis representing a computed measure.

point set | argument | disp | n*disp | #boxes
--- | --- | --- | --- | ---
P_0 | . | . | . | .
P_1 | . | . | . | .
... | . | . | . | .
P_m | . | . | . | .

Notice that the first column is not returned either. The header is returned as a commenting line as well.

# LIMITATION

The algorithm requires a 3-dimensional point sets sequence.