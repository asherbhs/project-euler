⎕IO←0
F←,∘.{p×(9=≢d)∧∧/1=+/(1+⍳9)∘.=d←∊10⊥⍣¯1¨⍺,⍵,p←⍺×⍵}
D←{(10*⍵)(⊢+⍳⍤-)10*⍵-1}
⎕←+/∪(1 F⍥D 4),2 F⍥D 3
