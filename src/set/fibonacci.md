% SET-FIBONACCI(1) 1.2.0 | Dispersion Toolkit Manuals
% Benjamin Sommer
% November 29, 2020

# NAME

set-fibonacci - compute a Fibonacci lattice

# SYNOPSIS

**set-fibonacci** **\--fibonacci-index|\--m**=*INTEGER* [**\--o** *FILE*] [**\--delimiter**=*CHARACTER*] [**\--silent**]

**set-fibonacci** **\--fibonacci-index|\--m**=*INTEGER* **\--compute-fibonacci-number**|**\--cardinality** [**\--no-pointset**] [**\--o** *FILE*] [**\--delimiter**=*CHARACTER*] [**\--silent**]

# DESCRIPTION

Computes the Fibonacci lattice given the Fibonacci index **\--fibonacci-index** *INTEGER*, which needs to be >= 3. 

Unless the option **\--no-pointset** is given, the resulting lattice is written to *standard output*, or to the file given by **\--o** *FILE*. 

# MANDATORY ARGUMENTS

**\--fibonacci-index**=*INTEGER*, **\--m**=*INTEGER*, **\--m** *INTEGER*
:   The *INTEGER* equals the Fibonacci index *m* of the Fibonacci number F_m. The cardinality of the resulting point set equals F_m. Boundary condition: *m* > 2.

# OPTIONS

**\--o** *FILE*, **\--o**=*FILE*
:   Redirects the computed results to *FILE*, opened in overwrite mode (not appending mode). Without *FILE*, results are forwarded to *stdout*. Errors encountered during the program's execution are streamed into *stderr*, and not into either *stdout* or *FILE*.

**\--compute-fibonacci-number**, **\--cardinality**
:   Computes the point set's cardinality and feeds it to the output stream. In the case of the Fibonacci lattice, this cardinality equals the Fibonacci number F_m, where *m* is the Fibonacci index (see above).

**\--delimiter**=*CHARACTER*
:   Define a delimiter character to separate coordinates of a point in the resulting output. A usual *CHARACTER* could be \' \' or \'\\t\', for instance.

**\--silent**
:   Suppress comments in the output stream, yielding only the computed value. The latter could be the point set or its cardinality.

# LIMITATION

The Fibonacci lattice will be two-dimensional, only.