:Namespace vedic

 vsq←(+⌿10 10∘⊤)⍣2∘.×⍨1+⍳9
 dsp ← {_←⎕DL÷8 ⋄ ⍺ gfx.∆.Image(?3 9⍴256){⍺[⍵-1]}⍤1 2⊢vsq}
 pat ← {_←⍺ gfx.∆.Image ⍵≠vsq ⋄ _←⎕DL÷8 ⋄ 1+9|⍵+1}        

:EndNamespace
