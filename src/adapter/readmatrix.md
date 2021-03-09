% READ-MATRIX(1) 1.3.0 | Dispersion Toolkit Manuals
% Benjamin Sommer
% February 26, 2021

# NAME

read-matrix - reads a matrix of points

# SYNOPSIS

**read-matrix** [**\--i** *FILE*] [**\--o** *FILE*] **\--domain-boundary**=*LIST_OF_NUMBERS* [**\--mathematica**] [**\--csv**] [**\--point-delimiter**=*CHARACTER*] [**\--coord-delimiter**=*CHARACTER*] [**\--point-prefix**=*CHARACTER*] [**\--point-suffix**=*CHARACTER*] [**\--set-prefix**=*CHARACTER*] [**\--set-suffix**=*CHARACTER*] [**\--delimiter**=*CHARACTER*] [**\--silent**]

# DESCRIPTION

Reads a matrix of points, where each column corresponds to a distinct dimension, and where each row represents a point.

# OPTIONS

**\--i** *FILE*, **\--i**=*FILE*
:   Retrieves a point set from *FILE*. Its absence is substituted by *stdin*.

**\--o** *FILE*, **\--o**=*FILE*
:   Redirects the point set sequence to *FILE*, opened in overwrite mode (not appending mode). Without *FILE*, results are forwarded to *stdout*. Errors encountered during the program's execution are streamed into *stderr*, and not into either *stdout* or *FILE*.

**\--delimiter**=*CHARACTER*
:   A point set's coordinates are separated by *CHARACTER*, while each point resides on a distinct line. Recommended condition: *CHARACTER* = \' \', *CHARACTER* = \'\\t\'.


**\--domain-boundary**=*LIST_OF_NUMBERS*
:   A list of numbers

    n1 n2 ... nk

    with k = 2 * dimension of point set, and which is ordered such that the first k/2 numbers correspond to the lower bound of the problem domain, and the remaining numbers to its upper bound. In addition, these numbers are ordered with increasing dimension index.

**\--mathematica**
:   The matrix format of Mathematica. Here:

    {{P0C0,P0C1,...,P0Ck},{P1C0,P1C1,...,P1Ck},...,{PnC0,PnC1,...,PnCk}}

    is a matrix of *n* points, each having *k* coordinates.

**\--csv**
:   A simple text based format following

     |  |  | 
    -- | -- | --- | ---
    P0C0 | P0C1 | ... | P0Ck
    P1C0 | P1C1 | ... | P1Ck
      .  |   .  |  .  |  .
      .  |   .  |  .  |  .
      .  |   .  |  .  |  .      
    PnC0 | PnC1 | ... | PnCk
    
    is a matrix of *n* points, each having *k* coordinates. Colomns are separated by a single empty space ( ). There is no line before the first row, and there is not line after the last row. Each point is written on a distinct row, terminated with EOL character (\\n).
    
**\--point-delimiter**=*CHARACTER*
:   The character to *seperate two points*. In the Mathematica format, this would be

    {{P0C0,P0C1,...,P0Ck}*CHARACTER*{P1C0,P1C1,...,P1Ck}*CHARACTER*...*CHARACTER*{PnC0,PnC1,...,PnCk}}.

**\--coord-delimiter**=*CHARACTER*
:   The character to *seperate two coordinates*. In the Mathematica format, this would be

    {{P0C0*CHARACTER*P0C1*CHARACTER*...*CHARACTER*P0Ck}}.

**\--point-prefix**=*CHARACTER*
:   The character to *prefix a point* (to the left). In the Mathematica format, this would be

    {*CHARACTER*P0C0,P0C1,...,P0Ck}}.

**\--point-suffix**=*CHARACTER*
:   The character to *postfix a point* (to the right). In the Mathematica format, this would be

    {{P0C0,P0C1,...,P0Ck*CHARACTER*}.

**\--set-prefix**=*CHARACTER*
:   The character to *prefix a point set* (to the left). In the Mathematica format, this would be

    *CHARACTER*{P0C0,P0C1,...,P0Ck}}.

**\--set-suffix**=*CHARACTER*
:   The character to *postfix a point set* (to the right). In the Mathematica format, this would be

    {{P0C0,P0C1,...,P0Ck}*CHARACTER*.

**\--silent**
:   Suppress comments in the output stream, yielding only the computed value. The latter could be the point set or its cardinality.

# LIMITATION

The algorithm requires a point set, not a point set sequence.