Given the triangle of consecutive odd numbers:

             1
          3     5
       7     9    11
   13    15    17    19
21    23    25    27    29
...
Calculate the sum of the numbers in the nth row of this triangle (starting at index 1) e.g.: (Input --> Output)

1 -->  1
2 --> 3 + 5 = 8


...

Let's try to identify a pattern.

1: 1
2: 3 + 5. 2 odd numbers. The numbers are ( 2 * 2 ) +- 1. 8 is 2^3
3: 7 + 9 + 11. 3 odd numbers. The numbers are ( 8 +-1 ), ( 10 +- 1 ) which is ( 2 * 4 ) +- 1, ( 2 * 5 ) +- 1. The total is 27 which is 9 * 3. Which is 3 * 3 * 3, which is 3 ^ 3.
4: 13 + 17 + 15 + 19 = 30 + 34 = 64. 4 ^ 3 = 64.

2 * 1 + 1 + 2 * 2 + 1 = 2 * 3 + 2 * 1 = 2 * 4
which is basically
2 * 1 + 2 * 2 + 2 * 1.