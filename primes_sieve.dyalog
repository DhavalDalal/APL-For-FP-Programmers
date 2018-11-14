:Namespace primes_sieve

⎕IO←0

sieve ← {⍸⊃{~⍵[⍺]:⍵ ⋄ 0@(⍺×2↓⍳⌈(≢⍵)÷⍺)⊢⍵}/⌽(⊂0 0,(⍵-2)⍴1),⍳⍵}

:EndNamespace