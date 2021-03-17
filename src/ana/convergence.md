% ANA-CONVERGENCE(1) 1.3.0 | Dispersion Toolkit Manuals
% Benjamin Sommer
% March 17, 2021

# NAME

ana-convergence - estimate convergence of a graph/sequence

# SYNOPSIS

**ana-convergence** [**\--i** *FILE*] [**\--o** *FILE*] [**\--absolute**] [**\--ffd**] [**\--silent**]

**ana-convergence** **\--graph-layout** [**\--i** *FILE*] [**\--o** *FILE*] [**\--absolute**] [**\--ffd**] [**\--silent**]

# DESCRIPTION

Estimates gradients of a sequence of values, along each dimension.

Supported gradient computation methods:

* Finite forward differences

In case of dealing with graphs, for which the first dimension represents the function's arguments, computing the gradients is not done for this first axis.

# OPTIONS

**\--i** *FILE*, **\--i**=*FILE*
:   Retrieves a point set *P* with dimension *d*, not a point set sequence, from *FILE*. Its absence is substituted by *stdin*. The end of a point set, which equals the line #eos, starts the algorithm. The coordinates are interpreted as *BINARY64*.

**\--o** *FILE*, **\--o**=*FILE*
:   Redirects the computed results to *FILE*, opened in overwrite mode (not appending mode). Without *FILE*, results are forwarded to *stdout*. Errors encountered during the program's execution are streamed into *stderr*, and not into either *stdout* or *FILE*.

**\--absolute**
:   Ensures that the approximated gradients, computed by the specified method, are non-negative.

**\--ffd**
:   Computes finite forward differences on the sequence of values to approximate the gradients.

**\--graph-layout**
:   Specifies that the first axis, or dimension, of the receiving point set represents the arguments of a function mapping to all other values. So each d dimensional point of this set is interpreted that

    * the first coordinate is the argument to a function,
    * the second coordinate is the value of the first graph, until
    * the d-th coordinate is the value of the (d-1)th graph.

    This option requires the point set P to have a least d=2 dimensions.

**\--silent**
:   Suppresses comments in the output stream, yielding only the computed value. The latter could be the point set or its cardinality.

# RETURN FORMAT

The returned point set has equal dimension compared to the given input. But its cardinality is reduced, depending on the chosen method of how to compute the gradient approximations. 

In case of **\--graph-layout**, values of the first axis remain constant.

# LIMITATION

This procedure accepts point sets of any dimension only, but not sequences thereof.