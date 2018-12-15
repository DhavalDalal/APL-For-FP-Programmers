 primes←sieve_loop n;sqrt;candidates;next;keep
⍝ well, the sieve is by definition a loop :-)

 sqrt←⌊n*0.5                 ⍝ End of loop
 candidates←1+2×1+⍳⌊0.5×n-1  ⍝ Odd numbers from 3
 primes←2                    ⍝ We "know" this

 :Repeat
     next←⊃candidates        ⍝ Find next prime
     primes,←next            ⍝ Add to result
     keep←~0=next|candidates ⍝ keep if not multiple of next
     candidates←keep/candidates
 :Until next≥sqrt

 primes,←candidates          ⍝ The rest are all prime
