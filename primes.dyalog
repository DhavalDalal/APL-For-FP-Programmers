:Namespace primes

⎕IO←0

⍝ Filter Operator - Big No NO! 
filter←{(⍺⍺¨⍵)⌿⍵}

⍝ N Primes: Classic
primes1←{(2=+⌿0=X∘.|X)⌿X←⍳⍵}

⍝ N Primes: Membership
primes2←{(~X∊X∘.×X)⌿X←2↓⍳⍵}

:EndNamespace