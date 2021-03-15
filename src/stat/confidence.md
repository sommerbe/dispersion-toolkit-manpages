% STAT-CONFIDENCE(1) 1.3.0 | Dispersion Toolkit Manuals
% Benjamin Sommer
% March 15, 2021

# NAME

stat-confidence - estimate confidence intervals, median and arithmetic mean

# SYNOPSIS

**stat-confidence** [**\--i** *FILE*] [**\--o** *FILE*] [**\--percentiles**=*BINARY64* *BINARY64* ...] [**\--2sigma**] [**\--iqr**] [**\--iqr-box**] [**\--mean**] [**\--stacked-graphs**] [**\--stacked-graphs-deviation-limit**=*BINARY64*] [**\--silent**]

# DESCRIPTION

Estimates a confidence statistics of a given point set, usually values of a measure.

Supported statistics:

* percentiles
* inter quartile range (IQR): Q1, Q2, Q3
* extended IQR for box plots: Q1 - 1.5 IQR, Q1, Q2, Q3, Q3 + 1.5 IQR
* two-sigma rule: -2 sigma, Q2, +2 sigma
* arithmetic mean

These statistics are estimated independently for each dimension *d* of the point set, with the values of the statistics being coordinates of points, along the axis *d*. These values are ordered as shown above.

# OPTIONS

**\--i** *FILE*, **\--i**=*FILE*
:   Retrieves a point set *P* with dimension *n*, not a point set sequence, from *FILE*. Its absence is substituted by *stdin*. The end of a point set, which equals the line #eos, starts the algorithm. The coordinates are interpreted as *BINARY64*.

**\--o** *FILE*, **\--o**=*FILE*
:   Redirects the computed results to *FILE*, opened in overwrite mode (not appending mode). Without *FILE*, results are forwarded to *stdout*. Errors encountered during the program's execution are streamed into *stderr*, and not into either *stdout* or *FILE*.

**\--mean**
:   Additionally computes the arithmetic mean along each axis. It will be the last statistical descriptor S_m of the return format.

**\--stacked-graphs**
:   Computes the statistics along a point set sequence. Therein, each point set represents a function evaluation with the first dimension being the arguments. The statistics is not computed along the first axis (aka the arguments), but along any axis d > 0. It is required that the subsequence of arguments is equal for each point set (aka function evaluation sequence). 

    For instance, such a possible valid sequence would be 

    ````
    #d 0 10 10 100
    1 10
    2 11
    3 12
    4 13
    #eos
    #d 0 10 10 100
    1 20
    2 21
    3 22
    4 23
    #eos
    #d 0 10 10 100
    1 30
    2 31
    3 32
    4 33
    #eos
    ````

    Therein, (1,2,3,4) are the function arguments, and the second column represents their values, which could be stochastic in practical applications. The statistics, for instance mean and confidence intervals, are computed on all values (of a given dimension d > 0) belonging to a function argument, for instance {10,20,30} for argument 1.

    The return format is almost equal to the default case of not dealing with stacked graphs, except that therein these function arguments are prepended to each statistics (as first axis 0). For the above example, computing its mean statistics (**\--mean**) would result to

    ````
    #d 0 10 10 100
    1.0000000000000000e+00 2.0000000000000000e+01
    2.0000000000000000e+00 2.1000000000000000e+01
    3.0000000000000000e+00 2.2000000000000000e+01
    4.0000000000000000e+00 2.3000000000000000e+01
    #eos
    ````

    This option becomes important in cases of having to analyse how a stochastic measure, or a measure of a stochastic point set, progresses or converges, for which confidence intervals need to be computed first to allow reasonable conclusions, in principle.

    Note that in the example above, while only one graph was given, the algorithm supports any number of graphs (at least one).

**\--stacked-graphs-deviation-limit**=*BINARY64*
:   Checks whether the subsequence of values of the first dimension (aka arguments) are all equal (at their index) up to the inclusive threshold <= *BINARY64*.

**\--silent**
:   Suppresses comments in the output stream, yielding only the computed value. The latter could be the point set or its cardinality.

## Statistics

Only one of these options may be chosen for each invocation. The values of the statistic are fed to the output in order, for each axis.

**\--percentiles**=*BINARY64* *BINARY64* ..., **\--p**=*BINARY64* *BINARY64* ...
:   A list of percentiles *BINARY64* separated by whitespace. Boundary condition: 0 <= *BINARY64* <= 1. 

**\--2sigma**
:   The two-sigma rule with the median, i.e. -2 sigma, Q2, +2 sigma. Emitted percentiles: 0.02275, 0.5, 1 - 0.02275.

**\--iqr**
:   Values to compute the IQR = Q3 - Q1, along with the median Q2. Emitted percentiles: Q1 = 0.25, Q2 = 5, Q3 = 0.75.

**\--iqr-box**
:   In addition to **\--iqr**, both upper and lower whiskers used for stistical box plots, are computed. Common practice employs whiskers to determine statistical outliers. Emitted values: Q1 - 1.5 IQR, Q1, Q2, Q3, Q3 + 1.5 IQR.

# RETURN FORMAT

## Default layout (no stacked graphs)

A point set of dimension *n* with each axis representing the tuple of *m* statistical descriptors S_i, including percentiles and derived quantities,

descriptors | axis_0 | axis_1 | ... | axis_n
--- | --- | --- | --- | ---
S_0 | . | . | ... | .
S_1 | . | . | ... | .
... | . | . | ... | .
S_m | . | . | ... | . .

Therein, axis_i relates to the statistics describing axis_i of the given point set *P*. Notice that the first column is not returned.

## Stacked graphs

For stacked graphs, the sequence of function arguments is prepended as first axis to the output. The remaining axes relate to the statistical descriptors S_0, S_1, ..., S_m. So for graph G_i

argument | G_0 | G_1 | ... | G_z
--- | --- | --- | --- | ---
. | . | . | ... | .
. | . | . | ... | . 

with m columns for each G_i,

S_0 | S_1 | ... | S_m 
--- | --- | --- | ---
. | . | ... | .
. | . | ... | . .

# LIMITATION

The algorithm requires any-dimensional point sets, while point set sequences remain unsupported, the latter except for stacked graphs.