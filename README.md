# ODIN Ruby Project, Knights Travails

A chess knight is positioned on a standard 8x8 chessboard
at an arbitrary start position. The algorithm then
sorts through possible moves to find the shortest
number of moves needed to get to an arbitrary goal or
destination square.

Conceptually the board is divided into ranks (horizontal
rows) and files (vertical columns). Each **rank** is assigned
a number from 1 to 8 whereas each **file** is assigned a
letter from 'a' to 'h'. Each square on the board is
located by its alphanumeric file, rank address.

```
a1 = [file 0, rank 0]
a2 = [file 0, rank 1]
b1 = [file 1, rank 0]
...
```

[chess notation](<https://en.wikipedia.org/wiki/Algebraic_notation_(chess)>)

The algorithm uses a breadth first search to sort through
possible moves until a path from the start to the goal is
found. Once found a node representing the goal is returned
containing pointers to parent nodes. Path reconstruction is
done by following the parent nodes backwards until no more
parent nodes exist .i.e the start node.

# Requirements

This project was developed using Ruby 3.4.6.

# Installation

Simply clone this repository to a local drive.

# Instructions

The application can be run from the ruby script `.\lib\knights_travails.rb` or
the included bash script found in `.\bin\run.sh`

To run the bash script it is convenient to first
make it executable:

```
chmod +x ./bin/run.sh
```

In either case the scripts accept two arguments, the first
represents the start point and the second the goal. Arguments
are provided in the standard alpha numeric notations
described herein.

as a ruby script:

```
cd lib
ruby knights_travails.rb a1 a2

File: knights_travails.rb, Running method: run
K: Location = a1 => rank: 1, file: 1
K: Location = c2 => rank: 2, file: 3
K: Location = b4 => rank: 4, file: 2
K: Location = a2 => rank: 2, file: 1
```

starting from the bash script:

```
cd bin
./run.sh a1 d5

File: knights_travails.rb, Running method: run
K: Location = a1 => rank: 1, file: 1
K: Location = c2 => rank: 2, file: 3
K: Location = e3 => rank: 3, file: 5
K: Location = d5 => rank: 5, file: 4
```
