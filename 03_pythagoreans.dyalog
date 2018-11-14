:Namespace pythagoreans

⎕IO←0

triples←{{⍵/⍨(2⌷x)=+⌿2↑x←×⍨⍵}⍉↑,1+⍳⍵ ⍵ ⍵}

:EndNamespace