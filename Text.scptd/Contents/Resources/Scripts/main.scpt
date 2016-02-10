FasdUAS 1.101.10   ��   ��    k             l      ��  ��   c] Text -- commonly-used text processing commands

Caution: When matching text item delimiters in text value, AppleScript uses the current scope's existing considering/ignoring case, diacriticals, hyphens, punctuation, white space and numeric strings settings; thus, wrapping a `search text` command in different considering/ignoring blocks can produce different results. For example, `search text "fud" for "F" will normally match the first character since AppleScript uses case-insensitive matching by default, whereas enclosing it in a `considering case` block will cause the same command to return zero matches. Conversely, `search text "f ud" for "fu"` will normally return zero matches as AppleScript considers white space by default, but when enclosed in an `ignoring white space` block will match the first three characters: "f u". This is how AppleScript is designed to work, but users need to be reminded of this as considering/ignoring blocks affect ALL script handlers called within that block, including nested calls (and all to any osax and application handlers that understand considering/ignoring attributes). (A much safer design would've restricted considering/ignoring blocks effect to their lexical scope by default; individual handlers would then using standard considering/ignoring behavior by default unless they use a `considering current options` block to indicate that the calling code's current considering/ignoring options should be used.)

TO DO:

- fix off-by-one error in `search text`:

	search text "ab" for "ab"
	--> {{class:matched text, startIndex:1, endIndex:1, foundText:"a", foundGroups:{}}} -- WRONG: should be `endIndex:2,foundText:"ab"`


- what about Unicode normalization when searching/comparing NSStrings? or does NSString/NSRegularExpression deal with that already? (i.e. are there any current use cases where explicit NSString normalization is required? probably not, but best confirm)

- decide if predefined considering/ignoring options in `search text`, etc. should consider or ignore diacriticals and numeric strings; once decided, use same combinations for List library's text comparator for consistency

- also provide `exact match` option in `search text`/`split text` that considers case, diacriticals, hyphens, punctuation and white space but ignores numeric strings? currently, the `case insensitivity` and `case sensitivity` options both consider numeric strings (BTW, it might be better to replace `case sensitivity` with `exact match` to avoid having too many confusing options); also check just how much `considering numeric strings` affects matching (as opposed to ordering, which is its real intention)

- implement `normalize text theText using normalizationForm`? One could argue this is just out of scope for stdlib as AS itself does the sensible thing when dealing with composed vs decomposed glyphs, treating them as logically equal. The problem is when AS interfaces with other systems that aren't (including shell and NSString), at which point AS code should normalize text before handing it off to ensure consistent behavior.

	- AS preserves composed vs decomposed unicode chars as-is (getting `id` produces different results) but is smart enough to compare them as equal; however, it doesn't normalize when reading/writing or crossing ASOC bridge so written files will vary and NSString (which is old-school UTF16) compares them as not-equal, so any operations involving NSString's `isEqual[ToString]:` will need to normalize both strings first to ensure consistent behavior using one of the following NSString methods:
	
		decomposedStringWithCanonicalMapping (Unicode Normalization Form D)
		decomposedStringWithCompatibilityMapping (Unicode Normalization Form KD)
		precomposedStringWithCanonicalMapping (Unicode Normalization Form C)
		precomposedStringWithCompatibilityMapping (Unicode Normalization Form KC)

 	- note that Satimage.osax provides a `normalize unicode` command, although it only covers 2 of 4 forms (most likely KD and KC) -- TO DO: use `precomposed characters` and `compatibility mapping` boolean params? (also, need to figure out which is preferred form to use as default: e.g. compiling "�" in SE gives precomposed form - though whether this is SE or AS or keyboard input has yet to be determined)



- `insert into text`, `delete from text` for inserting/replacing/deleting ranges of characters (c.f. `insert into list`, `delete from list` in List library)


- add `matching first item only` boolean option to `search text` (this allows users to perform incremental matching fairly efficiently without having to use an Iterator API)

- also allow `search text` handler's `replacing with` parameter to accept a script object containing a `replaceText` handler; this would take the match record produced by _findText()/_findPattern() and return the text to insert; useful when the replacement text is based on the original, e.g. when uppercasing matched text the user currently has to get a list of match records from `search text`, then iterate over it and replace each text range herself


- would it be worth implementing a `compare text` command that allows considering/ignoring options to be supplied as `considering`/`ignoring` parameters (considering/ignoring blocks can't be parameterized as they require hardcoded constants) as this would allow comparisons to be safely performed without having to futz with considering/ignoring blocks all the time (c.f. Number library's `compare number`); for extra flexibility, the comparator constructor should also be exposed as a public command, and the returned object implement the same `makeKey`+`compareItems` methods as List library's sort comparators, allowing them to be used interchangeably (one could even argue for putting all comparators into their own lib, which other libraries and user scripts can import whenever they need to parameterize comparison behavior)

- Q. what difference does locale make to uppercase/capitalize/lowercase text?

- what, if any, additional localization info (via NSLocale) might be relevant/useful to AS users?



- not sure about formatting type class and symbol constants in `literal representation` (IIRC, AS only binds application info to reference objects, not type/constant objects, in which case only terms defined in AS's own dictionary will format as keywords and the rest will format using raw chevron syntax (though currently even app specifers, which do know app identity, appear as raw syntax)

     � 	 	2�   T e x t   - -   c o m m o n l y - u s e d   t e x t   p r o c e s s i n g   c o m m a n d s 
 
 C a u t i o n :   W h e n   m a t c h i n g   t e x t   i t e m   d e l i m i t e r s   i n   t e x t   v a l u e ,   A p p l e S c r i p t   u s e s   t h e   c u r r e n t   s c o p e ' s   e x i s t i n g   c o n s i d e r i n g / i g n o r i n g   c a s e ,   d i a c r i t i c a l s ,   h y p h e n s ,   p u n c t u a t i o n ,   w h i t e   s p a c e   a n d   n u m e r i c   s t r i n g s   s e t t i n g s ;   t h u s ,   w r a p p i n g   a   ` s e a r c h   t e x t `   c o m m a n d   i n   d i f f e r e n t   c o n s i d e r i n g / i g n o r i n g   b l o c k s   c a n   p r o d u c e   d i f f e r e n t   r e s u l t s .   F o r   e x a m p l e ,   ` s e a r c h   t e x t   " f u d "   f o r   " F "   w i l l   n o r m a l l y   m a t c h   t h e   f i r s t   c h a r a c t e r   s i n c e   A p p l e S c r i p t   u s e s   c a s e - i n s e n s i t i v e   m a t c h i n g   b y   d e f a u l t ,   w h e r e a s   e n c l o s i n g   i t   i n   a   ` c o n s i d e r i n g   c a s e `   b l o c k   w i l l   c a u s e   t h e   s a m e   c o m m a n d   t o   r e t u r n   z e r o   m a t c h e s .   C o n v e r s e l y ,   ` s e a r c h   t e x t   " f   u d "   f o r   " f u " `   w i l l   n o r m a l l y   r e t u r n   z e r o   m a t c h e s   a s   A p p l e S c r i p t   c o n s i d e r s   w h i t e   s p a c e   b y   d e f a u l t ,   b u t   w h e n   e n c l o s e d   i n   a n   ` i g n o r i n g   w h i t e   s p a c e `   b l o c k   w i l l   m a t c h   t h e   f i r s t   t h r e e   c h a r a c t e r s :   " f   u " .   T h i s   i s   h o w   A p p l e S c r i p t   i s   d e s i g n e d   t o   w o r k ,   b u t   u s e r s   n e e d   t o   b e   r e m i n d e d   o f   t h i s   a s   c o n s i d e r i n g / i g n o r i n g   b l o c k s   a f f e c t   A L L   s c r i p t   h a n d l e r s   c a l l e d   w i t h i n   t h a t   b l o c k ,   i n c l u d i n g   n e s t e d   c a l l s   ( a n d   a l l   t o   a n y   o s a x   a n d   a p p l i c a t i o n   h a n d l e r s   t h a t   u n d e r s t a n d   c o n s i d e r i n g / i g n o r i n g   a t t r i b u t e s ) .   ( A   m u c h   s a f e r   d e s i g n   w o u l d ' v e   r e s t r i c t e d   c o n s i d e r i n g / i g n o r i n g   b l o c k s   e f f e c t   t o   t h e i r   l e x i c a l   s c o p e   b y   d e f a u l t ;   i n d i v i d u a l   h a n d l e r s   w o u l d   t h e n   u s i n g   s t a n d a r d   c o n s i d e r i n g / i g n o r i n g   b e h a v i o r   b y   d e f a u l t   u n l e s s   t h e y   u s e   a   ` c o n s i d e r i n g   c u r r e n t   o p t i o n s `   b l o c k   t o   i n d i c a t e   t h a t   t h e   c a l l i n g   c o d e ' s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   o p t i o n s   s h o u l d   b e   u s e d . ) 
 
 T O   D O : 
 
 -   f i x   o f f - b y - o n e   e r r o r   i n   ` s e a r c h   t e x t ` : 
 
 	 s e a r c h   t e x t   " a b "   f o r   " a b " 
 	 - - >   { { c l a s s : m a t c h e d   t e x t ,   s t a r t I n d e x : 1 ,   e n d I n d e x : 1 ,   f o u n d T e x t : " a " ,   f o u n d G r o u p s : { } } }   - -   W R O N G :   s h o u l d   b e   ` e n d I n d e x : 2 , f o u n d T e x t : " a b " ` 
 
 
 -   w h a t   a b o u t   U n i c o d e   n o r m a l i z a t i o n   w h e n   s e a r c h i n g / c o m p a r i n g   N S S t r i n g s ?   o r   d o e s   N S S t r i n g / N S R e g u l a r E x p r e s s i o n   d e a l   w i t h   t h a t   a l r e a d y ?   ( i . e .   a r e   t h e r e   a n y   c u r r e n t   u s e   c a s e s   w h e r e   e x p l i c i t   N S S t r i n g   n o r m a l i z a t i o n   i s   r e q u i r e d ?   p r o b a b l y   n o t ,   b u t   b e s t   c o n f i r m ) 
 
 -   d e c i d e   i f   p r e d e f i n e d   c o n s i d e r i n g / i g n o r i n g   o p t i o n s   i n   ` s e a r c h   t e x t ` ,   e t c .   s h o u l d   c o n s i d e r   o r   i g n o r e   d i a c r i t i c a l s   a n d   n u m e r i c   s t r i n g s ;   o n c e   d e c i d e d ,   u s e   s a m e   c o m b i n a t i o n s   f o r   L i s t   l i b r a r y ' s   t e x t   c o m p a r a t o r   f o r   c o n s i s t e n c y 
 
 -   a l s o   p r o v i d e   ` e x a c t   m a t c h `   o p t i o n   i n   ` s e a r c h   t e x t ` / ` s p l i t   t e x t `   t h a t   c o n s i d e r s   c a s e ,   d i a c r i t i c a l s ,   h y p h e n s ,   p u n c t u a t i o n   a n d   w h i t e   s p a c e   b u t   i g n o r e s   n u m e r i c   s t r i n g s ?   c u r r e n t l y ,   t h e   ` c a s e   i n s e n s i t i v i t y `   a n d   ` c a s e   s e n s i t i v i t y `   o p t i o n s   b o t h   c o n s i d e r   n u m e r i c   s t r i n g s   ( B T W ,   i t   m i g h t   b e   b e t t e r   t o   r e p l a c e   ` c a s e   s e n s i t i v i t y `   w i t h   ` e x a c t   m a t c h `   t o   a v o i d   h a v i n g   t o o   m a n y   c o n f u s i n g   o p t i o n s ) ;   a l s o   c h e c k   j u s t   h o w   m u c h   ` c o n s i d e r i n g   n u m e r i c   s t r i n g s `   a f f e c t s   m a t c h i n g   ( a s   o p p o s e d   t o   o r d e r i n g ,   w h i c h   i s   i t s   r e a l   i n t e n t i o n ) 
 
 -   i m p l e m e n t   ` n o r m a l i z e   t e x t   t h e T e x t   u s i n g   n o r m a l i z a t i o n F o r m ` ?   O n e   c o u l d   a r g u e   t h i s   i s   j u s t   o u t   o f   s c o p e   f o r   s t d l i b   a s   A S   i t s e l f   d o e s   t h e   s e n s i b l e   t h i n g   w h e n   d e a l i n g   w i t h   c o m p o s e d   v s   d e c o m p o s e d   g l y p h s ,   t r e a t i n g   t h e m   a s   l o g i c a l l y   e q u a l .   T h e   p r o b l e m   i s   w h e n   A S   i n t e r f a c e s   w i t h   o t h e r   s y s t e m s   t h a t   a r e n ' t   ( i n c l u d i n g   s h e l l   a n d   N S S t r i n g ) ,   a t   w h i c h   p o i n t   A S   c o d e   s h o u l d   n o r m a l i z e   t e x t   b e f o r e   h a n d i n g   i t   o f f   t o   e n s u r e   c o n s i s t e n t   b e h a v i o r . 
 
 	 -   A S   p r e s e r v e s   c o m p o s e d   v s   d e c o m p o s e d   u n i c o d e   c h a r s   a s - i s   ( g e t t i n g   ` i d `   p r o d u c e s   d i f f e r e n t   r e s u l t s )   b u t   i s   s m a r t   e n o u g h   t o   c o m p a r e   t h e m   a s   e q u a l ;   h o w e v e r ,   i t   d o e s n ' t   n o r m a l i z e   w h e n   r e a d i n g / w r i t i n g   o r   c r o s s i n g   A S O C   b r i d g e   s o   w r i t t e n   f i l e s   w i l l   v a r y   a n d   N S S t r i n g   ( w h i c h   i s   o l d - s c h o o l   U T F 1 6 )   c o m p a r e s   t h e m   a s   n o t - e q u a l ,   s o   a n y   o p e r a t i o n s   i n v o l v i n g   N S S t r i n g ' s   ` i s E q u a l [ T o S t r i n g ] : `   w i l l   n e e d   t o   n o r m a l i z e   b o t h   s t r i n g s   f i r s t   t o   e n s u r e   c o n s i s t e n t   b e h a v i o r   u s i n g   o n e   o f   t h e   f o l l o w i n g   N S S t r i n g   m e t h o d s : 
 	 
 	 	 d e c o m p o s e d S t r i n g W i t h C a n o n i c a l M a p p i n g   ( U n i c o d e   N o r m a l i z a t i o n   F o r m   D ) 
 	 	 d e c o m p o s e d S t r i n g W i t h C o m p a t i b i l i t y M a p p i n g   ( U n i c o d e   N o r m a l i z a t i o n   F o r m   K D ) 
 	 	 p r e c o m p o s e d S t r i n g W i t h C a n o n i c a l M a p p i n g   ( U n i c o d e   N o r m a l i z a t i o n   F o r m   C ) 
 	 	 p r e c o m p o s e d S t r i n g W i t h C o m p a t i b i l i t y M a p p i n g   ( U n i c o d e   N o r m a l i z a t i o n   F o r m   K C ) 
 
   	 -   n o t e   t h a t   S a t i m a g e . o s a x   p r o v i d e s   a   ` n o r m a l i z e   u n i c o d e `   c o m m a n d ,   a l t h o u g h   i t   o n l y   c o v e r s   2   o f   4   f o r m s   ( m o s t   l i k e l y   K D   a n d   K C )   - -   T O   D O :   u s e   ` p r e c o m p o s e d   c h a r a c t e r s `   a n d   ` c o m p a t i b i l i t y   m a p p i n g `   b o o l e a n   p a r a m s ?   ( a l s o ,   n e e d   t o   f i g u r e   o u t   w h i c h   i s   p r e f e r r e d   f o r m   t o   u s e   a s   d e f a u l t :   e . g .   c o m p i l i n g   " � "   i n   S E   g i v e s   p r e c o m p o s e d   f o r m   -   t h o u g h   w h e t h e r   t h i s   i s   S E   o r   A S   o r   k e y b o a r d   i n p u t   h a s   y e t   t o   b e   d e t e r m i n e d ) 
 
 
 
 -   ` i n s e r t   i n t o   t e x t ` ,   ` d e l e t e   f r o m   t e x t `   f o r   i n s e r t i n g / r e p l a c i n g / d e l e t i n g   r a n g e s   o f   c h a r a c t e r s   ( c . f .   ` i n s e r t   i n t o   l i s t ` ,   ` d e l e t e   f r o m   l i s t `   i n   L i s t   l i b r a r y ) 
 
 
 -   a d d   ` m a t c h i n g   f i r s t   i t e m   o n l y `   b o o l e a n   o p t i o n   t o   ` s e a r c h   t e x t `   ( t h i s   a l l o w s   u s e r s   t o   p e r f o r m   i n c r e m e n t a l   m a t c h i n g   f a i r l y   e f f i c i e n t l y   w i t h o u t   h a v i n g   t o   u s e   a n   I t e r a t o r   A P I ) 
 
 -   a l s o   a l l o w   ` s e a r c h   t e x t `   h a n d l e r ' s   ` r e p l a c i n g   w i t h `   p a r a m e t e r   t o   a c c e p t   a   s c r i p t   o b j e c t   c o n t a i n i n g   a   ` r e p l a c e T e x t `   h a n d l e r ;   t h i s   w o u l d   t a k e   t h e   m a t c h   r e c o r d   p r o d u c e d   b y   _ f i n d T e x t ( ) / _ f i n d P a t t e r n ( )   a n d   r e t u r n   t h e   t e x t   t o   i n s e r t ;   u s e f u l   w h e n   t h e   r e p l a c e m e n t   t e x t   i s   b a s e d   o n   t h e   o r i g i n a l ,   e . g .   w h e n   u p p e r c a s i n g   m a t c h e d   t e x t   t h e   u s e r   c u r r e n t l y   h a s   t o   g e t   a   l i s t   o f   m a t c h   r e c o r d s   f r o m   ` s e a r c h   t e x t ` ,   t h e n   i t e r a t e   o v e r   i t   a n d   r e p l a c e   e a c h   t e x t   r a n g e   h e r s e l f 
 
 
 -   w o u l d   i t   b e   w o r t h   i m p l e m e n t i n g   a   ` c o m p a r e   t e x t `   c o m m a n d   t h a t   a l l o w s   c o n s i d e r i n g / i g n o r i n g   o p t i o n s   t o   b e   s u p p l i e d   a s   ` c o n s i d e r i n g ` / ` i g n o r i n g `   p a r a m e t e r s   ( c o n s i d e r i n g / i g n o r i n g   b l o c k s   c a n ' t   b e   p a r a m e t e r i z e d   a s   t h e y   r e q u i r e   h a r d c o d e d   c o n s t a n t s )   a s   t h i s   w o u l d   a l l o w   c o m p a r i s o n s   t o   b e   s a f e l y   p e r f o r m e d   w i t h o u t   h a v i n g   t o   f u t z   w i t h   c o n s i d e r i n g / i g n o r i n g   b l o c k s   a l l   t h e   t i m e   ( c . f .   N u m b e r   l i b r a r y ' s   ` c o m p a r e   n u m b e r ` ) ;   f o r   e x t r a   f l e x i b i l i t y ,   t h e   c o m p a r a t o r   c o n s t r u c t o r   s h o u l d   a l s o   b e   e x p o s e d   a s   a   p u b l i c   c o m m a n d ,   a n d   t h e   r e t u r n e d   o b j e c t   i m p l e m e n t   t h e   s a m e   ` m a k e K e y ` + ` c o m p a r e I t e m s `   m e t h o d s   a s   L i s t   l i b r a r y ' s   s o r t   c o m p a r a t o r s ,   a l l o w i n g   t h e m   t o   b e   u s e d   i n t e r c h a n g e a b l y   ( o n e   c o u l d   e v e n   a r g u e   f o r   p u t t i n g   a l l   c o m p a r a t o r s   i n t o   t h e i r   o w n   l i b ,   w h i c h   o t h e r   l i b r a r i e s   a n d   u s e r   s c r i p t s   c a n   i m p o r t   w h e n e v e r   t h e y   n e e d   t o   p a r a m e t e r i z e   c o m p a r i s o n   b e h a v i o r ) 
 
 -   Q .   w h a t   d i f f e r e n c e   d o e s   l o c a l e   m a k e   t o   u p p e r c a s e / c a p i t a l i z e / l o w e r c a s e   t e x t ? 
 
 -   w h a t ,   i f   a n y ,   a d d i t i o n a l   l o c a l i z a t i o n   i n f o   ( v i a   N S L o c a l e )   m i g h t   b e   r e l e v a n t / u s e f u l   t o   A S   u s e r s ? 
 
 
 
 -   n o t   s u r e   a b o u t   f o r m a t t i n g   t y p e   c l a s s   a n d   s y m b o l   c o n s t a n t s   i n   ` l i t e r a l   r e p r e s e n t a t i o n `   ( I I R C ,   A S   o n l y   b i n d s   a p p l i c a t i o n   i n f o   t o   r e f e r e n c e   o b j e c t s ,   n o t   t y p e / c o n s t a n t   o b j e c t s ,   i n   w h i c h   c a s e   o n l y   t e r m s   d e f i n e d   i n   A S ' s   o w n   d i c t i o n a r y   w i l l   f o r m a t   a s   k e y w o r d s   a n d   t h e   r e s t   w i l l   f o r m a t   u s i n g   r a w   c h e v r o n   s y n t a x   ( t h o u g h   c u r r e n t l y   e v e n   a p p   s p e c i f e r s ,   w h i c h   d o   k n o w   a p p   i d e n t i t y ,   a p p e a r   a s   r a w   s y n t a x ) 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        l     ��������  ��  ��        j    �� �� 60 _textsupportagentbundleid _TextSupportAgentBundleID  m       �   d c o m . a p p l e . S c r i p t E d i t o r . i d . l i b r a r y . T e x t . T e x t S u p p o r t      l     ��������  ��  ��        l     ��������  ��  ��         l     �� ! "��   ! J D--------------------------------------------------------------------    " � # # � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -    $ % $ l     �� & '��   &   record types    ' � ( (    r e c o r d   t y p e s %  ) * ) l     ��������  ��  ��   *  + , + j    �� -�� (0 _unmatchedtexttype _UnmatchedTextType - m    ��
�� 
TxtU ,  . / . j    �� 0�� $0 _matchedtexttype _MatchedTextType 0 m    ��
�� 
TxtM /  1 2 1 j    �� 3�� &0 _matchedgrouptype _MatchedGroupType 3 m    ��
�� 
TxtG 2  4 5 4 l     ��������  ��  ��   5  6 7 6 l     ��������  ��  ��   7  8 9 8 l     �� : ;��   : J D--------------------------------------------------------------------    ; � < < � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 9  = > = l     �� ? @��   ?   support    @ � A A    s u p p o r t >  B C B l     ��������  ��  ��   C  D E D l      F G H F j    �� I�� 0 _support   I N     J J 4    �� K
�� 
scpt K m     L L � M M  T y p e S u p p o r t G "  used for parameter checking    H � N N 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g E  O P O l     ��������  ��  ��   P  Q R Q l     ��������  ��  ��   R  S T S i   ! U V U I      �� W���� 
0 _error   W  X Y X o      ���� 0 handlername handlerName Y  Z [ Z o      ���� 0 etext eText [  \ ] \ o      ���� 0 enumber eNumber ]  ^ _ ^ o      ���� 0 efrom eFrom _  `�� ` o      ���� 
0 eto eTo��  ��   V n     a b a I    �� c���� &0 throwcommanderror throwCommandError c  d e d m     f f � g g  T e x t e  h i h o    ���� 0 handlername handlerName i  j k j o    ���� 0 etext eText k  l m l o    	���� 0 enumber eNumber m  n o n o   	 
���� 0 efrom eFrom o  p�� p o   
 ���� 
0 eto eTo��  ��   b o     ���� 0 _support   T  q r q l     ��������  ��  ��   r  s t s l     ��������  ��  ��   t  u v u l     �� w x��   w J D--------------------------------------------------------------------    x � y y � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - v  z { z l     �� | }��   |   Find and Replace Suite    } � ~ ~ .   F i n d   a n d   R e p l a c e   S u i t e {   �  l     ��������  ��  ��   �  � � � i  " % � � � I      �� ����� 60 _compileregularexpression _compileRegularExpression �  ��� � o      ���� 0 patterntext patternText��  ��   � k     " � �  � � � r      � � � n    
 � � � I    
�� ����� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_ �  � � � o    ���� 0 patterntext patternText �  � � � m    ����   �  ��� � l    ����� � m    ��
�� 
msng��  ��  ��  ��   � n     � � � o    ���� *0 nsregularexpression NSRegularExpression � m     ��
�� misccura � o      ���� 
0 regexp   �  � � � Z    � ����� � =    � � � o    ���� 
0 regexp   � m    ��
�� 
msng � R    �� � �
�� .ascrerr ****      � **** � m     � � � � � \ I n v a l i d    f o r    p a r a m e t e r   ( n o t   a   v a l i d   p a t t e r n ) . � �� � �
�� 
errn � m    �����Y � �� ���
�� 
erob � o    ���� 0 patterntext patternText��  ��  ��   �  ��� � L     " � � o     !���� 
0 regexp  ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �   find pattern    � � � �    f i n d   p a t t e r n �  � � � l     ��������  ��  ��   �  � � � i  & ) � � � I      �� ����� $0 _matchinforecord _matchInfoRecord �  � � � o      ���� 0 
asocstring 
asocString �  � � � o      ����  0 asocmatchrange asocMatchRange �  � � � o      ���� 0 
textoffset 
textOffset �  ��� � o      ���� 0 
recordtype 
recordType��  ��   � k     # � �  � � � r     
 � � � c      � � � l     ����� � n     � � � I    �� ����� *0 substringwithrange_ substringWithRange_ �  ��� � o    ��  0 asocmatchrange asocMatchRange��  ��   � o     �~�~ 0 
asocstring 
asocString��  ��   � m    �}
�} 
ctxt � o      �|�| 0 	foundtext 	foundText �  � � � l    � � � � r     � � � [     � � � o    �{�{ 0 
textoffset 
textOffset � l    ��z�y � n     � � � 1    �x
�x 
leng � o    �w�w 0 	foundtext 	foundText�z  �y   � o      �v�v  0 nexttextoffset nextTextOffset � : 4 calculate the start index of the next AS text range    � � � � h   c a l c u l a t e   t h e   s t a r t   i n d e x   o f   t h e   n e x t   A S   t e x t   r a n g e �  � � � l   �u � ��u   �
 note: record keys are identifiers, not keywords, as 1. library-defined keywords are a huge pain to use outside of `tell script...` blocks and 2. importing the library's terminology into the global namespace via `use script...` is an excellent way to create keyword conflicts; only the class value is a keyword since Script Editor/OSAKit don't correctly handle records that use non-typename values (e.g. `{class:"matched text",...}`), but this shouldn't impact usability as it's really only used for informational purposes    � � � �   n o t e :   r e c o r d   k e y s   a r e   i d e n t i f i e r s ,   n o t   k e y w o r d s ,   a s   1 .   l i b r a r y - d e f i n e d   k e y w o r d s   a r e   a   h u g e   p a i n   t o   u s e   o u t s i d e   o f   ` t e l l   s c r i p t . . . `   b l o c k s   a n d   2 .   i m p o r t i n g   t h e   l i b r a r y ' s   t e r m i n o l o g y   i n t o   t h e   g l o b a l   n a m e s p a c e   v i a   ` u s e   s c r i p t . . . `   i s   a n   e x c e l l e n t   w a y   t o   c r e a t e   k e y w o r d   c o n f l i c t s ;   o n l y   t h e   c l a s s   v a l u e   i s   a   k e y w o r d   s i n c e   S c r i p t   E d i t o r / O S A K i t   d o n ' t   c o r r e c t l y   h a n d l e   r e c o r d s   t h a t   u s e   n o n - t y p e n a m e   v a l u e s   ( e . g .   ` { c l a s s : " m a t c h e d   t e x t " , . . . } ` ) ,   b u t   t h i s   s h o u l d n ' t   i m p a c t   u s a b i l i t y   a s   i t ' s   r e a l l y   o n l y   u s e d   f o r   i n f o r m a t i o n a l   p u r p o s e s �  ��t � l   # � � � � L    # � � J    " � �  � � � K     � � �s � �
�s 
pcls � o    �r�r 0 
recordtype 
recordType � �q � ��q 0 
startindex 
startIndex � o    �p�p 0 
textoffset 
textOffset � �o � ��o 0 endindex endIndex � \     � � � o    �n�n  0 nexttextoffset nextTextOffset � m    �m�m  � �l ��k�l 0 	foundtext 	foundText � o    �j�j 0 	foundtext 	foundText�k   �  ��i � o     �h�h  0 nexttextoffset nextTextOffset�i   � | v TO DO: use fromIndex/toIndex instead of startIndex/endIndex? (see also List; consistent naming would be good to have)    � � � � �   T O   D O :   u s e   f r o m I n d e x / t o I n d e x   i n s t e a d   o f   s t a r t I n d e x / e n d I n d e x ?   ( s e e   a l s o   L i s t ;   c o n s i s t e n t   n a m i n g   w o u l d   b e   g o o d   t o   h a v e )�t   �  � � � l     �g�f�e�g  �f  �e   �  � � � l     �d�c�b�d  �c  �b   �  � � � i  * - � � � I      �a ��`�a 0 _matchrecords _matchRecords �  � � � o      �_�_ 0 
asocstring 
asocString �  � � � o      �^�^  0 asocmatchrange asocMatchRange �  � � � o      �]�]  0 asocstartindex asocStartIndex �  � � � o      �\�\ 0 
textoffset 
textOffset �    o      �[�[ (0 nonmatchrecordtype nonMatchRecordType �Z o      �Y�Y "0 matchrecordtype matchRecordType�Z  �`   � k     V  l     �X�X   � � important: NSString character indexes aren't guaranteed to be same as AS character indexes, so reconstruct both non-matching and matching AS text values, and calculate accurate AS character ranges from those    ��   i m p o r t a n t :   N S S t r i n g   c h a r a c t e r   i n d e x e s   a r e n ' t   g u a r a n t e e d   t o   b e   s a m e   a s   A S   c h a r a c t e r   i n d e x e s ,   s o   r e c o n s t r u c t   b o t h   n o n - m a t c h i n g   a n d   m a t c h i n g   A S   t e x t   v a l u e s ,   a n d   c a l c u l a t e   a c c u r a t e   A S   c h a r a c t e r   r a n g e s   f r o m   t h o s e 	
	 r      n     I    �W�V�U�W 0 location  �V  �U   o     �T�T  0 asocmatchrange asocMatchRange o      �S�S  0 asocmatchstart asocMatchStart
  r     [     o    	�R�R  0 asocmatchstart asocMatchStart l  	 �Q�P n  	  I   
 �O�N�M�O 
0 length  �N  �M   o   	 
�L�L  0 asocmatchrange asocMatchRange�Q  �P   o      �K�K 0 asocmatchend asocMatchEnd  r     K     �J�J 0 location   o    �I�I  0 asocstartindex asocStartIndex �H�G�H 
0 length   \     !  o    �F�F  0 asocmatchstart asocMatchStart! o    �E�E  0 asocstartindex asocStartIndex�G   o      �D�D &0 asocnonmatchrange asocNonMatchRange "#" r    5$%$ I      �C&�B�C $0 _matchinforecord _matchInfoRecord& '(' o    �A�A 0 
asocstring 
asocString( )*) o     �@�@ &0 asocnonmatchrange asocNonMatchRange* +,+ o     !�?�? 0 
textoffset 
textOffset, -�>- o   ! "�=�= (0 nonmatchrecordtype nonMatchRecordType�>  �B  % J      .. /0/ o      �<�< 0 nonmatchinfo nonMatchInfo0 1�;1 o      �:�: 0 
textoffset 
textOffset�;  # 232 r   6 N454 I      �96�8�9 $0 _matchinforecord _matchInfoRecord6 787 o   7 8�7�7 0 
asocstring 
asocString8 9:9 o   8 9�6�6  0 asocmatchrange asocMatchRange: ;<; o   9 :�5�5 0 
textoffset 
textOffset< =�4= o   : ;�3�3 "0 matchrecordtype matchRecordType�4  �8  5 J      >> ?@? o      �2�2 0 	matchinfo 	matchInfo@ A�1A o      �0�0 0 
textoffset 
textOffset�1  3 B�/B L   O VCC J   O UDD EFE o   O P�.�. 0 nonmatchinfo nonMatchInfoF GHG o   P Q�-�- 0 	matchinfo 	matchInfoH IJI o   Q R�,�, 0 asocmatchend asocMatchEndJ K�+K o   R S�*�* 0 
textoffset 
textOffset�+  �/   � LML l     �)�(�'�)  �(  �'  M NON l     �&�%�$�&  �%  �$  O PQP i  . 1RSR I      �#T�"�# &0 _matchedgrouplist _matchedGroupListT UVU o      �!�! 0 
asocstring 
asocStringV WXW o      � �  0 	asocmatch 	asocMatchX YZY o      �� 0 
textoffset 
textOffsetZ [�[ o      �� &0 includenonmatches includeNonMatches�  �"  S k     �\\ ]^] r     _`_ J     ��  ` o      �� "0 submatchresults subMatchResults^ aba r    cdc \    efe l   
g��g n   
hih I    
����  0 numberofranges numberOfRanges�  �  i o    �� 0 	asocmatch 	asocMatch�  �  f m   
 �� d o      �� 0 groupindexes groupIndexesb jkj Z    �lm��l ?    non o    �� 0 groupindexes groupIndexeso m    ��  m k    �pp qrq r    sts n   uvu I    �w�� 0 rangeatindex_ rangeAtIndex_w x�x m    ��  �  �  v o    �
�
 0 	asocmatch 	asocMatcht o      �	�	 (0 asocfullmatchrange asocFullMatchRanger yzy r    %{|{ n   #}~} I    #���� 0 location  �  �  ~ o    �� (0 asocfullmatchrange asocFullMatchRange| o      �� &0 asocnonmatchstart asocNonMatchStartz � r   & /��� [   & -��� o   & '�� &0 asocnonmatchstart asocNonMatchStart� l  ' ,���� n  ' ,��� I   ( ,� �����  
0 length  ��  ��  � o   ' (���� (0 asocfullmatchrange asocFullMatchRange�  �  � o      ���� $0 asocfullmatchend asocFullMatchEnd� ��� Y   0 ��������� k   : ��� ��� r   : o��� I      ������� 0 _matchrecords _matchRecords� ��� o   ; <���� 0 
asocstring 
asocString� ��� n  < B��� I   = B������� 0 rangeatindex_ rangeAtIndex_� ���� o   = >���� 0 i  ��  ��  � o   < =���� 0 	asocmatch 	asocMatch� ��� o   B C���� &0 asocnonmatchstart asocNonMatchStart� ��� o   C D���� 0 
textoffset 
textOffset� ��� o   D I���� (0 _unmatchedtexttype _UnmatchedTextType� ���� o   I N���� &0 _matchedgrouptype _MatchedGroupType��  ��  � J      �� ��� o      ���� 0 nonmatchinfo nonMatchInfo� ��� o      ���� 0 	matchinfo 	matchInfo� ��� o      ���� &0 asocnonmatchstart asocNonMatchStart� ���� o      ���� 0 
textoffset 
textOffset��  � ��� Z  p |������� o   p q���� &0 includenonmatches includeNonMatches� r   t x��� o   t u���� 0 nonmatchinfo nonMatchInfo� n      ���  ;   v w� o   u v���� "0 submatchresults subMatchResults��  ��  � ���� r   } ���� o   } ~���� 0 	matchinfo 	matchInfo� n      ���  ;    �� o   ~ ���� "0 submatchresults subMatchResults��  �� 0 i  � m   3 4���� � o   4 5���� 0 groupindexes groupIndexes��  � ���� Z   � �������� o   � ����� &0 includenonmatches includeNonMatches� k   � ��� ��� r   � ���� K   � ��� ������ 0 location  � o   � ����� &0 asocnonmatchstart asocNonMatchStart� ������� 
0 length  � \   � ���� o   � ����� $0 asocfullmatchend asocFullMatchEnd� o   � ����� &0 asocnonmatchstart asocNonMatchStart��  � o      ���� &0 asocnonmatchrange asocNonMatchRange� ���� r   � ���� n   � ���� 4   � ����
�� 
cobj� m   � ����� � I   � �������� $0 _matchinforecord _matchInfoRecord� ��� o   � ����� 0 
asocstring 
asocString� ��� o   � ����� &0 asocnonmatchrange asocNonMatchRange� ��� o   � ����� 0 
textoffset 
textOffset� ���� o   � ����� (0 _unmatchedtexttype _UnmatchedTextType��  ��  � n      ���  ;   � �� o   � ����� "0 submatchresults subMatchResults��  ��  ��  ��  �  �  k ���� L   � ��� o   � ����� "0 submatchresults subMatchResults��  Q ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  2 5��� I      ������� 0 _findpattern _findPattern� ��� o      ���� 0 thetext theText� ��� o      ���� 0 patterntext patternText� ��� o      ���� &0 includenonmatches includeNonMatches� ���� o      ����  0 includematches includeMatches��  ��  � k    �� ��� r     ��� n    ��� I    ������� (0 asbooleanparameter asBooleanParameter� ��� o    ���� &0 includenonmatches includeNonMatches� ���� m    �� ���  u n m a t c h e d   t e x t��  ��  � o     ���� 0 _support  � o      ���� &0 includenonmatches includeNonMatches� ��� r    ��� n   ��� I    ������� (0 asbooleanparameter asBooleanParameter� ��� o    ����  0 includematches includeMatches� ���� m       �  m a t c h e d   t e x t��  ��  � o    ���� 0 _support  � o      ����  0 includematches includeMatches�  r    $ I    "������ 60 _compileregularexpression _compileRegularExpression �� o    ���� 0 patterntext patternText��  ��   o      ���� 
0 regexp   	 r   % /

 n  % - I   ( -������ &0 stringwithstring_ stringWithString_ �� o   ( )���� 0 thetext theText��  ��   n  % ( o   & (���� 0 nsstring NSString m   % &��
�� misccura o      ���� 0 
asocstring 
asocString	  l  0 3 r   0 3 m   0 1����   o      ���� &0 asocnonmatchstart asocNonMatchStart G A used to calculate NSRanges for non-matching portions of NSString    � �   u s e d   t o   c a l c u l a t e   N S R a n g e s   f o r   n o n - m a t c h i n g   p o r t i o n s   o f   N S S t r i n g  l  4 7 r   4 7  m   4 5����   o      ���� 0 
textoffset 
textOffset B < used to calculate correct AppleScript start and end indexes    �!! x   u s e d   t o   c a l c u l a t e   c o r r e c t   A p p l e S c r i p t   s t a r t   a n d   e n d   i n d e x e s "#" r   8 <$%$ J   8 :����  % o      ���� 0 
resultlist 
resultList# &'& l  = =��()��  ( @ : iterate over each non-matched + matched range in NSString   ) �** t   i t e r a t e   o v e r   e a c h   n o n - m a t c h e d   +   m a t c h e d   r a n g e   i n   N S S t r i n g' +,+ r   = N-.- n  = L/0/ I   > L��1���� @0 matchesinstring_options_range_ matchesInString_options_range_1 232 o   > ?���� 0 
asocstring 
asocString3 454 m   ? @����  5 6��6 J   @ H77 898 m   @ A����  9 :��: n  A F;<; I   B F�������� 
0 length  ��  ��  < o   A B���� 0 
asocstring 
asocString��  ��  ��  0 o   = >���� 
0 regexp  . o      ����  0 asocmatcharray asocMatchArray, =>= Y   O �?��@A��? k   _ �BB CDC r   _ gEFE l  _ eG����G n  _ eHIH I   ` e��J����  0 objectatindex_ objectAtIndex_J K��K o   ` a���� 0 i  ��  ��  I o   _ `����  0 asocmatcharray asocMatchArray��  ��  F o      ���� 0 	asocmatch 	asocMatchD LML l  h h�NO�  N � � the first range in match identifies the text matched by the entire pattern, so generate records for full match and its preceding (unmatched) text   O �PP$   t h e   f i r s t   r a n g e   i n   m a t c h   i d e n t i f i e s   t h e   t e x t   m a t c h e d   b y   t h e   e n t i r e   p a t t e r n ,   s o   g e n e r a t e   r e c o r d s   f o r   f u l l   m a t c h   a n d   i t s   p r e c e d i n g   ( u n m a t c h e d )   t e x tM QRQ r   h �STS I      �~U�}�~ 0 _matchrecords _matchRecordsU VWV o   i j�|�| 0 
asocstring 
asocStringW XYX n  j pZ[Z I   k p�{\�z�{ 0 rangeatindex_ rangeAtIndex_\ ]�y] m   k l�x�x  �y  �z  [ o   j k�w�w 0 	asocmatch 	asocMatchY ^_^ o   p q�v�v &0 asocnonmatchstart asocNonMatchStart_ `a` o   q r�u�u 0 
textoffset 
textOffseta bcb o   r w�t�t (0 _unmatchedtexttype _UnmatchedTextTypec d�sd o   w |�r�r $0 _matchedtexttype _MatchedTextType�s  �}  T J      ee fgf o      �q�q 0 nonmatchinfo nonMatchInfog hih o      �p�p 0 	matchinfo 	matchInfoi jkj o      �o�o &0 asocnonmatchstart asocNonMatchStartk l�nl o      �m�m 0 
textoffset 
textOffset�n  R mnm Z  � �op�l�ko o   � ��j�j &0 includenonmatches includeNonMatchesp r   � �qrq o   � ��i�i 0 nonmatchinfo nonMatchInfor n      sts  ;   � �t o   � ��h�h 0 
resultlist 
resultList�l  �k  n u�gu Z   � �vw�f�ev o   � ��d�d  0 includematches includeMatchesw k   � �xx yzy l  � ��c{|�c  { any additional ranges in match identify text matched by group references within regexp pattern, e.g. "([0-9]{4})-([0-9]{2})-([0-9]{2})" will match `YYYY-MM-DD` style date strings, returning the entire text match, plus sub-matches representing year, month and day text   | �}}   a n y   a d d i t i o n a l   r a n g e s   i n   m a t c h   i d e n t i f y   t e x t   m a t c h e d   b y   g r o u p   r e f e r e n c e s   w i t h i n   r e g e x p   p a t t e r n ,   e . g .   " ( [ 0 - 9 ] { 4 } ) - ( [ 0 - 9 ] { 2 } ) - ( [ 0 - 9 ] { 2 } ) "   w i l l   m a t c h   ` Y Y Y Y - M M - D D `   s t y l e   d a t e   s t r i n g s ,   r e t u r n i n g   t h e   e n t i r e   t e x t   m a t c h ,   p l u s   s u b - m a t c h e s   r e p r e s e n t i n g   y e a r ,   m o n t h   a n d   d a y   t e x tz ~�b~ r   � �� b   � ���� o   � ��a�a 0 	matchinfo 	matchInfo� K   � ��� �`��_�` 0 foundgroups foundGroups� I   � ��^��]�^ &0 _matchedgrouplist _matchedGroupList� ��� o   � ��\�\ 0 
asocstring 
asocString� ��� o   � ��[�[ 0 	asocmatch 	asocMatch� ��� n  � ���� o   � ��Z�Z 0 
startindex 
startIndex� o   � ��Y�Y 0 	matchinfo 	matchInfo� ��X� o   � ��W�W &0 includenonmatches includeNonMatches�X  �]  �_  � n      ���  ;   � �� o   � ��V�V 0 
resultlist 
resultList�b  �f  �e  �g  �� 0 i  @ m   R S�U�U  A \   S Z��� l  S X��T�S� n  S X��� I   T X�R�Q�P�R 	0 count  �Q  �P  � o   S T�O�O  0 asocmatcharray asocMatchArray�T  �S  � m   X Y�N�N ��  > ��� l  � ��M���M  � "  add final non-matched range   � ��� 8   a d d   f i n a l   n o n - m a t c h e d   r a n g e� ��� Z   ����L�K� o   � ��J�J &0 includenonmatches includeNonMatches� k   � �� ��� r   � ���� c   � ���� l  � ���I�H� n  � ���� I   � ��G��F�G *0 substringfromindex_ substringFromIndex_� ��E� o   � ��D�D &0 asocnonmatchstart asocNonMatchStart�E  �F  � o   � ��C�C 0 
asocstring 
asocString�I  �H  � m   � ��B
�B 
ctxt� o      �A�A 0 	foundtext 	foundText� ��@� r   � ��� K   � ��� �?��
�? 
pcls� o   � ��>�> (0 _unmatchedtexttype _UnmatchedTextType� �=���= 0 
startindex 
startIndex� o   � ��<�< 0 
textoffset 
textOffset� �;���; 0 endindex endIndex� n   � ���� 1   � ��:
�: 
leng� o   � ��9�9 0 thetext theText� �8��7�8 0 	foundtext 	foundText� o   � ��6�6 0 	foundtext 	foundText�7  � n      ���  ;   � �� o   � ��5�5 0 
resultlist 
resultList�@  �L  �K  � ��4� L  �� o  �3�3 0 
resultlist 
resultList�4  � ��� l     �2�1�0�2  �1  �0  � ��� l     �/�.�-�/  �.  �-  � ��� l     �,���,  �  -----   � ��� 
 - - - - -� ��� l     �+���+  �   replace pattern   � ���     r e p l a c e   p a t t e r n� ��� l     �*�)�(�*  �)  �(  � ��� i  6 9��� I      �'��&�' "0 _replacepattern _replacePattern� ��� o      �%�% 0 thetext theText� ��� o      �$�$ 0 patterntext patternText� ��#� o      �"�" 0 templatetext templateText�#  �&  � k     %�� ��� r     
��� n    ��� I    �!�� �! &0 stringwithstring_ stringWithString_� ��� o    �� 0 thetext theText�  �   � n    ��� o    �� 0 nsstring NSString� m     �
� misccura� o      �� 0 
asocstring 
asocString� ��� r    ��� I    ���� 60 _compileregularexpression _compileRegularExpression� ��� o    �� 0 patterntext patternText�  �  � o      �� 
0 regexp  � ��� L    %�� n   $��� I    $���� |0 <stringbyreplacingmatchesinstring_options_range_withtemplate_ <stringByReplacingMatchesInString_options_range_withTemplate_� ��� o    �� 0 
asocstring 
asocString� ��� m    ��  � ��� J    �� ��� m    ��  � ��� n   ��� I    ���� 
0 length  �  �  � o    �� 0 
asocstring 
asocString�  � ��
� o     �	�	 0 templatetext templateText�
  �  � o    �� 
0 regexp  �  � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     �� �  �  -----     � 
 - - - - -�  l     � �     
 find text    �    f i n d   t e x t  l     ��������  ��  ��   	
	 i  : = I      ������ 0 	_findtext 	_findText  o      ���� 0 thetext theText  o      ���� 0 fortext forText  o      ���� &0 includenonmatches includeNonMatches �� o      ����  0 includematches includeMatches��  ��   k    '  l     ����  �� TO DO: is it worth switching to a more efficient algorithim when hypens, punctuation, and white space are all considered and numeric strings ignored (the default)? i.e. given a fixed-length match, the endIndex of a match can be determined using `forText's length + startIndex - 1` instead of measuring the length of all remaining text after `text item i`; will need to implement both approaches and profile them to determine if it makes any significant difference to speed    ��   T O   D O :   i s   i t   w o r t h   s w i t c h i n g   t o   a   m o r e   e f f i c i e n t   a l g o r i t h i m   w h e n   h y p e n s ,   p u n c t u a t i o n ,   a n d   w h i t e   s p a c e   a r e   a l l   c o n s i d e r e d   a n d   n u m e r i c   s t r i n g s   i g n o r e d   ( t h e   d e f a u l t ) ?   i . e .   g i v e n   a   f i x e d - l e n g t h   m a t c h ,   t h e   e n d I n d e x   o f   a   m a t c h   c a n   b e   d e t e r m i n e d   u s i n g   ` f o r T e x t ' s   l e n g t h   +   s t a r t I n d e x   -   1 `   i n s t e a d   o f   m e a s u r i n g   t h e   l e n g t h   o f   a l l   r e m a i n i n g   t e x t   a f t e r   ` t e x t   i t e m   i ` ;   w i l l   n e e d   t o   i m p l e m e n t   b o t h   a p p r o a c h e s   a n d   p r o f i l e   t h e m   t o   d e t e r m i n e   i f   i t   m a k e s   a n y   s i g n i f i c a n t   d i f f e r e n c e   t o   s p e e d  l     ��������  ��  ��    l     ! Z    "#����" =    $%$ o     ���� 0 fortext forText% m    && �''  # R    ��()
�� .ascrerr ****      � ****( m    ** �++ � I n v a l i d    f o r    p a r a m e t e r   ( t e x t   i s   e m p t y ,   o r   o n l y   c o n t a i n s   c h a r a c t e r s   i g n o r e d   b y   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s )) ��,-
�� 
errn, m    	�����Y- ��.��
�� 
erob. o   
 ���� 0 fortext forText��  ��  ��   �� checks if all characters in forText are ignored by current considering/ignoring settings (the alternative would be to return each character as a non-match separated by a zero-length match, but that's probably not what the user intended); note that unlike `aString's length = 0`, which is what library code normally uses to check for empty text, on this occasion we do want to take into account the current considering/ignoring settings so deliberately use `forText is ""` here. For example, when ignoring punctuation, searching for the TID `"!?"` is no different to searching for `""`, because all of its characters are being ignored when comparing the text being searched against the text being searched for. Thus, a simple `forText is ""` test can be used to check in advance if the text contains any matchable characters under the current considering/ignoring settings, and report a meaningful error if not.   ! �//   c h e c k s   i f   a l l   c h a r a c t e r s   i n   f o r T e x t   a r e   i g n o r e d   b y   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s   ( t h e   a l t e r n a t i v e   w o u l d   b e   t o   r e t u r n   e a c h   c h a r a c t e r   a s   a   n o n - m a t c h   s e p a r a t e d   b y   a   z e r o - l e n g t h   m a t c h ,   b u t   t h a t ' s   p r o b a b l y   n o t   w h a t   t h e   u s e r   i n t e n d e d ) ;   n o t e   t h a t   u n l i k e   ` a S t r i n g ' s   l e n g t h   =   0 ` ,   w h i c h   i s   w h a t   l i b r a r y   c o d e   n o r m a l l y   u s e s   t o   c h e c k   f o r   e m p t y   t e x t ,   o n   t h i s   o c c a s i o n   w e   d o   w a n t   t o   t a k e   i n t o   a c c o u n t   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s   s o   d e l i b e r a t e l y   u s e   ` f o r T e x t   i s   " " `   h e r e .   F o r   e x a m p l e ,   w h e n   i g n o r i n g   p u n c t u a t i o n ,   s e a r c h i n g   f o r   t h e   T I D   ` " ! ? " `   i s   n o   d i f f e r e n t   t o   s e a r c h i n g   f o r   ` " " ` ,   b e c a u s e   a l l   o f   i t s   c h a r a c t e r s   a r e   b e i n g   i g n o r e d   w h e n   c o m p a r i n g   t h e   t e x t   b e i n g   s e a r c h e d   a g a i n s t   t h e   t e x t   b e i n g   s e a r c h e d   f o r .   T h u s ,   a   s i m p l e   ` f o r T e x t   i s   " " `   t e s t   c a n   b e   u s e d   t o   c h e c k   i n   a d v a n c e   i f   t h e   t e x t   c o n t a i n s   a n y   m a t c h a b l e   c h a r a c t e r s   u n d e r   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s ,   a n d   r e p o r t   a   m e a n i n g f u l   e r r o r   i f   n o t . 010 r    232 J    ����  3 o      ���� 0 
resultlist 
resultList1 454 r    676 n   898 1    ��
�� 
txdl9 1    ��
�� 
ascr7 o      ���� 0 oldtids oldTIDs5 :;: r    #<=< o    ���� 0 fortext forText= n     >?> 1     "��
�� 
txdl? 1     ��
�� 
ascr; @A@ r   $ 'BCB m   $ %���� C o      ���� 0 
startindex 
startIndexA DED r   ( 0FGF n   ( .HIH 1   , .��
�� 
lengI n   ( ,JKJ 4   ) ,��L
�� 
citmL m   * +���� K o   ( )���� 0 thetext theTextG o      ���� 0 endindex endIndexE MNM Z   1 JOP��QO B   1 4RSR o   1 2���� 0 
startindex 
startIndexS o   2 3���� 0 endindex endIndexP r   7 DTUT n   7 BVWV 7  8 B��XY
�� 
ctxtX o   < >���� 0 
startindex 
startIndexY o   ? A���� 0 endindex endIndexW o   7 8���� 0 thetext theTextU o      ���� 0 	foundtext 	foundText��  Q r   G JZ[Z m   G H\\ �]]  [ o      ���� 0 	foundtext 	foundTextN ^_^ Z  K f`a����` o   K L���� &0 includenonmatches includeNonMatchesa r   O bbcb K   O _dd ��ef
�� 
pclse o   P U���� (0 _unmatchedtexttype _UnmatchedTextTypef ��gh�� 0 
startindex 
startIndexg o   V W���� 0 
startindex 
startIndexh ��ij�� 0 endindex endIndexi o   X Y���� 0 endindex endIndexj ��k���� 0 	foundtext 	foundTextk o   Z [���� 0 	foundtext 	foundText��  c n      lml  ;   ` am o   _ `���� 0 
resultlist 
resultList��  ��  _ non Y   gp��qr��p k   wss tut r   w |vwv [   w zxyx o   w x���� 0 endindex endIndexy m   x y���� w o      ���� 0 
startindex 
startIndexu z{z r   } �|}| \   } �~~ l  } ������� n   } ���� 1   ~ ���
�� 
leng� o   } ~���� 0 thetext theText��  ��   l  � ������� n   � ���� 1   � ���
�� 
leng� n   � ���� 7  � �����
�� 
ctxt� l  � ������� 4   � ����
�� 
citm� o   � ����� 0 i  ��  ��  � m   � �������� o   � ����� 0 thetext theText��  ��  } o      ���� 0 endindex endIndex{ ��� Z   � ������� B   � ���� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 endindex endIndex� r   � ���� n   � ���� 7  � �����
�� 
ctxt� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 endindex endIndex� o   � ����� 0 thetext theText� o      ���� 0 	foundtext 	foundText��  � r   � ���� m   � ��� ���  � o      ���� 0 	foundtext 	foundText� ��� Z  � �������� o   � �����  0 includematches includeMatches� r   � ���� K   � ��� ����
�� 
pcls� o   � ����� $0 _matchedtexttype _MatchedTextType� ������ 0 
startindex 
startIndex� o   � ����� 0 
startindex 
startIndex� ������ 0 endindex endIndex� o   � ����� 0 endindex endIndex� ������ 0 	foundtext 	foundText� o   � ����� 0 	foundtext 	foundText� ������� 0 foundgroups foundGroups� J   � �����  ��  � n      ���  ;   � �� o   � ����� 0 
resultlist 
resultList��  ��  � ��� r   � ���� [   � ���� o   � ����� 0 endindex endIndex� m   � ����� � o      ���� 0 
startindex 
startIndex� ��� r   � ���� \   � ���� [   � ���� o   � ����� 0 
startindex 
startIndex� l  � ������� n   � ���� 1   � ���
�� 
leng� n   � ���� 4   � ����
�� 
citm� o   � ����� 0 i  � o   � ����� 0 thetext theText��  ��  � m   � ����� � o      ���� 0 endindex endIndex� ��� Z   � ������� B   � ���� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 endindex endIndex� r   � ���� n   � ���� 7  � �����
�� 
ctxt� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 endindex endIndex� o   � ����� 0 thetext theText� o      ���� 0 	foundtext 	foundText��  � r   � ���� m   � ��� ���  � o      ���� 0 	foundtext 	foundText� ���� Z  �������� o   � ��� &0 includenonmatches includeNonMatches� r  ��� K  �� �~��
�~ 
pcls� o  �}�} (0 _unmatchedtexttype _UnmatchedTextType� �|���| 0 
startindex 
startIndex� o  	
�{�{ 0 
startindex 
startIndex� �z���z 0 endindex endIndex� o  �y�y 0 endindex endIndex� �x��w�x 0 	foundtext 	foundText� o  �v�v 0 	foundtext 	foundText�w  � n      ���  ;  � o  �u�u 0 
resultlist 
resultList��  ��  ��  �� 0 i  q m   j k�t�t r I  k r�s��r
�s .corecnte****       ****� n   k n��� 2  l n�q
�q 
citm� o   k l�p�p 0 thetext theText�r  ��  o ��� r  $��� o   �o�o 0 oldtids oldTIDs� n     ��� 1  !#�n
�n 
txdl� 1   !�m
�m 
ascr� ��l� L  %'�� o  %&�k�k 0 
resultlist 
resultList�l  
 ��� l     �j�i�h�j  �i  �h  � ��� l     �g�f�e�g  �f  �e  � ��� l     �d���d  �  -----   � ��� 
 - - - - -� ��� l     �c���c  �   replace text   � ���    r e p l a c e   t e x t� ��� l     �b�a�`�b  �a  �`  � ��� i  > A   I      �_�^�_ 0 _replacetext _replaceText  o      �]�] 0 thetext theText  o      �\�\ 0 fortext forText �[ o      �Z�Z 0 newtext newText�[  �^   k     & 	
	 r      n     1    �Y
�Y 
txdl 1     �X
�X 
ascr o      �W�W 0 oldtids oldTIDs
  r     o    �V�V 0 fortext forText n      1    
�U
�U 
txdl 1    �T
�T 
ascr  l    r     n    2   �S
�S 
citm o    �R�R 0 thetext theText o      �Q�Q 0 	textitems 	textItems J D note: TID-based matching uses current considering/ignoring settings    � �   n o t e :   T I D - b a s e d   m a t c h i n g   u s e s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s   r    !"! o    �P�P 0 newtext newText" n     #$# 1    �O
�O 
txdl$ 1    �N
�N 
ascr  %&% r    '(' c    )*) o    �M�M 0 	textitems 	textItems* m    �L
�L 
ctxt( o      �K�K 0 
resulttext 
resultText& +,+ r    #-.- o    �J�J 0 oldtids oldTIDs. n     /0/ 1     "�I
�I 
txdl0 1     �H
�H 
ascr, 1�G1 L   $ &22 o   $ %�F�F 0 
resulttext 
resultText�G  � 343 l     �E�D�C�E  �D  �C  4 565 l     �B�A�@�B  �A  �@  6 787 l     �?9:�?  9  -----   : �;; 
 - - - - -8 <=< l     �>�=�<�>  �=  �<  = >?> i  B E@A@ I     �;BC
�; .Txt:Srchnull���     ctxtB o      �:�: 0 thetext theTextC �9DE
�9 
For_D o      �8�8 0 fortext forTextE �7FG
�7 
UsinF |�6�5H�4I�6  �5  H o      �3�3 0 matchformat matchFormat�4  I l 
    J�2�1J l     K�0�/K m      �.
�. SerECmpI�0  �/  �2  �1  G �-LM
�- 
ReplL |�,�+N�*O�,  �+  N o      �)�) 0 newtext newText�*  O l     P�(�'P m      �&
�& 
msng�(  �'  M �%Q�$
�% 
RetuQ |�#�"R�!S�#  �"  R o      � �  0 resultformat resultFormat�!  S l     T��T m      �
� RetEMatT�  �  �$  A Q    �UVWU k   �XX YZY r    [\[ n   ]^] I    �_�� "0 astextparameter asTextParameter_ `a` o    	�� 0 thetext theTexta b�b m   	 
cc �dd  �  �  ^ o    �� 0 _support  \ o      �� 0 thetext theTextZ efe l   ghig r    jkj n   lml I    �n�� "0 astextparameter asTextParametern opo o    �� 0 fortext forTextp q�q m    rr �ss  f o r�  �  m o    �� 0 _support  k o      �� 0 fortext forTexth TO DO: when matching with TIDs, optionally accept a list of multiple text values to match? (note:TIDs can do that for free, so it'd just be a case of relaxing restriction on 'for' parameter's type when pattern matching is false to accept a list of text as well); also optionally accept a corresponding list of replacement values for doing mapping? (note that map will need to be O(n) associative list in order to support considering/ignoring, although NSDictionary should be usable when matching case-sensitively)   i �tt   T O   D O :   w h e n   m a t c h i n g   w i t h   T I D s ,   o p t i o n a l l y   a c c e p t   a   l i s t   o f   m u l t i p l e   t e x t   v a l u e s   t o   m a t c h ?   ( n o t e : T I D s   c a n   d o   t h a t   f o r   f r e e ,   s o   i t ' d   j u s t   b e   a   c a s e   o f   r e l a x i n g   r e s t r i c t i o n   o n   ' f o r '   p a r a m e t e r ' s   t y p e   w h e n   p a t t e r n   m a t c h i n g   i s   f a l s e   t o   a c c e p t   a   l i s t   o f   t e x t   a s   w e l l ) ;   a l s o   o p t i o n a l l y   a c c e p t   a   c o r r e s p o n d i n g   l i s t   o f   r e p l a c e m e n t   v a l u e s   f o r   d o i n g   m a p p i n g ?   ( n o t e   t h a t   m a p   w i l l   n e e d   t o   b e   O ( n )   a s s o c i a t i v e   l i s t   i n   o r d e r   t o   s u p p o r t   c o n s i d e r i n g / i g n o r i n g ,   a l t h o u g h   N S D i c t i o n a r y   s h o u l d   b e   u s a b l e   w h e n   m a t c h i n g   c a s e - s e n s i t i v e l y )f uvu Z   3wx��w =    $yzy n    "{|{ 1     "�
� 
leng| o     �� 0 fortext forTextz m   " #��  x R   ' /�}~
� .ascrerr ****      � ****} m   - . ��� t I n v a l i d    f o r    p a r a m e t e r   ( e x p e c t e d   o n e   o r   m o r e   c h a r a c t e r s ) .~ �
��
�
 
errn� m   ) *�	�	�Y� ���
� 
erob� o   + ,�� 0 fortext forText�  �  �  v ��� Z   4������ =  4 7��� o   4 5�� 0 newtext newText� m   5 6�
� 
msng� l  :���� k   :�� ��� Z   : ������ =  : =��� o   : ;�� 0 resultformat resultFormat� m   ; <� 
�  RetEMatT� r   @ S��� J   @ D�� ��� m   @ A��
�� boovfals� ���� m   A B��
�� boovtrue��  � J      �� ��� o      ���� &0 includenonmatches includeNonMatches� ���� o      ����  0 includematches includeMatches��  � ��� =  V Y��� o   V W���� 0 resultformat resultFormat� m   W X��
�� RetEUmaT� ��� r   \ o��� J   \ `�� ��� m   \ ]��
�� boovtrue� ���� m   ] ^��
�� boovfals��  � J      �� ��� o      ���� &0 includenonmatches includeNonMatches� ���� o      ����  0 includematches includeMatches��  � ��� =  r u��� o   r s���� 0 resultformat resultFormat� m   s t��
�� RetEAllT� ���� r   x ���� J   x |�� ��� m   x y��
�� boovtrue� ���� m   y z��
�� boovtrue��  � J      �� ��� o      ���� &0 includenonmatches includeNonMatches� ���� o      ����  0 includematches includeMatches��  ��  � n  � ���� I   � �������� >0 throwinvalidparameterconstant throwInvalidParameterConstant� ��� o   � ����� 0 resultformat resultFormat� ���� m   � ��� ���  r e t u r n i n g��  ��  � o   � ����� 0 _support  � ���� Z   ������ =  � ���� o   � ����� 0 matchformat matchFormat� m   � ���
�� SerECmpI� P   � ����� L   � ��� I   � �������� 0 	_findtext 	_findText� ��� o   � ����� 0 thetext theText� ��� o   � ����� 0 fortext forText� ��� o   � ����� &0 includenonmatches includeNonMatches� ���� o   � �����  0 includematches includeMatches��  ��  � ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ���
�� conswhit� ����
�� consnume��  � ����
�� conscase��  � ��� =  � ���� o   � ����� 0 matchformat matchFormat� m   � ���
�� SerECmpP� ��� L   � ��� I   � �������� 0 _findpattern _findPattern� ��� o   � ����� 0 thetext theText� ��� o   � ����� 0 fortext forText� ��� o   � ����� &0 includenonmatches includeNonMatches� ���� o   � �����  0 includematches includeMatches��  ��  � ��� =  � ���� o   � ����� 0 matchformat matchFormat� m   � ���
�� SerECmpC� ��� P   � ������ L   � ��� I   � �������� 0 	_findtext 	_findText� ��� o   � ����� 0 thetext theText� ��� o   � ����� 0 fortext forText� ��� o   � ����� &0 includenonmatches includeNonMatches� ���� o   � �����  0 includematches includeMatches��  ��  � ���
�� conscase� ���
�� consdiac� �� 
�� conshyph  ��
�� conspunc ��
�� conswhit ����
�� consnume��  ��  �  =  � � o   � ����� 0 matchformat matchFormat m   � ���
�� SerECmpD �� L   � � I   � ���	���� 0 	_findtext 	_findText	 

 o   � ����� 0 thetext theText  o   � ����� 0 fortext forText  o   � ����� &0 includenonmatches includeNonMatches �� o   � �����  0 includematches includeMatches��  ��  ��  � n   I  ������ >0 throwinvalidparameterconstant throwInvalidParameterConstant  o  ���� 0 matchformat matchFormat �� m  	 � 
 u s i n g��  ��   o   ���� 0 _support  ��  �   find   � � 
   f i n d�  � l � k  �  r   !  n "#" I  ��$���� "0 astextparameter asTextParameter$ %&% o  ���� 0 newtext newText& '��' m  (( �))  r e p l a c i n g   w i t h��  ��  # o  ���� 0 _support  ! o      ���� 0 newtext newText *��* Z   �+,-.+ =  %/0/ o   !���� 0 matchformat matchFormat0 m  !$��
�� SerECmpI, P  (;1231 L  1:44 I  19��5���� 0 _replacetext _replaceText5 676 o  23���� 0 thetext theText7 898 o  34���� 0 fortext forText9 :��: o  45���� 0 newtext newText��  ��  2 ��;
�� consdiac; ��<
�� conshyph< ��=
�� conspunc= ��>
�� conswhit> ����
�� consnume��  3 ����
�� conscase��  - ?@? = >CABA o  >?���� 0 matchformat matchFormatB m  ?B��
�� SerECmpP@ CDC L  FOEE I  FN��F���� "0 _replacepattern _replacePatternF GHG o  GH���� 0 thetext theTextH IJI o  HI���� 0 fortext forTextJ K��K o  IJ���� 0 newtext newText��  ��  D LML = RWNON o  RS���� 0 matchformat matchFormatO m  SV��
�� SerECmpCM PQP P  ZkRS��R L  ajTT I  ai��U���� 0 _replacetext _replaceTextU VWV o  bc���� 0 thetext theTextW XYX o  cd���� 0 fortext forTextY Z��Z o  de���� 0 newtext newText��  ��  S ��[
�� conscase[ �\
� consdiac\ �~]
�~ conshyph] �}^
�} conspunc^ �|_
�| conswhit_ �{�z
�{ consnume�z  ��  Q `a` = nsbcb o  no�y�y 0 matchformat matchFormatc m  or�x
�x SerECmpDa d�wd L  vee I  v~�vf�u�v 0 _replacetext _replaceTextf ghg o  wx�t�t 0 thetext theTexth iji o  xy�s�s 0 fortext forTextj k�rk o  yz�q�q 0 newtext newText�r  �u  �w  . n ��lml I  ���pn�o�p >0 throwinvalidparameterconstant throwInvalidParameterConstantn opo o  ���n�n 0 matchformat matchFormatp q�mq m  ��rr �ss 
 u s i n g�m  �o  m o  ���l�l 0 _support  ��     replace    �tt    r e p l a c e�  V R      �kuv
�k .ascrerr ****      � ****u o      �j�j 0 etext eTextv �iwx
�i 
errnw o      �h�h 0 enumber eNumberx �gyz
�g 
eroby o      �f�f 0 efrom eFromz �e{�d
�e 
errt{ o      �c�c 
0 eto eTo�d  W I  ���b|�a�b 
0 _error  | }~} m  �� ���  s e a r c h   t e x t~ ��� o  ���`�` 0 etext eText� ��� o  ���_�_ 0 enumber eNumber� ��� o  ���^�^ 0 efrom eFrom� ��]� o  ���\�\ 
0 eto eTo�]  �a  ? ��� l     �[�Z�Y�[  �Z  �Y  � ��� l     �X�W�V�X  �W  �V  � ��� i  F I��� I     �U��T
�U .Txt:EPatnull���     ctxt� o      �S�S 0 thetext theText�T  � Q     *���� L    �� c    ��� l   ��R�Q� n   ��� I    �P��O�P 40 escapedpatternforstring_ escapedPatternForString_� ��N� l   ��M�L� n   ��� I    �K��J�K "0 astextparameter asTextParameter� ��� o    �I�I 0 thetext theText� ��H� m    �� ���  �H  �J  � o    �G�G 0 _support  �M  �L  �N  �O  � n   ��� o    �F�F *0 nsregularexpression NSRegularExpression� m    �E
�E misccura�R  �Q  � m    �D
�D 
ctxt� R      �C��
�C .ascrerr ****      � ****� o      �B�B 0 etext eText� �A��
�A 
errn� o      �@�@ 0 enumber eNumber� �?��
�? 
erob� o      �>�> 0 efrom eFrom� �=��<
�= 
errt� o      �;�; 
0 eto eTo�<  � I     *�:��9�: 
0 _error  � ��� m   ! "�� ���  e s c a p e   p a t t e r n� ��� o   " #�8�8 0 etext eText� ��� o   # $�7�7 0 enumber eNumber� ��� o   $ %�6�6 0 efrom eFrom� ��5� o   % &�4�4 
0 eto eTo�5  �9  � ��� l     �3�2�1�3  �2  �1  � ��� l     �0�/�.�0  �/  �.  � ��� i  J M��� I     �-��,
�- .Txt:ETemnull���     ctxt� o      �+�+ 0 thetext theText�,  � Q     *���� L    �� c    ��� l   ��*�)� n   ��� I    �(��'�( 60 escapedtemplateforstring_ escapedTemplateForString_� ��&� l   ��%�$� n   ��� I    �#��"�# "0 astextparameter asTextParameter� ��� o    �!�! 0 thetext theText� �� � m    �� ���  �   �"  � o    �� 0 _support  �%  �$  �&  �'  � n   ��� o    �� *0 nsregularexpression NSRegularExpression� m    �
� misccura�*  �)  � m    �
� 
ctxt� R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � I     *���� 
0 _error  � ��� m   ! "�� ���  e s c a p e   t e m p l a t e� ��� o   " #�� 0 etext eText� ��� o   # $�� 0 enumber eNumber� ��� o   $ %�� 0 efrom eFrom� ��� o   % &�� 
0 eto eTo�  �  � ��� l     ��
�	�  �
  �	  � ��� l     ����  �  �  � ��� l     ����  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ����  �   Conversion Suite   � ��� "   C o n v e r s i o n   S u i t e� ��� l     ����  �  �  � ��� i  N Q��� I     �  
�  .Txt:UppTnull���     ctxt  o      ���� 0 thetext theText ����
�� 
Loca |��������  ��   o      ���� 0 
localecode 
localeCode��   l     ���� m      ��
�� 
msng��  ��  ��  � Q     N k    <		 

 r     n    I    ������ &0 stringwithstring_ stringWithString_ �� l   ���� n    I    ������ "0 astextparameter asTextParameter  o    ���� 0 thetext theText �� m     �  ��  ��   o    ���� 0 _support  ��  ��  ��  ��   n    o    ���� 0 nsstring NSString m    ��
�� misccura o      ���� 0 
asocstring 
asocString �� Z    <��  =   !"! o    ���� 0 
localecode 
localeCode" m    ��
�� 
msng L    &## c    %$%$ l   #&����& n   #'(' I    #�������� "0 uppercasestring uppercaseString��  ��  ( o    ���� 0 
asocstring 
asocString��  ��  % m   # $��
�� 
ctxt��    L   ) <)) c   ) ;*+* l  ) 9,����, n  ) 9-.- I   * 9��/���� 80 uppercasestringwithlocale_ uppercaseStringWithLocale_/ 0��0 l  * 51����1 n  * 5232 I   / 5��4���� &0 aslocaleparameter asLocaleParameter4 565 o   / 0���� 0 
localecode 
localeCode6 7��7 m   0 188 �99  f o r   l o c a l e��  ��  3 o   * /���� 0 _support  ��  ��  ��  ��  . o   ) *���� 0 
asocstring 
asocString��  ��  + m   9 :��
�� 
ctxt��   R      ��:;
�� .ascrerr ****      � ****: o      ���� 0 etext eText; ��<=
�� 
errn< o      ���� 0 enumber eNumber= ��>?
�� 
erob> o      ���� 0 efrom eFrom? ��@��
�� 
errt@ o      ���� 
0 eto eTo��   I   D N��A���� 
0 _error  A BCB m   E FDD �EE  u p p e r c a s e   t e x tC FGF o   F G���� 0 etext eTextG HIH o   G H���� 0 enumber eNumberI JKJ o   H I���� 0 efrom eFromK L��L o   I J���� 
0 eto eTo��  ��  � MNM l     ��������  ��  ��  N OPO l     ��������  ��  ��  P QRQ i  R USTS I     ��UV
�� .Txt:CapTnull���     ctxtU o      ���� 0 thetext theTextV ��W��
�� 
LocaW |����X��Y��  ��  X o      ���� 0 
localecode 
localeCode��  Y l     Z����Z m      ��
�� 
msng��  ��  ��  T Q     N[\][ k    <^^ _`_ r    aba n   cdc I    ��e���� &0 stringwithstring_ stringWithString_e f��f l   g����g n   hih I    ��j���� "0 astextparameter asTextParameterj klk o    ���� 0 thetext theTextl m��m m    nn �oo  ��  ��  i o    ���� 0 _support  ��  ��  ��  ��  d n   pqp o    ���� 0 nsstring NSStringq m    ��
�� misccurab o      ���� 0 
asocstring 
asocString` r��r Z    <st��us =   vwv o    ���� 0 
localecode 
localeCodew m    ��
�� 
msngt L    &xx c    %yzy l   #{����{ n   #|}| I    #�������� &0 capitalizedstring capitalizedString��  ��  } o    ���� 0 
asocstring 
asocString��  ��  z m   # $��
�� 
ctxt��  u L   ) <~~ c   ) ;� l  ) 9������ n  ) 9��� I   * 9������� <0 capitalizedstringwithlocale_ capitalizedStringWithLocale_� ���� l  * 5������ n  * 5��� I   / 5������� &0 aslocaleparameter asLocaleParameter� ��� o   / 0���� 0 
localecode 
localeCode� ���� m   0 1�� ���  f o r   l o c a l e��  ��  � o   * /���� 0 _support  ��  ��  ��  ��  � o   ) *���� 0 
asocstring 
asocString��  ��  � m   9 :��
�� 
ctxt��  \ R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  ] I   D N���~� 
0 _error  � ��� m   E F�� ���  c a p i t a l i z e   t e x t� ��� o   F G�}�} 0 etext eText� ��� o   G H�|�| 0 enumber eNumber� ��� o   H I�{�{ 0 efrom eFrom� ��z� o   I J�y�y 
0 eto eTo�z  �~  R ��� l     �x�w�v�x  �w  �v  � ��� l     �u�t�s�u  �t  �s  � ��� i  V Y��� I     �r��
�r .Txt:LowTnull���     ctxt� o      �q�q 0 thetext theText� �p��o
�p 
Loca� |�n�m��l��n  �m  � o      �k�k 0 
localecode 
localeCode�l  � l     ��j�i� m      �h
�h 
msng�j  �i  �o  � Q     N���� k    <�� ��� r    ��� n   ��� I    �g��f�g &0 stringwithstring_ stringWithString_� ��e� l   ��d�c� n   ��� I    �b��a�b "0 astextparameter asTextParameter� ��� o    �`�` 0 thetext theText� ��_� m    �� ���  �_  �a  � o    �^�^ 0 _support  �d  �c  �e  �f  � n   ��� o    �]�] 0 nsstring NSString� m    �\
�\ misccura� o      �[�[ 0 
asocstring 
asocString� ��Z� Z    <���Y�� =   ��� o    �X�X 0 
localecode 
localeCode� m    �W
�W 
msng� L    &�� c    %��� l   #��V�U� n   #��� I    #�T�S�R�T "0 lowercasestring lowercaseString�S  �R  � o    �Q�Q 0 
asocstring 
asocString�V  �U  � m   # $�P
�P 
ctxt�Y  � L   ) <�� c   ) ;��� l  ) 9��O�N� n  ) 9��� I   * 9�M��L�M 80 lowercasestringwithlocale_ lowercaseStringWithLocale_� ��K� l  * 5��J�I� n  * 5��� I   / 5�H��G�H &0 aslocaleparameter asLocaleParameter� ��� o   / 0�F�F 0 
localecode 
localeCode� ��E� m   0 1�� ���  f o r   l o c a l e�E  �G  � o   * /�D�D 0 _support  �J  �I  �K  �L  � o   ) *�C�C 0 
asocstring 
asocString�O  �N  � m   9 :�B
�B 
ctxt�Z  � R      �A��
�A .ascrerr ****      � ****� o      �@�@ 0 etext eText� �?��
�? 
errn� o      �>�> 0 enumber eNumber� �=��
�= 
erob� o      �<�< 0 efrom eFrom� �;��:
�; 
errt� o      �9�9 
0 eto eTo�:  � I   D N�8��7�8 
0 _error  � ��� m   E F�� ���  l o w e r c a s e   t e x t� ��� o   F G�6�6 0 etext eText� ��� o   G H�5�5 0 enumber eNumber� ��� o   H I�4�4 0 efrom eFrom� ��3� o   I J�2�2 
0 eto eTo�3  �7  � ��� l     �1�0�/�1  �0  �/  � ��� l     �.�-�,�.  �-  �,  � ��� i  Z ]��� I     �+� 
�+ .Txt:PadTnull���     ctxt� o      �*�* 0 thetext theText  �)
�) 
toPl o      �(�( 0 toplaces toPlaces �'
�' 
Char |�&�%�$�&  �%   o      �#�# 0 padchar padChar�$   m       �    �"	�!
�" 
From	 |� �
��   �  
 o      �� 0 whichend whichEnd�   l     �� m      �
� LeTrLCha�  �  �!  � k     �  l     ��   � � TO DO: what if pad is multi-char? how best to align on right? e.g. if pad is ". " then ideally the periods should always appear in same columns, e.g. "foo. . ." vs "food . ."    �^   T O   D O :   w h a t   i f   p a d   i s   m u l t i - c h a r ?   h o w   b e s t   t o   a l i g n   o n   r i g h t ?   e . g .   i f   p a d   i s   " .   "   t h e n   i d e a l l y   t h e   p e r i o d s   s h o u l d   a l w a y s   a p p e a r   i n   s a m e   c o l u m n s ,   e . g .   " f o o .   .   . "   v s   " f o o d   .   . " � Q     � k    �  r     n    I    ��� "0 astextparameter asTextParameter   o    	�� 0 thetext theText  !�! m   	 
"" �##  �  �   o    �� 0 _support   o      �� 0 thetext theText $%$ r    &'& n   ()( I    �*�� (0 asintegerparameter asIntegerParameter* +,+ o    �� 0 toplaces toPlaces, -�- m    .. �//  t o   p l a c e s�  �  ) o    �� 0 _support  ' o      �� 0 toplaces toPlaces% 010 r    &232 \    $454 o     �� 0 toplaces toPlaces5 l    #6�
�	6 n    #787 1   ! #�
� 
leng8 o     !�� 0 thetext theText�
  �	  3 o      �� 0 	charcount 	charCount1 9:9 Z  ' 3;<��; B   ' *=>= o   ' (�� 0 	charcount 	charCount> m   ( )��  < L   - /?? o   - .�� 0 thetext theText�  �  : @A@ r   4 ABCB n  4 ?DED I   9 ?� F���  "0 astextparameter asTextParameterF GHG o   9 :���� 0 padchar padCharH I��I m   : ;JJ �KK 
 u s i n g��  ��  E o   4 9���� 0 _support  C o      ���� 0 padtext padTextA LML Z  B VNO����N =   B GPQP n  B ERSR 1   C E��
�� 
lengS o   B C���� 0 padtext padTextQ m   E F����  O R   J R��TU
�� .ascrerr ****      � ****T m   P QVV �WW f I n v a l i d    u s i n g    p a r a m e t e r   ( e m p t y   t e x t   n o t   a l l o w e d ) .U ��XY
�� 
errnX m   L M�����YY ��Z��
�� 
erobZ o   N O���� 0 padchar padChar��  ��  ��  M [\[ V   W k]^] r   a f_`_ b   a daba o   a b���� 0 padtext padTextb o   b c���� 0 padtext padText` o      ���� 0 padtext padText^ A   [ `cdc n  [ ^efe 1   \ ^��
�� 
lengf o   [ \���� 0 padtext padTextd o   ^ _���� 0 	charcount 	charCount\ g��g Z   l �hijkh =  l olml o   l m���� 0 whichend whichEndm m   m n��
�� LeTrLChai L   r �nn b   r opo l  r }q����q n  r }rsr 7  s }��tu
�� 
ctxtt m   w y���� u o   z |���� 0 	charcount 	charCounts o   r s���� 0 padtext padText��  ��  p o   } ~���� 0 thetext theTextj vwv =  � �xyx o   � ����� 0 whichend whichEndy m   � ���
�� LeTrTChaw z{z L   � �|| b   � �}~} o   � ����� 0 thetext theText~ l  � ����� n  � ���� 7  � �����
�� 
ctxt� m   � ����� � o   � ����� 0 	charcount 	charCount� o   � ����� 0 padtext padText��  ��  { ��� =  � ���� o   � ����� 0 whichend whichEnd� m   � ���
�� LeTrBCha� ���� Z   � ������� =   � ���� o   � ����� 0 	charcount 	charCount� m   � ����� � L   � ��� b   � ���� o   � ����� 0 thetext theText� l  � ������� n  � ���� 7  � �����
�� 
ctxt� m   � ����� � o   � ����� 0 	charcount 	charCount� o   � ����� 0 padtext padText��  ��  ��  � L   � ��� n  � ���� 7  � �����
�� 
ctxt� m   � ����� � o   � ����� 0 toplaces toPlaces� l  � ������� b   � ���� b   � ���� n  � ���� 7  � �����
�� 
ctxt� m   � ����� � l  � ������� _   � ���� o   � ����� 0 	charcount 	charCount� m   � ����� ��  ��  � o   � ����� 0 padtext padText� o   � ����� 0 thetext theText� o   � ����� 0 padtext padText��  ��  ��  k n  � ���� I   � �������� >0 throwinvalidparameterconstant throwInvalidParameterConstant� ��� o   � ����� 0 whichend whichEnd� ���� m   � ��� ���  a d d i n g��  ��  � o   � ����� 0 _support  ��   R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��   I   � �������� 
0 _error  � ��� m   � ��� ���  p a d   t e x t� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  �  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  ^ a��� I     ����
�� .Txt:SliTnull���     ctxt� o      ���� 0 thetext theText� ����
�� 
FIdx� |����������  ��  � o      ���� 0 
startindex 
startIndex��  � l     ������ m      ��
�� 
msng��  ��  � �����
�� 
TIdx� |����������  ��  � o      ���� 0 endindex endIndex��  � l     ������ m      ��
�� 
msng��  ��  ��  � Q    ����� k   p�� ��� r    ��� n   ��� I    ������� "0 astextparameter asTextParameter� ��� o    	���� 0 thetext theText� ���� m   	 
�� ���  ��  ��  � o    ���� 0 _support  � o      ���� 0 thetext theText� ��� r    ��� n   ��� 1    ��
�� 
leng� o    ���� 0 thetext theText� o      ���� 0 	thelength 	theLength� ��� Z    ������ >   ��� o    ���� 0 
startindex 
startIndex� m    ��
�� 
msng� k    l�� ��� r    *��� n   (��� I   " (������� (0 asintegerparameter asIntegerParameter� ��� o   " #�� 0 
startindex 
startIndex� ��~� m   # $�� ���  f r o m�~  ��  � o    "�}�} 0 _support  � o      �|�| 0 
startindex 
startIndex� � � l  + +�{�{   J D note: index 0 is disallowed as it makes behavior confusing to users    � �   n o t e :   i n d e x   0   i s   d i s a l l o w e d   a s   i t   m a k e s   b e h a v i o r   c o n f u s i n g   t o   u s e r s   Z  + =�z�y =   + .	 o   + ,�x�x 0 
startindex 
startIndex	 m   , -�w�w   R   1 9�v

�v .ascrerr ****      � ****
 m   7 8 � Z I n v a l i d   i n d e x   (  f r o m    p a r a m e t e r   c a n n o t   b e   0 ) . �u
�u 
errn m   3 4�t�t�Y �s�r
�s 
erob o   5 6�q�q 0 
startindex 
startIndex�r  �z  �y   �p Z   > l�o�n =  > A o   > ?�m�m 0 endindex endIndex m   ? @�l
�l 
msng Z   D h A   D H o   D E�k�k 0 
startindex 
startIndex d   E G o   E F�j�j 0 	thelength 	theLength L   K M o   K L�i�i 0 thetext theText  ?   P S !  o   P Q�h�h 0 
startindex 
startIndex! o   Q R�g�g 0 	thelength 	theLength "�f" L   V X## m   V W$$ �%%  �f   L   [ h&& n  [ g'(' 7  \ f�e)*
�e 
ctxt) o   ` b�d�d 0 
startindex 
startIndex* m   c e�c�c��( o   [ \�b�b 0 thetext theText�o  �n  �p  � +,+ =  o r-.- o   o p�a�a 0 endindex endIndex. m   p q�`
�` 
msng, /�_/ R   u {�^01
�^ .ascrerr ****      � ****0 m   y z22 �33 J M i s s i n g    f r o m    a n d / o r    t o    p a r a m e t e r .1 �]4�\
�] 
errn4 m   w x�[�[�[�\  �_  ��  � 565 Z   � �78�Z�Y7 >  � �9:9 o   � ��X�X 0 endindex endIndex: m   � ��W
�W 
msng8 k   � �;; <=< r   � �>?> n  � �@A@ I   � ��VB�U�V (0 asintegerparameter asIntegerParameterB CDC o   � ��T�T 0 endindex endIndexD E�SE m   � �FF �GG  t o�S  �U  A o   � ��R�R 0 _support  ? o      �Q�Q 0 endindex endIndex= HIH Z  � �JK�P�OJ =   � �LML o   � ��N�N 0 endindex endIndexM m   � ��M�M  K R   � ��LNO
�L .ascrerr ****      � ****N m   � �PP �QQ V I n v a l i d   i n d e x   (  t o    p a r a m e t e r   c a n n o t   b e   0 ) .O �KRS
�K 
errnR m   � ��J�J�YS �IT�H
�I 
erobT o   � ��G�G 0 endindex endIndex�H  �P  �O  I U�FU Z   � �VW�E�DV =  � �XYX o   � ��C�C 0 
startindex 
startIndexY m   � ��B
�B 
msngW Z   � �Z[\]Z A   � �^_^ o   � ��A�A 0 endindex endIndex_ d   � �`` o   � ��@�@ 0 	thelength 	theLength[ L   � �aa m   � �bb �cc  \ ded ?   � �fgf o   � ��?�? 0 endindex endIndexg o   � ��>�> 0 	thelength 	theLengthe h�=h L   � �ii o   � ��<�< 0 thetext theText�=  ] L   � �jj n  � �klk 7  � ��;mn
�; 
ctxtm m   � ��:�: n o   � ��9�9 0 endindex endIndexl o   � ��8�8 0 thetext theText�E  �D  �F  �Z  �Y  6 opo l  � ��7qr�7  q + % both start and end indexes are given   r �ss J   b o t h   s t a r t   a n d   e n d   i n d e x e s   a r e   g i v e np tut Z  � �vw�6�5v A   � �xyx o   � ��4�4 0 
startindex 
startIndexy m   � ��3�3  w r   � �z{z [   � �|}| [   � �~~ o   � ��2�2 0 	thelength 	theLength m   � ��1�1 } o   � ��0�0 0 
startindex 
startIndex{ o      �/�/ 0 
startindex 
startIndex�6  �5  u ��� Z  ����.�-� A   � ���� o   � ��,�, 0 endindex endIndex� m   � ��+�+  � r   � ���� [   � ���� [   � ���� o   � ��*�* 0 	thelength 	theLength� m   � ��)�) � o   � ��(�( 0 endindex endIndex� o      �'�' 0 endindex endIndex�.  �-  � ��� Z .���&�%� G  #��� F  ��� A  ��� o  �$�$ 0 
startindex 
startIndex� m  �#�# � A  ��� o  	�"�" 0 endindex endIndex� l 
	
��!� � m  	
�� �!  �   � F  ��� ?  ��� o  �� 0 
startindex 
startIndex� o  �� 0 	thelength 	theLength� ?  ��� o  �� 0 endindex endIndex� o  �� 0 	thelength 	theLength� L  &*�� m  &)�� ���  �&  �%  � ��� Z  /H����� A  /2��� o  /0�� 0 
startindex 
startIndex� m  01�� � r  58��� m  56�� � o      �� 0 
startindex 
startIndex� ��� ?  ;>��� o  ;<�� 0 
startindex 
startIndex� o  <=�� 0 	thelength 	theLength� ��� r  AD��� o  AB�� 0 	thelength 	theLength� o      �� 0 
startindex 
startIndex�  �  � ��� Z  Ib����� A  IL��� o  IJ�� 0 endindex endIndex� m  JK�� � r  OR��� m  OP�� � o      �� 0 endindex endIndex� ��� ?  UX��� o  UV�� 0 endindex endIndex� o  VW�
�
 0 	thelength 	theLength� ��	� r  [^��� o  [\�� 0 	thelength 	theLength� o      �� 0 endindex endIndex�	  �  � ��� L  cp�� n  co��� 7 dn���
� 
ctxt� o  hj�� 0 
startindex 
startIndex� o  km�� 0 endindex endIndex� o  cd�� 0 thetext theText�  � R      ���
� .ascrerr ****      � ****� o      � �  0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I  x�������� 
0 _error  � ��� m  y|�� ���  s l i c e   t e x t� ��� o  |}���� 0 etext eText� ��� o  }~���� 0 enumber eNumber� ��� o  ~���� 0 efrom eFrom� ���� o  ����� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  b e��� I     ����
�� .Txt:TrmTnull���     ctxt� o      ���� 0 thetext theText� �����
�� 
From� |����������  ��  � o      ���� 0 whichend whichEnd��  � l     ������ m      ��
�� LeTrBCha��  ��  ��  � Q     ����� k    ��� ��� r    ��� n   ��� I    ������� "0 astextparameter asTextParameter� ��� o    	���� 0 thetext theText� ���� m   	 
�� ���  ��  ��  � o    ���� 0 _support  � o      ���� 0 thetext theText� ��� Z    -������� H    �� E   ��� J    	 	  			 m    ��
�� LeTrLCha	 			 m    ��
�� LeTrTCha	 	��	 m    ��
�� LeTrBCha��  � J    		 	��	 o    ���� 0 whichend whichEnd��  � n   )				 I   # )��	
���� >0 throwinvalidparameterconstant throwInvalidParameterConstant	
 			 o   # $���� 0 whichend whichEnd	 	��	 m   $ %		 �		  r e m o v i n g��  ��  		 o    #���� 0 _support  ��  ��  � 	��	 P   . �				 k   3 �		 			 l  3 ?				 Z  3 ?		����	 =  3 6			 o   3 4���� 0 thetext theText	 m   4 5		 �		  	 L   9 ;	 	  m   9 :	!	! �	"	"  ��  ��  	 H B check if theText is empty or contains white space characters only   	 �	#	# �   c h e c k   i f   t h e T e x t   i s   e m p t y   o r   c o n t a i n s   w h i t e   s p a c e   c h a r a c t e r s   o n l y	 	$	%	$ r   @ S	&	'	& J   @ D	(	( 	)	*	) m   @ A���� 	* 	+��	+ m   A B��������  	' J      	,	, 	-	.	- o      ���� 0 
startindex 
startIndex	. 	/��	/ o      ���� 0 endindex endIndex��  	% 	0	1	0 Z   T x	2	3����	2 E  T \	4	5	4 J   T X	6	6 	7	8	7 m   T U��
�� LeTrLCha	8 	9��	9 m   U V��
�� LeTrBCha��  	5 J   X [	:	: 	;��	; o   X Y���� 0 whichend whichEnd��  	3 V   _ t	<	=	< r   j o	>	?	> [   j m	@	A	@ o   j k���� 0 
startindex 
startIndex	A m   k l���� 	? o      ���� 0 
startindex 
startIndex	= =  c i	B	C	B n   c g	D	E	D 4   d g��	F
�� 
cha 	F o   e f���� 0 
startindex 
startIndex	E o   c d���� 0 thetext theText	C m   g h	G	G �	H	H  ��  ��  	1 	I	J	I Z   y �	K	L����	K E  y �	M	N	M J   y }	O	O 	P	Q	P m   y z��
�� LeTrTCha	Q 	R��	R m   z {��
�� LeTrBCha��  	N J   } �	S	S 	T��	T o   } ~���� 0 whichend whichEnd��  	L V   � �	U	V	U r   � �	W	X	W \   � �	Y	Z	Y o   � ����� 0 endindex endIndex	Z m   � ����� 	X o      ���� 0 endindex endIndex	V =  � �	[	\	[ n   � �	]	^	] 4   � ���	_
�� 
cha 	_ o   � ����� 0 endindex endIndex	^ o   � ����� 0 thetext theText	\ m   � �	`	` �	a	a  ��  ��  	J 	b��	b L   � �	c	c n   � �	d	e	d 7  � ���	f	g
�� 
ctxt	f o   � ����� 0 
startindex 
startIndex	g o   � ����� 0 endindex endIndex	e o   � ����� 0 thetext theText��  	 ��	h
�� conscase	h ��	i
�� consdiac	i ��	j
�� conshyph	j ����
�� conspunc��  	 ��	k
�� consnume	k ����
�� conswhit��  ��  � R      ��	l	m
�� .ascrerr ****      � ****	l o      ���� 0 etext eText	m ��	n	o
�� 
errn	n o      ���� 0 enumber eNumber	o ��	p	q
�� 
erob	p o      ���� 0 efrom eFrom	q ��	r��
�� 
errt	r o      ���� 
0 eto eTo��  � I   � ���	s���� 
0 _error  	s 	t	u	t m   � �	v	v �	w	w  t r i m   t e x t	u 	x	y	x o   � ����� 0 etext eText	y 	z	{	z o   � ����� 0 enumber eNumber	{ 	|	}	| o   � ����� 0 efrom eFrom	} 	~��	~ o   � ����� 
0 eto eTo��  ��  � 		�	 l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��	�	���  	� J D--------------------------------------------------------------------   	� �	�	� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -	� 	�	�	� l     ��	�	���  	�   Split and Join Suite   	� �	�	� *   S p l i t   a n d   J o i n   S u i t e	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  f i	�	�	� I      ��	����� 0 
_splittext 
_splitText	� 	�	�	� o      �� 0 thetext theText	� 	��~	� o      �}�} 0 theseparator theSeparator�~  ��  	� l    ^	�	�	�	� k     ^	�	� 	�	�	� r     	�	�	� n    
	�	�	� I    
�|	��{�| "0 aslistparameter asListParameter	� 	��z	� o    �y�y 0 theseparator theSeparator�z  �{  	� o     �x�x 0 _support  	� o      �w�w 0 delimiterlist delimiterList	� 	�	�	� X    C	��v	�	� Q    >	�	�	�	� l    )	�	�	�	� r     )	�	�	� c     %	�	�	� n     #	�	�	� 1   ! #�u
�u 
pcnt	� o     !�t�t 0 aref aRef	� m   # $�s
�s 
ctxt	� n      	�	�	� 1   & (�r
�r 
pcnt	� o   % &�q�q 0 aref aRef	��� caution: AS silently ignores invalid TID values, so separator items must be explicitly validated to catch any user errors; for now, just coerce to text and catch errors, but might want to make it more rigorous in future (e.g. if a list of lists is given, should sublist be treated as an error instead of just coercing it to text, which is itself TIDs sensitive); see also existing TODO on TypeSupport's asTextParameter handler   	� �	�	�V   c a u t i o n :   A S   s i l e n t l y   i g n o r e s   i n v a l i d   T I D   v a l u e s ,   s o   s e p a r a t o r   i t e m s   m u s t   b e   e x p l i c i t l y   v a l i d a t e d   t o   c a t c h   a n y   u s e r   e r r o r s ;   f o r   n o w ,   j u s t   c o e r c e   t o   t e x t   a n d   c a t c h   e r r o r s ,   b u t   m i g h t   w a n t   t o   m a k e   i t   m o r e   r i g o r o u s   i n   f u t u r e   ( e . g .   i f   a   l i s t   o f   l i s t s   i s   g i v e n ,   s h o u l d   s u b l i s t   b e   t r e a t e d   a s   a n   e r r o r   i n s t e a d   o f   j u s t   c o e r c i n g   i t   t o   t e x t ,   w h i c h   i s   i t s e l f   T I D s   s e n s i t i v e ) ;   s e e   a l s o   e x i s t i n g   T O D O   o n   T y p e S u p p o r t ' s   a s T e x t P a r a m e t e r   h a n d l e r	� R      �p�o	�
�p .ascrerr ****      � ****�o  	� �n	��m
�n 
errn	� d      	�	� m      �l�l��m  	� n  1 >	�	�	� I   6 >�k	��j�k 60 throwinvalidparametertype throwInvalidParameterType	� 	�	�	� o   6 7�i�i 0 aref aRef	� 	�	�	� m   7 8	�	� �	�	�  u s i n g   s e p a r a t o r	� 	�	�	� m   8 9	�	� �	�	�  l i s t   o f   t e x t	� 	��h	� m   9 :�g
�g 
ctxt�h  �j  	� o   1 6�f�f 0 _support  �v 0 aref aRef	� o    �e�e 0 delimiterlist delimiterList	� 	�	�	� r   D I	�	�	� n  D G	�	�	� 1   E G�d
�d 
txdl	� 1   D E�c
�c 
ascr	� o      �b�b 0 oldtids oldTIDs	� 	�	�	� r   J O	�	�	� o   J K�a�a 0 delimiterlist delimiterList	� n     	�	�	� 1   L N�`
�` 
txdl	� 1   K L�_
�_ 
ascr	� 	�	�	� r   P U	�	�	� n   P S	�	�	� 2  Q S�^
�^ 
citm	� o   P Q�]�] 0 thetext theText	� o      �\�\ 0 
resultlist 
resultList	� 	�	�	� r   V [	�	�	� o   V W�[�[ 0 oldtids oldTIDs	� n     	�	�	� 1   X Z�Z
�Z 
txdl	� 1   W X�Y
�Y 
ascr	� 	��X	� L   \ ^	�	� o   \ ]�W�W 0 
resultlist 
resultList�X  	� � � used by `split text` to split text using one or more text item delimiters and current or predefined considering/ignoring settings   	� �	�	�   u s e d   b y   ` s p l i t   t e x t `   t o   s p l i t   t e x t   u s i n g   o n e   o r   m o r e   t e x t   i t e m   d e l i m i t e r s   a n d   c u r r e n t   o r   p r e d e f i n e d   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s	� 	�	�	� l     �V�U�T�V  �U  �T  	� 	�	�	� l     �S�R�Q�S  �R  �Q  	� 	�	�	� i  j m	�	�	� I      �P	��O�P 0 _splitpattern _splitPattern	� 	�	�	� o      �N�N 0 thetext theText	� 	��M	� o      �L�L 0 patterntext patternText�M  �O  	� l    �	�	�	�	� k     �	�	� 	�	�	� r     	�	�	� I     �K	��J�K 60 _compileregularexpression _compileRegularExpression	� 	��I	� o    �H�H 0 patterntext patternText�I  �J  	� o      �G�G 
0 regexp  	� 	�	�	� r   	 	�	�	� n  	 	�	�	� I    �F	��E�F &0 stringwithstring_ stringWithString_	� 	��D	� o    �C�C 0 thetext theText�D  �E  	� n  	 
 

  o   
 �B�B 0 nsstring NSString
 m   	 
�A
�A misccura	� o      �@�@ 0 
asocstring 
asocString	� 


 l   



 r    


 m    �?�?  
 o      �>�> &0 asocnonmatchstart asocNonMatchStart
 G A used to calculate NSRanges for non-matching portions of NSString   
 �
	
	 �   u s e d   t o   c a l c u l a t e   N S R a n g e s   f o r   n o n - m a t c h i n g   p o r t i o n s   o f   N S S t r i n g
 




 r    


 J    �=�=  
 o      �<�< 0 
resultlist 
resultList
 


 l   �;

�;  
 @ : iterate over each non-matched + matched range in NSString   
 �

 t   i t e r a t e   o v e r   e a c h   n o n - m a t c h e d   +   m a t c h e d   r a n g e   i n   N S S t r i n g
 


 r    .


 n   ,


 I    ,�:
�9�: @0 matchesinstring_options_range_ matchesInString_options_range_
 


 o    �8�8 0 
asocstring 
asocString
 


 m     �7�7  
 
�6
 J     (

 
 
!
  m     !�5�5  
! 
"�4
" n  ! &
#
$
# I   " &�3�2�1�3 
0 length  �2  �1  
$ o   ! "�0�0 0 
asocstring 
asocString�4  �6  �9  
 o    �/�/ 
0 regexp  
 o      �.�.  0 asocmatcharray asocMatchArray
 
%
&
% Y   / v
'�-
(
)�,
' k   ? q
*
* 
+
,
+ r   ? L
-
.
- l  ? J
/�+�*
/ n  ? J
0
1
0 I   E J�)
2�(�) 0 rangeatindex_ rangeAtIndex_
2 
3�'
3 m   E F�&�&  �'  �(  
1 l  ? E
4�%�$
4 n  ? E
5
6
5 I   @ E�#
7�"�#  0 objectatindex_ objectAtIndex_
7 
8�!
8 o   @ A� �  0 i  �!  �"  
6 o   ? @��  0 asocmatcharray asocMatchArray�%  �$  �+  �*  
. o      ��  0 asocmatchrange asocMatchRange
, 
9
:
9 r   M T
;
<
; n  M R
=
>
= I   N R���� 0 location  �  �  
> o   M N��  0 asocmatchrange asocMatchRange
< o      ��  0 asocmatchstart asocMatchStart
: 
?
@
? r   U g
A
B
A c   U d
C
D
C l  U b
E��
E n  U b
F
G
F I   V b�
H�� *0 substringwithrange_ substringWithRange_
H 
I�
I K   V ^
J
J �
K
L� 0 location  
K o   W X�� &0 asocnonmatchstart asocNonMatchStart
L �
M�� 
0 length  
M \   Y \
N
O
N o   Y Z��  0 asocmatchstart asocMatchStart
O o   Z [�� &0 asocnonmatchstart asocNonMatchStart�  �  �  
G o   U V�� 0 
asocstring 
asocString�  �  
D m   b c�
� 
ctxt
B n      
P
Q
P  ;   e f
Q o   d e�� 0 
resultlist 
resultList
@ 
R�

R r   h q
S
T
S [   h o
U
V
U o   h i�	�	  0 asocmatchstart asocMatchStart
V l  i n
W��
W n  i n
X
Y
X I   j n���� 
0 length  �  �  
Y o   i j��  0 asocmatchrange asocMatchRange�  �  
T o      �� &0 asocnonmatchstart asocNonMatchStart�
  �- 0 i  
( m   2 3��  
) \   3 :
Z
[
Z l  3 8
\� ��
\ n  3 8
]
^
] I   4 8�������� 	0 count  ��  ��  
^ o   3 4����  0 asocmatcharray asocMatchArray�   ��  
[ m   8 9���� �,  
& 
_
`
_ l  w w��
a
b��  
a "  add final non-matched range   
b �
c
c 8   a d d   f i n a l   n o n - m a t c h e d   r a n g e
` 
d
e
d r   w �
f
g
f c   w 
h
i
h l  w }
j����
j n  w }
k
l
k I   x }��
m���� *0 substringfromindex_ substringFromIndex_
m 
n��
n o   x y���� &0 asocnonmatchstart asocNonMatchStart��  ��  
l o   w x���� 0 
asocstring 
asocString��  ��  
i m   } ~��
�� 
ctxt
g n      
o
p
o  ;   � �
p o    ����� 0 
resultlist 
resultList
e 
q��
q L   � �
r
r o   � ����� 0 
resultlist 
resultList��  	� Q K used by `split text` to split text using a regular expression as separator   	� �
s
s �   u s e d   b y   ` s p l i t   t e x t `   t o   s p l i t   t e x t   u s i n g   a   r e g u l a r   e x p r e s s i o n   a s   s e p a r a t o r	� 
t
u
t l     ��������  ��  ��  
u 
v
w
v l     ��������  ��  ��  
w 
x
y
x i  n q
z
{
z I      ��
|���� 0 	_jointext 	_joinText
| 
}
~
} o      ���� 0 thelist theList
~ 
��
 o      ���� 0 separatortext separatorText��  ��  
{ k     >
�
� 
�
�
� r     
�
�
� n    
�
�
� 1    ��
�� 
txdl
� 1     ��
�� 
ascr
� o      ���� 0 oldtids oldTIDs
� 
�
�
� r    
�
�
� o    ���� 0 delimiterlist delimiterList
� n     
�
�
� 1    
��
�� 
txdl
� 1    ��
�� 
ascr
� 
�
�
� Q    5
�
�
�
� r    
�
�
� c    
�
�
� n   
�
�
� I    ��
����� "0 aslistparameter asListParameter
� 
���
� o    ���� 0 thelist theList��  ��  
� o    ���� 0 _support  
� m    ��
�� 
ctxt
� o      ���� 0 
resulttext 
resultText
� R      ����
�
�� .ascrerr ****      � ****��  
� ��
���
�� 
errn
� d      
�
� m      �������  
� k   % 5
�
� 
�
�
� r   % *
�
�
� o   % &���� 0 oldtids oldTIDs
� n     
�
�
� 1   ' )��
�� 
txdl
� 1   & '��
�� 
ascr
� 
���
� R   + 5��
�
�
�� .ascrerr ****      � ****
� m   3 4
�
� �
�
� b I n v a l i d   d i r e c t   p a r a m e t e r   ( e x p e c t e d   l i s t   o f   t e x t ) .
� ��
�
�
�� 
errn
� m   - .�����Y
� ��
�
�
�� 
erob
� o   / 0���� 0 thelist theList
� ��
���
�� 
errt
� m   1 2��
�� 
list��  ��  
� 
�
�
� r   6 ;
�
�
� o   6 7���� 0 oldtids oldTIDs
� n     
�
�
� 1   8 :��
�� 
txdl
� 1   7 8��
�� 
ascr
� 
���
� L   < >
�
� o   < =���� 0 
resulttext 
resultText��  
y 
�
�
� l     ��������  ��  ��  
� 
�
�
� l     ��������  ��  ��  
� 
�
�
� l     ��
�
���  
�  -----   
� �
�
� 
 - - - - -
� 
�
�
� l     ��������  ��  ��  
� 
�
�
� i  r u
�
�
� I     ��
�
�
�� .Txt:SplTnull���     ctxt
� o      ���� 0 thetext theText
� ��
�
�
�� 
Sepa
� |����
���
���  ��  
� o      ���� 0 theseparator theSeparator��  
� l     
�����
� m      ��
�� 
msng��  ��  
� ��
���
�� 
Usin
� |����
���
���  ��  
� o      ���� 0 matchformat matchFormat��  
� l     
�����
� m      ��
�� SerECmpI��  ��  ��  
� k     �
�
� 
�
�
� l     ��
�
���  
�rl convenience handler for splitting text using TIDs that can also use a regular expression pattern as separator; note that this is similar to using `search text theText for theSeparator returning non matching text` (except that `search text` returns start and end indexes as well as text), but avoids some of the overhead and is an obvious complement to `join text`   
� �
�
��   c o n v e n i e n c e   h a n d l e r   f o r   s p l i t t i n g   t e x t   u s i n g   T I D s   t h a t   c a n   a l s o   u s e   a   r e g u l a r   e x p r e s s i o n   p a t t e r n   a s   s e p a r a t o r ;   n o t e   t h a t   t h i s   i s   s i m i l a r   t o   u s i n g   ` s e a r c h   t e x t   t h e T e x t   f o r   t h e S e p a r a t o r   r e t u r n i n g   n o n   m a t c h i n g   t e x t `   ( e x c e p t   t h a t   ` s e a r c h   t e x t `   r e t u r n s   s t a r t   a n d   e n d   i n d e x e s   a s   w e l l   a s   t e x t ) ,   b u t   a v o i d s   s o m e   o f   t h e   o v e r h e a d   a n d   i s   a n   o b v i o u s   c o m p l e m e n t   t o   ` j o i n   t e x t `
� 
���
� Q     �
�
�
�
� k    �
�
� 
�
�
� r    
�
�
� n   
�
�
� I    ��
����� "0 astextparameter asTextParameter
� 
�
�
� o    	���� 0 thetext theText
� 
���
� m   	 

�
� �
�
�  ��  ��  
� o    ���� 0 _support  
� o      ���� 0 thetext theText
� 
���
� Z    �
�
�
�
�
� =   
�
�
� o    ���� 0 theseparator theSeparator
� m    ��
�� 
msng
� l   
�
�
�
� L    
�
� I    ��
����� 0 _splitpattern _splitPattern
� 
�
�
� o    ���� 0 thetext theText
� 
���
� m    
�
� �
�
�  \ s +��  ��  
� g a if `at` parameter is omitted, splits on whitespace runs by default, ignoring any `using` options   
� �
�
� �   i f   ` a t `   p a r a m e t e r   i s   o m i t t e d ,   s p l i t s   o n   w h i t e s p a c e   r u n s   b y   d e f a u l t ,   i g n o r i n g   a n y   ` u s i n g `   o p t i o n s
� 
�
�
� =  " %
�
�
� o   " #���� 0 matchformat matchFormat
� m   # $��
�� SerECmpI
� 
�
�
� P   ( 6
� 
� L   - 5 I   - 4������ 0 
_splittext 
_splitText  o   . /���� 0 thetext theText �� o   / 0���� 0 theseparator theSeparator��  ��    ��
�� consdiac ��
�� conshyph ��	
�� conspunc	 ��

�� conswhit
 ����
�� consnume��   ����
�� conscase��  
�  =  9 < o   9 :���� 0 matchformat matchFormat m   : ;��
�� SerECmpP  L   ? Q I   ? P������ 0 _splitpattern _splitPattern  o   @ A���� 0 thetext theText � n  A L I   F L�~�}�~ "0 astextparameter asTextParameter  o   F G�|�| 0 theseparator theSeparator �{ m   G H �  a t�{  �}   o   A F�z�z 0 _support  �  ��    =  T W !  o   T U�y�y 0 matchformat matchFormat! m   U V�x
�x SerECmpC "#" P   Z h$%�w$ L   _ g&& I   _ f�v'�u�v 0 
_splittext 
_splitText' ()( o   ` a�t�t 0 thetext theText) *�s* o   a b�r�r 0 theseparator theSeparator�s  �u  % �q+
�q conscase+ �p,
�p consdiac, �o-
�o conshyph- �n.
�n conspunc. �m/
�m conswhit/ �l�k
�l consnume�k  �w  # 010 =  k n232 o   k l�j�j 0 matchformat matchFormat3 m   l m�i
�i SerECmpD1 4�h4 L   q y55 I   q x�g6�f�g 0 
_splittext 
_splitText6 787 o   r s�e�e 0 thetext theText8 9�d9 o   s t�c�c 0 theseparator theSeparator�d  �f  �h  
� n  | �:;: I   � ��b<�a�b >0 throwinvalidparameterconstant throwInvalidParameterConstant< =>= o   � ��`�` 0 matchformat matchFormat> ?�_? m   � �@@ �AA 
 u s i n g�_  �a  ; o   | ��^�^ 0 _support  ��  
� R      �]BC
�] .ascrerr ****      � ****B o      �\�\ 0 etext eTextC �[DE
�[ 
errnD o      �Z�Z 0 enumber eNumberE �YFG
�Y 
erobF o      �X�X 0 efrom eFromG �WH�V
�W 
errtH o      �U�U 
0 eto eTo�V  
� I   � ��TI�S�T 
0 _error  I JKJ m   � �LL �MM  s p l i t   t e x tK NON o   � ��R�R 0 etext eTextO PQP o   � ��Q�Q 0 enumber eNumberQ RSR o   � ��P�P 0 efrom eFromS T�OT o   � ��N�N 
0 eto eTo�O  �S  ��  
� UVU l     �M�L�K�M  �L  �K  V WXW l     �J�I�H�J  �I  �H  X YZY i  v y[\[ I     �G]^
�G .Txt:JoiTnull���     ****] o      �F�F 0 thelist theList^ �E_�D
�E 
Sepa_ |�C�B`�Aa�C  �B  ` o      �@�@ 0 separatortext separatorText�A  a m      bb �cc  �D  \ Q     'defd L    gg I    �?h�>�? 0 	_jointext 	_joinTexth iji o    �=�= 0 thelist theListj k�<k n   lml I   
 �;n�:�; "0 astextparameter asTextParametern opo o   
 �9�9 0 separatortext separatorTextp q�8q m    rr �ss  u s i n g   s e p a r a t o r�8  �:  m o    
�7�7 0 _support  �<  �>  e R      �6tu
�6 .ascrerr ****      � ****t o      �5�5 0 etext eTextu �4vw
�4 
errnv o      �3�3 0 enumber eNumberw �2xy
�2 
erobx o      �1�1 0 efrom eFromy �0z�/
�0 
errtz o      �.�. 
0 eto eTo�/  f I    '�-{�,�- 
0 _error  { |}| m    ~~ �  j o i n   t e x t} ��� o     �+�+ 0 etext eText� ��� o     !�*�* 0 enumber eNumber� ��� o   ! "�)�) 0 efrom eFrom� ��(� o   " #�'�' 
0 eto eTo�(  �,  Z ��� l     �&�%�$�&  �%  �$  � ��� l     �#�"�!�#  �"  �!  � ��� i  z }��� I     � ��
�  .Txt:SplPnull���     ctxt� o      �� 0 thetext theText�  � Q     $���� L    �� n    ��� 2   �
� 
cpar� n   ��� I    ���� "0 astextparameter asTextParameter� ��� o    	�� 0 thetext theText� ��� m   	 
�� ���  �  �  � o    �� 0 _support  � R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � I    $���� 
0 _error  � ��� m    �� ���   s p l i t   p a r a g r a p h s� ��� o    �� 0 etext eText� ��� o    �� 0 enumber eNumber� ��� o    �
�
 0 efrom eFrom� ��	� o     �� 
0 eto eTo�	  �  � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  ~ ���� I     ���
� .Txt:JoiPnull���     ****� o      � �  0 thelist theList� �����
�� 
LiBr� |����������  ��  � o      ���� 0 linebreaktype lineBreakType��  � l     ������ m      ��
�� LiBrLiOX��  ��  ��  � Q     O���� k    =�� ��� Z    4����� =   ��� o    ���� 0 linebreaktype lineBreakType� m    ��
�� LiBrLiOX� r   	 ��� 1   	 
��
�� 
lnfd� o      ���� 0 separatortext separatorText� ��� =   ��� o    ���� 0 linebreaktype lineBreakType� m    ��
�� LiBrLiCM� ��� r    ��� o    ��
�� 
ret � o      ���� 0 separatortext separatorText� ��� =   ��� o    ���� 0 linebreaktype lineBreakType� m    ��
�� LiBrLiWi� ���� r   ! &��� b   ! $��� o   ! "��
�� 
ret � 1   " #��
�� 
lnfd� o      ���� 0 separatortext separatorText��  � n  ) 4��� I   . 4������� >0 throwinvalidparameterconstant throwInvalidParameterConstant� ��� o   . /���� 0 linebreaktype lineBreakType� ���� m   / 0�� ��� 
 u s i n g��  ��  � o   ) .���� 0 _support  � ���� L   5 =�� I   5 <������� 0 	_jointext 	_joinText� ��� o   6 7���� 0 thelist theList� ���� o   7 8���� 0 separatortext separatorText��  ��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I   E O������� 
0 _error  � ��� m   F G�� ���  j o i n   p a r a g r a p h s� ��� o   G H���� 0 etext eText� ��� o   H I���� 0 enumber eNumber� ��� o   I J���� 0 efrom eFrom� ���� o   J K���� 
0 eto eTo��  ��  � � � l     ��������  ��  ��     l     ��������  ��  ��    l     ��������  ��  ��    l     ����   J D--------------------------------------------------------------------    �		 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

 l     ����     formatting    �    f o r m a t t i n g  l     ��������  ��  ��    i  � � I      ������ (0 _makevalueiterator _makeValueIterator �� o      ���� 0 
objectlist 
objectList��  ��   h     ���� 0 scpt   k        j     ���� 0 _objects   c      o     ���� 0 
objectlist 
objectList m    ��
�� 
list  j   	 �� �� 0 i    m   	 
����   !��! i    "#" I     ������
�� .aevtoappnull  �   � ****��  ��  # k     7$$ %&% r     '(' [     )*) o     ���� 0 i  * m    ���� ( o      ���� 0 i  & +,+ l   (-./- Z   (01����0 ?    232 o    ���� 0 i  3 n    454 1    ��
�� 
leng5 o    ���� 0 _objects  1 R    $����6
�� .ascrerr ****      � ****��  6 ��7��
�� 
errn7 m     !�������  ��  ��  .   stop iteration   / �88    s t o p   i t e r a t i o n, 9��9 L   ) 7:: n   ) 6;<; 4   . 5��=
�� 
cobj= o   / 4���� 0 i  < o   ) .���� 0 _objects  ��  ��   >?> l     ��������  ��  ��  ? @A@ l     ��BC��  B  -----   C �DD 
 - - - - -A EFE l     ��������  ��  ��  F GHG i  � �IJI I     ����K
�� .Txt:FLitnull��� ��� null��  K ��L��
�� 
For_L o      ���� 0 thevalue theValue��  J k    aMM NON l      ��PQ��  P�� Notes:
	 
	 - Most value types can be rendered using vanilla code; only specifiers and records have to be rendered via OSA APIs; values should be rendered in human-readable form (text isn't quoted, lists are concatentated as comma-separated items, dates and numbers using default AS coercions, etc) - user can use `literal representation`, `format number/date`, etc. to format values differently (avoids need for complex template parsing).
	 
	- Rendering arbitrary AS values requires wrapping the value in a script object (to preserve context info such as an object specifier's target application), converting that script to a typeScript descriptor (e.g. by packing it into an Apple event and sending it to a previously installed AE handler), then loading that script into an AS component instance, executing it, and returning the result's display value. Currently this is done via TextSupport.app agent. The whole thing's ridiculously kludgy, currently isn't smart enough to load up appropriate terminology before rendering app specifiers, and really requires AppleScript to implement a proper `literal text` property on all its datatypes. But at least it should help demonstrate the need for such a feature.
	   Q �RR	z   N o t e s : 
 	   
 	   -   M o s t   v a l u e   t y p e s   c a n   b e   r e n d e r e d   u s i n g   v a n i l l a   c o d e ;   o n l y   s p e c i f i e r s   a n d   r e c o r d s   h a v e   t o   b e   r e n d e r e d   v i a   O S A   A P I s ;   v a l u e s   s h o u l d   b e   r e n d e r e d   i n   h u m a n - r e a d a b l e   f o r m   ( t e x t   i s n ' t   q u o t e d ,   l i s t s   a r e   c o n c a t e n t a t e d   a s   c o m m a - s e p a r a t e d   i t e m s ,   d a t e s   a n d   n u m b e r s   u s i n g   d e f a u l t   A S   c o e r c i o n s ,   e t c )   -   u s e r   c a n   u s e   ` l i t e r a l   r e p r e s e n t a t i o n ` ,   ` f o r m a t   n u m b e r / d a t e ` ,   e t c .   t o   f o r m a t   v a l u e s   d i f f e r e n t l y   ( a v o i d s   n e e d   f o r   c o m p l e x   t e m p l a t e   p a r s i n g ) . 
 	   
 	 -   R e n d e r i n g   a r b i t r a r y   A S   v a l u e s   r e q u i r e s   w r a p p i n g   t h e   v a l u e   i n   a   s c r i p t   o b j e c t   ( t o   p r e s e r v e   c o n t e x t   i n f o   s u c h   a s   a n   o b j e c t   s p e c i f i e r ' s   t a r g e t   a p p l i c a t i o n ) ,   c o n v e r t i n g   t h a t   s c r i p t   t o   a   t y p e S c r i p t   d e s c r i p t o r   ( e . g .   b y   p a c k i n g   i t   i n t o   a n   A p p l e   e v e n t   a n d   s e n d i n g   i t   t o   a   p r e v i o u s l y   i n s t a l l e d   A E   h a n d l e r ) ,   t h e n   l o a d i n g   t h a t   s c r i p t   i n t o   a n   A S   c o m p o n e n t   i n s t a n c e ,   e x e c u t i n g   i t ,   a n d   r e t u r n i n g   t h e   r e s u l t ' s   d i s p l a y   v a l u e .   C u r r e n t l y   t h i s   i s   d o n e   v i a   T e x t S u p p o r t . a p p   a g e n t .   T h e   w h o l e   t h i n g ' s   r i d i c u l o u s l y   k l u d g y ,   c u r r e n t l y   i s n ' t   s m a r t   e n o u g h   t o   l o a d   u p   a p p r o p r i a t e   t e r m i n o l o g y   b e f o r e   r e n d e r i n g   a p p   s p e c i f i e r s ,   a n d   r e a l l y   r e q u i r e s   A p p l e S c r i p t   t o   i m p l e m e n t   a   p r o p e r   ` l i t e r a l   t e x t `   p r o p e r t y   o n   a l l   i t s   d a t a t y p e s .   B u t   a t   l e a s t   i t   s h o u l d   h e l p   d e m o n s t r a t e   t h e   n e e d   f o r   s u c h   a   f e a t u r e . 
 	O S��S P    aTUVT Q   `WXYW k   JZZ [\[ l   ��]^��  ] � z caution: AS types that can have overridden `class` properties (specifiers, records, etc) must be handled as special cases   ^ �__ �   c a u t i o n :   A S   t y p e s   t h a t   c a n   h a v e   o v e r r i d d e n   ` c l a s s `   p r o p e r t i e s   ( s p e c i f i e r s ,   r e c o r d s ,   e t c )   m u s t   b e   h a n d l e d   a s   s p e c i a l   c a s e s\ `a` Z   �bc����b F    3ded F    #fgf =    hih l   j����j I   ��kl
�� .corecnte****       ****k J    mm n��n o    	���� 0 thevalue theValue��  l ��o��
�� 
koclo m    ��
�� 
obj ��  ��  ��  i m    ����  g =    !pqp l   r����r I   ��st
�� .corecnte****       ****s J    uu v��v o    ���� 0 thevalue theValue��  t ��w��
�� 
koclw m    �
� 
capp��  ��  ��  q m     �~�~  e =   & 1xyx l  & /z�}�|z I  & /�{{|
�{ .corecnte****       ****{ J   & )}} ~�z~ o   & '�y�y 0 thevalue theValue�z  | �x�w
�x 
kocl m   * +�v
�v 
reco�w  �}  �|  y m   / 0�u�u  c Z   6������ >   6 A��� l  6 ?��t�s� I  6 ?�r��
�r .corecnte****       ****� J   6 9�� ��q� o   6 7�p�p 0 thevalue theValue�q  � �o��n
�o 
kocl� m   : ;�m
�m 
scpt�n  �t  �s  � m   ? @�l�l  � l  D Y���� Q   D Y���� L   G O�� b   G N��� b   G L��� m   G H�� ���  � s c r i p t  � l  H K��k�j� n  H K��� 1   I K�i
�i 
pnam� o   H I�h�h 0 thevalue theValue�k  �j  � m   L M�� ���  �� R      �g�f�e
�g .ascrerr ****      � ****�f  �e  � L   W Y�� m   W X�� ���  � s c r i p t ��GA script objects are currently displayed as "�script[NAME]�" (displaying script objects as source code is a separate task and should be done via OSAKit/osadecompile); TO DO: support informal 'description' protocol, speculatively calling `theValue's objectDescription()` and returning result if it's a non-empty text value?   � ����   s c r i p t   o b j e c t s   a r e   c u r r e n t l y   d i s p l a y e d   a s   " � s c r i p t [ N A M E ] � "   ( d i s p l a y i n g   s c r i p t   o b j e c t s   a s   s o u r c e   c o d e   i s   a   s e p a r a t e   t a s k   a n d   s h o u l d   b e   d o n e   v i a   O S A K i t / o s a d e c o m p i l e ) ;   T O   D O :   s u p p o r t   i n f o r m a l   ' d e s c r i p t i o n '   p r o t o c o l ,   s p e c u l a t i v e l y   c a l l i n g   ` t h e V a l u e ' s   o b j e c t D e s c r i p t i o n ( ) `   a n d   r e t u r n i n g   r e s u l t   i f   i t ' s   a   n o n - e m p t y   t e x t   v a l u e ?� ��� =  \ c��� n  \ _��� m   ] _�d
�d 
pcls� o   \ ]�c�c 0 thevalue theValue� m   _ b�b
�b 
ctxt� ��� k   f ��� ��� r   f o��� n  f m��� 1   i m�a
�a 
txdl� 1   f i�`
�` 
ascr� o      �_�_ 0 oldtids oldTIDs� ��� r   p {��� m   p s�� ���  \� n     ��� 1   v z�^
�^ 
txdl� 1   s v�]
�] 
ascr� ��� r   | ���� n   | ���� 2  } ��\
�\ 
citm� o   | }�[�[ 0 thevalue theValue� o      �Z�Z 0 	textitems 	textItems� ��� r   � ���� m   � ��� ���  \ \� n     ��� 1   � ��Y
�Y 
txdl� 1   � ��X
�X 
ascr� ��� r   � ���� c   � ���� o   � ��W�W 0 	textitems 	textItems� m   � ��V
�V 
ctxt� o      �U�U 0 thevalue theValue� ��� r   � ���� m   � ��� ���  "� n     ��� 1   � ��T
�T 
txdl� 1   � ��S
�S 
ascr� ��� r   � ���� n   � ���� 2  � ��R
�R 
citm� o   � ��Q�Q 0 thevalue theValue� o      �P�P 0 	textitems 	textItems� ��� r   � ���� m   � ��� ���  \ "� n     ��� 1   � ��O
�O 
txdl� 1   � ��N
�N 
ascr� ��� r   � ���� c   � ���� o   � ��M�M 0 	textitems 	textItems� m   � ��L
�L 
ctxt� o      �K�K 0 thevalue theValue� ��� r   � ���� o   � ��J�J 0 oldtids oldTIDs� n     ��� 1   � ��I
�I 
txdl� 1   � ��H
�H 
ascr� ��G� L   � ��� b   � ���� b   � ���� m   � ��� ���  "� o   � ��F�F 0 thevalue theValue� m   � ��� ���  "�G  � ��� =  � ���� n  � ���� m   � ��E
�E 
pcls� o   � ��D�D 0 thevalue theValue� m   � ��C
�C 
optr� ��B� l  �x   k   �x  l  � ��A�A   f ` TO DO: this is kludgy; ought to be possible to load AEDesc into an OSAValueID then display that    � �   T O   D O :   t h i s   i s   k l u d g y ;   o u g h t   t o   b e   p o s s i b l e   t o   l o a d   A E D e s c   i n t o   a n   O S A V a l u e I D   t h e n   d i s p l a y   t h a t 	
	 Q   �m k   �`  r   � � n  � � I   � ��@�?�@  0 objectatindex_ objectAtIndex_ �> m   � ��=�=  �>  �?   l  � ��<�; n  � � I   � ��:�9�: $0 arraywithobject_ arrayWithObject_ �8 o   � ��7�7 0 thevalue theValue�8  �9   n  � � o   � ��6�6 0 nsarray NSArray m   � ��5
�5 misccura�<  �;   o      �4�4  0 asocdescriptor asocDescriptor  r   � !  c   �"#" l  �$�3�2$ n  �%&% I   ��1'�0�1 &0 stringwithstring_ stringWithString_' (�/( l  �)�.�-) n  �*+* I  �,�+�*�, "0 uppercasestring uppercaseString�+  �*  + l  �,�)�(, n  �-.- I  �'�&�%�' 0 description  �&  �%  . n  �/0/ I   �$�#�"�$ 0 data  �#  �"  0 o   � �!�!  0 asocdescriptor asocDescriptor�)  �(  �.  �-  �/  �0  & n  � �121 o   � �� �  0 nsstring NSString2 m   � ��
� misccura�3  �2  # m  �
� 
ctxt! o      �� 0 hextext hexText 343 r   565 n 787 1  �
� 
txdl8 1  �
� 
ascr6 o      �� 0 oldtids oldTIDs4 9:9 r  !,;<; 1  !$�
� 
spac< n     =>= 1  '+�
� 
txdl> 1  $'�
� 
ascr: ?@? r  -4ABA n  -2CDC 2 .2�
� 
citmD o  -.�� 0 hextext hexTextB o      �� 0 	textitems 	textItems@ EFE r  5@GHG m  58II �JJ  H n     KLK 1  ;?�
� 
txdlL 1  8;�
� 
ascrF MNM r  AVOPO n ATQRQ 7 FT�ST
� 
ctxtS m  LN�� T m  OS����R l AFU��U c  AFVWV o  AB�� 0 	textitems 	textItemsW m  BE�
� 
ctxt�  �  P o      �
�
 0 hextext hexTextN X�	X r  W`YZY o  WX�� 0 oldtids oldTIDsZ n     [\[ 1  [_�
� 
txdl\ 1  X[�
� 
ascr�	   R      ���
� .ascrerr ****      � ****�  �   r  hm]^] m  hk__ �``  &^ o      �� 0 hextext hexText
 a�a L  nxbb b  nwcdc b  nsefe m  nqgg �hh  � d a t a   o p t rf o  qr� �  0 hextext hexTextd m  svii �jj  ��     format "�data optr...�"    �kk 0   f o r m a t   " � d a t a   o p t r . . . � "�B  � Q  {�lmnl L  ~�oo c  ~�pqp o  ~���� 0 thevalue theValueq m  ���
�� 
ctxtm R      ����r
�� .ascrerr ****      � ****��  r ��s��
�� 
errns d      tt m      �������  n l ����uv��  u   fall through   v �ww    f a l l   t h r o u g h��  ��  a xyx l ����z{��  z � � if it's an ASOC object specifier, use object's description if available otherwise create raw syntax representation of ocid specifier   { �||
   i f   i t ' s   a n   A S O C   o b j e c t   s p e c i f i e r ,   u s e   o b j e c t ' s   d e s c r i p t i o n   i f   a v a i l a b l e   o t h e r w i s e   c r e a t e   r a w   s y n t a x   r e p r e s e n t a t i o n   o f   o c i d   s p e c i f i e ry }~} Z  ������ F  ����� >  ����� l �������� I ������
�� .corecnte****       ****� J  ���� ���� o  ������ 0 thevalue theValue��  � �����
�� 
kocl� m  ����
�� 
obj ��  ��  ��  � m  ������  � = ����� n ����� m  ����
�� 
want� l �������� c  ����� o  ������ 0 thevalue theValue� m  ����
�� 
reco��  ��  � m  ����
�� 
ocid� l ����� Q  ����� k  ���� ��� r  ����� l �������� c  ����� n ����� I  ���������� 0 description  ��  ��  � o  ������ 0 thevalue theValue� m  ����
�� 
ctxt��  ��  � o      ���� "0 descriptiontext descriptionText� ��� Z ��������� F  ����� C  ����� o  ������ "0 descriptiontext descriptionText� m  ���� ���  <� D  ����� o  ������ "0 descriptiontext descriptionText� m  ���� ���  >� r  ����� n  ����� 7 ������
�� 
ctxt� m  ������ � m  ��������� o  ������ "0 descriptiontext descriptionText� o      ���� "0 descriptiontext descriptionText��  ��  � ���� L  ���� b  ����� b  ����� m  ���� ���  �� o  ������ "0 descriptiontext descriptionText� m  ���� ���  ���  � R      ������
�� .ascrerr ****      � ****��  ��  � l ����� l ����� L  ��� b  ���� m  ���� ���   � c l a s s   o c i d �   i d  � l ������� I ������
�� .Txt:FLitnull��� ��� null��  � �����
�� 
For_� l  ������ n  ��� m  ��
�� 
seld� l  ������ c   ��� o   ���� 0 thevalue theValue� m  ��
�� 
reco��  ��  ��  ��  ��  ��  ��  � � � would be better to get correct representation generated by OSAKit, but AS doesn't allow ASOC specifiers to travel so string-munging it is   � ���   w o u l d   b e   b e t t e r   t o   g e t   c o r r e c t   r e p r e s e n t a t i o n   g e n e r a t e d   b y   O S A K i t ,   b u t   A S   d o e s n ' t   a l l o w   A S O C   s p e c i f i e r s   t o   t r a v e l   s o   s t r i n g - m u n g i n g   i t   i s� V P otherwise use raw ASOC object specifier syntax (not ideal, but will have to do)   � ��� �   o t h e r w i s e   u s e   r a w   A S O C   o b j e c t   s p e c i f i e r   s y n t a x   ( n o t   i d e a l ,   b u t   w i l l   h a v e   t o   d o )� � �  (see Objects library's `check type` handler for notes)		-- TO DO: need to check this hack (it's also used in Objects) as it's possible it will error on some reference objects (e.g. app specifiers)   � ����     ( s e e   O b j e c t s   l i b r a r y ' s   ` c h e c k   t y p e `   h a n d l e r   f o r   n o t e s ) 	 	 - -   T O   D O :   n e e d   t o   c h e c k   t h i s   h a c k   ( i t ' s   a l s o   u s e d   i n   O b j e c t s )   a s   i t ' s   p o s s i b l e   i t   w i l l   e r r o r   o n   s o m e   r e f e r e n c e   o b j e c t s   ( e . g .   a p p   s p e c i f i e r s )��  ��  ~ ��� l ������  �hb TO DO: there's a problem here if value is a record containing ASOC specifiers, as there's no practical way to examine the record's properties without sending it to an AE handler, and AS will throw an error; suspect the only practical option is to throw another error that describes the problem, or return "�record�" to indicate object is unrepresentable   � ����   T O   D O :   t h e r e ' s   a   p r o b l e m   h e r e   i f   v a l u e   i s   a   r e c o r d   c o n t a i n i n g   A S O C   s p e c i f i e r s ,   a s   t h e r e ' s   n o   p r a c t i c a l   w a y   t o   e x a m i n e   t h e   r e c o r d ' s   p r o p e r t i e s   w i t h o u t   s e n d i n g   i t   t o   a n   A E   h a n d l e r ,   a n d   A S   w i l l   t h r o w   a n   e r r o r ;   s u s p e c t   t h e   o n l y   p r a c t i c a l   o p t i o n   i s   t o   t h r o w   a n o t h e r   e r r o r   t h a t   d e s c r i b e s   t h e   p r o b l e m ,   o r   r e t u r n   " � r e c o r d � "   t o   i n d i c a t e   o b j e c t   i s   u n r e p r e s e n t a b l e� ���� Q  J���� k  >�� ��� r  ��� I  ������� (0 _makevalueiterator _makeValueIterator� ���� J  �� ���� o  ���� 0 thevalue theValue��  ��  ��  � o      ���� 0 scpt  � ���� O   >��� I .=�����
�� .Txt:LitR****      � ****��  � ����
�� 
Scpt� o  23���� 0 scpt  � �����
�� 
Deco� l 67������ m  67��
�� boovfals��  ��  ��  � 5   +�����
�� 
capp� o  "'���� 60 _textsupportagentbundleid _TextSupportAgentBundleID
�� kfrmID  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � L  FJ�� m  FI�� ��� 0 � u n r e p r e s e n t a b l e   o b j e c t ���  X R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  Y l R`���� I  R`������� 
0 _error  �    m  SV � , l i t e r a l   r e p r e s e n t a t i o n  o  VW���� 0 etext eText  o  WX���� 0 enumber eNumber 	 o  XY���� 0 efrom eFrom	 
��
 o  YZ���� 
0 eto eTo��  ��  � 8 2 note: this handler should never fail, caveat bugs   � � d   n o t e :   t h i s   h a n d l e r   s h o u l d   n e v e r   f a i l ,   c a v e a t   b u g sU ��
�� conscase ��
�� consdiac ��
�� conshyph ��
�� conspunc ����
�� conswhit��  V ����
�� consnume��  ��  H  l     ��������  ��  ��    l     ��������  ��  ��    i  � � I     ��
�� .Txt:FTxtnull���     ctxt o      ���� 0 templatetext templateText ����
�� 
Usin o      ���� 0 	thevalues 	theValues��   k    3  l     ����   � � note: templateText uses same `$n` (where n=1-9) notation as `search text`'s replacement templates, with `\$` to escape as necessary ($ not followed by a digit will appear as-is)    �  d   n o t e :   t e m p l a t e T e x t   u s e s   s a m e   ` $ n `   ( w h e r e   n = 1 - 9 )   n o t a t i o n   a s   ` s e a r c h   t e x t ` ' s   r e p l a c e m e n t   t e m p l a t e s ,   w i t h   ` \ $ `   t o   e s c a p e   a s   n e c e s s a r y   ( $   n o t   f o l l o w e d   b y   a   d i g i t   w i l l   a p p e a r   a s - i s ) !��! Q    3"#$" k   %% &'& r    ()( n   *+* I    ��,���� "0 aslistparameter asListParameter, -��- o    	���� 0 	thevalues 	theValues��  ��  + o    ���� 0 _support  ) o      ���� 0 	thevalues 	theValues' ./. r    010 n   232 I    �4�~� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_4 565 m    77 �88  \ \ . | \ $ [ 1 - 9 ]6 9:9 m    �}�}  : ;�|; l   <�{�z< m    �y
�y 
msng�{  �z  �|  �~  3 n   =>= o    �x�x *0 nsregularexpression NSRegularExpression> m    �w
�w misccura1 o      �v�v 
0 regexp  / ?@? r    'ABA n   %CDC I     %�uE�t�u &0 stringwithstring_ stringWithString_E F�sF o     !�r�r 0 templatetext templateText�s  �t  D n    GHG o     �q�q 0 nsstring NSStringH m    �p
�p misccuraB o      �o�o 0 
asocstring 
asocString@ IJI r   ( 9KLK l  ( 7M�n�mM n  ( 7NON I   ) 7�lP�k�l @0 matchesinstring_options_range_ matchesInString_options_range_P QRQ o   ) *�j�j 0 
asocstring 
asocStringR STS m   * +�i�i  T U�hU J   + 3VV WXW m   + ,�g�g  X Y�fY n  , 1Z[Z I   - 1�e�d�c�e 
0 length  �d  �c  [ o   , -�b�b 0 
asocstring 
asocString�f  �h  �k  O o   ( )�a�a 
0 regexp  �n  �m  L o      �`�`  0 asocmatcharray asocMatchArrayJ \]\ r   : >^_^ J   : <�_�_  _ o      �^�^ 0 resulttexts resultTexts] `a` r   ? Bbcb m   ? @�]�]  c o      �\�\ 0 
startindex 
startIndexa d�[d P   Cefge k   Hhh iji Y   H �k�Zlm�Yk k   X �nn opo r   X eqrq l  X cs�X�Ws n  X ctut I   ^ c�Vv�U�V 0 rangeatindex_ rangeAtIndex_v w�Tw m   ^ _�S�S  �T  �U  u l  X ^x�R�Qx n  X ^yzy I   Y ^�P{�O�P  0 objectatindex_ objectAtIndex_{ |�N| o   Y Z�M�M 0 i  �N  �O  z o   X Y�L�L  0 asocmatcharray asocMatchArray�R  �Q  �X  �W  r o      �K�K 0 
matchrange 
matchRangep }~} r   f �� c   f }��� l  f y��J�I� n  f y��� I   g y�H��G�H *0 substringwithrange_ substringWithRange_� ��F� K   g u�� �E���E 0 location  � o   h i�D�D 0 
startindex 
startIndex� �C��B�C 
0 length  � l  j q��A�@� \   j q��� l  j o��?�>� n  j o��� I   k o�=�<�;�= 0 location  �<  �;  � o   j k�:�: 0 
matchrange 
matchRange�?  �>  � o   o p�9�9 0 
startindex 
startIndex�A  �@  �B  �F  �G  � o   f g�8�8 0 
asocstring 
asocString�J  �I  � m   y |�7
�7 
ctxt� n      ���  ;   ~ � o   } ~�6�6 0 resulttexts resultTexts~ ��� r   � ���� c   � ���� l  � ���5�4� n  � ���� I   � ��3��2�3 *0 substringwithrange_ substringWithRange_� ��1� o   � ��0�0 0 
matchrange 
matchRange�1  �2  � o   � ��/�/ 0 
asocstring 
asocString�5  �4  � m   � ��.
�. 
ctxt� o      �-�- 0 thetoken theToken� ��� Z   � ����,�� =  � ���� o   � ��+�+ 0 thetoken theToken� m   � ��� ���  \ \� l  � ����� r   � ���� o   � ��*�* 0 thetoken theToken� n      ���  ;   � �� o   � ��)�) 0 resulttexts resultTexts� ( " found backslash-escaped character   � ��� D   f o u n d   b a c k s l a s h - e s c a p e d   c h a r a c t e r�,  � l  � ����� k   � ��� ��� l  � ����� r   � ���� n   � ���� 4   � ��(�
�( 
cobj� l  � ���'�&� c   � ���� n  � ���� 4  � ��%�
�% 
cha � m   � ��$�$��� o   � ��#�# 0 thetoken theToken� m   � ��"
�" 
long�'  �&  � o   � ��!�! 0 	thevalues 	theValues� o      � �  0 theitem theItem� 2 , this will raise error -1728 if out of range   � ��� X   t h i s   w i l l   r a i s e   e r r o r   - 1 7 2 8   i f   o u t   o f   r a n g e� ��� Q   � ����� r   � ���� c   � ���� o   � ��� 0 theitem theItem� m   � ��
� 
ctxt� n      ���  ;   � �� o   � ��� 0 resulttexts resultTexts� R      ���
� .ascrerr ****      � ****�  � ���
� 
errn� d      �� m      ����  � l  � ����� r   � ���� I  � ����
� .Txt:FLitnull��� ��� null�  � ���
� 
For_� o   � ��� 0 theitem theItem�  � n      ���  ;   � �� o   � ��� 0 resulttexts resultTexts� � � TO DO: or just throw 'unsupported object type' error, requiring user to get value's literal representation before passing it to `format text`   � ���   T O   D O :   o r   j u s t   t h r o w   ' u n s u p p o r t e d   o b j e c t   t y p e '   e r r o r ,   r e q u i r i n g   u s e r   t o   g e t   v a l u e ' s   l i t e r a l   r e p r e s e n t a t i o n   b e f o r e   p a s s i n g   i t   t o   ` f o r m a t   t e x t `�  �  	 found $n   � ���    f o u n d   $ n� ��� r   � ���� [   � ���� l  � ����� n  � ���� I   � ����� 0 location  �  �  � o   � ��
�
 0 
matchrange 
matchRange�  �  � l  � ���	�� n  � ���� I   � ����� 
0 length  �  �  � o   � ��� 0 
matchrange 
matchRange�	  �  � o      �� 0 
startindex 
startIndex�  �Z 0 i  l m   K L��  m l  L S��� � \   L S��� l  L Q������ n  L Q��� I   M Q�������� 	0 count  ��  ��  � o   L M����  0 asocmatcharray asocMatchArray��  ��  � m   Q R���� �  �   �Y  j ��� r   � ���� c   � ���� l  � ������� n  � ���� I   � �������� *0 substringfromindex_ substringFromIndex_� ���� o   � ����� 0 
startindex 
startIndex��  ��  � o   � ����� 0 
asocstring 
asocString��  ��  � m   � ���
�� 
ctxt� n      ���  ;   � �� o   � ����� 0 resulttexts resultTexts� ��� r   � ���� n  � �� � 1   � ���
�� 
txdl  1   � ���
�� 
ascr� o      ���� 0 oldtids oldTIDs�  r   � m   � � �   n      1   ��
�� 
txdl 1   � ��
�� 
ascr 	
	 r   c   o  ���� 0 resulttexts resultTexts m  
��
�� 
ctxt o      ���� 0 
resulttext 
resultText
  r   o  ���� 0 oldtids oldTIDs n      1  ��
�� 
txdl 1  ��
�� 
ascr �� L   o  ���� 0 
resulttext 
resultText��  f ��
�� conscase ��
�� consdiac ��
�� conshyph ��
�� conspunc ����
�� conswhit��  g ����
�� consnume��  �[  # R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber �� 
�� 
erob o      ���� 0 efrom eFrom  ��!��
�� 
errt! o      ���� 
0 eto eTo��  $ I  #3��"���� 
0 _error  " #$# m  $'%% �&&  f o r m a t   t e x t$ '(' o  '(���� 0 etext eText( )*) o  ()���� 0 enumber eNumber* +,+ o  )*���� 0 efrom eFrom, -��- o  *-���� 
0 eto eTo��  ��  ��   ./. l     ��������  ��  ��  / 010 l     ��������  ��  ��  1 232 l     ��������  ��  ��  3 454 l     ��67��  6 J D--------------------------------------------------------------------   7 �88 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -5 9:9 l     ��;<��  ;�� locale support -- TO DO: what other functionality should be exposed to user? if there's much more, consider moving to its own Localization library; bear in mind that NSLocale instances and other Cocoa objects generally shouldn't be returned to user as ASOC objects cause problems for autosave, script persistence, etc; instead, use localeIdentifier strings and convert to/from NSLocale at point of use   < �==$   l o c a l e   s u p p o r t   - -   T O   D O :   w h a t   o t h e r   f u n c t i o n a l i t y   s h o u l d   b e   e x p o s e d   t o   u s e r ?   i f   t h e r e ' s   m u c h   m o r e ,   c o n s i d e r   m o v i n g   t o   i t s   o w n   L o c a l i z a t i o n   l i b r a r y ;   b e a r   i n   m i n d   t h a t   N S L o c a l e   i n s t a n c e s   a n d   o t h e r   C o c o a   o b j e c t s   g e n e r a l l y   s h o u l d n ' t   b e   r e t u r n e d   t o   u s e r   a s   A S O C   o b j e c t s   c a u s e   p r o b l e m s   f o r   a u t o s a v e ,   s c r i p t   p e r s i s t e n c e ,   e t c ;   i n s t e a d ,   u s e   l o c a l e I d e n t i f i e r   s t r i n g s   a n d   c o n v e r t   t o / f r o m   N S L o c a l e   a t   p o i n t   o f   u s e: >?> l     ��������  ��  ��  ? @A@ i  � �BCB I     ������
�� .Txt:LLocnull��� ��� null��  ��  C l    DEFD L     GG c     HIH l    J����J n    KLK I    ��M���� 60 sortedarrayusingselector_ sortedArrayUsingSelector_M N��N m    OO �PP  c o m p a r e :��  ��  L n    QRQ I    �������� 80 availablelocaleidentifiers availableLocaleIdentifiers��  ��  R n    STS o    ���� 0 nslocale NSLocaleT m     ��
�� misccura��  ��  I m    ��
�� 
listE , &> {"af", "af_NA", "af_ZA", "agq", ...}   F �UU L >   { " a f " ,   " a f _ N A " ,   " a f _ Z A " ,   " a g q " ,   . . . }A VWV l     ��������  ��  ��  W XYX i  � �Z[Z I     ������
�� .Txt:CLocnull��� ��� null��  ��  [ L     \\ c     ]^] l    _����_ n    `a` I    �������� $0 localeidentifier localeIdentifier��  ��  a n    bcb I    �������� 0 currentlocale currentLocale��  ��  c n    ded o    ���� 0 nslocale NSLocalee m     ��
�� misccura��  ��  ^ m    ��
�� 
ctxtY fgf l     ��������  ��  ��  g h��h l     ��������  ��  ��  ��       &��ij ������klmnopqrstuvwxyz{|}~������������  i $����������������������������������������~�}�|�{�z�y�x�w�v�u�t�s�r�q�p�o
�� 
pimr�� 60 _textsupportagentbundleid _TextSupportAgentBundleID�� (0 _unmatchedtexttype _UnmatchedTextType�� $0 _matchedtexttype _MatchedTextType�� &0 _matchedgrouptype _MatchedGroupType�� 0 _support  �� 
0 _error  �� 60 _compileregularexpression _compileRegularExpression�� $0 _matchinforecord _matchInfoRecord�� 0 _matchrecords _matchRecords�� &0 _matchedgrouplist _matchedGroupList�� 0 _findpattern _findPattern�� "0 _replacepattern _replacePattern�� 0 	_findtext 	_findText�� 0 _replacetext _replaceText
�� .Txt:Srchnull���     ctxt
�� .Txt:EPatnull���     ctxt
�� .Txt:ETemnull���     ctxt
�� .Txt:UppTnull���     ctxt
� .Txt:CapTnull���     ctxt
�~ .Txt:LowTnull���     ctxt
�} .Txt:PadTnull���     ctxt
�| .Txt:SliTnull���     ctxt
�{ .Txt:TrmTnull���     ctxt�z 0 
_splittext 
_splitText�y 0 _splitpattern _splitPattern�x 0 	_jointext 	_joinText
�w .Txt:SplTnull���     ctxt
�v .Txt:JoiTnull���     ****
�u .Txt:SplPnull���     ctxt
�t .Txt:JoiPnull���     ****�s (0 _makevalueiterator _makeValueIterator
�r .Txt:FLitnull��� ��� null
�q .Txt:FTxtnull���     ctxt
�p .Txt:LLocnull��� ��� null
�o .Txt:CLocnull��� ��� nullj �n��n �  �� �m��l
�m 
cobj� ��   �k 
�k 
frmk�l  
�� 
TxtU
�� 
TxtM
�� 
TxtGk ��   �j L
�j 
scptl �i V�h�g���f�i 
0 _error  �h �e��e �  �d�c�b�a�`�d 0 handlername handlerName�c 0 etext eText�b 0 enumber eNumber�a 0 efrom eFrom�` 
0 eto eTo�g  � �_�^�]�\�[�_ 0 handlername handlerName�^ 0 etext eText�] 0 enumber eNumber�\ 0 efrom eFrom�[ 
0 eto eTo�  f�Z�Y�Z �Y &0 throwcommanderror throwCommandError�f b  ࠡ����+ m �X ��W�V���U�X 60 _compileregularexpression _compileRegularExpression�W �T��T �  �S�S 0 patterntext patternText�V  � �R�Q�R 0 patterntext patternText�Q 
0 regexp  � 	�P�O�N�M�L�K�J�I �
�P misccura�O *0 nsregularexpression NSRegularExpression
�N 
msng�M Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_
�L 
errn�K�Y
�J 
erob�I �U #��,�j�m+ E�O��  )�����Y hO�n �H ��G�F���E�H $0 _matchinforecord _matchInfoRecord�G �D��D �  �C�B�A�@�C 0 
asocstring 
asocString�B  0 asocmatchrange asocMatchRange�A 0 
textoffset 
textOffset�@ 0 
recordtype 
recordType�F  � �?�>�=�<�;�:�? 0 
asocstring 
asocString�>  0 asocmatchrange asocMatchRange�= 0 
textoffset 
textOffset�< 0 
recordtype 
recordType�; 0 	foundtext 	foundText�:  0 nexttextoffset nextTextOffset� �9�8�7�6�5�4�3�2�9 *0 substringwithrange_ substringWithRange_
�8 
ctxt
�7 
leng
�6 
pcls�5 0 
startindex 
startIndex�4 0 endindex endIndex�3 0 	foundtext 	foundText�2 �E $��k+  �&E�O���,E�O���k���lvo �1 ��0�/���.�1 0 _matchrecords _matchRecords�0 �-��- �  �,�+�*�)�(�'�, 0 
asocstring 
asocString�+  0 asocmatchrange asocMatchRange�*  0 asocstartindex asocStartIndex�) 0 
textoffset 
textOffset�( (0 nonmatchrecordtype nonMatchRecordType�' "0 matchrecordtype matchRecordType�/  � �&�%�$�#�"�!� �����& 0 
asocstring 
asocString�%  0 asocmatchrange asocMatchRange�$  0 asocstartindex asocStartIndex�# 0 
textoffset 
textOffset�" (0 nonmatchrecordtype nonMatchRecordType�! "0 matchrecordtype matchRecordType�   0 asocmatchstart asocMatchStart� 0 asocmatchend asocMatchEnd� &0 asocnonmatchrange asocNonMatchRange� 0 nonmatchinfo nonMatchInfo� 0 	matchinfo 	matchInfo� ������ 0 location  � 
0 length  � � $0 _matchinforecord _matchInfoRecord
� 
cobj�. W�j+  E�O��j+ E�O�ᦢ�E�O*�����+ E[�k/E�Z[�l/E�ZO*�����+ E[�k/E�Z[�l/E�ZO�����vp �S������ &0 _matchedgrouplist _matchedGroupList� ��� �  ����� 0 
asocstring 
asocString� 0 	asocmatch 	asocMatch� 0 
textoffset 
textOffset� &0 includenonmatches includeNonMatches�  � ����
�	��������� 0 
asocstring 
asocString� 0 	asocmatch 	asocMatch� 0 
textoffset 
textOffset�
 &0 includenonmatches includeNonMatches�	 "0 submatchresults subMatchResults� 0 groupindexes groupIndexes� (0 asocfullmatchrange asocFullMatchRange� &0 asocnonmatchstart asocNonMatchStart� $0 asocfullmatchend asocFullMatchEnd� 0 i  � 0 nonmatchinfo nonMatchInfo� 0 	matchinfo 	matchInfo� &0 asocnonmatchrange asocNonMatchRange� 	� �����������������   0 numberofranges numberOfRanges�� 0 rangeatindex_ rangeAtIndex_�� 0 location  �� 
0 length  �� �� 0 _matchrecords _matchRecords
�� 
cobj�� �� $0 _matchinforecord _matchInfoRecord� �jvE�O�j+  kE�O�j ��jk+ E�O�j+ E�O��j+ E�O Uk�kh 	*���k+ ��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO� 	��6FY hO��6F[OY��O� #�㨧�E�O*���b  �+ �k/�6FY hY hO�q ������������� 0 _findpattern _findPattern�� ����� �  ���������� 0 thetext theText�� 0 patterntext patternText�� &0 includenonmatches includeNonMatches��  0 includematches includeMatches��  � �������������������������������� 0 thetext theText�� 0 patterntext patternText�� &0 includenonmatches includeNonMatches��  0 includematches includeMatches�� 
0 regexp  �� 0 
asocstring 
asocString�� &0 asocnonmatchstart asocNonMatchStart�� 0 
textoffset 
textOffset�� 0 
resultlist 
resultList��  0 asocmatcharray asocMatchArray�� 0 i  �� 0 	asocmatch 	asocMatch�� 0 nonmatchinfo nonMatchInfo�� 0 	matchinfo 	matchInfo�� 0 	foundtext 	foundText� ��� ������������������������������������������������ (0 asbooleanparameter asBooleanParameter�� 60 _compileregularexpression _compileRegularExpression
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� 
0 length  �� @0 matchesinstring_options_range_ matchesInString_options_range_�� 	0 count  ��  0 objectatindex_ objectAtIndex_�� 0 rangeatindex_ rangeAtIndex_�� �� 0 _matchrecords _matchRecords
�� 
cobj�� �� 0 foundgroups foundGroups�� 0 
startindex 
startIndex�� &0 _matchedgrouplist _matchedGroupList�� *0 substringfromindex_ substringFromIndex_
�� 
ctxt
�� 
pcls�� 0 endindex endIndex
�� 
leng�� 0 	foundtext 	foundText�� ��b  ��l+ E�Ob  ��l+ E�O*�k+ E�O��,�k+ E�OjE�OkE�OjvE�O��jj�j+ lvm+ E�O j�j+ 	kkh 
��k+ 
E�O*��jk+ ��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO� 	��6FY hO� �a *���a ,��+ l%�6FY h[OY��O� 1��k+ a &E�Oa b  a �a �a ,a �a �6FY hO�r ������������� "0 _replacepattern _replacePattern�� ����� �  �������� 0 thetext theText�� 0 patterntext patternText�� 0 templatetext templateText��  � ������������ 0 thetext theText�� 0 patterntext patternText�� 0 templatetext templateText�� 0 
asocstring 
asocString�� 
0 regexp  � ��������������
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� 60 _compileregularexpression _compileRegularExpression�� 
0 length  �� �� |0 <stringbyreplacingmatchesinstring_options_range_withtemplate_ <stringByReplacingMatchesInString_options_range_withTemplate_�� &��,�k+ E�O*�k+ E�O��jj�j+ lv��+ s ������������ 0 	_findtext 	_findText�� ����� �  ���������� 0 thetext theText�� 0 fortext forText�� &0 includenonmatches includeNonMatches��  0 includematches includeMatches��  � 
���������������������� 0 thetext theText�� 0 fortext forText�� &0 includenonmatches includeNonMatches��  0 includematches includeMatches�� 0 
resultlist 
resultList�� 0 oldtids oldTIDs�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 	foundtext 	foundText�� 0 i  � &��������*����������\������������������
�� 
errn���Y
�� 
erob�� 
�� 
ascr
�� 
txdl
�� 
citm
�� 
leng
�� 
ctxt
�� 
pcls�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 	foundtext 	foundText�� 
�� .corecnte****       ****�� 0 foundgroups foundGroups�� 
��(��  )�����Y hOjvE�O��,E�O���,FOkE�O��k/�,E�O�� �[�\[Z�\Z�2E�Y �E�O� �b  ����a �6FY hO �l��-j kh 	�kE�O��,�[�\[�/\Zi2�,E�O�� �[�\[Z�\Z�2E�Y a E�O� �b  ����a jva �6FY hO�kE�O���/�,kE�O�� �[�\[Z�\Z�2E�Y a E�O� �b  ����a �6FY h[OY�XO���,FO�t ������� 0 _replacetext _replaceText� ��� �  ���� 0 thetext theText� 0 fortext forText� 0 newtext newText�  � ������� 0 thetext theText� 0 fortext forText� 0 newtext newText� 0 oldtids oldTIDs� 0 	textitems 	textItems� 0 
resulttext 
resultText� ����~
� 
ascr
� 
txdl
� 
citm
�~ 
ctxt� '��,E�O���,FO��-E�O���,FO��&E�O���,FO�u �}A�|�{���z
�} .Txt:Srchnull���     ctxt�| 0 thetext theText�{ �y�x�
�y 
For_�x 0 fortext forText� �w��
�w 
Usin� {�v�u�t�v 0 matchformat matchFormat�u  
�t SerECmpI� �s��
�s 
Repl� {�r�q�p�r 0 newtext newText�q  
�p 
msng� �o��n
�o 
Retu� {�m�l�k�m 0 resultformat resultFormat�l  
�k RetEMatT�n  � �j�i�h�g�f�e�d�c�b�a�`�j 0 thetext theText�i 0 fortext forText�h 0 matchformat matchFormat�g 0 newtext newText�f 0 resultformat resultFormat�e &0 includenonmatches includeNonMatches�d  0 includematches includeMatches�c 0 etext eText�b 0 enumber eNumber�a 0 efrom eFrom�` 
0 eto eTo� #c�_r�^�]�\�[�Z�Y�X�W�V�U��T�S���R�Q�P�O��N(�M�Lr�K��J�I�_ "0 astextparameter asTextParameter
�^ 
leng
�] 
errn�\�Y
�[ 
erob�Z 
�Y 
msng
�X RetEMatT
�W 
cobj
�V RetEUmaT
�U RetEAllT�T >0 throwinvalidparameterconstant throwInvalidParameterConstant
�S SerECmpI�R 0 	_findtext 	_findText
�Q SerECmpP�P 0 _findpattern _findPattern
�O SerECmpC
�N SerECmpD�M 0 _replacetext _replaceText�L "0 _replacepattern _replacePattern�K 0 etext eText� �H�G�
�H 
errn�G 0 enumber eNumber� �F�E�
�F 
erob�E 0 efrom eFrom� �D�C�B
�D 
errt�C 
0 eto eTo�B  �J �I 
0 _error  �z��b  ��l+ E�Ob  ��l+ E�O��,j  )�����Y hO��  ؤ�  felvE[�k/E�Z[�l/E�ZY E��  eflvE[�k/E�Z[�l/E�ZY )��  eelvE[�k/E�Z[�l/E�ZY b  ��l+ O�a   a a  *�����+ VY V�a   *�����+ Y A�a   a g *�����+ VY $�a   *�����+ Y b  �a l+ Y �b  �a l+ E�O�a   a a  *���m+ VY S�a   *���m+ Y ?�a   a g *���m+ VY #�a   *���m+ Y b  �a l+ W X  *a  ����a !+ "v �A��@�?���>
�A .Txt:EPatnull���     ctxt�@ 0 thetext theText�?  � �=�<�;�:�9�= 0 thetext theText�< 0 etext eText�; 0 enumber eNumber�: 0 efrom eFrom�9 
0 eto eTo� �8�7��6�5�4�3���2�1
�8 misccura�7 *0 nsregularexpression NSRegularExpression�6 "0 astextparameter asTextParameter�5 40 escapedpatternforstring_ escapedPatternForString_
�4 
ctxt�3 0 etext eText� �0�/�
�0 
errn�/ 0 enumber eNumber� �.�-�
�. 
erob�- 0 efrom eFrom� �,�+�*
�, 
errt�+ 
0 eto eTo�*  �2 �1 
0 _error  �> + ��,b  ��l+ k+ �&W X  *衢���+ 
w �)��(�'���&
�) .Txt:ETemnull���     ctxt�( 0 thetext theText�'  � �%�$�#�"�!�% 0 thetext theText�$ 0 etext eText�# 0 enumber eNumber�" 0 efrom eFrom�! 
0 eto eTo� � ����������
�  misccura� *0 nsregularexpression NSRegularExpression� "0 astextparameter asTextParameter� 60 escapedtemplateforstring_ escapedTemplateForString_
� 
ctxt� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �& + ��,b  ��l+ k+ �&W X  *衢���+ 
x �������
� .Txt:UppTnull���     ctxt� 0 thetext theText� ���
� 
Loca� {��
�	� 0 
localecode 
localeCode�
  
�	 
msng�  � �������� 0 thetext theText� 0 
localecode 
localeCode� 0 
asocstring 
asocString� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� �� ����������8�������D����
� misccura�  0 nsstring NSString�� "0 astextparameter asTextParameter�� &0 stringwithstring_ stringWithString_
�� 
msng�� "0 uppercasestring uppercaseString
�� 
ctxt�� &0 aslocaleparameter asLocaleParameter�� 80 uppercasestringwithlocale_ uppercaseStringWithLocale_�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � O >��,b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ 	k+ 
�&W X  *������+ y ��T��������
�� .Txt:CapTnull���     ctxt�� 0 thetext theText�� �����
�� 
Loca� {�������� 0 
localecode 
localeCode��  
�� 
msng��  � ���������������� 0 thetext theText�� 0 
localecode 
localeCode�� 0 
asocstring 
asocString�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ����n�����������������������
�� misccura�� 0 nsstring NSString�� "0 astextparameter asTextParameter�� &0 stringwithstring_ stringWithString_
�� 
msng�� &0 capitalizedstring capitalizedString
�� 
ctxt�� &0 aslocaleparameter asLocaleParameter�� <0 capitalizedstringwithlocale_ capitalizedStringWithLocale_�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� O >��,b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ 	k+ 
�&W X  *������+ z �����������
�� .Txt:LowTnull���     ctxt�� 0 thetext theText�� �����
�� 
Loca� {�������� 0 
localecode 
localeCode��  
�� 
msng��  � ������������ 0 thetext theText�� 0 
localecode 
localeCode�� 0 
asocstring 
asocString� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� ����������������
� misccura� 0 nsstring NSString� "0 astextparameter asTextParameter� &0 stringwithstring_ stringWithString_
� 
msng� "0 lowercasestring lowercaseString
� 
ctxt� &0 aslocaleparameter asLocaleParameter� 80 lowercasestringwithlocale_ lowercaseStringWithLocale_� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� O >��,b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ 	k+ 
�&W X  *������+ { �������
� .Txt:PadTnull���     ctxt� 0 thetext theText� ���
� 
toPl� 0 toplaces toPlaces� ���
� 
Char� {��� 0 padchar padChar�  � ���
� 
From� {���� 0 whichend whichEnd�  
� LeTrLCha�  � 
����������� 0 thetext theText� 0 toplaces toPlaces� 0 padchar padChar� 0 whichend whichEnd� 0 	charcount 	charCount� 0 padtext padText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� "�.��J����V������������ "0 astextparameter asTextParameter� (0 asintegerparameter asIntegerParameter
� 
leng
� 
errn��Y
� 
erob� 
� LeTrLCha
� 
ctxt
� LeTrTCha
� LeTrBCha� >0 throwinvalidparameterconstant throwInvalidParameterConstant� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ��~�
� 
erob�~ 0 efrom eFrom� �}�|�{
�} 
errt�| 
0 eto eTo�{  � � 
0 _error  � � �b  ��l+ E�Ob  ��l+ E�O���,E�O�j �Y hOb  ��l+ E�O��,j  )�����Y hO h��,���%E�[OY��O��  �[�\[Zk\Z�2�%Y a��  ��[�\[Zk\Z�2%Y J��  9�k  ��[�\[Zk\Z�2%Y �[�\[Zk\Z�l"2�%�%[�\[Zk\Z�2EY b  ��l+ W X  *a ����a + | �z��y�x���w
�z .Txt:SliTnull���     ctxt�y 0 thetext theText�x �v��
�v 
FIdx� {�u�t�s�u 0 
startindex 
startIndex�t  
�s 
msng� �r��q
�r 
TIdx� {�p�o�n�p 0 endindex endIndex�o  
�n 
msng�q  � �m�l�k�j�i�h�g�f�m 0 thetext theText�l 0 
startindex 
startIndex�k 0 endindex endIndex�j 0 	thelength 	theLength�i 0 etext eText�h 0 enumber eNumber�g 0 efrom eFrom�f 
0 eto eTo� ��e�d�c��b�a�`�_�^$�]�\2FPb�[��Z���Y�X�e "0 astextparameter asTextParameter
�d 
leng
�c 
msng�b (0 asintegerparameter asIntegerParameter
�a 
errn�`�Y
�_ 
erob�^ 
�] 
ctxt�\�[
�[ 
bool�Z 0 etext eText� �W�V�
�W 
errn�V 0 enumber eNumber� �U�T�
�U 
erob�T 0 efrom eFrom� �S�R�Q
�S 
errt�R 
0 eto eTo�Q  �Y �X 
0 _error  �w�rb  ��l+ E�O��,E�O�� Tb  ��l+ E�O�j  )�����Y hO��  )��' �Y �� �Y �[�\[Z�\Zi2EY hY ��  )��l�Y hO�� Xb  ��l+ E�O�j  )����a Y hO��  +��' 	a Y �� �Y �[�\[Zk\Z�2EY hY hO�j �k�E�Y hO�j �k�E�Y hO�k	 	�ka &
 ��	 	��a &a & 	a Y hO�k kE�Y �� �E�Y hO�k kE�Y �� �E�Y hO�[�\[Z�\Z�2EW X  *a ����a + } �P��O�N���M
�P .Txt:TrmTnull���     ctxt�O 0 thetext theText�N �L��K
�L 
From� {�J�I�H�J 0 whichend whichEnd�I  
�H LeTrBCha�K  � �G�F�E�D�C�B�A�@�G 0 thetext theText�F 0 whichend whichEnd�E 0 
startindex 
startIndex�D 0 endindex endIndex�C 0 etext eText�B 0 enumber eNumber�A 0 efrom eFrom�@ 
0 eto eTo� ��?�>�=�<	�;				!�:�9	G	`�8�7�	v�6�5�? "0 astextparameter asTextParameter
�> LeTrLCha
�= LeTrTCha
�< LeTrBCha�; >0 throwinvalidparameterconstant throwInvalidParameterConstant
�: 
cobj
�9 
cha 
�8 
ctxt�7 0 etext eText� �4�3�
�4 
errn�3 0 enumber eNumber� �2�1�
�2 
erob�1 0 efrom eFrom� �0�/�.
�0 
errt�/ 
0 eto eTo�.  �6 �5 
0 _error  �M � �b  ��l+ E�O���mv�kv b  ��l+ Y hO�� {��  �Y hOkilvE[�k/E�Z[�l/E�ZO��lv�kv  h��/� �kE�[OY��Y hO��lv�kv  h��/� �kE�[OY��Y hO�[�\[Z�\Z�2EVW X  *a ����a + ~ �-	��,�+���*�- 0 
_splittext 
_splitText�, �)��) �  �(�'�( 0 thetext theText�' 0 theseparator theSeparator�+  � �&�%�$�#�"�!�& 0 thetext theText�% 0 theseparator theSeparator�$ 0 delimiterlist delimiterList�# 0 aref aRef�" 0 oldtids oldTIDs�! 0 
resultlist 
resultList� � �������	�	�������  "0 aslistparameter asListParameter
� 
kocl
� 
cobj
� .corecnte****       ****
� 
pcnt
� 
ctxt�  � ���
� 
errn��\�  � � 60 throwinvalidparametertype throwInvalidParameterType
� 
ascr
� 
txdl
� 
citm�* _b  �k+  E�O 5�[��l kh  ��,�&��,FW X  b  �����+ [OY��O��,E�O���,FO��-E�O���,FO� �	������� 0 _splitpattern _splitPattern� ��� �  ��� 0 thetext theText� 0 patterntext patternText�  � 
�
�	���������
 0 thetext theText�	 0 patterntext patternText� 
0 regexp  � 0 
asocstring 
asocString� &0 asocnonmatchstart asocNonMatchStart� 0 
resultlist 
resultList�  0 asocmatcharray asocMatchArray� 0 i  �  0 asocmatchrange asocMatchRange�  0 asocmatchstart asocMatchStart� � ���������������������������  60 _compileregularexpression _compileRegularExpression
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� 
0 length  �� @0 matchesinstring_options_range_ matchesInString_options_range_�� 	0 count  ��  0 objectatindex_ objectAtIndex_�� 0 rangeatindex_ rangeAtIndex_�� 0 location  �� �� *0 substringwithrange_ substringWithRange_
�� 
ctxt�� *0 substringfromindex_ substringFromIndex_� �*�k+  E�O��,�k+ E�OjE�OjvE�O��jj�j+ lvm+ E�O Fj�j+ kkh ��k+ jk+ E�O�j+ 	E�O��䩤�k+ �&�6FO��j+ E�[OY��O��k+ �&�6FO�� ��
{���������� 0 	_jointext 	_joinText�� ����� �  ������ 0 thelist theList�� 0 separatortext separatorText��  � ������������ 0 thelist theList�� 0 separatortext separatorText�� 0 oldtids oldTIDs�� 0 delimiterlist delimiterList�� 0 
resulttext 
resultText� �����������������������
�
�� 
ascr
�� 
txdl�� "0 aslistparameter asListParameter
�� 
ctxt��  � ������
�� 
errn���\��  
�� 
errn���Y
�� 
erob
�� 
errt
�� 
list�� �� ?��,E�O���,FO b  �k+ �&E�W X  ���,FO)�������O���,FO�� ��
���������
�� .Txt:SplTnull���     ctxt�� 0 thetext theText�� ����
�� 
Sepa� {�������� 0 theseparator theSeparator��  
�� 
msng� �����
�� 
Usin� {�������� 0 matchformat matchFormat��  
�� SerECmpI��  � ���������������� 0 thetext theText�� 0 theseparator theSeparator�� 0 matchformat matchFormat�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� 
�����
����� ����%�@���L���� "0 astextparameter asTextParameter
�� 
msng�� 0 _splitpattern _splitPattern
�� SerECmpI�� 0 
_splittext 
_splitText
� SerECmpP
� SerECmpC
� SerECmpD� >0 throwinvalidparameterconstant throwInvalidParameterConstant� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� � �b  ��l+ E�O��  *��l+ Y g��  �� *��l+ VY P��  *�b  ��l+ l+ Y 5��  �g *��l+ VY ��  *��l+ Y b  ��l+ W X  *a ����a + � �\�����
� .Txt:JoiTnull���     ****� 0 thelist theList� ���
� 
Sepa� {��b� 0 separatortext separatorText�  �  � ������� 0 thelist theList� 0 separatortext separatorText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� r����~��� "0 astextparameter asTextParameter� 0 	_jointext 	_joinText� 0 etext eText� ���
� 
errn� 0 enumber eNumber� �� 
� 
erob� 0 efrom eFrom  ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � ( *�b  ��l+ l+ W X  *墣���+ � �����
� .Txt:SplPnull���     ctxt� 0 thetext theText�   ������ 0 thetext theText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo �������� "0 astextparameter asTextParameter
� 
cpar� 0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � % b  ��l+ �-EW X  *塢���+ � �����
� .Txt:JoiPnull���     ****� 0 thelist theList� �~�}
�~ 
LiBr {�|�{�z�| 0 linebreaktype lineBreakType�{  
�z LiBrLiOX�}   �y�x�w�v�u�t�s�y 0 thelist theList�x 0 linebreaktype lineBreakType�w 0 separatortext separatorText�v 0 etext eText�u 0 enumber eNumber�t 0 efrom eFrom�s 
0 eto eTo �r�q�p�o�n��m�l�k	��j�i
�r LiBrLiOX
�q 
lnfd
�p LiBrLiCM
�o 
ret 
�n LiBrLiWi�m >0 throwinvalidparameterconstant throwInvalidParameterConstant�l 0 	_jointext 	_joinText�k 0 etext eText	 �h�g

�h 
errn�g 0 enumber eNumber
 �f�e
�f 
erob�e 0 efrom eFrom �d�c�b
�d 
errt�c 
0 eto eTo�b  �j �i 
0 _error  � P ?��  �E�Y '��  �E�Y ��  
��%E�Y b  ��l+ O*��l+ W X  	*꣤���+ � �a�`�_�^�a (0 _makevalueiterator _makeValueIterator�` �]�]   �\�\ 0 
objectlist 
objectList�_   �[�Z�[ 0 
objectlist 
objectList�Z 0 scpt   �Y�Y 0 scpt   �X�W�V�U
�X .ascrinit****      � **** k        !�T�T  �W  �V   �S�R�Q�S 0 _objects  �R 0 i  
�Q .aevtoappnull  �   � **** �P�O�N
�P 
list�O 0 _objects  �N 0 i   �M#�L�K�J
�M .aevtoappnull  �   � ****�L  �K     �I�H�G�F
�I 
leng
�H 
errn�G�
�F 
cobj�J 8b  kEc  Ob  b   �, )��lhY hOb   �b  /E�U b   �&�Oj�OL �^ ��K S�� �EJ�D�C�B
�E .Txt:FLitnull��� ��� null�D  �C �A�@�?
�A 
For_�@ 0 thevalue theValue�?   �>�=�<�;�:�9�8�7�6�5�4�> 0 thevalue theValue�= 0 oldtids oldTIDs�< 0 	textitems 	textItems�;  0 asocdescriptor asocDescriptor�: 0 hextext hexText�9 "0 descriptiontext descriptionText�8 0 scpt  �7 0 etext eText�6 0 enumber eNumber�5 0 efrom eFrom�4 
0 eto eTo AUV�3�2�1�0�/�.�-��,��+�*��)�(�'�&��%������$�#�"�!� ������I�_gi��������������������
�3 
kocl
�2 
obj 
�1 .corecnte****       ****
�0 
capp
�/ 
bool
�. 
reco
�- 
scpt
�, 
pnam�+  �*  
�) 
pcls
�( 
ctxt
�' 
ascr
�& 
txdl
�% 
citm
�$ 
optr
�# misccura�" 0 nsarray NSArray�! $0 arraywithobject_ arrayWithObject_�   0 objectatindex_ objectAtIndex_� 0 nsstring NSString� 0 data  � 0 description  � "0 uppercasestring uppercaseString� &0 stringwithstring_ stringWithString_
� 
spac��� �
�	�
�
 
errn�	�\�  
� 
want
� 
ocid
� 
For_
� 
seld
� .Txt:FLitnull��� ��� null� (0 _makevalueiterator _makeValueIterator
� kfrmID  
� 
Scpt
� 
Deco� 
� .Txt:LitR****      � ****� 0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �Bb��^G�kv��l j 	 �kv��l j �&	 �kv��l j �&\�kv��l j  ��,%�%W 	X  �Y3��,a   s_ a ,E�Oa _ a ,FO�a -E�Oa _ a ,FO�a &E�Oa _ a ,FO�a -E�Oa _ a ,FO�a &E�O�_ a ,FOa �%a %Y ���,a   � �a a ,�k+ jk+ E�Oa a ,�j+  j+ !j+ "k+ #a &E�O_ a ,E�O_ $_ a ,FO�a -E�Oa %_ a ,FO�a &[a \[Zl\Za &2E�O�_ a ,FW X  a 'E�Oa (�%a )%Y  �a &W X  *hY hO�kv��l j	 ��&a +,a , �& b C�j+ !a &E�O�a -	 	�a .�& �[a \[Zl\Za &2E�Y hOa /�%a 0%W X  a 1*a 2��&a 3,l 4%Y hO .*�kvk+ 5E�O*�b  a 60 *a 7�a 8fa 9 :UW X  a ;W X < =*a >����a ?+ @V� � ���� ��
�  .Txt:FTxtnull���     ctxt�� 0 templatetext templateText�� ������
�� 
Usin�� 0 	thevalues 	theValues��   ������������������������������������ 0 templatetext templateText�� 0 	thevalues 	theValues�� 
0 regexp  �� 0 
asocstring 
asocString��  0 asocmatcharray asocMatchArray�� 0 resulttexts resultTexts�� 0 
startindex 
startIndex�� 0 i  �� 0 
matchrange 
matchRange�� 0 thetoken theToken�� 0 theitem theItem�� 0 oldtids oldTIDs�� 0 
resulttext 
resultText�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo  $������7������������fg�����������������������!������������"%������ "0 aslistparameter asListParameter
�� misccura�� *0 nsregularexpression NSRegularExpression
�� 
msng�� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� 
0 length  �� @0 matchesinstring_options_range_ matchesInString_options_range_�� 	0 count  ��  0 objectatindex_ objectAtIndex_�� 0 rangeatindex_ rangeAtIndex_�� 0 location  �� �� *0 substringwithrange_ substringWithRange_
�� 
ctxt
�� 
cobj
�� 
cha 
�� 
long��  ! ������
�� 
errn���\��  
�� 
For_
�� .Txt:FLitnull��� ��� null�� *0 substringfromindex_ substringFromIndex_
�� 
ascr
�� 
txdl�� 0 etext eText" ����#
�� 
errn�� 0 enumber eNumber# ����$
�� 
erob�� 0 efrom eFrom$ ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ��4b  �k+  E�O��,�j�m+ E�O��,�k+ E�O��jj�j+ lvm+ 	E�OjvE�OjE�O�� � �j�j+ kkh ��k+ jk+ E�O���j+ �a k+ a &�6FO��k+ a &E�O�a   	��6FY 3�a �a i/a &/E�O �a &�6FW X  *a �l �6FO�j+ �j+ E�[OY�vO��k+ a &�6FO_ a ,E�Oa _ a ,FO�a &E�O�_ a ,FO�VW X   *a !���] a "+ #� ��C����%&�
�� .Txt:LLocnull��� ��� null��  ��  %  & ���O��
� misccura� 0 nslocale NSLocale� 80 availablelocaleidentifiers availableLocaleIdentifiers� 60 sortedarrayusingselector_ sortedArrayUsingSelector_
� 
list� ��,j+ �k+ �&� �[��'(�
� .Txt:CLocnull��� ��� null�  �  '  ( �����
� misccura� 0 nslocale NSLocale� 0 currentlocale currentLocale� $0 localeidentifier localeIdentifier
� 
ctxt� ��,j+ j+ �& ascr  ��ޭ