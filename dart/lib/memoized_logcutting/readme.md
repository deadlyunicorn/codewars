The logging company Clear Cutter's makes its money by optimizing the price-to-length of each log they cut before selling them. An example of one of their price tables is included:

# So a price table p
p = [ 0,  1,  5,  8,  9, 10]

# Can be imagined as:
# length i | 0  1  2  3  4  5 *in feet*
# price pi | 0  1  5  8  9 10 *in money*
They hired an intern last summer to create a recursive function for them to easily calculate the most profitable price for a log of length n using price table p as follows:

int cutLog(List<int> p, int n) {
  if (n == 0) return 0;
  int q = -1;
  for (int i = 1; i <= n; i++) {
    q = max(q, p[i] + cutLog(p, n - i));
  }
  return q;
}
An example of the working code:

However, their senior software engineer realized that the number of recursive calls in the function gives it an awful running time of 2^n (as this function iterates through ALL 2^n-1 possibilities for a log of length n).

Having discovered this problem just as you've arrived for your internship, he responsibly delegates the issue to you.

Using the power of Stack Overflow and Google, he wants you to create a solution that runs in Θ(n^2) time so that it doesn't take 5 hours to calculate the optimal price for a log of size 50. (He also suggests to research the problem using the keywords in the tags)

(Be aware that if your algorithm is not efficient, it will attempt to look at 2^49 = 562949953421312 nodes instead of 49^2 = 2401... The solution will automatically fail if it takes longer than 6 seconds... which occurs at right around Log 23)

---
I remember asked by George about some recursive problem that had a solution that required memoization
We can create a dictionary where we store already calculated values