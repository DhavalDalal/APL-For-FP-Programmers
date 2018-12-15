:Namespace MacAddress

⎕IO←0

⍝ General N Random Mac Addresses in two different forms
'-:'⊣@(' '=⊢)¨(14⍴(4⍴1),0)(17⍴1 1 0)\¨⊂⍉(⎕D,6↑⎕A)[(12⍴16)⊤?10⍴2*48]

:EndNamespace