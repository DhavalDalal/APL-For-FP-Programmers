:Namespace game_of_life

⎕IO←0

⍝ Game of Life a la Scholes with Wrapping
life←{⊃1 ⍵∨.∧3 4=+⌿,1 0 ¯1∘.⊖1 0 ¯1⌽¨⊂⍵}

⍝ Game of Life a la Whitney with No Wrapping
life2←{3=s-⍵∧4=s←{+/,⍵}⌺3 3⊢⍵}         
life2_torous←{1 1↓¯1 ¯1↓life2 ((⍴⍵)|¯1+⍳¨2+⍴⍵)⌷⍵}

edges←∘.⌈⍨2 1 2     ⍝ Neighbors weighted 2, centre = 1
good←5 6 7∊⍨⍳18     ⍝ 5 7 => 2 or 3 neighbors and live, 6 = 3 neighbors

life3←{⍝ Game of life using lookup table
      good[{+/,edges×⍵} ⌺ 3 3⊢⍵]
      }


:EndNamespace
