:Namespace trees

⎕IO←0

⍝ Simple Tree:
⍝	○                  
⍝	├─┬───┐            
⍝	○ ○   ○            
⍝	│ │   │            
⍝	○ ○   ○            
⍝	│ ├─┐ ├─────┬─────┐
⍝	○ ○ ○ ○     ○     ○
⍝	    │ │     │     │
⍝	    ○ ○     ○     ○
⍝	      ├─┬─┐ ├─┬─┐  
⍝	      ○ ○ ○ ○ ○ ○  
⍝	      │   │ │   │  
⍝	      ○   ○ ○   ○  

⍝ Tree Ids in Depth-first, pre-order traversal:
⍝	0                         
⍝	├─┬───┐                   
⍝	1 4   9                   
⍝	│ │   │                   
⍝	2 5   10                  
⍝	│ ├─┐ ├────────┬────────┐ 
⍝	3 6 7 11       18       25
⍝	    │ │        │        │ 
⍝	    8 12       19       26
⍝	      ├──┬──┐  ├──┬──┐    
⍝	      13 15 16 20 22 23   
⍝	      │     │  │     │    
⍝	      14    17 21    24   

⍝ Traditional AST representation:
_←10 (11 (12 (13 14) 15 (16 17))) (18 (19 (20 21) 22 (23 24))) (25 26)
ast←0 (1 (2 3)) (4 (5 6 (7 8))) (9 _)
⎕EX'_'

⍝ Compute a depth vector for ast
d←∊0{(⍺+1){⍵,⍺⍺ ⍵⍵ ⍺}∇/⌽⍺,1↓⍵}ast

⍝ Add some data to the tree, type, kind, and symbol to represent this code:
⍝	:Namespace
⍝	 global←5
⍝	 gex←×global
⍝	 func←{X←⍵+global ⋄ Y←X×X ⋄ Y}
⍝	:EndNamespace

⍝	F1                           
⍝	├──┬─────┐                   
⍝	B0 B0    B1                  
⍝	│  │     │                   
⍝	A0 E1    F1                  
⍝	│  ├──┐  ├────────┬────────┐ 
⍝	N0 P0 A1 B0       B0       A1
⍝	      │  │        │        │ 
⍝	      V0 E2       E2       V0
⍝	         ├──┬──┐  ├──┬──┐    
⍝	         A1 P0 A1 A1 P0 A1   
⍝	         │     │  │     │    
⍝	         V0    V0 V0    V0   

t←3 1 0 7 1 2 9 0 10 1 3 1 2 0 10 9 0 10 1 2 0 10 9 0 10 0 10
k←1 0 0 0 0 1 0 1 0 1 1 0 2 1 0 0 1 0 0 2 1 0 0 1 0 1 0 
n←0 ¯5 0 ¯6 ¯7 0 ¯8 0 ¯6 ¯9 0 ¯10 0 0 ¯1 ¯11 0 ¯5 ¯12 0 0 ¯10 ¯8 0 ¯10 0 ¯12
syms←0,,¨'⍵' '⍺' '⍺⍺' '⍵⍵' 'global' '5' 'gex' '×' 'func' 'X' '+' 'Y'	
N∆←'ABEFGLMNOPVZ'

⍝ Compute a Path Matrix
pm←⌈\⌈⍀(⍳≢d)@(,d,¨⍳≢d)⊢0⍴⍨(1+⌈/d),≢d

⍝ Compute the walking distance, three ways
wd0←0⌈(∘.+⍨1+d)-2×(⍉+.=⊢)pm
wd1←∘.(≢∪~∩)⍨(⌊∘⊃∪⊢)\⌽⍋⍋⌽d    ⍝ Credit H.PWiz, APL Orchard.
wd2←∘.(≢∪~∩)⍨⊢↑¨∘↓(⌈⍀+\↑⍨⌸-)d ⍝ Credit ngn, APL Orchard.

⍝ Compute Parent vector, quadratic
p←⌽0⌈¯1++/∨/(∘.>⍨⌽d)∧∘.>⍨⌽⍳≢d

⍝ Compuate Parent-Sibling vectors, Key
2{l[⍵[i]]←⍵[¯1+i←⍸0,2=⌿i]⊣p[⍵]←⍺[i←⍺⍸⍵]}⌿⊢∘⊂⌸d⊣l←p←⍳≢d

⍝ Enclosing Scope
scp←I@{t[⍵]≠3}⍣≡⍨p

⍝ Deletion Mask for sub-trees 12 and 4
n2d←⍸M←4 12∊⍨p I@{~⍵∊4 12}⍣≡⍳≢p

⍝ Delete sub-trees 12 and 4
p2←(⍸M)(⊢-1+⍸)(~M)⌿p
l2←(⍸M)(⊢-1+⍸)(~M)⌿l

⍝ Right sibling vector
rsv←i@(l[i←⍸l≠⍳≢l])⍳≢l

:EndNamespace