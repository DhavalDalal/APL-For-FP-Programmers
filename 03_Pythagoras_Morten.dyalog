 Pythagoras_Morten←{
⍝ Pythagoeran Triples with sides up to ⍵

     r←⌽i←1+⍳⍵         ⍝ r is reversed count
     m←(2÷⍨⍵×⍵+1)⍴1    ⍝ +/⍳n ←→ (n(n+1))/2
     m[+\t]←2-t←¯1↓r   ⍝ +\m to get y
     xy←(r/i),⍪+\m     ⍝ x,⍪y

     ((⌊=⊢)0.5*⍨+/2*⍨xy)⌿xy
     ⍝ Dyalog v18.0 (2020): ((⌊=⊢)(+/⍢*∘2)xy)⌿xy
 }
