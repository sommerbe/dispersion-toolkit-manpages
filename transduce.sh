#!/bin/bash
# run from <project root dir>

# audience:
# intended for source developers, NOT FOR BUILDERS / USERS
# i.e. developers are those among us who modify manpage.md files
#

# dependencies:
# pandoc

man_prefix="dptk-"
dir_prefix="man"

function mk_manpage() {
  # args
  pdir=$1
  name=$2
  section=$3

  # source files
  src_md="$pdir/$name.md"

  # final output
  dst_dir="$dir_prefix$section"
  dst_man="$dst_dir/$man_prefix$name.$section"

  # convert manpage mardown to man roff
  mkdir -p $dst_dir
  pandoc -s -t man "$src_md" -o "$dst_man"

  # log
  echo "mkman $src_md -> $dst_man"
}

mk_manpage "src/set" "fibonacci" 1
mk_manpage "src/set" "kritzinger" 1
mk_manpage "src/set" "cswap" 1
mk_manpage "src/measure" "dispnaamad" 1
mk_manpage "src/measure" "dispdumitrescu2017" 1
mk_manpage "src/measure" "dispcombinatorial" 1
mk_manpage "src/measure" "dispgs" 1
mk_manpage "src/measure" "pdisppermute" 1
mk_manpage "src/opt" "mindispgs" 1
mk_manpage "src/ana" "convergence" 1
mk_manpage "src/stat" "confidence" 1
mk_manpage "src/vis" "psspy" 1
mk_manpage "src/vis" "rectangles" 1
mk_manpage "src/adapter" "utk" 1
mk_manpage "src/adapter" "readmatrix" 1
mk_manpage "src/adapter" "writematrix" 1
