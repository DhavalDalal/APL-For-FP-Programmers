:Namespace game_of_life

⎕IO←0

⍝ Game of Life a la Scholes with Wrapping
life←{⊃1 ⍵∨.∧3 4=+⌿,1 0 ¯1∘.⊖1 0 ¯1⌽¨⊂⍵}

⍝ Game of Life a la Whitney with No Wrapping
life2←{3=s-⍵∧4=s←{+/,⍵}⌺3 3⊢⍵}

:EndNamespace