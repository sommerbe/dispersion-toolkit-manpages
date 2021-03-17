% DISP-PERMUTE(1) 1.3.0 | Dispersion Toolkit Manuals
% Benjamin Sommer
% March 17, 2021

# NAME

pdisp-permute - compute p-dispersion with a permutation algorithm (exhaustive search)

# SYNOPSIS

**pdisp-permute** [**\--i** *FILE*] [**\--o** *FILE*] [**\--p**=2] [**\--disp**] [**\--ndisp**] [**\--debug-permute**] [**\--silent**]

**pdisp-permute** **\--graph-layout** [**\--i** *FILE*] [**\--o** *FILE*] [**\--p**=2] [**\--disp**] [**\--ndisp**] [**\--debug-permute**] [**\--silent**]

# DESCRIPTION

Computes p-dispersion or *n* * p-dispersion.

The measures are written to *standard output*, or to the file given by **\--o** *FILE*.

# OPTIONS

**\--i** *FILE*, **\--i**=*FILE*
:   Retrieves a point set sequence (P_0, P_1, ..., P_i, ..., P_m) from *FILE*. Its absence is substituted by *stdin*. The end of a point set P_i, which equals the line #eos, starts the algorithm to emit the requested measure(s) applied on *P_i*.

**\--o** *FILE*, **\--o**=*FILE*
:   Redirects the measures to *FILE*, opened in overwrite mode (not appending mode). Without *FILE*, results are forwarded to *stdout*. Errors encountered during the program's execution are streamed into *stderr*, and not into either *stdout* or *FILE*.

**\--p**=*INTEGER*
:   The size of combinations out of *n* points of *P_i*, s.t. the number of combinations are *p* out of *n* equalling the binomial coefficient. Boundary condition: *p* > 1 and *p* <= *n*.

**\--disp**
:   Computes p-dispersion of *P_i*.

**\--ndisp**
:   Computes p-dispersion of *P_i*, multiplied by the cardinality *n* of *P_i*.

**\--debug-permute**
:   Show all combination of point indices used.

**\--graph-layout**
:   Reads the arguments of point set P_i, stored in its file header, and streams the first argument out of this list as the argument to a function mapping to dispersion, n*dispersion and/or number of boxes.

**\--silent**
:   Suppress comments in the output stream, yielding only the computed value. The latter could be the point set or its cardinality.

# RETURN FORMAT

## Dispersion, number of boxes

A point set of cardinality *m* with each axis representing a computed measure.

point set | disp | n*disp
--- | --- | ---
P_0 | . | .
P_1 | . | .
... | . | .
P_m | . | .

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

No known limitations.