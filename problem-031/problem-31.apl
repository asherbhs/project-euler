⎕IO←0
coins←1 2 5 10 20 50 100 200
ways←8 201⍴0
ways[0;]←1
{
	(c a)←⍵
	v←coins[c]
	ways[c;a]←+/ways[c-1;a-v×⍳1+⌊a÷v]
}¨1 0∘+¨⍳7 201
⎕←ways[7;200]
