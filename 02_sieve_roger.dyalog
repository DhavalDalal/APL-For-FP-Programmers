 sieve_roger←{                  ⍝ Comments in "traditional" language
     q←2 3 5                    ⍝ Cheat a little to get started
     b←⍵⍴{∧⌿↑(×/⍵)⍴¨~⍵↑¨1}q     ⍝ Knock off multiples of known small primes
     b[⍳6⌊⍵]←(6⌊⍵)⍴0 0 1 1 0 1  ⍝ Special-case interval [0..5]
     49≥⍵:b                     ⍝ Up to 49 (7^2), we are done

     p←(≢q)↓⍸∇⌈⍵*0.5            ⍝ additional primes up to sqrt(n)
     m←1+⌊(⍵-1+p×p)÷2×p         ⍝ number of multiples of 2×p from (p^2) to n
     b⊣p{b[⍺×⍺+2×⍳⍵]←0}¨m       ⍝ mark off multiples of each prime
 }
