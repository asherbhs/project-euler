m←999999⍴0
m[1]←1
{
	m[⍵]: 1
	m[⍵×1+⍳¯1+⌊999999÷⍵]←1}¨1+⍳999998
p←⍸~m
⍝ I know a way to speed this up a little but
⍝ Dyalog is being a bitch so I'll do it whenever
⍝ I next read this comment >:(
⎕←+/{∧/p∊⍨10⊥¨(⍳n)⌽¨(n←¯1+≢d)⍴⊂d←10⊥⍣¯1⊢⍵}¨p

