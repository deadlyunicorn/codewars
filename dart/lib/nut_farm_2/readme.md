You receive the following letter in the mail...

Dear Valued Customer,

>Thank you for your recent visit to the Nut Farm - https://www.codewars.com/kata/nut-farm
>
>You came
>You saw
>You harvested our nuts
>I am pleased to advise that more trees have recently come into season. Looking forward to seeing you again soon.
>
>Your Sincerely,
>D.M. (CEO) Nut Co. 

Barely able to contain your excitement you jump in the car and head straight back to the Nut Farm.

To Recap
Harvesting nuts is very easy. We just shake the trees and the nuts fall out!

As they fall down the nuts might hit branches:

Sometimes they bounce left.
Sometimes they bounce right.
Sometimes they get stuck in the tree and don't fall out at all.
Legend
o = a nut
\ = branch. A nut hitting this branch bounces right
/ = branch. A nut hitting this branch bounces left
. = leaves, which have no effect on falling nuts
| = tree trunk, which has no effect on falling nuts
  = empty space, which has no effect on falling nuts
Kata Task
Shake the tree and count where the nuts land.

Output - An array (same width as the tree) which indicates how many nuts fell at each position ^

^ See the example tests

Notes

The nuts may be anywhere in the canopy of the tree
Nuts do not affect the falling patterns of other nuts
Falling nuts are only affected by the branches beneath them
There is not always space for nuts to fall between branches
A left/right bouncing nut may continue hitting other branches that bounces it further in that direction
If a nut bouncing in one direction bounces backwards then it will become stuck in the tree
There are no branches at the extreme left/right edges of the tree so it is not possible for a nut to fall "out of bounds"
Example
```
.\..\..o//.o....\o.
.\./\\.///....\.o\.
.oo.\..o/\....\\o/.
..o.o\\//.o/.......
.\/.\/.\.o\oo\o.oo.
././..//o..o..oo\o.
.\.o\oo/\.o.o..\.\.
.\.\..o/oo\...//...
0000112013052200106
```
            
            
                

Algorithms