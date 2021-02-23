
# UNIX man pages for the dispersion toolkit

## Build instructions

Using BASH, executing

````
bash transduce.sh
````

generates the man pages to be found in

````
man1/
````

using the source markdown files. This generative step requires 

````
pandoc
````

to be installed on your system.

## Conventions for developers

### Versioning

All releases are versioned according to the *Backus–Naur Form of Semantic Versioning 2.0.0* to be found at https://semver.org/. Basically, this entails the version core to match

````
MAJOR.MINOR.PATCH
````

where

* MAJOR reflects a code change breaking backwards compatibility,
* MINOR reflects a code change with backwards compatibility while introducing new features,
* PATCH reflects a code change with error fixes only, and therefore remaining backwards compatible without introducing new features,

and MAJOR, MINOR, and PATCH are unsigned integers in increasing order.

## License

See the file *license* within the directory in which this file resides.

## Authors

2020 - present: Benjamin Sommer