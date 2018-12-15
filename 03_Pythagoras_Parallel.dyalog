 Pythagoras_Parallel←{
⍝ Distribute Pythagoras calculation to ⍺ processors

     ⍺←1111⌶⍬ ⍝ Default to # of processors reported by OS if ⍺ not provided

     Under←{⍵⍵⍣¯1 ⍺⍺ ⍵⍵ ⍵}  ⍝ Will probably be primitive ⍢ in Dyalog 18.0
     Slice_Triangle←{2-/⌊0.5+(⍵÷10000)×⌽(⍺÷⍨⍳1+⍺)∘×Under(⊢×1∘+)10000}  ⍝ Divide triangle of size ⍵ into ⍺ equal slices
     blksize←⍺ Slice_Triangle ⍵
     ⍝ blksize←⍺ {⌽{≢⍵}⌸⌈(+\⍳⍵)×⍺÷0.5×⍵×⍵+1} ⍵ ⍝ Morten's original brute force solution

     parts←⍵ Pythagoras_Block IÏ(+\¯1↓0,blksize),¨blksize
     ⊃⍪/parts ⍝ create a single 2-column matrix
 }
