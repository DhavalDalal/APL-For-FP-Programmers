 Pythagoras_Block←{
⍝ Find Pythagorean trangles with [offset < x ≤ offset+size]

     (offset size)←⍵         ⍝ ⍺ is maximum size
     r←(1+⍺)-i←(1+offset)+⍳size  ⍝ r is remaining
     x←r/i
     m←(≢x)⍴1
     m[+\t]←2-t←¯1↓r
     xy←x,⍪1↓+\offset,m

     ((⌊=⊢)0.5*⍨+/2*⍨xy)⌿xy ⍝ select where z is integer
⍝ v18.0 : ((⌊=⊢)(+/⍢*∘2)xy)⌿xy
 }
