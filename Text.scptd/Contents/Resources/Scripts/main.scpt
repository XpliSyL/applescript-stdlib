FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� Text -- commonly-used text processing commands

Notes: 

- When matching text item delimiters in text value, AppleScript uses the current scope's existing considering/ignoring case, diacriticals, hyphens, punctuation, white space and numeric strings settings; thus, wrapping a `search text` command in different considering/ignoring blocks can produce different results. For example, `search text "fud" for "F" will normally match the first character since AppleScript uses case-insensitive matching by default, whereas enclosing it in a `considering case` block will cause the same command to return zero matches. Conversely, `search text "f ud" for "fu"` will normally return zero matches as AppleScript considers white space by default, but when enclosed in an `ignoring white space` block will match the first three characters: "f u". This is how AppleScript is designed to work, but users need to be reminded of this as considering/ignoring blocks affect ALL script handlers called within that block, including nested calls (and all to any osax and application handlers that understand considering/ignoring attributes).

- Unlike AS text values, NSString and NSRegularExpression don't ignore normalization differences when comparing for equality, so `search text`, `split text`, etc. must normalize input and pattern text; this means that result text may have different normalization to input.


TO DO:

- decide if predefined considering/ignoring options in `search text`, etc. should consider or ignore diacriticals and numeric strings; once decided, use same combinations for List library's text comparator for consistency? (currently Text library's `case [in]sensitivity` options consider diacriticals for equality whereas List library ignores them for ordering)


- what about `normalize text` command that wraps NSString's stringByFoldingWithOptions:locale:? (e.g. for removing diacriticals); also incorporate unicode normalization into this rather than having separate precompose/decompose commands; also merge the `normalize line breaks` command's functionality in it. 

	Notes:

	- one could argue unicode normalization is just out of scope for stdlib as AS itself does the sensible thing when dealing with composed vs decomposed glyphs, treating them as logically equal. The problem is when AS interfaces with other systems that aren't (including shell and NSString), at which point AS code should normalize text before handing it off to ensure consistent behavior.

	- AS preserves composed vs decomposed unicode chars as-is (getting `id` produces different results) but is smart enough to compare them as equal; however, it doesn't normalize when reading/writing or crossing ASOC bridge so written files will vary and NSString (which is old-school UTF16) compares them as not-equal, so any operations involving NSString's `isEqual[ToString]:` will need to normalize both strings first to ensure consistent behavior using one of the following NSString methods:
	
		decomposedStringWithCanonicalMapping (Unicode Normalization Form D)
		decomposedStringWithCompatibilityMapping (Unicode Normalization Form KD)
		precomposedStringWithCanonicalMapping (Unicode Normalization Form C)
		precomposedStringWithCompatibilityMapping (Unicode Normalization Form KC)

 	- note that Satimage.osax provides a `normalize unicode` command, although it only covers 2 of 4 forms


- should `format text` support "\\n", "\\t", etc.? how should backslashed characters that are non-special be treated? (note that the template syntax is designed to be same as that used by `search text`, which uses NSRegularExpression's template syntax); need to give some thought to this, and whether a different escape character should be used throughout to avoid need for double backslashing (since AS already uses backslash as escape character in text literals), which is hard to read and error prone (downside is portability, as backslash escaping is already standard in regexps)


- fix inconsistency: `search text`'s `for` parameter doesn't allow list of text but `split text`'s `using` parameter does, even though both commands are supposed to support same matching options for consistency

- should regexps use NSRegularExpressionAnchorsMatchLines flag as standard (i.e. "^" and "$" would always match per-line, and "\A" and "\Z" would be used to match start and end of text)? given that users will frequently need to include "(?i)" flag to match case-insensitively, it may be as well to leave them to include `m` flag as well

     � 	 	#H   T e x t   - -   c o m m o n l y - u s e d   t e x t   p r o c e s s i n g   c o m m a n d s 
 
 N o t e s :   
 
 -   W h e n   m a t c h i n g   t e x t   i t e m   d e l i m i t e r s   i n   t e x t   v a l u e ,   A p p l e S c r i p t   u s e s   t h e   c u r r e n t   s c o p e ' s   e x i s t i n g   c o n s i d e r i n g / i g n o r i n g   c a s e ,   d i a c r i t i c a l s ,   h y p h e n s ,   p u n c t u a t i o n ,   w h i t e   s p a c e   a n d   n u m e r i c   s t r i n g s   s e t t i n g s ;   t h u s ,   w r a p p i n g   a   ` s e a r c h   t e x t `   c o m m a n d   i n   d i f f e r e n t   c o n s i d e r i n g / i g n o r i n g   b l o c k s   c a n   p r o d u c e   d i f f e r e n t   r e s u l t s .   F o r   e x a m p l e ,   ` s e a r c h   t e x t   " f u d "   f o r   " F "   w i l l   n o r m a l l y   m a t c h   t h e   f i r s t   c h a r a c t e r   s i n c e   A p p l e S c r i p t   u s e s   c a s e - i n s e n s i t i v e   m a t c h i n g   b y   d e f a u l t ,   w h e r e a s   e n c l o s i n g   i t   i n   a   ` c o n s i d e r i n g   c a s e `   b l o c k   w i l l   c a u s e   t h e   s a m e   c o m m a n d   t o   r e t u r n   z e r o   m a t c h e s .   C o n v e r s e l y ,   ` s e a r c h   t e x t   " f   u d "   f o r   " f u " `   w i l l   n o r m a l l y   r e t u r n   z e r o   m a t c h e s   a s   A p p l e S c r i p t   c o n s i d e r s   w h i t e   s p a c e   b y   d e f a u l t ,   b u t   w h e n   e n c l o s e d   i n   a n   ` i g n o r i n g   w h i t e   s p a c e `   b l o c k   w i l l   m a t c h   t h e   f i r s t   t h r e e   c h a r a c t e r s :   " f   u " .   T h i s   i s   h o w   A p p l e S c r i p t   i s   d e s i g n e d   t o   w o r k ,   b u t   u s e r s   n e e d   t o   b e   r e m i n d e d   o f   t h i s   a s   c o n s i d e r i n g / i g n o r i n g   b l o c k s   a f f e c t   A L L   s c r i p t   h a n d l e r s   c a l l e d   w i t h i n   t h a t   b l o c k ,   i n c l u d i n g   n e s t e d   c a l l s   ( a n d   a l l   t o   a n y   o s a x   a n d   a p p l i c a t i o n   h a n d l e r s   t h a t   u n d e r s t a n d   c o n s i d e r i n g / i g n o r i n g   a t t r i b u t e s ) . 
 
 -   U n l i k e   A S   t e x t   v a l u e s ,   N S S t r i n g   a n d   N S R e g u l a r E x p r e s s i o n   d o n ' t   i g n o r e   n o r m a l i z a t i o n   d i f f e r e n c e s   w h e n   c o m p a r i n g   f o r   e q u a l i t y ,   s o   ` s e a r c h   t e x t ` ,   ` s p l i t   t e x t ` ,   e t c .   m u s t   n o r m a l i z e   i n p u t   a n d   p a t t e r n   t e x t ;   t h i s   m e a n s   t h a t   r e s u l t   t e x t   m a y   h a v e   d i f f e r e n t   n o r m a l i z a t i o n   t o   i n p u t . 
 
 
 T O   D O : 
 
 -   d e c i d e   i f   p r e d e f i n e d   c o n s i d e r i n g / i g n o r i n g   o p t i o n s   i n   ` s e a r c h   t e x t ` ,   e t c .   s h o u l d   c o n s i d e r   o r   i g n o r e   d i a c r i t i c a l s   a n d   n u m e r i c   s t r i n g s ;   o n c e   d e c i d e d ,   u s e   s a m e   c o m b i n a t i o n s   f o r   L i s t   l i b r a r y ' s   t e x t   c o m p a r a t o r   f o r   c o n s i s t e n c y ?   ( c u r r e n t l y   T e x t   l i b r a r y ' s   ` c a s e   [ i n ] s e n s i t i v i t y `   o p t i o n s   c o n s i d e r   d i a c r i t i c a l s   f o r   e q u a l i t y   w h e r e a s   L i s t   l i b r a r y   i g n o r e s   t h e m   f o r   o r d e r i n g ) 
 
 
 -   w h a t   a b o u t   ` n o r m a l i z e   t e x t `   c o m m a n d   t h a t   w r a p s   N S S t r i n g ' s   s t r i n g B y F o l d i n g W i t h O p t i o n s : l o c a l e : ?   ( e . g .   f o r   r e m o v i n g   d i a c r i t i c a l s ) ;   a l s o   i n c o r p o r a t e   u n i c o d e   n o r m a l i z a t i o n   i n t o   t h i s   r a t h e r   t h a n   h a v i n g   s e p a r a t e   p r e c o m p o s e / d e c o m p o s e   c o m m a n d s ;   a l s o   m e r g e   t h e   ` n o r m a l i z e   l i n e   b r e a k s `   c o m m a n d ' s   f u n c t i o n a l i t y   i n   i t .   
 
 	 N o t e s : 
 
 	 -   o n e   c o u l d   a r g u e   u n i c o d e   n o r m a l i z a t i o n   i s   j u s t   o u t   o f   s c o p e   f o r   s t d l i b   a s   A S   i t s e l f   d o e s   t h e   s e n s i b l e   t h i n g   w h e n   d e a l i n g   w i t h   c o m p o s e d   v s   d e c o m p o s e d   g l y p h s ,   t r e a t i n g   t h e m   a s   l o g i c a l l y   e q u a l .   T h e   p r o b l e m   i s   w h e n   A S   i n t e r f a c e s   w i t h   o t h e r   s y s t e m s   t h a t   a r e n ' t   ( i n c l u d i n g   s h e l l   a n d   N S S t r i n g ) ,   a t   w h i c h   p o i n t   A S   c o d e   s h o u l d   n o r m a l i z e   t e x t   b e f o r e   h a n d i n g   i t   o f f   t o   e n s u r e   c o n s i s t e n t   b e h a v i o r . 
 
 	 -   A S   p r e s e r v e s   c o m p o s e d   v s   d e c o m p o s e d   u n i c o d e   c h a r s   a s - i s   ( g e t t i n g   ` i d `   p r o d u c e s   d i f f e r e n t   r e s u l t s )   b u t   i s   s m a r t   e n o u g h   t o   c o m p a r e   t h e m   a s   e q u a l ;   h o w e v e r ,   i t   d o e s n ' t   n o r m a l i z e   w h e n   r e a d i n g / w r i t i n g   o r   c r o s s i n g   A S O C   b r i d g e   s o   w r i t t e n   f i l e s   w i l l   v a r y   a n d   N S S t r i n g   ( w h i c h   i s   o l d - s c h o o l   U T F 1 6 )   c o m p a r e s   t h e m   a s   n o t - e q u a l ,   s o   a n y   o p e r a t i o n s   i n v o l v i n g   N S S t r i n g ' s   ` i s E q u a l [ T o S t r i n g ] : `   w i l l   n e e d   t o   n o r m a l i z e   b o t h   s t r i n g s   f i r s t   t o   e n s u r e   c o n s i s t e n t   b e h a v i o r   u s i n g   o n e   o f   t h e   f o l l o w i n g   N S S t r i n g   m e t h o d s : 
 	 
 	 	 d e c o m p o s e d S t r i n g W i t h C a n o n i c a l M a p p i n g   ( U n i c o d e   N o r m a l i z a t i o n   F o r m   D ) 
 	 	 d e c o m p o s e d S t r i n g W i t h C o m p a t i b i l i t y M a p p i n g   ( U n i c o d e   N o r m a l i z a t i o n   F o r m   K D ) 
 	 	 p r e c o m p o s e d S t r i n g W i t h C a n o n i c a l M a p p i n g   ( U n i c o d e   N o r m a l i z a t i o n   F o r m   C ) 
 	 	 p r e c o m p o s e d S t r i n g W i t h C o m p a t i b i l i t y M a p p i n g   ( U n i c o d e   N o r m a l i z a t i o n   F o r m   K C ) 
 
   	 -   n o t e   t h a t   S a t i m a g e . o s a x   p r o v i d e s   a   ` n o r m a l i z e   u n i c o d e `   c o m m a n d ,   a l t h o u g h   i t   o n l y   c o v e r s   2   o f   4   f o r m s 
 
 
 -   s h o u l d   ` f o r m a t   t e x t `   s u p p o r t   " \ \ n " ,   " \ \ t " ,   e t c . ?   h o w   s h o u l d   b a c k s l a s h e d   c h a r a c t e r s   t h a t   a r e   n o n - s p e c i a l   b e   t r e a t e d ?   ( n o t e   t h a t   t h e   t e m p l a t e   s y n t a x   i s   d e s i g n e d   t o   b e   s a m e   a s   t h a t   u s e d   b y   ` s e a r c h   t e x t ` ,   w h i c h   u s e s   N S R e g u l a r E x p r e s s i o n ' s   t e m p l a t e   s y n t a x ) ;   n e e d   t o   g i v e   s o m e   t h o u g h t   t o   t h i s ,   a n d   w h e t h e r   a   d i f f e r e n t   e s c a p e   c h a r a c t e r   s h o u l d   b e   u s e d   t h r o u g h o u t   t o   a v o i d   n e e d   f o r   d o u b l e   b a c k s l a s h i n g   ( s i n c e   A S   a l r e a d y   u s e s   b a c k s l a s h   a s   e s c a p e   c h a r a c t e r   i n   t e x t   l i t e r a l s ) ,   w h i c h   i s   h a r d   t o   r e a d   a n d   e r r o r   p r o n e   ( d o w n s i d e   i s   p o r t a b i l i t y ,   a s   b a c k s l a s h   e s c a p i n g   i s   a l r e a d y   s t a n d a r d   i n   r e g e x p s ) 
 
 
 -   f i x   i n c o n s i s t e n c y :   ` s e a r c h   t e x t ` ' s   ` f o r `   p a r a m e t e r   d o e s n ' t   a l l o w   l i s t   o f   t e x t   b u t   ` s p l i t   t e x t ` ' s   ` u s i n g `   p a r a m e t e r   d o e s ,   e v e n   t h o u g h   b o t h   c o m m a n d s   a r e   s u p p o s e d   t o   s u p p o r t   s a m e   m a t c h i n g   o p t i o n s   f o r   c o n s i s t e n c y 
 
 -   s h o u l d   r e g e x p s   u s e   N S R e g u l a r E x p r e s s i o n A n c h o r s M a t c h L i n e s   f l a g   a s   s t a n d a r d   ( i . e .   " ^ "   a n d   " $ "   w o u l d   a l w a y s   m a t c h   p e r - l i n e ,   a n d   " \ A "   a n d   " \ Z "   w o u l d   b e   u s e d   t o   m a t c h   s t a r t   a n d   e n d   o f   t e x t ) ?   g i v e n   t h a t   u s e r s   w i l l   f r e q u e n t l y   n e e d   t o   i n c l u d e   " ( ? i ) "   f l a g   t o   m a t c h   c a s e - i n s e n s i t i v e l y ,   i t   m a y   b e   a s   w e l l   t o   l e a v e   t h e m   t o   i n c l u d e   ` m `   f l a g   a s   w e l l 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      record types     �      r e c o r d   t y p e s     !   l     ��������  ��  ��   !  " # " j    �� $�� (0 _unmatchedtexttype _UnmatchedTextType $ m    ��
�� 
TxtU #  % & % j    �� '�� $0 _matchedtexttype _MatchedTextType ' m    ��
�� 
TxtM &  ( ) ( j    �� *�� &0 _matchedgrouptype _MatchedGroupType * m    ��
�� 
TxtG )  + , + l     ��������  ��  ��   ,  - . - l     ��������  ��  ��   .  / 0 / l     �� 1 2��   1 J D--------------------------------------------------------------------    2 � 3 3 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 0  4 5 4 l     �� 6 7��   6   support    7 � 8 8    s u p p o r t 5  9 : 9 l     ��������  ��  ��   :  ; < ; l      = > ? = j    �� @�� 0 _support   @ N     A A 4    �� B
�� 
scpt B m     C C � D D  T y p e S u p p o r t > "  used for parameter checking    ? � E E 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g <  F G F l     ��������  ��  ��   G  H I H l     ��������  ��  ��   I  J K J i    L M L I      �� N���� 
0 _error   N  O P O o      ���� 0 handlername handlerName P  Q R Q o      ���� 0 etext eText R  S T S o      ���� 0 enumber eNumber T  U V U o      ���� 0 efrom eFrom V  W�� W o      ���� 
0 eto eTo��  ��   M n     X Y X I    �� Z���� &0 throwcommanderror throwCommandError Z  [ \ [ m     ] ] � ^ ^  T e x t \  _ ` _ o    ���� 0 handlername handlerName `  a b a o    ���� 0 etext eText b  c d c o    	���� 0 enumber eNumber d  e f e o   	 
���� 0 efrom eFrom f  g�� g o   
 ���� 
0 eto eTo��  ��   Y o     ���� 0 _support   K  h i h l     ��������  ��  ��   i  j k j l     �� l m��   l J D--------------------------------------------------------------------    m � n n � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - k  o p o l     �� q r��   q   Find and Replace Suite    r � s s .   F i n d   a n d   R e p l a c e   S u i t e p  t u t l     ��������  ��  ��   u  v w v l     �� x y��   x   find pattern    y � z z    f i n d   p a t t e r n w  { | { l     ��������  ��  ��   |  } ~ } i   "  �  I      �� ����� $0 _matchinforecord _matchInfoRecord �  � � � o      ���� 0 
asocstring 
asocString �  � � � o      ����  0 asocmatchrange asocMatchRange �  � � � o      ���� 0 
textoffset 
textOffset �  ��� � o      ���� 0 
recordtype 
recordType��  ��   � k     # � �  � � � r     
 � � � c      � � � l     ����� � n     � � � I    �� ����� *0 substringwithrange_ substringWithRange_ �  ��� � o    ����  0 asocmatchrange asocMatchRange��  ��   � o     ���� 0 
asocstring 
asocString��  ��   � m    ��
�� 
ctxt � o      ���� 0 	foundtext 	foundText �  � � � l    � � � � r     � � � [     � � � o    ���� 0 
textoffset 
textOffset � l    ����� � n     � � � 1    ��
�� 
leng � o    ���� 0 	foundtext 	foundText��  ��   � o      ����  0 nexttextoffset nextTextOffset � : 4 calculate the start index of the next AS text range    � � � � h   c a l c u l a t e   t h e   s t a r t   i n d e x   o f   t h e   n e x t   A S   t e x t   r a n g e �  � � � l   �� � ���   �
 note: record keys are identifiers, not keywords, as 1. library-defined keywords are a huge pain to use outside of `tell script...` blocks and 2. importing the library's terminology into the global namespace via `use script...` is an excellent way to create keyword conflicts; only the class value is a keyword since Script Editor/OSAKit don't correctly handle records that use non-typename values (e.g. `{class:"matched text",...}`), but this shouldn't impact usability as it's really only used for informational purposes    � � � �   n o t e :   r e c o r d   k e y s   a r e   i d e n t i f i e r s ,   n o t   k e y w o r d s ,   a s   1 .   l i b r a r y - d e f i n e d   k e y w o r d s   a r e   a   h u g e   p a i n   t o   u s e   o u t s i d e   o f   ` t e l l   s c r i p t . . . `   b l o c k s   a n d   2 .   i m p o r t i n g   t h e   l i b r a r y ' s   t e r m i n o l o g y   i n t o   t h e   g l o b a l   n a m e s p a c e   v i a   ` u s e   s c r i p t . . . `   i s   a n   e x c e l l e n t   w a y   t o   c r e a t e   k e y w o r d   c o n f l i c t s ;   o n l y   t h e   c l a s s   v a l u e   i s   a   k e y w o r d   s i n c e   S c r i p t   E d i t o r / O S A K i t   d o n ' t   c o r r e c t l y   h a n d l e   r e c o r d s   t h a t   u s e   n o n - t y p e n a m e   v a l u e s   ( e . g .   ` { c l a s s : " m a t c h e d   t e x t " , . . . } ` ) ,   b u t   t h i s   s h o u l d n ' t   i m p a c t   u s a b i l i t y   a s   i t ' s   r e a l l y   o n l y   u s e d   f o r   i n f o r m a t i o n a l   p u r p o s e s �  ��� � L    # � � J    " � �  � � � K     � � �� � �
�� 
pcls � o    ���� 0 
recordtype 
recordType � �� � ��� 0 
startindex 
startIndex � o    ���� 0 
textoffset 
textOffset � �� � ��� 0 endindex endIndex � \     � � � o    ����  0 nexttextoffset nextTextOffset � m    ����  � �� ����� 0 	foundtext 	foundText � o    ���� 0 	foundtext 	foundText��   �  ��� � o     ����  0 nexttextoffset nextTextOffset��  ��   ~  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  # & � � � I      �� ����� 0 _matchrecords _matchRecords �  � � � o      ���� 0 
asocstring 
asocString �  � � � o      ����  0 asocmatchrange asocMatchRange �  � � � o      ����  0 asocstartindex asocStartIndex �  � � � o      ���� 0 
textoffset 
textOffset �  � � � o      ���� (0 nonmatchrecordtype nonMatchRecordType �  ��� � o      ���� "0 matchrecordtype matchRecordType��  ��   � k     V � �  � � � l     �� � ���   �TN important: NSString character indexes aren't guaranteed to be same as AS character indexes (AS sensibly counts glyphs but NSString only counts UTF16 codepoints, and a glyph may be composed of more than one codepoint), so reconstruct both non-matching and matching AS text values, and calculate accurate AS character ranges from those    � � � ��   i m p o r t a n t :   N S S t r i n g   c h a r a c t e r   i n d e x e s   a r e n ' t   g u a r a n t e e d   t o   b e   s a m e   a s   A S   c h a r a c t e r   i n d e x e s   ( A S   s e n s i b l y   c o u n t s   g l y p h s   b u t   N S S t r i n g   o n l y   c o u n t s   U T F 1 6   c o d e p o i n t s ,   a n d   a   g l y p h   m a y   b e   c o m p o s e d   o f   m o r e   t h a n   o n e   c o d e p o i n t ) ,   s o   r e c o n s t r u c t   b o t h   n o n - m a t c h i n g   a n d   m a t c h i n g   A S   t e x t   v a l u e s ,   a n d   c a l c u l a t e   a c c u r a t e   A S   c h a r a c t e r   r a n g e s   f r o m   t h o s e �  � � � r      � � � n     � � � I    �������� 0 location  ��  ��   � o     ��  0 asocmatchrange asocMatchRange � o      �~�~  0 asocmatchstart asocMatchStart �  � � � r     � � � [     � � � o    	�}�}  0 asocmatchstart asocMatchStart � l  	  ��|�{ � n  	  � � � I   
 �z�y�x�z 
0 length  �y  �x   � o   	 
�w�w  0 asocmatchrange asocMatchRange�|  �{   � o      �v�v 0 asocmatchend asocMatchEnd �  � � � r     � � � K     � � �u � ��u 0 location   � o    �t�t  0 asocstartindex asocStartIndex � �s ��r�s 
0 length   � \     � � � o    �q�q  0 asocmatchstart asocMatchStart � o    �p�p  0 asocstartindex asocStartIndex�r   � o      �o�o &0 asocnonmatchrange asocNonMatchRange �  � � � r    5 � � � I      �n ��m�n $0 _matchinforecord _matchInfoRecord �  � � � o    �l�l 0 
asocstring 
asocString �  � � � o     �k�k &0 asocnonmatchrange asocNonMatchRange �  � � � o     !�j�j 0 
textoffset 
textOffset �  ��i � o   ! "�h�h (0 nonmatchrecordtype nonMatchRecordType�i  �m   � J       � �  � � � o      �g�g 0 nonmatchinfo nonMatchInfo �  ��f � o      �e�e 0 
textoffset 
textOffset�f   �  � � � r   6 N � � � I      �d ��c�d $0 _matchinforecord _matchInfoRecord �  �  � o   7 8�b�b 0 
asocstring 
asocString   o   8 9�a�a  0 asocmatchrange asocMatchRange  o   9 :�`�` 0 
textoffset 
textOffset �_ o   : ;�^�^ "0 matchrecordtype matchRecordType�_  �c   � J        o      �]�] 0 	matchinfo 	matchInfo 	�\	 o      �[�[ 0 
textoffset 
textOffset�\   � 
�Z
 L   O V J   O U  o   O P�Y�Y 0 nonmatchinfo nonMatchInfo  o   P Q�X�X 0 	matchinfo 	matchInfo  o   Q R�W�W 0 asocmatchend asocMatchEnd �V o   R S�U�U 0 
textoffset 
textOffset�V  �Z   �  l     �T�S�R�T  �S  �R    l     �Q�P�O�Q  �P  �O    i  ' * I      �N�M�N &0 _matchedgrouplist _matchedGroupList  o      �L�L 0 
asocstring 
asocString   o      �K�K 0 	asocmatch 	asocMatch  !"! o      �J�J 0 
textoffset 
textOffset" #�I# o      �H�H &0 includenonmatches includeNonMatches�I  �M   k     �$$ %&% r     '(' J     �G�G  ( o      �F�F "0 submatchresults subMatchResults& )*) r    +,+ \    -.- l   
/�E�D/ n   
010 I    
�C�B�A�C  0 numberofranges numberOfRanges�B  �A  1 o    �@�@ 0 	asocmatch 	asocMatch�E  �D  . m   
 �?�? , o      �>�> 0 groupindexes groupIndexes* 232 Z    �45�=�<4 ?    676 o    �;�; 0 groupindexes groupIndexes7 m    �:�:  5 k    �88 9:9 r    ;<; n   =>= I    �9?�8�9 0 rangeatindex_ rangeAtIndex_? @�7@ m    �6�6  �7  �8  > o    �5�5 0 	asocmatch 	asocMatch< o      �4�4 (0 asocfullmatchrange asocFullMatchRange: ABA r    %CDC n   #EFE I    #�3�2�1�3 0 location  �2  �1  F o    �0�0 (0 asocfullmatchrange asocFullMatchRangeD o      �/�/ &0 asocnonmatchstart asocNonMatchStartB GHG r   & /IJI [   & -KLK o   & '�.�. &0 asocnonmatchstart asocNonMatchStartL l  ' ,M�-�,M n  ' ,NON I   ( ,�+�*�)�+ 
0 length  �*  �)  O o   ' (�(�( (0 asocfullmatchrange asocFullMatchRange�-  �,  J o      �'�' $0 asocfullmatchend asocFullMatchEndH PQP Y   0 �R�&ST�%R k   : �UU VWV r   : oXYX I      �$Z�#�$ 0 _matchrecords _matchRecordsZ [\[ o   ; <�"�" 0 
asocstring 
asocString\ ]^] n  < B_`_ I   = B�!a� �! 0 rangeatindex_ rangeAtIndex_a b�b o   = >�� 0 i  �  �   ` o   < =�� 0 	asocmatch 	asocMatch^ cdc o   B C�� &0 asocnonmatchstart asocNonMatchStartd efe o   C D�� 0 
textoffset 
textOffsetf ghg o   D I�� (0 _unmatchedtexttype _UnmatchedTextTypeh i�i o   I N�� &0 _matchedgrouptype _MatchedGroupType�  �#  Y J      jj klk o      �� 0 nonmatchinfo nonMatchInfol mnm o      �� 0 	matchinfo 	matchInfon opo o      �� &0 asocnonmatchstart asocNonMatchStartp q�q o      �� 0 
textoffset 
textOffset�  W rsr Z  p |tu��t o   p q�� &0 includenonmatches includeNonMatchesu r   t xvwv o   t u�� 0 nonmatchinfo nonMatchInfow n      xyx  ;   v wy o   u v�� "0 submatchresults subMatchResults�  �  s z�z r   } �{|{ o   } ~�� 0 	matchinfo 	matchInfo| n      }~}  ;    �~ o   ~ �� "0 submatchresults subMatchResults�  �& 0 i  S m   3 4�
�
 T o   4 5�	�	 0 groupindexes groupIndexes�%  Q � Z   � ������ o   � ��� &0 includenonmatches includeNonMatches� k   � ��� ��� r   � ���� K   � ��� ���� 0 location  � o   � ��� &0 asocnonmatchstart asocNonMatchStart� ���� 
0 length  � \   � ���� o   � �� �  $0 asocfullmatchend asocFullMatchEnd� o   � ����� &0 asocnonmatchstart asocNonMatchStart�  � o      ���� &0 asocnonmatchrange asocNonMatchRange� ���� r   � ���� n   � ���� 4   � ����
�� 
cobj� m   � ����� � I   � �������� $0 _matchinforecord _matchInfoRecord� ��� o   � ����� 0 
asocstring 
asocString� ��� o   � ����� &0 asocnonmatchrange asocNonMatchRange� ��� o   � ����� 0 
textoffset 
textOffset� ���� o   � ����� (0 _unmatchedtexttype _UnmatchedTextType��  ��  � n      ���  ;   � �� o   � ����� "0 submatchresults subMatchResults��  �  �  �  �=  �<  3 ���� L   � ��� o   � ����� "0 submatchresults subMatchResults��   ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  + .��� I      ������� 0 _findpattern _findPattern� ��� o      ���� 0 thetext theText� ��� o      ���� 0 patterntext patternText� ��� o      ���� &0 includenonmatches includeNonMatches� ���� o      ����  0 includematches includeMatches��  ��  � k    �� ��� r     ��� n    ��� I    ������� (0 asbooleanparameter asBooleanParameter� ��� o    ���� &0 includenonmatches includeNonMatches� ���� m    �� ���  u n m a t c h e d   t e x t��  ��  � o     ���� 0 _support  � o      ���� &0 includenonmatches includeNonMatches� ��� r    ��� n   ��� I    ������� (0 asbooleanparameter asBooleanParameter� ��� o    ����  0 includematches includeMatches� ���� m    �� ���  m a t c h e d   t e x t��  ��  � o    ���� 0 _support  � o      ����  0 includematches includeMatches� ��� r    *��� n   (��� I   ! (������� @0 asnsregularexpressionparameter asNSRegularExpressionParameter� ��� o   ! "���� 0 patterntext patternText� ��� m   " #����  � ���� m   # $�� ���  f o r��  ��  � o    !���� 0 _support  � o      ���� 0 asocpattern asocPattern� ��� r   + 7��� n  + 5��� I   0 5������� ,0 asnormalizednsstring asNormalizedNSString� ���� o   0 1���� 0 thetext theText��  ��  � o   + 0���� 0 _support  � o      ���� 0 
asocstring 
asocString� ��� l  8 ;���� r   8 ;��� m   8 9����  � o      ���� &0 asocnonmatchstart asocNonMatchStart� G A used to calculate NSRanges for non-matching portions of NSString   � ��� �   u s e d   t o   c a l c u l a t e   N S R a n g e s   f o r   n o n - m a t c h i n g   p o r t i o n s   o f   N S S t r i n g� ��� l  < ?���� r   < ?��� m   < =���� � o      ���� 0 
textoffset 
textOffset� B < used to calculate correct AppleScript start and end indexes   � ��� x   u s e d   t o   c a l c u l a t e   c o r r e c t   A p p l e S c r i p t   s t a r t   a n d   e n d   i n d e x e s� ��� r   @ D��� J   @ B����  � o      ���� 0 
resultlist 
resultList� ��� l  E E������  � @ : iterate over each non-matched + matched range in NSString   � ��� t   i t e r a t e   o v e r   e a c h   n o n - m a t c h e d   +   m a t c h e d   r a n g e   i n   N S S t r i n g� ��� r   E V��� n  E T��� I   F T������� @0 matchesinstring_options_range_ matchesInString_options_range_�    o   F G���� 0 
asocstring 
asocString  m   G H����   �� J   H P  m   H I����   �� n  I N	
	 I   J N�������� 
0 length  ��  ��  
 o   I J���� 0 
asocstring 
asocString��  ��  ��  � o   E F���� 0 asocpattern asocPattern� o      ����  0 asocmatcharray asocMatchArray�  Y   W ����� k   g �  r   g o l  g m���� n  g m I   h m������  0 objectatindex_ objectAtIndex_ �� o   h i���� 0 i  ��  ��   o   g h����  0 asocmatcharray asocMatchArray��  ��   o      ���� 0 	asocmatch 	asocMatch  l  p p����   � � the first range in match identifies the text matched by the entire pattern, so generate records for full match and its preceding (unmatched) text    �$   t h e   f i r s t   r a n g e   i n   m a t c h   i d e n t i f i e s   t h e   t e x t   m a t c h e d   b y   t h e   e n t i r e   p a t t e r n ,   s o   g e n e r a t e   r e c o r d s   f o r   f u l l   m a t c h   a n d   i t s   p r e c e d i n g   ( u n m a t c h e d )   t e x t   r   p �!"! I      ��#���� 0 _matchrecords _matchRecords# $%$ o   q r���� 0 
asocstring 
asocString% &'& n  r x()( I   s x��*���� 0 rangeatindex_ rangeAtIndex_* +��+ m   s t����  ��  ��  ) o   r s���� 0 	asocmatch 	asocMatch' ,-, o   x y���� &0 asocnonmatchstart asocNonMatchStart- ./. o   y z���� 0 
textoffset 
textOffset/ 010 o   z ���� (0 _unmatchedtexttype _UnmatchedTextType1 2��2 o    ����� $0 _matchedtexttype _MatchedTextType��  ��  " J      33 454 o      ���� 0 nonmatchinfo nonMatchInfo5 676 o      ���� 0 	matchinfo 	matchInfo7 898 o      ���� &0 asocnonmatchstart asocNonMatchStart9 :��: o      ���� 0 
textoffset 
textOffset��    ;<; Z  � �=>����= o   � ����� &0 includenonmatches includeNonMatches> r   � �?@? o   � ����� 0 nonmatchinfo nonMatchInfo@ n      ABA  ;   � �B o   � ����� 0 
resultlist 
resultList��  ��  < C��C Z   � �DE����D o   � �����  0 includematches includeMatchesE k   � �FF GHG l  � ���IJ��  I any additional ranges in match identify text matched by group references within regexp pattern, e.g. "([0-9]{4})-([0-9]{2})-([0-9]{2})" will match `YYYY-MM-DD` style date strings, returning the entire text match, plus sub-matches representing year, month and day text   J �KK   a n y   a d d i t i o n a l   r a n g e s   i n   m a t c h   i d e n t i f y   t e x t   m a t c h e d   b y   g r o u p   r e f e r e n c e s   w i t h i n   r e g e x p   p a t t e r n ,   e . g .   " ( [ 0 - 9 ] { 4 } ) - ( [ 0 - 9 ] { 2 } ) - ( [ 0 - 9 ] { 2 } ) "   w i l l   m a t c h   ` Y Y Y Y - M M - D D `   s t y l e   d a t e   s t r i n g s ,   r e t u r n i n g   t h e   e n t i r e   t e x t   m a t c h ,   p l u s   s u b - m a t c h e s   r e p r e s e n t i n g   y e a r ,   m o n t h   a n d   d a y   t e x tH L��L r   � �MNM b   � �OPO o   � ����� 0 	matchinfo 	matchInfoP K   � �QQ ��R���� 0 foundgroups foundGroupsR I   � ���S���� &0 _matchedgrouplist _matchedGroupListS TUT o   � ����� 0 
asocstring 
asocStringU VWV o   � ����� 0 	asocmatch 	asocMatchW XYX n  � �Z[Z o   � ����� 0 
startindex 
startIndex[ o   � ����� 0 	matchinfo 	matchInfoY \��\ o   � ����� &0 includenonmatches includeNonMatches��  ��  ��  N n      ]^]  ;   � �^ o   � ����� 0 
resultlist 
resultList��  ��  ��  ��  �� 0 i   m   Z [��   \   [ b_`_ l  [ `a�~�}a n  [ `bcb I   \ `�|�{�z�| 	0 count  �{  �z  c o   [ \�y�y  0 asocmatcharray asocMatchArray�~  �}  ` m   ` a�x�x ��   ded l  � ��wfg�w  f "  add final non-matched range   g �hh 8   a d d   f i n a l   n o n - m a t c h e d   r a n g ee iji Z   �
kl�v�uk o   � ��t�t &0 includenonmatches includeNonMatchesl k   �mm non r   � �pqp c   � �rsr l  � �t�s�rt n  � �uvu I   � ��qw�p�q *0 substringfromindex_ substringFromIndex_w x�ox o   � ��n�n &0 asocnonmatchstart asocNonMatchStart�o  �p  v o   � ��m�m 0 
asocstring 
asocString�s  �r  s m   � ��l
�l 
ctxtq o      �k�k 0 	foundtext 	foundTexto y�jy r   �z{z K   �|| �i}~
�i 
pcls} o   � ��h�h (0 _unmatchedtexttype _UnmatchedTextType~ �g��g 0 
startindex 
startIndex o   � ��f�f 0 
textoffset 
textOffset� �e���e 0 endindex endIndex� n   � ���� 1   � ��d
�d 
leng� o   � ��c�c 0 thetext theText� �b��a�b 0 	foundtext 	foundText� o   � ��`�` 0 	foundtext 	foundText�a  { n      ���  ;  � o  �_�_ 0 
resultlist 
resultList�j  �v  �u  j ��^� L  �� o  �]�] 0 
resultlist 
resultList�^  � ��� l     �\�[�Z�\  �[  �Z  � ��� l     �Y�X�W�Y  �X  �W  � ��� l     �V���V  �  -----   � ��� 
 - - - - -� ��� l     �U���U  �   replace pattern   � ���     r e p l a c e   p a t t e r n� ��� l     �T�S�R�T  �S  �R  � ��� i  / 2��� I      �Q��P�Q "0 _replacepattern _replacePattern� ��� o      �O�O 0 thetext theText� ��� o      �N�N 0 patterntext patternText� ��M� o      �L�L 0 templatetext templateText�M  �P  � k    P�� ��� r     ��� n    
��� I    
�K��J�K ,0 asnormalizednsstring asNormalizedNSString� ��I� o    �H�H 0 thetext theText�I  �J  � o     �G�G 0 _support  � o      �F�F 0 
asocstring 
asocString� ��� r    ��� n   ��� I    �E��D�E @0 asnsregularexpressionparameter asNSRegularExpressionParameter� ��� o    �C�C 0 patterntext patternText� ��� m    �B�B  � ��A� m    �� ���  f o r�A  �D  � o    �@�@ 0 _support  � o      �?�? 0 asocpattern asocPattern� ��>� Z   P���=�� >    '��� l   %��<�;� I   %�:��
�: .corecnte****       ****� J    �� ��9� o    �8�8 0 templatetext templateText�9  � �7��6
�7 
kocl� m     !�5
�5 
scpt�6  �<  �;  � m   % &�4�4  � k   *8�� ��� r   * F��� J   * 0�� ��� J   * ,�3�3  � ��� m   , -�2�2  � ��1� m   - .�0�0 �1  � J      �� ��� o      �/�/ 0 
resultlist 
resultList� ��� o      �.�. &0 asocnonmatchstart asocNonMatchStart� ��-� o      �,�, 0 
textoffset 
textOffset�-  � ��� r   G X��� n  G V��� I   H V�+��*�+ @0 matchesinstring_options_range_ matchesInString_options_range_� ��� o   H I�)�) 0 
asocstring 
asocString� ��� m   I J�(�(  � ��'� J   J R�� ��� m   J K�&�&  � ��%� n  K P��� I   L P�$�#�"�$ 
0 length  �#  �"  � o   K L�!�! 0 
asocstring 
asocString�%  �'  �*  � o   G H� �  0 asocpattern asocPattern� o      ��  0 asocmatcharray asocMatchArray� ��� Y   Y ������� k   i ��� ��� r   i q��� l  i o���� n  i o��� I   j o����  0 objectatindex_ objectAtIndex_� ��� o   j k�� 0 i  �  �  � o   i j��  0 asocmatcharray asocMatchArray�  �  � o      �� 0 	asocmatch 	asocMatch� ��� r   r ���� I      ���� 0 _matchrecords _matchRecords� ��� o   s t�� 0 
asocstring 
asocString�    n  t z I   u z��� 0 rangeatindex_ rangeAtIndex_ � m   u v��  �  �   o   t u�� 0 	asocmatch 	asocMatch  o   z {�� &0 asocnonmatchstart asocNonMatchStart 	 o   { |�� 0 
textoffset 
textOffset	 

 o   | ��
�
 (0 _unmatchedtexttype _UnmatchedTextType �	 o   � ��� $0 _matchedtexttype _MatchedTextType�	  �  � J        o      �� 0 nonmatchinfo nonMatchInfo  o      �� 0 	matchinfo 	matchInfo  o      �� &0 asocnonmatchstart asocNonMatchStart � o      �� 0 
textoffset 
textOffset�  �  r   � � n  � � o   � ��� 0 	foundtext 	foundText o   � ��� 0 nonmatchinfo nonMatchInfo n        ;   � � o   � �� �  0 
resultlist 
resultList  r   � �  I   � ���!���� &0 _matchedgrouplist _matchedGroupList! "#" o   � ����� 0 
asocstring 
asocString# $%$ o   � ����� 0 	asocmatch 	asocMatch% &'& n  � �()( o   � ����� 0 
startindex 
startIndex) o   � ����� 0 	matchinfo 	matchInfo' *��* m   � ���
�� boovtrue��  ��    o      ���� 0 matchedgroups matchedGroups +��+ Q   � �,-., r   � �/0/ c   � �121 n  � �343 I   � ���5����  0 replacepattern replacePattern5 676 n  � �898 o   � ����� 0 	foundtext 	foundText9 o   � ����� 0 	matchinfo 	matchInfo7 :��: o   � ����� 0 matchedgroups matchedGroups��  ��  4 o   � ����� 0 templatetext templateText2 m   � ���
�� 
ctxt0 n      ;<;  ;   � �< o   � ����� 0 
resultlist 
resultList- R      ��=>
�� .ascrerr ****      � ****= o      ���� 0 etext eText> ��?@
�� 
errn? o      ���� 0 enumber eNumber@ ��AB
�� 
erobA o      ���� 0 efrom eFromB ��C��
�� 
errtC o      ���� 
0 eto eTo��  . R   � ���DE
�� .ascrerr ****      � ****D b   � �FGF m   � �HH �II � A n   e r r o r   o c c u r r e d   w h e n   c a l l i n g   t h e    r e p l a c e   p a t t e r n    s c r i p t   o b j e c t :  G o   � ����� 0 etext eTextE ��JK
�� 
errnJ o   � ����� 0 enumber eNumberK ��LM
�� 
erobL o   � ����� 0 efrom eFromM ��N��
�� 
errtN o   � ����� 
0 eto eTo��  ��  � 0 i  � m   \ ]����  � \   ] dOPO l  ] bQ����Q n  ] bRSR I   ^ b�������� 	0 count  ��  ��  S o   ] ^����  0 asocmatcharray asocMatchArray��  ��  P m   b c���� �  � TUT l  � ���VW��  V "  add final non-matched range   W �XX 8   a d d   f i n a l   n o n - m a t c h e d   r a n g eU YZY r   �[\[ c   �]^] l  � �_����_ n  � �`a` I   � ���b���� *0 substringfromindex_ substringFromIndex_b c��c o   � ����� &0 asocnonmatchstart asocNonMatchStart��  ��  a o   � ����� 0 
asocstring 
asocString��  ��  ^ m   ���
�� 
ctxt\ n      ded  ;  e o  ���� 0 
resultlist 
resultListZ fgf r  hih n jkj 1  	��
�� 
txdlk 1  	��
�� 
ascri o      ���� 0 oldtids oldTIDsg lml r  non m  pp �qq  o n     rsr 1  ��
�� 
txdls 1  ��
�� 
ascrm tut r  'vwv c  #xyx o  ���� 0 
resultlist 
resultListy m  "��
�� 
ctxtw o      ���� 0 
resulttext 
resultTextu z{z r  (3|}| o  (+���� 0 oldtids oldTIDs} n     ~~ 1  .2��
�� 
txdl 1  +.��
�� 
ascr{ ���� L  48�� o  47���� 0 
resulttext 
resultText��  �=  � L  ;P�� c  ;O��� l ;K������ n ;K��� I  <K������� |0 <stringbyreplacingmatchesinstring_options_range_withtemplate_ <stringByReplacingMatchesInString_options_range_withTemplate_� ��� l 
<=������ o  <=���� 0 
asocstring 
asocString��  ��  � ��� m  =>����  � ��� J  >F�� ��� m  >?����  � ���� n ?D��� I  @D�������� 
0 length  ��  ��  � o  ?@���� 0 
asocstring 
asocString��  � ���� o  FG���� 0 templatetext templateText��  ��  � o  ;<���� 0 asocpattern asocPattern��  ��  � m  KN��
�� 
ctxt�>  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ������  �  
 find text   � ���    f i n d   t e x t� ��� l     ��������  ��  ��  � ��� i  3 6��� I      ������� 0 	_findtext 	_findText� ��� o      ���� 0 thetext theText� ��� o      ���� 0 fortext forText� ��� o      ���� &0 includenonmatches includeNonMatches� ���� o      ����  0 includematches includeMatches��  ��  � k    	�� ��� r     ��� J     ����  � o      ���� 0 
resultlist 
resultList� ��� r    
��� n   ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� o      ���� 0 oldtids oldTIDs� ��� r    ��� o    ���� 0 fortext forText� n     ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� ��� r    ��� m    ���� � o      ���� 0 
startindex 
startIndex� ��� r    ��� n    ��� 1    ��
�� 
leng� n    ��� 4    ���
�� 
citm� m    ���� � o    ���� 0 thetext theText� o      ���� 0 endindex endIndex� ��� Z    Q������� o    ���� &0 includenonmatches includeNonMatches� k   " M�� ��� Z   " ;������ B   " %��� o   " #���� 0 
startindex 
startIndex� o   # $���� 0 endindex endIndex� r   ( 5��� n   ( 3��� 7  ) 3����
�� 
ctxt� o   - /���� 0 
startindex 
startIndex� o   0 2���� 0 endindex endIndex� o   ( )�� 0 thetext theText� o      �~�~ 0 	foundtext 	foundText��  � r   8 ;��� m   8 9�� ���  � o      �}�} 0 	foundtext 	foundText� ��|� r   < M��� K   < J�� �{��
�{ 
pcls� o   = B�z�z (0 _unmatchedtexttype _UnmatchedTextType� �y���y 0 
startindex 
startIndex� o   C D�x�x 0 
startindex 
startIndex� �w���w 0 endindex endIndex� o   E F�v�v 0 endindex endIndex� �u��t�u 0 	foundtext 	foundText� o   G H�s�s 0 	foundtext 	foundText�t  � n      ���  ;   K L� o   J K�r�r 0 
resultlist 
resultList�|  ��  ��  � ��� Y   R ��q���p� k   b ��� ��� r   b g��� [   b e��� o   b c�o�o 0 endindex endIndex� m   c d�n�n � o      �m�m 0 
startindex 
startIndex�    r   h } \   h { l  h k�l�k n   h k 1   i k�j
�j 
leng o   h i�i�i 0 thetext theText�l  �k   l  k z	�h�g	 n   k z

 1   x z�f
�f 
leng n   k x 7  l x�e
�e 
ctxt l  p s�d�c 4   p s�b
�b 
citm o   q r�a�a 0 i  �d  �c   l  t w�`�_ 4   t w�^
�^ 
citm m   u v�]�]���`  �_   o   k l�\�\ 0 thetext theText�h  �g   o      �[�[ 0 endindex endIndex  Z   ~ ��Z�Y o   ~ �X�X  0 includematches includeMatches k   � �  Z   � ��W B   � � o   � ��V�V 0 
startindex 
startIndex o   � ��U�U 0 endindex endIndex r   � � !  n   � �"#" 7  � ��T$%
�T 
ctxt$ o   � ��S�S 0 
startindex 
startIndex% o   � ��R�R 0 endindex endIndex# o   � ��Q�Q 0 thetext theText! o      �P�P 0 	foundtext 	foundText�W   r   � �&'& m   � �(( �))  ' o      �O�O 0 	foundtext 	foundText *�N* r   � �+,+ K   � �-- �M./
�M 
pcls. o   � ��L�L $0 _matchedtexttype _MatchedTextType/ �K01�K 0 
startindex 
startIndex0 o   � ��J�J 0 
startindex 
startIndex1 �I23�I 0 endindex endIndex2 o   � ��H�H 0 endindex endIndex3 �G45�G 0 	foundtext 	foundText4 o   � ��F�F 0 	foundtext 	foundText5 �E6�D�E 0 foundgroups foundGroups6 J   � ��C�C  �D  , n      787  ;   � �8 o   � ��B�B 0 
resultlist 
resultList�N  �Z  �Y   9:9 r   � �;<; [   � �=>= o   � ��A�A 0 endindex endIndex> m   � ��@�@ < o      �?�? 0 
startindex 
startIndex: ?@? r   � �ABA \   � �CDC [   � �EFE o   � ��>�> 0 
startindex 
startIndexF l  � �G�=�<G n   � �HIH 1   � ��;
�; 
lengI n   � �JKJ 4   � ��:L
�: 
citmL o   � ��9�9 0 i  K o   � ��8�8 0 thetext theText�=  �<  D m   � ��7�7 B o      �6�6 0 endindex endIndex@ M�5M Z   � �NO�4�3N o   � ��2�2 &0 includenonmatches includeNonMatchesO k   � �PP QRQ Z   � �ST�1US B   � �VWV o   � ��0�0 0 
startindex 
startIndexW o   � ��/�/ 0 endindex endIndexT r   � �XYX n   � �Z[Z 7  � ��.\]
�. 
ctxt\ o   � ��-�- 0 
startindex 
startIndex] o   � ��,�, 0 endindex endIndex[ o   � ��+�+ 0 thetext theTextY o      �*�* 0 	foundtext 	foundText�1  U r   � �^_^ m   � �`` �aa  _ o      �)�) 0 	foundtext 	foundTextR b�(b r   � �cdc K   � �ee �'fg
�' 
pclsf o   � ��&�& (0 _unmatchedtexttype _UnmatchedTextTypeg �%hi�% 0 
startindex 
startIndexh o   � ��$�$ 0 
startindex 
startIndexi �#jk�# 0 endindex endIndexj o   � ��"�" 0 endindex endIndexk �!l� �! 0 	foundtext 	foundTextl o   � ��� 0 	foundtext 	foundText�   d n      mnm  ;   � �n o   � ��� 0 
resultlist 
resultList�(  �4  �3  �5  �q 0 i  � m   U V�� � I  V ]�o�
� .corecnte****       ****o n   V Ypqp 2  W Y�
� 
citmq o   V W�� 0 thetext theText�  �p  � rsr r  tut o  �� 0 oldtids oldTIDsu n     vwv 1  �
� 
txdlw 1  �
� 
ascrs x�x L  	yy o  �� 0 
resultlist 
resultList�  � z{z l     ����  �  �  { |}| l     ����  �  �  } ~~ l     ����  �  -----   � ��� 
 - - - - - ��� l     ����  �   replace text   � ���    r e p l a c e   t e x t� ��� l     ��
�	�  �
  �	  � ��� i  7 :��� I      ���� 0 _replacetext _replaceText� ��� o      �� 0 thetext theText� ��� o      �� 0 fortext forText� ��� o      �� 0 newtext newText�  �  � k    '�� ��� r     ��� n    ��� 1    �
� 
txdl� 1     �
� 
ascr� o      � �  0 oldtids oldTIDs� ��� r    ��� o    ���� 0 fortext forText� n     ��� 1    
��
�� 
txdl� 1    ��
�� 
ascr� ��� Z   ������ >    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ���� 0 newtext newText��  � �����
�� 
kocl� m    ��
�� 
scpt��  ��  ��  � m    ����  � k    ��� ��� r    ;��� J    %�� ��� J    ����  � ��� m    ���� � ���� n    #��� 1   ! #��
�� 
leng� n    !��� 4    !���
�� 
citm� m     ���� � o    ���� 0 thetext theText��  � J      �� ��� o      ���� 0 
resultlist 
resultList� ��� o      ���� 0 
startindex 
startIndex� ���� o      ���� 0 endindex endIndex��  � ��� Z  < T������� B   < ?��� o   < =���� 0 
startindex 
startIndex� o   = >���� 0 endindex endIndex� r   B P��� n   B M��� 7  C M����
�� 
ctxt� o   G I���� 0 
startindex 
startIndex� o   J L���� 0 endindex endIndex� o   B C���� 0 thetext theText� n      ���  ;   N O� o   M N���� 0 
resultlist 
resultList��  ��  � ��� Y   U ��������� k   e ��� ��� r   e j��� [   e h��� o   e f���� 0 endindex endIndex� m   f g���� � o      ���� 0 
startindex 
startIndex� ��� r   k ���� \   k ~��� l  k n������ n   k n��� 1   l n��
�� 
leng� o   k l���� 0 thetext theText��  ��  � l  n }������ n   n }��� 1   { }��
�� 
leng� n   n {��� 7  o {����
�� 
ctxt� l  s v������ 4   s v���
�� 
citm� o   t u���� 0 i  ��  ��  � l  w z������ 4   w z���
�� 
citm� m   x y��������  ��  � o   n o���� 0 thetext theText��  ��  � o      ���� 0 endindex endIndex� ��� Z   � ������� B   � ���� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 endindex endIndex� r   � ���� n   � ���� 7  � �����
�� 
ctxt� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 endindex endIndex� o   � ����� 0 thetext theText� o      ���� 0 	foundtext 	foundText��  � r   � �� � m   � � �    o      ���� 0 	foundtext 	foundText�  Q   � � r   � �	 c   � �

 n  � � I   � ������� 0 replacetext replaceText �� o   � ����� 0 	foundtext 	foundText��  ��   o   � ����� 0 newtext newText m   � ���
�� 
ctxt	 n        ;   � � o   � ����� 0 
resultlist 
resultList R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   R   � ���
�� .ascrerr ****      � **** b   � � m   � � � � A n   e r r o r   o c c u r r e d   w h e n   c a l l i n g   t h e    r e p l a c e   t e x t    s c r i p t   o b j e c t :   o   � ����� 0 etext eText �� 
�� 
errn o   � ����� 0 enumber eNumber  ��!"
�� 
erob! o   � ����� 0 efrom eFrom" ��#��
�� 
errt# o   � ����� 
0 eto eTo��   $%$ r   � �&'& [   � �()( o   � ����� 0 endindex endIndex) m   � ����� ' o      ���� 0 
startindex 
startIndex% *+* r   � �,-, \   � �./. [   � �010 o   � ����� 0 
startindex 
startIndex1 l  � �2����2 n   � �343 1   � ���
�� 
leng4 n   � �565 4   � ���7
�� 
citm7 o   � ����� 0 i  6 o   � ����� 0 thetext theText��  ��  / m   � ����� - o      ���� 0 endindex endIndex+ 8��8 Z  � �9:����9 B   � �;<; o   � ����� 0 
startindex 
startIndex< o   � ����� 0 endindex endIndex: r   � �=>= n   � �?@? 7  � ���AB
�� 
ctxtA o   � ����� 0 
startindex 
startIndexB o   � ����� 0 endindex endIndex@ o   � ����� 0 thetext theText> n      CDC  ;   � �D o   � ����� 0 
resultlist 
resultList��  ��  ��  �� 0 i  � m   X Y���� � I  Y `��E��
�� .corecnte****       ****E n   Y \FGF 2  Z \��
�� 
citmG o   Y Z���� 0 thetext theText��  ��  � H��H r   � �IJI m   � �KK �LL  J n     MNM 1   � ���
�� 
txdlN 1   � ���
�� 
ascr��  ��  � l  �OPQO k   �RR STS l  � ���UV��  U   replace with text   V �WW $   r e p l a c e   w i t h   t e x tT XYX r   �Z[Z n  �
\]\ I  
��^���� "0 astextparameter asTextParameter^ _`_ o  ���� 0 newtext newText` a��a m  bb �cc  r e p l a c i n g   w i t h��  ��  ] o   ����� 0 _support  [ o      ���� 0 newtext newTextY ded l fghf r  iji n klk 2 ��
�� 
citml o  �� 0 thetext theTextj o      �~�~ 0 
resultlist 
resultListg J D note: TID-based matching uses current considering/ignoring settings   h �mm �   n o t e :   T I D - b a s e d   m a t c h i n g   u s e s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g se n�}n r  opo o  �|�| 0 newtext newTextp n     qrq 1  �{
�{ 
txdlr 1  �z
�z 
ascr�}  P * $ replace with callback-supplied text   Q �ss H   r e p l a c e   w i t h   c a l l b a c k - s u p p l i e d   t e x t� tut r  vwv c  xyx o  �y�y 0 
resultlist 
resultListy m  �x
�x 
ctxtw o      �w�w 0 
resulttext 
resultTextu z{z r  $|}| o   �v�v 0 oldtids oldTIDs} n     ~~ 1  !#�u
�u 
txdl 1   !�t
�t 
ascr{ ��s� L  %'�� o  %&�r�r 0 
resulttext 
resultText�s  � ��� l     �q�p�o�q  �p  �o  � ��� l     �n�m�l�n  �m  �l  � ��� l     �k���k  �  -----   � ��� 
 - - - - -� ��� l     �j�i�h�j  �i  �h  � ��� i  ; >��� I     �g��
�g .Txt:Srchnull���     ctxt� o      �f�f 0 thetext theText� �e��
�e 
For_� o      �d�d 0 fortext forText� �c��
�c 
Usin� |�b�a��`��b  �a  � o      �_�_ 0 matchformat matchFormat�`  � l 
    ��^�]� l     ��\�[� m      �Z
�Z SerECmpI�\  �[  �^  �]  � �Y��
�Y 
Repl� |�X�W��V��X  �W  � o      �U�U 0 newtext newText�V  � l     ��T�S� m      �R
�R 
msng�T  �S  � �Q��P
�Q 
Retu� |�O�N��M��O  �N  � o      �L�L 0 resultformat resultFormat�M  � l     ��K�J� m      �I
�I RetEMatT�K  �J  �P  � Q    O���� k   9�� ��� r    ��� n   ��� I    �H��G�H "0 astextparameter asTextParameter� ��� o    	�F�F 0 thetext theText� ��E� m   	 
�� ���  �E  �G  � o    �D�D 0 _support  � o      �C�C 0 thetext theText� ��� r    ��� n   ��� I    �B��A�B "0 astextparameter asTextParameter� ��� o    �@�@ 0 fortext forText� ��?� m    �� ���  f o r�?  �A  � o    �>�> 0 _support  � o      �=�= 0 fortext forText� ��� Z   3���<�;� =    $��� n   "��� 1     "�:
�: 
leng� o     �9�9 0 fortext forText� m   " #�8�8  � R   ' /�7��
�7 .ascrerr ****      � ****� m   - .�� ��� t I n v a l i d    f o r    p a r a m e t e r   ( e x p e c t e d   o n e   o r   m o r e   c h a r a c t e r s ) .� �6��
�6 
errn� m   ) *�5�5�Y� �4��3
�4 
erob� o   + ,�2�2 0 fortext forText�3  �<  �;  � ��1� Z   49���0�� =  4 7��� o   4 5�/�/ 0 newtext newText� m   5 6�.
�. 
msng� l  :����� k   :��� ��� Z   : e���-�,� =   : ?��� n  : =��� 1   ; =�+
�+ 
leng� o   : ;�*�* 0 thetext theText� m   = >�)�)  � Z   B a���(�� =  B E��� o   B C�'�' 0 resultformat resultFormat� m   C D�&
�& RetEMatT� L   H K�� J   H J�%�%  �(  � L   N a�� J   N `�� ��$� K   N ^�� �#��
�# 
pcls� o   O T�"�" (0 _unmatchedtexttype _UnmatchedTextType� �!���! 0 
startindex 
startIndex� m   U V� �  � ���� 0 endindex endIndex� m   W X��  � ���� 0 	foundtext 	foundText� m   Y Z�� ���  �  �$  �-  �,  � ��� Z   f ������ =  f i��� o   f g�� 0 resultformat resultFormat� m   g h�
� RetEMatT� r   l ���� J   l p�� � � m   l m�
� boovfals  � m   m n�
� boovtrue�  � J        o      �� &0 includenonmatches includeNonMatches � o      ��  0 includematches includeMatches�  �  =  � �	 o   � ��� 0 resultformat resultFormat	 m   � ��
� RetEUmaT 

 r   � � J   � �  m   � ��
� boovtrue � m   � ��
� boovfals�   J        o      �� &0 includenonmatches includeNonMatches � o      ��  0 includematches includeMatches�    =  � � o   � ��� 0 resultformat resultFormat m   � ��

�
 RetEAllT �	 r   � � J   � �  m   � ��
� boovtrue  �  m   � ��
� boovtrue�   J      !! "#" o      �� &0 includenonmatches includeNonMatches# $�$ o      ��  0 includematches includeMatches�  �	  � n  � �%&% I   � ��'�� >0 throwinvalidconstantparameter throwInvalidConstantParameter' ()( o   � �� �  0 resultformat resultFormat) *��* m   � �++ �,,  r e t u r n i n g��  �  & o   � ����� 0 _support  � -��- Z   ��./01. =  � �232 o   � ����� 0 matchformat matchFormat3 m   � ���
�� SerECmpI/ P   � �4564 L   � �77 I   � ���8���� 0 	_findtext 	_findText8 9:9 o   � ����� 0 thetext theText: ;<; o   � ����� 0 fortext forText< =>= o   � ����� &0 includenonmatches includeNonMatches> ?��? o   � �����  0 includematches includeMatches��  ��  5 ��@
�� consdiac@ ��A
�� conshyphA ��B
�� conspuncB ��C
�� conswhitC ����
�� consnume��  6 ����
�� conscase��  0 DED =  � �FGF o   � ����� 0 matchformat matchFormatG m   � ���
�� SerECmpPE HIH L   �	JJ I   ���K���� 0 _findpattern _findPatternK LML o   ���� 0 thetext theTextM NON o  ���� 0 fortext forTextO PQP o  ���� &0 includenonmatches includeNonMatchesQ R��R o  ����  0 includematches includeMatches��  ��  I STS = UVU o  ���� 0 matchformat matchFormatV m  ��
�� SerECmpCT WXW P  &YZ��Y L  %[[ I  $��\���� 0 	_findtext 	_findText\ ]^] o  ���� 0 thetext theText^ _`_ o  ���� 0 fortext forText` aba o  ���� &0 includenonmatches includeNonMatchesb c��c o   ����  0 includematches includeMatches��  ��  Z ��d
�� conscased ��e
�� consdiace ��f
�� conshyphf ��g
�� conspuncg ��h
�� conswhith ����
�� consnume��  ��  X iji = ).klk o  )*���� 0 matchformat matchFormatl m  *-��
�� SerECmpEj mnm P  1Eopqo L  :Drr I  :C��s���� 0 	_findtext 	_findTexts tut o  ;<���� 0 thetext theTextu vwv o  <=���� 0 fortext forTextw xyx o  =>���� &0 includenonmatches includeNonMatchesy z��z o  >?����  0 includematches includeMatches��  ��  p ��{
�� conscase{ ��|
�� consdiac| ��}
�� conshyph} ��~
�� conspunc~ ����
�� conswhit��  q ����
�� consnume��  n � = HM��� o  HI���� 0 matchformat matchFormat� m  IL��
�� SerECmpD� ���� k  Pq�� ��� l Pf���� Z Pf������� = PU��� o  PQ���� 0 fortext forText� m  QT�� ���  � R  Xb����
�� .ascrerr ****      � ****� m  ^a�� ��� � I n v a l i d    f o r    p a r a m e t e r   ( c o n t a i n s   o n l y   c h a r a c t e r s   i g n o r e d   b y   t h e   c u r r e n t   c o n s i d e r a t i o n s ) .� ����
�� 
errn� m  Z[�����Y� �����
�� 
erob� o  \]���� 0 fortext forText��  ��  ��  ��� checks if all characters in forText are ignored by current considering/ignoring settings (the alternative would be to return each character as a non-match separated by a zero-length match, but that's probably not what the user intended); note that unlike `aString's length = 0`, which is what library code normally uses to check for empty text, on this occasion we do want to take into account the current considering/ignoring settings so deliberately use `forText is ""` here. For example, when ignoring punctuation, searching for the TID `"!?"` is no different to searching for `""`, because all of its characters are being ignored when comparing the text being searched against the text being searched for. Thus, a simple `forText is ""` test can be used to check in advance if the text contains any matchable characters under the current considering/ignoring settings, and report a meaningful error if not.   � ���   c h e c k s   i f   a l l   c h a r a c t e r s   i n   f o r T e x t   a r e   i g n o r e d   b y   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s   ( t h e   a l t e r n a t i v e   w o u l d   b e   t o   r e t u r n   e a c h   c h a r a c t e r   a s   a   n o n - m a t c h   s e p a r a t e d   b y   a   z e r o - l e n g t h   m a t c h ,   b u t   t h a t ' s   p r o b a b l y   n o t   w h a t   t h e   u s e r   i n t e n d e d ) ;   n o t e   t h a t   u n l i k e   ` a S t r i n g ' s   l e n g t h   =   0 ` ,   w h i c h   i s   w h a t   l i b r a r y   c o d e   n o r m a l l y   u s e s   t o   c h e c k   f o r   e m p t y   t e x t ,   o n   t h i s   o c c a s i o n   w e   d o   w a n t   t o   t a k e   i n t o   a c c o u n t   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s   s o   d e l i b e r a t e l y   u s e   ` f o r T e x t   i s   " " `   h e r e .   F o r   e x a m p l e ,   w h e n   i g n o r i n g   p u n c t u a t i o n ,   s e a r c h i n g   f o r   t h e   T I D   ` " ! ? " `   i s   n o   d i f f e r e n t   t o   s e a r c h i n g   f o r   ` " " ` ,   b e c a u s e   a l l   o f   i t s   c h a r a c t e r s   a r e   b e i n g   i g n o r e d   w h e n   c o m p a r i n g   t h e   t e x t   b e i n g   s e a r c h e d   a g a i n s t   t h e   t e x t   b e i n g   s e a r c h e d   f o r .   T h u s ,   a   s i m p l e   ` f o r T e x t   i s   " " `   t e s t   c a n   b e   u s e d   t o   c h e c k   i n   a d v a n c e   i f   t h e   t e x t   c o n t a i n s   a n y   m a t c h a b l e   c h a r a c t e r s   u n d e r   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s ,   a n d   r e p o r t   a   m e a n i n g f u l   e r r o r   i f   n o t .� ���� L  gq�� I  gp������� 0 	_findtext 	_findText� ��� o  hi���� 0 thetext theText� ��� o  ij���� 0 fortext forText� ��� o  jk���� &0 includenonmatches includeNonMatches� ���� o  kl����  0 includematches includeMatches��  ��  ��  ��  1 n t���� I  y�������� >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o  yz���� 0 matchformat matchFormat� ���� m  z}�� ��� 
 u s i n g��  ��  � o  ty���� 0 _support  ��  �   find matches   � ���    f i n d   m a t c h e s�0  � l �9���� k  �9�� ��� Z ��������� =  ����� n ����� 1  ����
�� 
leng� o  ������ 0 thetext theText� m  ������  � L  ���� m  ���� ���  ��  ��  � ���� Z  �9����� = ����� o  ������ 0 matchformat matchFormat� m  ����
�� SerECmpI� P  ������ L  ���� I  ��������� 0 _replacetext _replaceText� ��� o  ������ 0 thetext theText� ��� o  ������ 0 fortext forText� ���� o  ������ 0 newtext newText��  ��  � ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ���
�� conswhit� ����
�� consnume��  � ����
�� conscase��  � ��� = ����� o  ������ 0 matchformat matchFormat� m  ����
�� SerECmpP� ��� L  ���� I  ��������� "0 _replacepattern _replacePattern� ��� o  ������ 0 thetext theText� ��� o  ������ 0 fortext forText� ���� o  ������ 0 newtext newText��  ��  � ��� = ����� o  ������ 0 matchformat matchFormat� m  ����
�� SerECmpE� ��� P  ������ L  ���� I  ��������� 0 _replacetext _replaceText� ��� o  ������ 0 thetext theText� ��� o  ������ 0 fortext forText� ���� o  ������ 0 newtext newText��  ��  � ���
�� conscase� ���
�� consdiac� ��
� conshyph� �~�
�~ conspunc� �}�|
�} conswhit�|  � �{�z
�{ consnume�z  � ��� = ����� o  ���y�y 0 matchformat matchFormat� m  ���x
�x SerECmpC� ��� P  �����w� L  ���� I  ���v��u�v 0 _replacetext _replaceText� ��� o  ���t�t 0 thetext theText� ��� o  ���s�s 0 fortext forText� ��r� o  ���q�q 0 newtext newText�r  �u  � �p�
�p conscase� �o 
�o consdiac  �n
�n conshyph �m
�m conspunc �l
�l conswhit �k�j
�k consnume�j  �w  �  =  o  �i�i 0 matchformat matchFormat m  �h
�h SerECmpD �g k  	)		 

 Z 	�f�e = 	 o  	
�d�d 0 fortext forText m  
 �   R  �c
�c .ascrerr ****      � **** m   � � I n v a l i d    f o r    p a r a m e t e r   ( c o n t a i n s   o n l y   c h a r a c t e r s   i g n o r e d   b y   t h e   c u r r e n t   c o n s i d e r a t i o n s ) . �b
�b 
errn m  �a�a�Y �`�_
�` 
erob o  �^�^ 0 fortext forText�_  �f  �e   �] L   ) I   (�\�[�\ 0 _replacetext _replaceText  o  !"�Z�Z 0 thetext theText  o  "#�Y�Y 0 fortext forText  �X  o  #$�W�W 0 newtext newText�X  �[  �]  �g  � n ,9!"! I  19�V#�U�V >0 throwinvalidconstantparameter throwInvalidConstantParameter# $%$ o  12�T�T 0 matchformat matchFormat% &�S& m  25'' �(( 
 u s i n g�S  �U  " o  ,1�R�R 0 _support  ��  �   replace matches   � �))     r e p l a c e   m a t c h e s�1  � R      �Q*+
�Q .ascrerr ****      � ***** o      �P�P 0 etext eText+ �O,-
�O 
errn, o      �N�N 0 enumber eNumber- �M./
�M 
erob. o      �L�L 0 efrom eFrom/ �K0�J
�K 
errt0 o      �I�I 
0 eto eTo�J  � I  AO�H1�G�H 
0 _error  1 232 m  BE44 �55  s e a r c h   t e x t3 676 o  EF�F�F 0 etext eText7 898 o  FG�E�E 0 enumber eNumber9 :;: o  GH�D�D 0 efrom eFrom; <�C< o  HI�B�B 
0 eto eTo�C  �G  � =>= l     �A�@�?�A  �@  �?  > ?@? l     �>�=�<�>  �=  �<  @ ABA i  ? BCDC I     �;E�:
�; .Txt:EPatnull���     ctxtE o      �9�9 0 thetext theText�:  D Q     *FGHF L    II c    JKJ l   L�8�7L n   MNM I    �6O�5�6 40 escapedpatternforstring_ escapedPatternForString_O P�4P l   Q�3�2Q n   RSR I    �1T�0�1 "0 astextparameter asTextParameterT UVU o    �/�/ 0 thetext theTextV W�.W m    XX �YY  �.  �0  S o    �-�- 0 _support  �3  �2  �4  �5  N n   Z[Z o    �,�, *0 nsregularexpression NSRegularExpression[ m    �+
�+ misccura�8  �7  K m    �*
�* 
ctxtG R      �)\]
�) .ascrerr ****      � ****\ o      �(�( 0 etext eText] �'^_
�' 
errn^ o      �&�& 0 enumber eNumber_ �%`a
�% 
erob` o      �$�$ 0 efrom eFroma �#b�"
�# 
errtb o      �!�! 
0 eto eTo�"  H I     *� c��  
0 _error  c ded m   ! "ff �gg  e s c a p e   p a t t e r ne hih o   " #�� 0 etext eTexti jkj o   # $�� 0 enumber eNumberk lml o   $ %�� 0 efrom eFromm n�n o   % &�� 
0 eto eTo�  �  B opo l     ����  �  �  p qrq l     ����  �  �  r sts i  C Fuvu I     �w�
� .Txt:ETemnull���     ctxtw o      �� 0 thetext theText�  v Q     *xyzx L    {{ c    |}| l   ~��~ n   � I    ���� 60 escapedtemplateforstring_ escapedTemplateForString_� ��� l   ���
� n   ��� I    �	���	 "0 astextparameter asTextParameter� ��� o    �� 0 thetext theText� ��� m    �� ���  �  �  � o    �� 0 _support  �  �
  �  �  � n   ��� o    �� *0 nsregularexpression NSRegularExpression� m    �
� misccura�  �  } m    �
� 
ctxty R      ���
� .ascrerr ****      � ****� o      � �  0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  z I     *������� 
0 _error  � ��� m   ! "�� ���  e s c a p e   t e m p l a t e� ��� o   " #���� 0 etext eText� ��� o   # $���� 0 enumber eNumber� ��� o   $ %���� 0 efrom eFrom� ���� o   % &���� 
0 eto eTo��  ��  t ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   Conversion Suite   � ��� "   C o n v e r s i o n   S u i t e� ��� l     ��������  ��  ��  � ��� i  G J��� I     ����
�� .Txt:UppTnull���     ctxt� o      ���� 0 thetext theText� �����
�� 
Loca� |����������  ��  � o      ���� 0 
localecode 
localeCode��  � l     ������ m      �� ���  n o n e��  ��  ��  � Q     P���� k    >�� ��� r    ��� n   ��� I    ������� 0 
asnsstring 
asNSString� ���� n   ��� I    ������� "0 astextparameter asTextParameter� ��� o    ���� 0 thetext theText� ���� m    �� ���  ��  ��  � o    ���� 0 _support  ��  ��  � o    ���� 0 _support  � o      ���� 0 
asocstring 
asocString� ���� Z    >������ =   ��� o    ���� 0 
localecode 
localeCode� m    ��
�� 
msng� L     (�� c     '��� l    %������ n    %��� I   ! %�������� "0 uppercasestring uppercaseString��  ��  � o     !���� 0 
asocstring 
asocString��  ��  � m   % &��
�� 
ctxt��  � L   + >�� c   + =��� l  + ;������ n  + ;��� I   , ;������� 80 uppercasestringwithlocale_ uppercaseStringWithLocale_� ���� l  , 7������ n  , 7��� I   1 7������� *0 asnslocaleparameter asNSLocaleParameter� ��� o   1 2���� 0 
localecode 
localeCode� ���� m   2 3�� ���  f o r   l o c a l e��  ��  � o   , 1���� 0 _support  ��  ��  ��  ��  � o   + ,���� 0 
asocstring 
asocString��  ��  � m   ; <��
�� 
ctxt��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I   F P������� 
0 _error  � ��� m   G H�� ���  u p p e r c a s e   t e x t� ��� o   H I���� 0 etext eText� ��� o   I J���� 0 enumber eNumber� ��� o   J K���� 0 efrom eFrom�  ��  o   K L���� 
0 eto eTo��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��    i  K N I     ��	

�� .Txt:CapTnull���     ctxt	 o      ���� 0 thetext theText
 ����
�� 
Loca |��������  ��   o      ���� 0 
localecode 
localeCode��   l     ���� m       �  n o n e��  ��  ��   Q     P k    >  r     n    I    ������ 0 
asnsstring 
asNSString �� n    I    ������ "0 astextparameter asTextParameter  !  o    ���� 0 thetext theText! "��" m    ## �$$  ��  ��   o    ���� 0 _support  ��  ��   o    ���� 0 _support   o      ���� 0 
asocstring 
asocString %��% Z    >&'��(& =   )*) o    ���� 0 
localecode 
localeCode* m    ��
�� 
msng' L     (++ c     ',-, l    %.����. n    %/0/ I   ! %�������� &0 capitalizedstring capitalizedString��  ��  0 o     !���� 0 
asocstring 
asocString��  ��  - m   % &��
�� 
ctxt��  ( L   + >11 c   + =232 l  + ;4����4 n  + ;565 I   , ;��7���� <0 capitalizedstringwithlocale_ capitalizedStringWithLocale_7 8��8 l  , 79��~9 n  , 7:;: I   1 7�}<�|�} *0 asnslocaleparameter asNSLocaleParameter< =>= o   1 2�{�{ 0 
localecode 
localeCode> ?�z? m   2 3@@ �AA  f o r   l o c a l e�z  �|  ; o   , 1�y�y 0 _support  �  �~  ��  ��  6 o   + ,�x�x 0 
asocstring 
asocString��  ��  3 m   ; <�w
�w 
ctxt��   R      �vBC
�v .ascrerr ****      � ****B o      �u�u 0 etext eTextC �tDE
�t 
errnD o      �s�s 0 enumber eNumberE �rFG
�r 
erobF o      �q�q 0 efrom eFromG �pH�o
�p 
errtH o      �n�n 
0 eto eTo�o   I   F P�mI�l�m 
0 _error  I JKJ m   G HLL �MM  c a p i t a l i z e   t e x tK NON o   H I�k�k 0 etext eTextO PQP o   I J�j�j 0 enumber eNumberQ RSR o   J K�i�i 0 efrom eFromS T�hT o   K L�g�g 
0 eto eTo�h  �l   UVU l     �f�e�d�f  �e  �d  V WXW l     �c�b�a�c  �b  �a  X YZY i  O R[\[ I     �`]^
�` .Txt:LowTnull���     ctxt] o      �_�_ 0 thetext theText^ �^_�]
�^ 
Loca_ |�\�[`�Za�\  �[  ` o      �Y�Y 0 
localecode 
localeCode�Z  a l     b�X�Wb m      cc �dd  n o n e�X  �W  �]  \ Q     Pefge k    >hh iji r    klk n   mnm I    �Vo�U�V 0 
asnsstring 
asNSStringo p�Tp n   qrq I    �Ss�R�S "0 astextparameter asTextParameters tut o    �Q�Q 0 thetext theTextu v�Pv m    ww �xx  �P  �R  r o    �O�O 0 _support  �T  �U  n o    �N�N 0 _support  l o      �M�M 0 
asocstring 
asocStringj y�Ly Z    >z{�K|z =   }~} o    �J�J 0 
localecode 
localeCode~ m    �I
�I 
msng{ L     ( c     '��� l    %��H�G� n    %��� I   ! %�F�E�D�F "0 lowercasestring lowercaseString�E  �D  � o     !�C�C 0 
asocstring 
asocString�H  �G  � m   % &�B
�B 
ctxt�K  | L   + >�� c   + =��� l  + ;��A�@� n  + ;��� I   , ;�?��>�? 80 lowercasestringwithlocale_ lowercaseStringWithLocale_� ��=� l  , 7��<�;� n  , 7��� I   1 7�:��9�: *0 asnslocaleparameter asNSLocaleParameter� ��� o   1 2�8�8 0 
localecode 
localeCode� ��7� m   2 3�� ���  f o r   l o c a l e�7  �9  � o   , 1�6�6 0 _support  �<  �;  �=  �>  � o   + ,�5�5 0 
asocstring 
asocString�A  �@  � m   ; <�4
�4 
ctxt�L  f R      �3��
�3 .ascrerr ****      � ****� o      �2�2 0 etext eText� �1��
�1 
errn� o      �0�0 0 enumber eNumber� �/��
�/ 
erob� o      �.�. 0 efrom eFrom� �-��,
�- 
errt� o      �+�+ 
0 eto eTo�,  g I   F P�*��)�* 
0 _error  � ��� m   G H�� ���  l o w e r c a s e   t e x t� ��� o   H I�(�( 0 etext eText� ��� o   I J�'�' 0 enumber eNumber� ��� o   J K�&�& 0 efrom eFrom� ��%� o   K L�$�$ 
0 eto eTo�%  �)  Z ��� l     �#�"�!�#  �"  �!  � ��� l     � ���   �  �  � ��� i  S V��� I     ���
� .Txt:FTxtnull���     ctxt� o      �� 0 templatetext templateText� ���
� 
Usin� o      �� 0 	thevalues 	theValues�  � k    [�� ��� l     ����  � � � note: templateText uses same `$n` (where n=1-9) notation as `search text`'s replacement templates, with `\$` to escape as necessary ($ not followed by a digit will appear as-is)   � ���d   n o t e :   t e m p l a t e T e x t   u s e s   s a m e   ` $ n `   ( w h e r e   n = 1 - 9 )   n o t a t i o n   a s   ` s e a r c h   t e x t ` ' s   r e p l a c e m e n t   t e m p l a t e s ,   w i t h   ` \ $ `   t o   e s c a p e   a s   n e c e s s a r y   ( $   n o t   f o l l o w e d   b y   a   d i g i t   w i l l   a p p e a r   a s - i s )� ��� Q    [���� P   A���� k   @�� ��� r    ��� n   ��� I    ���� "0 aslistparameter asListParameter� ��� o    �� 0 	thevalues 	theValues�  �  � o    �� 0 _support  � o      �� 0 	thevalues 	theValues� ��� l   !���� r    !��� n   ��� I    ���� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_� ��� m    �� ���  \ \ . | \ $ [ 1 - 9 ]� ��� m    ��  � ��� l   ���� m    �

�
 
msng�  �  �  �  � n   ��� o    �	�	 *0 nsregularexpression NSRegularExpression� m    �
� misccura� o      �� 0 asocpattern asocPattern� E ? match any backslash escaped character or a $ followed by digit   � ��� ~   m a t c h   a n y   b a c k s l a s h   e s c a p e d   c h a r a c t e r   o r   a   $   f o l l o w e d   b y   d i g i t� ��� r   " .��� n  " ,��� I   ' ,���� 0 
asnsstring 
asNSString� ��� o   ' (�� 0 templatetext templateText�  �  � o   " '�� 0 _support  � o      �� 0 
asocstring 
asocString� ��� r   / @��� l  / >�� ��� n  / >��� I   0 >������� @0 matchesinstring_options_range_ matchesInString_options_range_� ��� o   0 1���� 0 
asocstring 
asocString� ��� m   1 2����  � ���� J   2 :�� ��� m   2 3����  � ���� n  3 8��� I   4 8�������� 
0 length  ��  ��  � o   3 4���� 0 
asocstring 
asocString��  ��  ��  � o   / 0���� 0 asocpattern asocPattern�   ��  � o      ����  0 asocmatcharray asocMatchArray� ��� r   A E��� J   A C����  � o      ���� 0 resulttexts resultTexts� ��� r   F I	 		  m   F G����  	 o      ���� 0 
startindex 
startIndex� 			 Y   J	��		��	 k   Z		 				 r   Z g	
		
 l  Z e	����	 n  Z e			 I   ` e��	���� 0 rangeatindex_ rangeAtIndex_	 	��	 m   ` a����  ��  ��  	 l  Z `	����	 n  Z `			 I   [ `��	����  0 objectatindex_ objectAtIndex_	 	��	 o   [ \���� 0 i  ��  ��  	 o   Z [����  0 asocmatcharray asocMatchArray��  ��  ��  ��  	 o      ���� 0 
matchrange 
matchRange		 			 r   h �			 c   h }			 l  h y	����	 n  h y			 I   i y��	���� *0 substringwithrange_ substringWithRange_	 	 ��	  K   i u	!	! ��	"	#�� 0 location  	" o   j k���� 0 
startindex 
startIndex	# ��	$���� 
0 length  	$ l  l s	%����	% \   l s	&	'	& l  l q	(����	( n  l q	)	*	) I   m q�������� 0 location  ��  ��  	* o   l m���� 0 
matchrange 
matchRange��  ��  	' o   q r���� 0 
startindex 
startIndex��  ��  ��  ��  ��  	 o   h i���� 0 
asocstring 
asocString��  ��  	 m   y |��
�� 
ctxt	 n      	+	,	+  ;   ~ 	, o   } ~���� 0 resulttexts resultTexts	 	-	.	- r   � �	/	0	/ c   � �	1	2	1 l  � �	3����	3 n  � �	4	5	4 I   � ���	6���� *0 substringwithrange_ substringWithRange_	6 	7��	7 o   � ����� 0 
matchrange 
matchRange��  ��  	5 o   � ����� 0 
asocstring 
asocString��  ��  	2 m   � ���
�� 
ctxt	0 o      ���� 0 thetoken theToken	. 	8	9	8 Z   � �	:	;��	<	: =  � �	=	>	= n  � �	?	@	? 4   � ���	A
�� 
cha 	A m   � ����� 	@ o   � ����� 0 thetoken theToken	> m   � �	B	B �	C	C  \	; l  � �	D	E	F	D l  � �	G	H	I	G r   � �	J	K	J n  � �	L	M	L 4   � ���	N
�� 
cha 	N m   � ����� 	M o   � ����� 0 thetoken theToken	K n      	O	P	O  ;   � �	P o   � ����� 0 resulttexts resultTexts	H w q �so insert the character that follows it -- TO DO: should this support 'special' character escapes, \t, \n, etc?   	I �	Q	Q �   & s o   i n s e r t   t h e   c h a r a c t e r   t h a t   f o l l o w s   i t   - -   T O   D O :   s h o u l d   t h i s   s u p p o r t   ' s p e c i a l '   c h a r a c t e r   e s c a p e s ,   \ t ,   \ n ,   e t c ?	E + % found a backslash-escaped character�   	F �	R	R J   f o u n d   a   b a c k s l a s h - e s c a p e d   c h a r a c t e r &��  	< l  � �	S	T	U	S k   � �	V	V 	W	X	W r   � �	Y	Z	Y c   � �	[	\	[ n  � �	]	^	] 4   � ���	_
�� 
cha 	_ m   � ����� 	^ o   � ����� 0 thetoken theToken	\ m   � ���
�� 
long	Z o      ���� 0 	itemindex 	itemIndex	X 	`	a	` l  � �	b	c	d	b r   � �	e	f	e n   � �	g	h	g 4   � ���	i
�� 
cobj	i o   � ����� 0 	itemindex 	itemIndex	h o   � ����� 0 	thevalues 	theValues	f o      ���� 0 theitem theItem	c < 6 raises error -1728 if itemIndex > length of theValues   	d �	j	j l   r a i s e s   e r r o r   - 1 7 2 8   i f   i t e m I n d e x   >   l e n g t h   o f   t h e V a l u e s	a 	k��	k Q   � �	l	m	n	l r   � �	o	p	o c   � �	q	r	q o   � ����� 0 theitem theItem	r m   � ���
�� 
ctxt	p n      	s	t	s  ;   � �	t o   � ����� 0 resulttexts resultTexts	m R      ����	u
�� .ascrerr ****      � ****��  	u ��	v��
�� 
errn	v d      	w	w m      �������  	n R   � ���	x	y
�� .ascrerr ****      � ****	x b   � �	z	{	z b   � �	|	}	| m   � �	~	~ �		 & C a n  t   c o n v e r t   i t e m  	} o   � ����� 0 	itemindex 	itemIndex	{ m   � �	�	� �	�	�    t o   t e x t .	y ��	�	�
�� 
errn	� m   � ������\	� ��	�	�
�� 
erob	� l  � �	�����	� N   � �	�	� n   � �	�	�	� 4   � ���	�
�� 
cobj	� o   � ����� 0 	itemindex 	itemIndex	� o   � ����� 0 	thevalues 	theValues��  ��  	� ��	���
�� 
errt	� m   � ���
�� 
ctxt��  ��  	T  	 found $n   	U �	�	�    f o u n d   $ n	9 	���	� r   �	�	�	� [   � 	�	�	� l  � �	�����	� n  � �	�	�	� I   � ��������� 0 location  ��  ��  	� o   � ����� 0 
matchrange 
matchRange��  ��  	� l  � �	�����	� n  � �	�	�	� I   � ��������� 
0 length  ��  ��  	� o   � ����� 0 
matchrange 
matchRange��  ��  	� o      ���� 0 
startindex 
startIndex��  �� 0 i  	 m   M N����  	 l  N U	�����	� \   N U	�	�	� l  N S	�����	� n  N S	�	�	� I   O S�������� 	0 count  ��  ��  	� o   N O����  0 asocmatcharray asocMatchArray��  ��  	� m   S T���� ��  ��  ��  	 	�	�	� r  	�	�	� c  	�	�	� l 	����	� n 	�	�	� I  	�~	��}�~ *0 substringfromindex_ substringFromIndex_	� 	��|	� o  	
�{�{ 0 
startindex 
startIndex�|  �}  	� o  	�z�z 0 
asocstring 
asocString��  �  	� m  �y
�y 
ctxt	� n      	�	�	�  ;  	� o  �x�x 0 resulttexts resultTexts	� 	�	�	� r  	�	�	� n 	�	�	� 1  �w
�w 
txdl	� 1  �v
�v 
ascr	� o      �u�u 0 oldtids oldTIDs	� 	�	�	� r   +	�	�	� m   #	�	� �	�	�  	� n     	�	�	� 1  &*�t
�t 
txdl	� 1  #&�s
�s 
ascr	� 	�	�	� r  ,3	�	�	� c  ,1	�	�	� o  ,-�r�r 0 resulttexts resultTexts	� m  -0�q
�q 
ctxt	� o      �p�p 0 
resulttext 
resultText	� 	�	�	� r  4=	�	�	� o  45�o�o 0 oldtids oldTIDs	� n     	�	�	� 1  8<�n
�n 
txdl	� 1  58�m
�m 
ascr	� 	��l	� L  >@	�	� o  >?�k�k 0 
resulttext 
resultText�l  � �j	�
�j conscase	� �i	�
�i consdiac	� �h	�
�h conshyph	� �g	�
�g conspunc	� �f�e
�f conswhit�e  � �d�c
�d consnume�c  � R      �b	�	�
�b .ascrerr ****      � ****	� o      �a�a 0 etext eText	� �`	�	�
�` 
errn	� o      �_�_ 0 enumber eNumber	� �^	�	�
�^ 
erob	� o      �]�] 0 efrom eFrom	� �\	��[
�\ 
errt	� o      �Z�Z 
0 eto eTo�[  � I  I[�Y	��X�Y 
0 _error  	� 	�	�	� m  JM	�	� �	�	�  f o r m a t   t e x t	� 	�	�	� o  MN�W�W 0 etext eText	� 	�	�	� o  NO�V�V 0 enumber eNumber	� 	�	�	� o  OR�U�U 0 efrom eFrom	� 	��T	� o  RU�S�S 
0 eto eTo�T  �X  �  � 	�	�	� l     �R�Q�P�R  �Q  �P  	� 	�	�	� l     �O�N�M�O  �N  �M  	� 	�	�	� i  W Z	�	�	� I     �L	�	�
�L .Txt:NLiBnull���     ctxt	� o      �K�K 0 thetext theText	� �J	��I
�J 
LiBr	� |�H�G	��F	��H  �G  	� o      �E�E 0 linebreaktype lineBreakType�F  	� l     	��D�C	� m      �B
�B LiBrLiOX�D  �C  �I  	� Q     /	�	�	�	� L    	�	� I    �A	��@�A 0 	_jointext 	_joinText	� 	�	�	� n   	�	�	� 2   �?
�? 
cpar	� n   	�	�	� I   	 �>	��=�> "0 astextparameter asTextParameter	� 	�	�	� o   	 
�<�< 0 thetext theText	� 	��;	� m   
 	�	� �	�	�  �;  �=  	� o    	�:�: 0 _support  	� 	��9	� I    �8	��7�8 .0 _aslinebreakparameter _asLineBreakParameter	� 	�
 	� o    �6�6 0 linebreaktype lineBreakType
  
�5
 m    

 �

 
 u s i n g�5  �7  �9  �@  	� R      �4


�4 .ascrerr ****      � ****
 o      �3�3 0 etext eText
 �2


�2 
errn
 o      �1�1 0 enumber eNumber
 �0

	
�0 
erob
 o      �/�/ 0 efrom eFrom
	 �.

�-
�. 
errt

 o      �,�, 
0 eto eTo�-  	� I   % /�+
�*�+ 
0 _error  
 


 m   & '

 �

 * n o r m a l i z e   l i n e   b r e a k s
 


 o   ' (�)�) 0 etext eText
 


 o   ( )�(�( 0 enumber eNumber
 


 o   ) *�'�' 0 efrom eFrom
 
�&
 o   * +�%�% 
0 eto eTo�&  �*  	� 


 l     �$�#�"�$  �#  �"  
 


 l     �!� ��!  �   �  
 


 i  [ ^


 I     �

 
� .Txt:PadTnull���     ctxt
 o      �� 0 thetext theText
  �
!
"
� 
toPl
! o      �� 0 	textwidth 	textWidth
" �
#
$
� 
Char
# |��
%�
&�  �  
% o      �� 0 padtext padText�  
& l     
'��
' m      
(
( �
)
)                                  �  �  
$ �
*�
� 
From
* |��
+�
,�  �  
+ o      �� 0 whichend whichEnd�  
, l     
-��
- m      �
� LeTrLCha�  �  �  
 Q    
.
/
0
. k    �
1
1 
2
3
2 r    
4
5
4 n   
6
7
6 I    �

8�	�
 "0 astextparameter asTextParameter
8 
9
:
9 o    	�� 0 thetext theText
: 
;�
; m   	 

<
< �
=
=  �  �	  
7 o    �� 0 _support  
5 o      �� 0 thetext theText
3 
>
?
> r    
@
A
@ n   
B
C
B I    �
D�� (0 asintegerparameter asIntegerParameter
D 
E
F
E o    �� 0 	textwidth 	textWidth
F 
G�
G m    
H
H �
I
I  t o   p l a c e s�  �  
C o    � �  0 _support  
A o      ���� 0 	textwidth 	textWidth
? 
J
K
J r    &
L
M
L \    $
N
O
N o     ���� 0 	textwidth 	textWidth
O l    #
P����
P n    #
Q
R
Q 1   ! #��
�� 
leng
R o     !���� 0 thetext theText��  ��  
M o      ���� 0 
widthtoadd 
widthToAdd
K 
S
T
S Z  ' 3
U
V����
U B   ' *
W
X
W o   ' (���� 0 
widthtoadd 
widthToAdd
X m   ( )����  
V L   - /
Y
Y o   - .���� 0 thetext theText��  ��  
T 
Z
[
Z r   4 A
\
]
\ n  4 ?
^
_
^ I   9 ?��
`���� "0 astextparameter asTextParameter
` 
a
b
a o   9 :���� 0 padtext padText
b 
c��
c m   : ;
d
d �
e
e 
 u s i n g��  ��  
_ o   4 9���� 0 _support  
] o      ���� 0 padtext padText
[ 
f
g
f r   B G
h
i
h n  B E
j
k
j 1   C E��
�� 
leng
k o   B C���� 0 padtext padText
i o      ���� 0 padsize padSize
g 
l
m
l Z  H \
n
o����
n =   H M
p
q
p n  H K
r
s
r 1   I K��
�� 
leng
s o   H I���� 0 padtext padText
q m   K L����  
o R   P X��
t
u
�� .ascrerr ****      � ****
t m   V W
v
v �
w
w f I n v a l i d    u s i n g    p a r a m e t e r   ( e m p t y   t e x t   n o t   a l l o w e d ) .
u ��
x
y
�� 
errn
x m   R S�����Y
y ��
z��
�� 
erob
z o   T U���� 0 padtext padText��  ��  ��  
m 
{
|
{ V   ] s
}
~
} r   i n

�
 b   i l
�
�
� o   i j���� 0 padtext padText
� o   j k���� 0 padtext padText
� o      ���� 0 padtext padText
~ A   a h
�
�
� n  a d
�
�
� 1   b d��
�� 
leng
� o   a b���� 0 padtext padText
� l  d g
�����
� [   d g
�
�
� o   d e���� 0 
widthtoadd 
widthToAdd
� o   e f���� 0 padsize padSize��  ��  
| 
���
� Z   t �
�
�
�
�
� =  t w
�
�
� o   t u���� 0 whichend whichEnd
� m   u v��
�� LeTrLCha
� L   z �
�
� b   z �
�
�
� l  z �
�����
� n  z �
�
�
� 7  { ���
�
�
�� 
ctxt
� m    ����� 
� o   � ����� 0 
widthtoadd 
widthToAdd
� o   z {���� 0 padtext padText��  ��  
� o   � ����� 0 thetext theText
� 
�
�
� =  � �
�
�
� o   � ����� 0 whichend whichEnd
� m   � ���
�� LeTrTCha
� 
�
�
� k   � �
�
� 
�
�
� r   � �
�
�
� `   � �
�
�
� l  � �
�����
� n  � �
�
�
� 1   � ���
�� 
leng
� o   � ����� 0 thetext theText��  ��  
� o   � ����� 0 padsize padSize
� o      ���� 0 	padoffset 	padOffset
� 
���
� L   � �
�
� b   � �
�
�
� o   � ����� 0 thetext theText
� l  � �
�����
� n  � �
�
�
� 7  � ���
�
�
�� 
ctxt
� l  � �
�����
� [   � �
�
�
� m   � ����� 
� o   � ����� 0 	padoffset 	padOffset��  ��  
� l  � �
�����
� [   � �
�
�
� o   � ����� 0 	padoffset 	padOffset
� o   � ����� 0 
widthtoadd 
widthToAdd��  ��  
� o   � ����� 0 padtext padText��  ��  ��  
� 
�
�
� =  � �
�
�
� o   � ����� 0 whichend whichEnd
� m   � ���
�� LeTrBCha
� 
���
� k   � �
�
� 
�
�
� Z  � �
�
�����
� ?   � �
�
�
� o   � ����� 0 
widthtoadd 
widthToAdd
� m   � ����� 
� r   � �
�
�
� b   � �
�
�
� n  � �
�
�
� 7  � ���
�
�
�� 
ctxt
� m   � ����� 
� l  � �
�����
� _   � �
�
�
� o   � ����� 0 
widthtoadd 
widthToAdd
� m   � ����� ��  ��  
� o   � ����� 0 padtext padText
� o   � ����� 0 thetext theText
� o      ���� 0 thetext theText��  ��  
� 
�
�
� r   � �
�
�
� `   � �
�
�
� l  � �
�����
� n  � �
�
�
� 1   � ���
�� 
leng
� o   � ����� 0 thetext theText��  ��  
� o   � ����� 0 padsize padSize
� o      ���� 0 	padoffset 	padOffset
� 
���
� L   � �
�
� b   � �
�
�
� o   � ����� 0 thetext theText
� l  � �
�����
� n  � �
�
�
� 7  � ���
�
�
�� 
ctxt
� l  � �
�����
� [   � �
�
�
� m   � ����� 
� o   � ����� 0 	padoffset 	padOffset��  ��  
� l  � �
�����
� [   � �
�
�
� o   � ����� 0 	padoffset 	padOffset
� _   � �
�
�
� l  � �
�����
� [   � �
�
�
� o   � ����� 0 
widthtoadd 
widthToAdd
� m   � ����� ��  ��  
� m   � ����� ��  ��  
� o   � ����� 0 padtext padText��  ��  ��  ��  
� n  � �
�
�
� I   � ���
����� >0 throwinvalidconstantparameter throwInvalidConstantParameter
� 
�
�
� o   � ����� 0 whichend whichEnd
� 
���
� m   � �
�
� �
�
�  a d d i n g��  ��  
� o   � ����� 0 _support  ��  
/ R      ��
�
�
�� .ascrerr ****      � ****
� o      ���� 0 etext eText
� ��
�
�
�� 
errn
� o      ���� 0 enumber eNumber
� ��
�
�
�� 
erob
� o      ���� 0 efrom eFrom
� ��
���
�� 
errt
� o      ���� 
0 eto eTo��  
0 I  ��
���� 
0 _error  
� 
�
�
� m  
�
� �
�
�  p a d   t e x t
�    o  	�~�~ 0 etext eText  o  	
�}�} 0 enumber eNumber  o  
�|�| 0 efrom eFrom �{ o  �z�z 
0 eto eTo�{  �  
  l     �y�x�w�y  �x  �w   	
	 l     �v�u�t�v  �u  �t  
  i  _ b I     �s
�s .Txt:SliTnull���     ctxt o      �r�r 0 thetext theText �q
�q 
FIdx |�p�o�n�p  �o   o      �m�m 0 
startindex 
startIndex�n   l     �l�k m      �j
�j 
msng�l  �k   �i�h
�i 
TIdx |�g�f�e�g  �f   o      �d�d 0 endindex endIndex�e   l     �c�b m      �a
�a 
msng�c  �b  �h   Q    � k   �  r     !  n   "#" I    �`$�_�` "0 astextparameter asTextParameter$ %&% o    	�^�^ 0 thetext theText& '�]' m   	 
(( �))  �]  �_  # o    �\�\ 0 _support  ! o      �[�[ 0 thetext theText *+* r    ,-, n   ./. 1    �Z
�Z 
leng/ o    �Y�Y 0 thetext theText- o      �X�X 0 	thelength 	theLength+ 010 Z    I23�W�V2 =    454 o    �U�U 0 	thelength 	theLength5 m    �T�T  3 k    E66 787 l   �S9:�S  9 � � note: index 0 is always disallowed as its position is ambiguous, being both before index 1 at start of text and after index -1 at end of text   : �;;   n o t e :   i n d e x   0   i s   a l w a y s   d i s a l l o w e d   a s   i t s   p o s i t i o n   i s   a m b i g u o u s ,   b e i n g   b o t h   b e f o r e   i n d e x   1   a t   s t a r t   o f   t e x t   a n d   a f t e r   i n d e x   - 1   a t   e n d   o f   t e x t8 <=< Z   />?�R�Q> =     @A@ o    �P�P 0 
startindex 
startIndexA m    �O�O  ? R   # +�NBC
�N .ascrerr ****      � ****B m   ) *DD �EE Z I n v a l i d   i n d e x   (  f r o m    p a r a m e t e r   c a n n o t   b e   0 ) .C �MFG
�M 
errnF m   % &�L�L�YG �KH�J
�K 
erobH o   ' (�I�I 0 
startindex 
startIndex�J  �R  �Q  = IJI Z  0 BKL�H�GK =   0 3MNM o   0 1�F�F 0 endindex endIndexN m   1 2�E�E  L R   6 >�DOP
�D .ascrerr ****      � ****O m   < =QQ �RR V I n v a l i d   i n d e x   (  t o    p a r a m e t e r   c a n n o t   b e   0 ) .P �CST
�C 
errnS m   8 9�B�B�YT �AU�@
�A 
erobU o   : ;�?�? 0 endindex endIndex�@  �H  �G  J V�>V L   C EWW m   C DXX �YY  �>  �W  �V  1 Z[Z Z   J �\]^�=\ >  J M_`_ o   J K�<�< 0 
startindex 
startIndex` m   K L�;
�; 
msng] k   P �aa bcb r   P ]ded n  P [fgf I   U [�:h�9�: (0 asintegerparameter asIntegerParameterh iji o   U V�8�8 0 
startindex 
startIndexj k�7k m   V Wll �mm  f r o m�7  �9  g o   P U�6�6 0 _support  e o      �5�5 0 
startindex 
startIndexc non Z  ^ ppq�4�3p =   ^ arsr o   ^ _�2�2 0 
startindex 
startIndexs m   _ `�1�1  q R   d l�0tu
�0 .ascrerr ****      � ****t m   j kvv �ww Z I n v a l i d   i n d e x   (  f r o m    p a r a m e t e r   c a n n o t   b e   0 ) .u �/xy
�/ 
errnx m   f g�.�.�Yy �-z�,
�- 
erobz o   h i�+�+ 0 
startindex 
startIndex�,  �4  �3  o {�*{ Z   q �|}�)�(| =  q t~~ o   q r�'�' 0 endindex endIndex m   r s�&
�& 
msng} Z   w ������ A   w {��� o   w x�%�% 0 
startindex 
startIndex� d   x z�� o   x y�$�$ 0 	thelength 	theLength� L   ~ ��� o   ~ �#�# 0 thetext theText� ��� ?   � ���� o   � ��"�" 0 
startindex 
startIndex� o   � ��!�! 0 	thelength 	theLength� �� � L   � ��� m   � ��� ���  �   � L   � ��� n  � ���� 7  � ����
� 
ctxt� o   � ��� 0 
startindex 
startIndex� m   � ������ o   � ��� 0 thetext theText�)  �(  �*  ^ ��� =  � ���� o   � ��� 0 endindex endIndex� m   � ��
� 
msng� ��� R   � ����
� .ascrerr ****      � ****� m   � ��� ��� J M i s s i n g    f r o m    a n d / o r    t o    p a r a m e t e r .� ���
� 
errn� m   � ����[�  �  �=  [ ��� Z   ������ >  � ���� o   � ��� 0 endindex endIndex� m   � ��
� 
msng� k   ��� ��� r   � ���� n  � ���� I   � ����� (0 asintegerparameter asIntegerParameter� ��� o   � ��� 0 endindex endIndex� ��� m   � ��� ���  t o�  �  � o   � ��� 0 _support  � o      �� 0 endindex endIndex� ��� Z  � ����
�	� =   � ���� o   � ��� 0 endindex endIndex� m   � ���  � R   � ����
� .ascrerr ****      � ****� m   � ��� ��� V I n v a l i d   i n d e x   (  t o    p a r a m e t e r   c a n n o t   b e   0 ) .� ���
� 
errn� m   � ����Y� ���
� 
erob� o   � ��� 0 endindex endIndex�  �
  �	  � �� � Z   �������� =  � ���� o   � ����� 0 
startindex 
startIndex� m   � ���
�� 
msng� Z   ������ A   � ���� o   � ����� 0 endindex endIndex� d   � ��� o   � ����� 0 	thelength 	theLength� L   � ��� m   � ��� ���  � ��� ?   � ���� o   � ����� 0 endindex endIndex� o   � ����� 0 	thelength 	theLength� ���� L   � ��� o   � ����� 0 thetext theText��  � L  �� n ��� 7 ����
�� 
ctxt� m  ���� � o  	���� 0 endindex endIndex� o  ���� 0 thetext theText��  ��  �   �  �  � ��� l ������  � + % both start and end indexes are given   � ��� J   b o t h   s t a r t   a n d   e n d   i n d e x e s   a r e   g i v e n� ��� Z (������� A  ��� o  ���� 0 
startindex 
startIndex� m  ����  � r  $��� [  "��� [   ��� o  ���� 0 	thelength 	theLength� m  ���� � o   !���� 0 
startindex 
startIndex� o      ���� 0 
startindex 
startIndex��  ��  � ��� Z ):������� A  ),��� o  )*���� 0 endindex endIndex� m  *+����  � r  /6��� [  /4��� [  /2��� o  /0���� 0 	thelength 	theLength� m  01���� � o  23���� 0 endindex endIndex� o      ���� 0 endindex endIndex��  ��  � ��� Z ;q������� G  ;f��� G  ;R��� ?  ;>��� o  ;<���� 0 
startindex 
startIndex� o  <=���� 0 endindex endIndex� F  AN   A  AD o  AB���� 0 
startindex 
startIndex m  BC����  A  GJ o  GH���� 0 endindex endIndex l 
HI���� m  HI���� ��  ��  � F  Ub ?  UX	
	 o  UV���� 0 
startindex 
startIndex
 o  VW���� 0 	thelength 	theLength ?  [^ o  [\���� 0 endindex endIndex o  \]���� 0 	thelength 	theLength� L  im m  il �  ��  ��  �  Z  r��� A  ru o  rs���� 0 
startindex 
startIndex m  st����  r  x{ m  xy����  o      ���� 0 
startindex 
startIndex  ?  ~� o  ~���� 0 
startindex 
startIndex o  ����� 0 	thelength 	theLength �� r  �� o  ������ 0 	thelength 	theLength o      ���� 0 
startindex 
startIndex��  ��    !  Z  ��"#$��" A  ��%&% o  ������ 0 endindex endIndex& m  ������ # r  ��'(' m  ������ ( o      ���� 0 endindex endIndex$ )*) ?  ��+,+ o  ������ 0 endindex endIndex, o  ������ 0 	thelength 	theLength* -��- r  ��./. o  ������ 0 	thelength 	theLength/ o      ���� 0 endindex endIndex��  ��  ! 0��0 L  ��11 n  ��232 7 ����45
�� 
ctxt4 o  ������ 0 
startindex 
startIndex5 o  ������ 0 endindex endIndex3 o  ������ 0 thetext theText��   R      ��67
�� .ascrerr ****      � ****6 o      ���� 0 etext eText7 ��89
�� 
errn8 o      ���� 0 enumber eNumber9 ��:;
�� 
erob: o      ���� 0 efrom eFrom; ��<��
�� 
errt< o      ���� 
0 eto eTo��   I  ����=���� 
0 _error  = >?> m  ��@@ �AA  s l i c e   t e x t? BCB o  ������ 0 etext eTextC DED o  ������ 0 enumber eNumberE FGF o  ������ 0 efrom eFromG H��H o  ������ 
0 eto eTo��  ��   IJI l     ��������  ��  ��  J KLK l     ��������  ��  ��  L MNM i  c fOPO I     ��QR
�� .Txt:TrmTnull���     ctxtQ o      ���� 0 thetext theTextR ��S��
�� 
FromS |����T��U��  ��  T o      ���� 0 whichend whichEnd��  U l     V����V m      ��
�� LeTrBCha��  ��  ��  P Q     �WXYW k    �ZZ [\[ r    ]^] n   _`_ I    ��a���� "0 astextparameter asTextParametera bcb o    	���� 0 thetext theTextc d��d m   	 
ee �ff  ��  ��  ` o    ���� 0 _support  ^ o      ���� 0 thetext theText\ ghg Z    -ij����i H    kk E   lml J    nn opo m    ��
�� LeTrLChap qrq m    ��
�� LeTrTChar s��s m    ��
�� LeTrBCha��  m J    tt u��u o    ���� 0 whichend whichEnd��  j n   )vwv I   # )��x���� >0 throwinvalidconstantparameter throwInvalidConstantParameterx yzy o   # $���� 0 whichend whichEndz {��{ m   $ %|| �}}  r e m o v i n g��  ��  w o    #���� 0 _support  ��  ��  h ~��~ P   . ��� k   3 ��� ��� l  3 ?���� Z  3 ?������� =  3 6��� o   3 4���� 0 thetext theText� m   4 5�� ���  � L   9 ;�� m   9 :�� ���  ��  ��  � H B check if theText is empty or contains white space characters only   � ��� �   c h e c k   i f   t h e T e x t   i s   e m p t y   o r   c o n t a i n s   w h i t e   s p a c e   c h a r a c t e r s   o n l y� ��� r   @ S��� J   @ D�� ��� m   @ A���� � ���� m   A B������  � J      �� ��� o      �~�~ 0 
startindex 
startIndex� ��}� o      �|�| 0 endindex endIndex�}  � ��� Z   T x���{�z� E  T \��� J   T X�� ��� m   T U�y
�y LeTrLCha� ��x� m   U V�w
�w LeTrBCha�x  � J   X [�� ��v� o   X Y�u�u 0 whichend whichEnd�v  � V   _ t��� r   j o��� [   j m��� o   j k�t�t 0 
startindex 
startIndex� m   k l�s�s � o      �r�r 0 
startindex 
startIndex� =  c i��� n   c g��� 4   d g�q�
�q 
cha � o   e f�p�p 0 
startindex 
startIndex� o   c d�o�o 0 thetext theText� m   g h�� ���  �{  �z  � ��� Z   y ����n�m� E  y ���� J   y }�� ��� m   y z�l
�l LeTrTCha� ��k� m   z {�j
�j LeTrBCha�k  � J   } ��� ��i� o   } ~�h�h 0 whichend whichEnd�i  � V   � ���� r   � ���� \   � ���� o   � ��g�g 0 endindex endIndex� m   � ��f�f � o      �e�e 0 endindex endIndex� =  � ���� n   � ���� 4   � ��d�
�d 
cha � o   � ��c�c 0 endindex endIndex� o   � ��b�b 0 thetext theText� m   � ��� ���  �n  �m  � ��a� L   � ��� n   � ���� 7  � ��`��
�` 
ctxt� o   � ��_�_ 0 
startindex 
startIndex� o   � ��^�^ 0 endindex endIndex� o   � ��]�] 0 thetext theText�a  � �\�
�\ conscase� �[�
�[ consdiac� �Z�
�Z conshyph� �Y�X
�Y conspunc�X  � �W�
�W consnume� �V�U
�V conswhit�U  ��  X R      �T��
�T .ascrerr ****      � ****� o      �S�S 0 etext eText� �R��
�R 
errn� o      �Q�Q 0 enumber eNumber� �P��
�P 
erob� o      �O�O 0 efrom eFrom� �N��M
�N 
errt� o      �L�L 
0 eto eTo�M  Y I   � ��K��J�K 
0 _error  � ��� m   � ��� ���  t r i m   t e x t� ��� o   � ��I�I 0 etext eText� ��� o   � ��H�H 0 enumber eNumber� ��� o   � ��G�G 0 efrom eFrom� ��F� o   � ��E�E 
0 eto eTo�F  �J  N ��� l     �D�C�B�D  �C  �B  � ��� l     �A�@�?�A  �@  �?  � ��� l     �>���>  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �=���=  �   Split and Join Suite   � ��� *   S p l i t   a n d   J o i n   S u i t e� ��� l     �<�;�:�<  �;  �:  � ��� i  g j� � I      �9�8�9 .0 _aslinebreakparameter _asLineBreakParameter  o      �7�7 0 linebreaktype lineBreakType �6 o      �5�5 0 parametername parameterName�6  �8    l    / Z     /	
 =     o     �4�4 0 linebreaktype lineBreakType m    �3
�3 LiBrLiOX	 L    	 1    �2
�2 
lnfd
  =    o    �1�1 0 linebreaktype lineBreakType m    �0
�0 LiBrLiCM  L     o    �/
�/ 
ret   =    o    �.�. 0 linebreaktype lineBreakType m    �-
�- LiBrLiWi �, L    ! b      o    �+
�+ 
ret  1    �*
�* 
lnfd�,   n  $ / I   ) /�) �(�) >0 throwinvalidconstantparameter throwInvalidConstantParameter  !"! o   ) *�'�' 0 linebreaktype lineBreakType" #�&# o   * +�%�% 0 parametername parameterName�&  �(   o   $ )�$�$ 0 _support   < 6 used by `join paragraphs` and `normalize line breaks`    �$$ l   u s e d   b y   ` j o i n   p a r a g r a p h s `   a n d   ` n o r m a l i z e   l i n e   b r e a k s `� %&% l     �#�"�!�#  �"  �!  & '(' l     � ���   �  �  ( )*) i  k n+,+ I      �-�� 0 
_splittext 
_splitText- ./. o      �� 0 thetext theText/ 0�0 o      �� 0 theseparator theSeparator�  �  , l    ^1231 k     ^44 565 r     787 n    
9:9 I    
�;�� "0 aslistparameter asListParameter; <�< o    �� 0 theseparator theSeparator�  �  : o     �� 0 _support  8 o      �� 0 delimiterlist delimiterList6 =>= X    C?�@? Q    >ABCA l    )DEFD r     )GHG c     %IJI n     #KLK 1   ! #�
� 
pcntL o     !�� 0 aref aRefJ m   # $�
� 
ctxtH n      MNM 1   & (�
� 
pcntN o   % &�� 0 aref aRefE�� caution: AS silently ignores invalid TID values, so separator items must be explicitly validated to catch any user errors; for now, just coerce to text and catch errors, but might want to make it more rigorous in future (e.g. if a list of lists is given, should sublist be treated as an error instead of just coercing it to text, which is itself TIDs sensitive); see also existing TODO on TypeSupport's asTextParameter handler   F �OOV   c a u t i o n :   A S   s i l e n t l y   i g n o r e s   i n v a l i d   T I D   v a l u e s ,   s o   s e p a r a t o r   i t e m s   m u s t   b e   e x p l i c i t l y   v a l i d a t e d   t o   c a t c h   a n y   u s e r   e r r o r s ;   f o r   n o w ,   j u s t   c o e r c e   t o   t e x t   a n d   c a t c h   e r r o r s ,   b u t   m i g h t   w a n t   t o   m a k e   i t   m o r e   r i g o r o u s   i n   f u t u r e   ( e . g .   i f   a   l i s t   o f   l i s t s   i s   g i v e n ,   s h o u l d   s u b l i s t   b e   t r e a t e d   a s   a n   e r r o r   i n s t e a d   o f   j u s t   c o e r c i n g   i t   t o   t e x t ,   w h i c h   i s   i t s e l f   T I D s   s e n s i t i v e ) ;   s e e   a l s o   e x i s t i n g   T O D O   o n   T y p e S u p p o r t ' s   a s T e x t P a r a m e t e r   h a n d l e rB R      ��P
� .ascrerr ****      � ****�  P �
Q�	
�
 
errnQ d      RR m      ����	  C n  1 >STS I   6 >�U�� 60 throwinvalidparametertype throwInvalidParameterTypeU VWV o   6 7�� 0 aref aRefW XYX m   7 8ZZ �[[ 
 u s i n gY \]\ m   8 9�
� 
ctxt] ^�^ m   9 :__ �``  l i s t   o f   t e x t�  �  T o   1 6�� 0 _support  � 0 aref aRef@ o    �� 0 delimiterlist delimiterList> aba r   D Icdc n  D Gefe 1   E G� 
�  
txdlf 1   D E��
�� 
ascrd o      ���� 0 oldtids oldTIDsb ghg r   J Oiji o   J K���� 0 delimiterlist delimiterListj n     klk 1   L N��
�� 
txdll 1   K L��
�� 
ascrh mnm r   P Uopo n   P Sqrq 2  Q S��
�� 
citmr o   P Q���� 0 thetext theTextp o      ���� 0 
resultlist 
resultListn sts r   V [uvu o   V W���� 0 oldtids oldTIDsv n     wxw 1   X Z��
�� 
txdlx 1   W X��
�� 
ascrt y��y L   \ ^zz o   \ ]���� 0 
resultlist 
resultList��  2 � � used by `split text` to split text using one or more text item delimiters and current or predefined considering/ignoring settings   3 �{{   u s e d   b y   ` s p l i t   t e x t `   t o   s p l i t   t e x t   u s i n g   o n e   o r   m o r e   t e x t   i t e m   d e l i m i t e r s   a n d   c u r r e n t   o r   p r e d e f i n e d   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s* |}| l     ��������  ��  ��  } ~~ l     ��������  ��  ��   ��� i  o r��� I      ������� 0 _splitpattern _splitPattern� ��� o      ���� 0 thetext theText� ���� o      ���� 0 patterntext patternText��  ��  � l    ����� k     ��� ��� Z    ������� =     ��� l    	������ I    	����
�� .corecnte****       ****� J     �� ���� o     ���� 0 patterntext patternText��  � �����
�� 
kocl� m    ��
�� 
list��  ��  ��  � m   	 
���� � r    ��� I   ����
�� .Txt:JoiTnull���     ****� o    ���� 0 patterntext patternText� �����
�� 
Sepa� m    �� ���  |��  � o      ���� 0 patterntext patternText��  ��  � ��� r    *��� n   (��� I   ! (������� @0 asnsregularexpressionparameter asNSRegularExpressionParameter� ��� o   ! "���� 0 patterntext patternText� ��� m   " #����  � ���� m   # $�� ���  a t��  ��  � o    !���� 0 _support  � o      ���� 0 asocpattern asocPattern� ��� r   + 7��� n  + 5��� I   0 5������� ,0 asnormalizednsstring asNormalizedNSString� ���� o   0 1���� 0 thetext theText��  ��  � o   + 0���� 0 _support  � o      ���� 0 
asocstring 
asocString� ��� l  8 ;���� r   8 ;��� m   8 9����  � o      ���� &0 asocnonmatchstart asocNonMatchStart� G A used to calculate NSRanges for non-matching portions of NSString   � ��� �   u s e d   t o   c a l c u l a t e   N S R a n g e s   f o r   n o n - m a t c h i n g   p o r t i o n s   o f   N S S t r i n g� ��� r   < @��� J   < >����  � o      ���� 0 
resultlist 
resultList� ��� l  A A������  � @ : iterate over each non-matched + matched range in NSString   � ��� t   i t e r a t e   o v e r   e a c h   n o n - m a t c h e d   +   m a t c h e d   r a n g e   i n   N S S t r i n g� ��� r   A R��� n  A P��� I   B P������� @0 matchesinstring_options_range_ matchesInString_options_range_� ��� o   B C���� 0 
asocstring 
asocString� ��� m   C D����  � ���� J   D L�� ��� m   D E����  � ���� n  E J��� I   F J�������� 
0 length  ��  ��  � o   E F���� 0 
asocstring 
asocString��  ��  ��  � o   A B���� 0 asocpattern asocPattern� o      ����  0 asocmatcharray asocMatchArray� ��� Y   S ��������� k   c ��� ��� r   c p��� l  c n������ n  c n��� I   i n������� 0 rangeatindex_ rangeAtIndex_� ���� m   i j����  ��  ��  � l  c i������ n  c i��� I   d i�������  0 objectatindex_ objectAtIndex_� ���� o   d e���� 0 i  ��  ��  � o   c d����  0 asocmatcharray asocMatchArray��  ��  ��  ��  � o      ����  0 asocmatchrange asocMatchRange� ��� r   q x��� n  q v��� I   r v�������� 0 location  ��  ��  � o   q r����  0 asocmatchrange asocMatchRange� o      ����  0 asocmatchstart asocMatchStart� ��� r   y ���� c   y ���� l  y ������� n  y ���� I   z �������� *0 substringwithrange_ substringWithRange_� ���� K   z ��� ������ 0 location  � o   { |���� &0 asocnonmatchstart asocNonMatchStart� �� ���� 
0 length    \   } � o   } ~����  0 asocmatchstart asocMatchStart o   ~ ���� &0 asocnonmatchstart asocNonMatchStart��  ��  ��  � o   y z���� 0 
asocstring 
asocString��  ��  � m   � ���
�� 
ctxt� n        ;   � � o   � ����� 0 
resultlist 
resultList� �� r   � � [   � �	 o   � �����  0 asocmatchstart asocMatchStart	 l  � �
����
 n  � � I   � ��������� 
0 length  ��  ��   o   � �����  0 asocmatchrange asocMatchRange��  ��   o      ���� &0 asocnonmatchstart asocNonMatchStart��  �� 0 i  � m   V W����  � \   W ^ l  W \���� n  W \ I   X \�������� 	0 count  ��  ��   o   W X����  0 asocmatcharray asocMatchArray��  ��   m   \ ]���� ��  �  l  � �����   "  add final non-matched range    � 8   a d d   f i n a l   n o n - m a t c h e d   r a n g e  r   � � c   � � l  � ����� n  � � I   � ��� ���� *0 substringfromindex_ substringFromIndex_  !�! o   � ��~�~ &0 asocnonmatchstart asocNonMatchStart�  ��   o   � ��}�} 0 
asocstring 
asocString��  ��   m   � ��|
�| 
ctxt n      "#"  ;   � �# o   � ��{�{ 0 
resultlist 
resultList $%$ l  � �&'(& Z  � �)*�z�y) F   � �+,+ =   � �-.- n  � �/0/ 1   � ��x
�x 
leng0 o   � ��w�w 0 
resultlist 
resultList. m   � ��v�v , =   � �121 n  � �343 1   � ��u
�u 
leng4 n  � �565 4   � ��t7
�t 
cobj7 m   � ��s�s 6 o   � ��r�r 0 
resultlist 
resultList2 m   � ��q�q  * L   � �88 J   � ��p�p  �z  �y  ' U O for consistency with _splitText(), where `text items of ""` returns empty list   ( �99 �   f o r   c o n s i s t e n c y   w i t h   _ s p l i t T e x t ( ) ,   w h e r e   ` t e x t   i t e m s   o f   " " `   r e t u r n s   e m p t y   l i s t% :�o: L   � �;; o   � ��n�n 0 
resultlist 
resultList�o  � Q K used by `split text` to split text using a regular expression as separator   � �<< �   u s e d   b y   ` s p l i t   t e x t `   t o   s p l i t   t e x t   u s i n g   a   r e g u l a r   e x p r e s s i o n   a s   s e p a r a t o r� =>= l     �m�l�k�m  �l  �k  > ?@? l     �j�i�h�j  �i  �h  @ ABA i  s vCDC I      �gE�f�g 0 	_jointext 	_joinTextE FGF o      �e�e 0 thelist theListG H�dH o      �c�c 0 separatortext separatorText�d  �f  D k     5II JKJ r     LML n    NON 1    �b
�b 
txdlO 1     �a
�a 
ascrM o      �`�` 0 oldtids oldTIDsK PQP r    RSR o    �_�_ 0 separatortext separatorTextS n     TUT 1    
�^
�^ 
txdlU 1    �]
�] 
ascrQ VWV Q    ,XYZX r    [\[ c    ]^] o    �\�\ 0 thelist theList^ m    �[
�[ 
ctxt\ o      �Z�Z 0 
resulttext 
resultTextY R      �Y�X_
�Y .ascrerr ****      � ****�X  _ �W`�V
�W 
errn` d      aa m      �U�U��V  Z k    ,bb cdc r    !efe o    �T�T 0 oldtids oldTIDsf n     ghg 1     �S
�S 
txdlh 1    �R
�R 
ascrd i�Qi R   " ,�Pjk
�P .ascrerr ****      � ****j m   * +ll �mm b I n v a l i d   d i r e c t   p a r a m e t e r   ( e x p e c t e d   l i s t   o f   t e x t ) .k �Ono
�O 
errnn m   $ %�N�N�Yo �Mpq
�M 
erobp o   & '�L�L 0 thelist theListq �Kr�J
�K 
errtr m   ( )�I
�I 
list�J  �Q  W sts r   - 2uvu o   - .�H�H 0 oldtids oldTIDsv n     wxw 1   / 1�G
�G 
txdlx 1   . /�F
�F 
ascrt y�Ey L   3 5zz o   3 4�D�D 0 
resulttext 
resultText�E  B {|{ l     �C�B�A�C  �B  �A  | }~} l     �@�?�>�@  �?  �>  ~ � l     �=���=  �  -----   � ��� 
 - - - - -� ��� l     �<�;�:�<  �;  �:  � ��� i  w z��� I     �9��
�9 .Txt:SplTnull���     ctxt� o      �8�8 0 thetext theText� �7��
�7 
Sepa� |�6�5��4��6  �5  � o      �3�3 0 theseparator theSeparator�4  � l     ��2�1� m      �0
�0 
msng�2  �1  � �/��.
�/ 
Usin� |�-�,��+��-  �,  � o      �*�* 0 matchformat matchFormat�+  � l     ��)�(� m      �'
�' SerECmpI�)  �(  �.  � k     ��� ��� l     �&���&  � � � convenience handler for splitting text using TIDs that can also use a regular expression pattern as separator; similar to Python's str.split()   � ���   c o n v e n i e n c e   h a n d l e r   f o r   s p l i t t i n g   t e x t   u s i n g   T I D s   t h a t   c a n   a l s o   u s e   a   r e g u l a r   e x p r e s s i o n   p a t t e r n   a s   s e p a r a t o r ;   s i m i l a r   t o   P y t h o n ' s   s t r . s p l i t ( )� ��%� Q     ����� k    ��� ��� r    ��� n   ��� I    �$��#�$ "0 astextparameter asTextParameter� ��� o    	�"�" 0 thetext theText� ��!� m   	 
�� ���  �!  �#  � o    � �  0 _support  � o      �� 0 thetext theText� ��� Z    ����� =    ��� n   ��� 1    �
� 
leng� o    �� 0 thetext theText� m    ��  � L    �� J    ��  �  �  � ��� Z   ! ������ =  ! $��� o   ! "�� 0 theseparator theSeparator� m   " #�
� 
msng� l  ' 3���� L   ' 3�� I   ' 2���� 0 _splitpattern _splitPattern� ��� I  ( -���
� .Txt:TrmTnull���     ctxt� o   ( )�� 0 thetext theText�  � ��� m   - .�� ���  \ s +�  �  � � � if `at` parameter is omitted, trim ends then then split on whitespace runs, same as Python's str.split() default behavior (any `using` options are ignored)   � ���8   i f   ` a t `   p a r a m e t e r   i s   o m i t t e d ,   t r i m   e n d s   t h e n   t h e n   s p l i t   o n   w h i t e s p a c e   r u n s ,   s a m e   a s   P y t h o n ' s   s t r . s p l i t ( )   d e f a u l t   b e h a v i o r   ( a n y   ` u s i n g `   o p t i o n s   a r e   i g n o r e d )� ��� =  6 9��� o   6 7�� 0 matchformat matchFormat� m   7 8�
� SerECmpI� ��� P   < J���� L   A I�� I   A H���� 0 
_splittext 
_splitText� ��� o   B C�� 0 thetext theText� ��
� o   C D�	�	 0 theseparator theSeparator�
  �  � ��
� consdiac� ��
� conshyph� ��
� conspunc� ��
� conswhit� ��
� consnume�  � ��
� conscase�  � ��� =  M P��� o   M N� �  0 matchformat matchFormat� m   N O��
�� SerECmpP� ��� L   S [�� I   S Z������� 0 _splitpattern _splitPattern� ��� o   T U���� 0 thetext theText� ���� o   U V���� 0 theseparator theSeparator��  ��  � ��� =  ^ a��� o   ^ _���� 0 matchformat matchFormat� m   _ `��
�� SerECmpC� ��� P   d r����� L   i q�� I   i p������� 0 
_splittext 
_splitText� ��� o   j k���� 0 thetext theText� ���� o   k l���� 0 theseparator theSeparator��  ��  � ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ���
�� conswhit� ����
�� consnume��  ��  � ��� =  u x��� o   u v���� 0 matchformat matchFormat� m   v w��
�� SerECmpE� ��� P   { ����� L   � �   I   � ������� 0 
_splittext 
_splitText  o   � ����� 0 thetext theText �� o   � ����� 0 theseparator theSeparator��  ��  � ��
�� conscase ��
�� consdiac ��
�� conshyph ��
�� conspunc ����
�� conswhit��  � ����
�� consnume��  � 	
	 =  � � o   � ����� 0 matchformat matchFormat m   � ���
�� SerECmpD
 �� L   � � I   � ������� 0 
_splittext 
_splitText  o   � ����� 0 thetext theText �� o   � ����� 0 theseparator theSeparator��  ��  ��  � n  � � I   � ������� >0 throwinvalidconstantparameter throwInvalidConstantParameter  o   � ����� 0 matchformat matchFormat �� m   � � � 
 u s i n g��  ��   o   � ����� 0 _support  �  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber �� 
�� 
erob o      ���� 0 efrom eFrom  ��!��
�� 
errt! o      ���� 
0 eto eTo��  � I   � ���"���� 
0 _error  " #$# m   � �%% �&&  s p l i t   t e x t$ '(' o   � ����� 0 etext eText( )*) o   � ����� 0 enumber eNumber* +,+ o   � ����� 0 efrom eFrom, -��- o   � ����� 
0 eto eTo��  ��  �%  � ./. l     ��������  ��  ��  / 010 l     ��������  ��  ��  1 232 i  { ~454 I     ��67
�� .Txt:JoiTnull���     ****6 o      ���� 0 thelist theList7 ��8��
�� 
Sepa8 |����9��:��  ��  9 o      ���� 0 separatortext separatorText��  : m      ;; �<<  ��  5 Q     0=>?= L    @@ I    ��A���� 0 	_jointext 	_joinTextA BCB n   DED I   	 ��F���� "0 aslistparameter asListParameterF G��G o   	 
���� 0 thelist theList��  ��  E o    	���� 0 _support  C H��H n   IJI I    ��K���� "0 astextparameter asTextParameterK LML o    ���� 0 separatortext separatorTextM N��N m    OO �PP 
 u s i n g��  ��  J o    ���� 0 _support  ��  ��  > R      ��QR
�� .ascrerr ****      � ****Q o      ���� 0 etext eTextR ��ST
�� 
errnS o      ���� 0 enumber eNumberT ��UV
�� 
erobU o      ���� 0 efrom eFromV ��W��
�� 
errtW o      ���� 
0 eto eTo��  ? I   & 0��X���� 
0 _error  X YZY m   ' ([[ �\\  j o i n   t e x tZ ]^] o   ( )���� 0 etext eText^ _`_ o   ) *���� 0 enumber eNumber` aba o   * +���� 0 efrom eFromb c��c o   + ,���� 
0 eto eTo��  ��  3 ded l     ��������  ��  ��  e fgf l     ��������  ��  ��  g hih i   �jkj I     ��l��
�� .Txt:SplPnull���     ctxtl o      ���� 0 thetext theText��  k Q     $mnom L    pp n    qrq 2   ��
�� 
cparr n   sts I    ��u���� "0 astextparameter asTextParameteru vwv o    	���� 0 thetext theTextw x��x m   	 
yy �zz  ��  ��  t o    ���� 0 _support  n R      ��{|
�� .ascrerr ****      � ****{ o      ���� 0 etext eText| ��}~
�� 
errn} o      ���� 0 enumber eNumber~ ���
�� 
erob o      �� 0 efrom eFrom� �~��}
�~ 
errt� o      �|�| 
0 eto eTo�}  o I    $�{��z�{ 
0 _error  � ��� m    �� ���   s p l i t   p a r a g r a p h s� ��� o    �y�y 0 etext eText� ��� o    �x�x 0 enumber eNumber� ��� o    �w�w 0 efrom eFrom� ��v� o     �u�u 
0 eto eTo�v  �z  i ��� l     �t�s�r�t  �s  �r  � ��� l     �q�p�o�q  �p  �o  � ��� i  � ���� I     �n��
�n .Txt:JoiPnull���     ****� o      �m�m 0 thelist theList� �l��k
�l 
LiBr� |�j�i��h��j  �i  � o      �g�g 0 linebreaktype lineBreakType�h  � l     ��f�e� m      �d
�d LiBrLiOX�f  �e  �k  � Q     ,���� L    �� I    �c��b�c 0 	_jointext 	_joinText� ��� n   ��� I   	 �a��`�a "0 aslistparameter asListParameter� ��_� o   	 
�^�^ 0 thelist theList�_  �`  � o    	�]�] 0 _support  � ��\� I    �[��Z�[ .0 _aslinebreakparameter _asLineBreakParameter� ��� o    �Y�Y 0 linebreaktype lineBreakType� ��X� m    �� ��� 
 u s i n g�X  �Z  �\  �b  � R      �W��
�W .ascrerr ****      � ****� o      �V�V 0 etext eText� �U��
�U 
errn� o      �T�T 0 enumber eNumber� �S��
�S 
erob� o      �R�R 0 efrom eFrom� �Q��P
�Q 
errt� o      �O�O 
0 eto eTo�P  � I   " ,�N��M�N 
0 _error  � ��� m   # $�� ���  j o i n   p a r a g r a p h s� ��� o   $ %�L�L 0 etext eText� ��� o   % &�K�K 0 enumber eNumber� ��� o   & '�J�J 0 efrom eFrom� ��I� o   ' (�H�H 
0 eto eTo�I  �M  � ��� l     �G�F�E�G  �F  �E  � ��D� l     �C�B�A�C  �B  �A  �D       "�@���?�>�=�����������������������������@  �  �<�;�:�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� ���
�< 
pimr�; (0 _unmatchedtexttype _UnmatchedTextType�: $0 _matchedtexttype _MatchedTextType�9 &0 _matchedgrouptype _MatchedGroupType�8 0 _support  �7 
0 _error  �6 $0 _matchinforecord _matchInfoRecord�5 0 _matchrecords _matchRecords�4 &0 _matchedgrouplist _matchedGroupList�3 0 _findpattern _findPattern�2 "0 _replacepattern _replacePattern�1 0 	_findtext 	_findText�0 0 _replacetext _replaceText
�/ .Txt:Srchnull���     ctxt
�. .Txt:EPatnull���     ctxt
�- .Txt:ETemnull���     ctxt
�, .Txt:UppTnull���     ctxt
�+ .Txt:CapTnull���     ctxt
�* .Txt:LowTnull���     ctxt
�) .Txt:FTxtnull���     ctxt
�( .Txt:NLiBnull���     ctxt
�' .Txt:PadTnull���     ctxt
�& .Txt:SliTnull���     ctxt
�% .Txt:TrmTnull���     ctxt�$ .0 _aslinebreakparameter _asLineBreakParameter�# 0 
_splittext 
_splitText�" 0 _splitpattern _splitPattern�! 0 	_jointext 	_joinText
�  .Txt:SplTnull���     ctxt
� .Txt:JoiTnull���     ****
� .Txt:SplPnull���     ctxt
� .Txt:JoiPnull���     ****� ��� �  �� ���
� 
cobj� ��   � 
� 
frmk�  
�? 
TxtU
�> 
TxtM
�= 
TxtG� ��   � C
� 
scpt� � M������ 
0 _error  � ��� �  ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  � ����
�	� 0 handlername handlerName� 0 etext eText� 0 enumber eNumber�
 0 efrom eFrom�	 
0 eto eTo�  ]��� � &0 throwcommanderror throwCommandError� b  ࠡ����+ � � ������� $0 _matchinforecord _matchInfoRecord� ��� �  �� ����� 0 
asocstring 
asocString�   0 asocmatchrange asocMatchRange�� 0 
textoffset 
textOffset�� 0 
recordtype 
recordType�  � �������������� 0 
asocstring 
asocString��  0 asocmatchrange asocMatchRange�� 0 
textoffset 
textOffset�� 0 
recordtype 
recordType�� 0 	foundtext 	foundText��  0 nexttextoffset nextTextOffset� ������������������ *0 substringwithrange_ substringWithRange_
�� 
ctxt
�� 
leng
�� 
pcls�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 	foundtext 	foundText�� � $��k+  �&E�O���,E�O���k���lv� �� ����������� 0 _matchrecords _matchRecords�� ����� �  �������������� 0 
asocstring 
asocString��  0 asocmatchrange asocMatchRange��  0 asocstartindex asocStartIndex�� 0 
textoffset 
textOffset�� (0 nonmatchrecordtype nonMatchRecordType�� "0 matchrecordtype matchRecordType��  � ������������������������ 0 
asocstring 
asocString��  0 asocmatchrange asocMatchRange��  0 asocstartindex asocStartIndex�� 0 
textoffset 
textOffset�� (0 nonmatchrecordtype nonMatchRecordType�� "0 matchrecordtype matchRecordType��  0 asocmatchstart asocMatchStart�� 0 asocmatchend asocMatchEnd�� &0 asocnonmatchrange asocNonMatchRange�� 0 nonmatchinfo nonMatchInfo�� 0 	matchinfo 	matchInfo� ������������ 0 location  �� 
0 length  �� �� $0 _matchinforecord _matchInfoRecord
�� 
cobj�� W�j+  E�O��j+ E�O�ᦢ�E�O*�����+ E[�k/E�Z[�l/E�ZO*�����+ E[�k/E�Z[�l/E�ZO�����v� ������������ &0 _matchedgrouplist _matchedGroupList�� ����� �  ���������� 0 
asocstring 
asocString�� 0 	asocmatch 	asocMatch�� 0 
textoffset 
textOffset�� &0 includenonmatches includeNonMatches��  � ���������������������������� 0 
asocstring 
asocString�� 0 	asocmatch 	asocMatch�� 0 
textoffset 
textOffset�� &0 includenonmatches includeNonMatches�� "0 submatchresults subMatchResults�� 0 groupindexes groupIndexes�� (0 asocfullmatchrange asocFullMatchRange�� &0 asocnonmatchstart asocNonMatchStart�� $0 asocfullmatchend asocFullMatchEnd�� 0 i  �� 0 nonmatchinfo nonMatchInfo�� 0 	matchinfo 	matchInfo�� &0 asocnonmatchrange asocNonMatchRange� 	��������������������  0 numberofranges numberOfRanges�� 0 rangeatindex_ rangeAtIndex_�� 0 location  �� 
0 length  �� �� 0 _matchrecords _matchRecords
�� 
cobj�� �� $0 _matchinforecord _matchInfoRecord�� �jvE�O�j+  kE�O�j ��jk+ E�O�j+ E�O��j+ E�O Uk�kh 	*���k+ ��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO� 	��6FY hO��6F[OY��O� #�㨧�E�O*���b  �+ �k/�6FY hY hO�� ������������� 0 _findpattern _findPattern�� ����� �  ���������� 0 thetext theText�� 0 patterntext patternText�� &0 includenonmatches includeNonMatches��  0 includematches includeMatches��  � �������������������������������� 0 thetext theText�� 0 patterntext patternText�� &0 includenonmatches includeNonMatches��  0 includematches includeMatches�� 0 asocpattern asocPattern�� 0 
asocstring 
asocString�� &0 asocnonmatchstart asocNonMatchStart�� 0 
textoffset 
textOffset�� 0 
resultlist 
resultList��  0 asocmatcharray asocMatchArray�� 0 i  �� 0 	asocmatch 	asocMatch�� 0 nonmatchinfo nonMatchInfo�� 0 	matchinfo 	matchInfo�� 0 	foundtext 	foundText� ����������������������������������������� (0 asbooleanparameter asBooleanParameter�� @0 asnsregularexpressionparameter asNSRegularExpressionParameter�� ,0 asnormalizednsstring asNormalizedNSString�� 
0 length  �� @0 matchesinstring_options_range_ matchesInString_options_range_�� 	0 count  ��  0 objectatindex_ objectAtIndex_�� 0 rangeatindex_ rangeAtIndex_�� �� 0 _matchrecords _matchRecords
�� 
cobj�� �� 0 foundgroups foundGroups�� 0 
startindex 
startIndex� &0 _matchedgrouplist _matchedGroupList� *0 substringfromindex_ substringFromIndex_
� 
ctxt
� 
pcls� 0 endindex endIndex
� 
leng� 0 	foundtext 	foundText� ��b  ��l+ E�Ob  ��l+ E�Ob  �j�m+ E�Ob  �k+ E�OjE�OkE�OjvE�O��jj�j+ lvm+ E�O }j�j+ kkh 
��k+ 	E�O*��jk+ 
��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO� 	��6FY hO� ��*���a ,��+ l%�6FY h[OY��O� 1��k+ a &E�Oa b  a �a �a ,a �a �6FY hO�� �������� "0 _replacepattern _replacePattern� ��� �  ���� 0 thetext theText� 0 patterntext patternText� 0 templatetext templateText�  � ��~�}�|�{�z�y�x�w�v�u�t�s�r�q�p�o�n�m�l� 0 thetext theText�~ 0 patterntext patternText�} 0 templatetext templateText�| 0 
asocstring 
asocString�{ 0 asocpattern asocPattern�z 0 
resultlist 
resultList�y &0 asocnonmatchstart asocNonMatchStart�x 0 
textoffset 
textOffset�w  0 asocmatcharray asocMatchArray�v 0 i  �u 0 	asocmatch 	asocMatch�t 0 nonmatchinfo nonMatchInfo�s 0 	matchinfo 	matchInfo�r 0 matchedgroups matchedGroups�q 0 etext eText�p 0 enumber eNumber�o 0 efrom eFrom�n 
0 eto eTo�m 0 oldtids oldTIDs�l 0 
resulttext 
resultText� �k��j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X��W�V�UH�T�S�Rp�Q�k ,0 asnormalizednsstring asNormalizedNSString�j @0 asnsregularexpressionparameter asNSRegularExpressionParameter
�i 
kocl
�h 
scpt
�g .corecnte****       ****
�f 
cobj�e 
0 length  �d @0 matchesinstring_options_range_ matchesInString_options_range_�c 	0 count  �b  0 objectatindex_ objectAtIndex_�a 0 rangeatindex_ rangeAtIndex_�` �_ 0 _matchrecords _matchRecords�^ �] 0 	foundtext 	foundText�\ 0 
startindex 
startIndex�[ &0 _matchedgrouplist _matchedGroupList�Z  0 replacepattern replacePattern
�Y 
ctxt�X 0 etext eText� �P�O�
�P 
errn�O 0 enumber eNumber� �N�M�
�N 
erob�M 0 efrom eFrom� �L�K�J
�L 
errt�K 
0 eto eTo�J  
�W 
errn
�V 
erob
�U 
errt�T *0 substringfromindex_ substringFromIndex_
�S 
ascr
�R 
txdl�Q |0 <stringbyreplacingmatchesinstring_options_range_withtemplate_ <stringByReplacingMatchesInString_options_range_withTemplate_�Qb  �k+  E�Ob  �j�m+ E�O�kv��l jjvjkmvE[�k/E�Z[�l/E�Z[�m/E�ZO��jj�j+ lvm+ E�O �j�j+ 	kkh 	��k+ 
E�O*��jk+ ��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO��,�6FO*���a ,e�+ E�O ���,�l+ a &�6FW X  )a �a ] a ] �a �%[OY�qO��k+ a &�6FO_ a ,E^ Oa _ a ,FO�a &E^ O] _ a ,FO] Y ��jj�j+ lv��+ a &� �I��H�G���F�I 0 	_findtext 	_findText�H �E��E �  �D�C�B�A�D 0 thetext theText�C 0 fortext forText�B &0 includenonmatches includeNonMatches�A  0 includematches includeMatches�G  � 
�@�?�>�=�<�;�:�9�8�7�@ 0 thetext theText�? 0 fortext forText�> &0 includenonmatches includeNonMatches�=  0 includematches includeMatches�< 0 
resultlist 
resultList�; 0 oldtids oldTIDs�: 0 
startindex 
startIndex�9 0 endindex endIndex�8 0 	foundtext 	foundText�7 0 i  � �6�5�4�3�2��1�0�/�.�-�,(�+�*`
�6 
ascr
�5 
txdl
�4 
citm
�3 
leng
�2 
ctxt
�1 
pcls�0 0 
startindex 
startIndex�/ 0 endindex endIndex�. 0 	foundtext 	foundText�- 
�, .corecnte****       ****�+ 0 foundgroups foundGroups�* 
�F
jvE�O��,E�O���,FOkE�O��k/�,E�O� 0�� �[�\[Z�\Z�2E�Y �E�O�b  �����6FY hO �l��-j kh 	�kE�O��,�[�\[�/\�i/2�,E�O� 3�� �[�\[Z�\Z�2E�Y �E�O�b  ����jv��6FY hO�kE�O���/�,kE�O� 0�� �[�\[Z�\Z�2E�Y �E�O�b  �����6FY h[OY�aO���,FO�� �)��(�'� �&�) 0 _replacetext _replaceText�( �%�%   �$�#�"�$ 0 thetext theText�# 0 fortext forText�" 0 newtext newText�'  � �!� �������������! 0 thetext theText�  0 fortext forText� 0 newtext newText� 0 oldtids oldTIDs� 0 
resultlist 
resultList� 0 
startindex 
startIndex� 0 endindex endIndex� 0 i  � 0 	foundtext 	foundText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� 0 
resulttext 
resultText  ����������
�	����Kb�
� 
ascr
� 
txdl
� 
kocl
� 
scpt
� .corecnte****       ****
� 
citm
� 
leng
� 
cobj
� 
ctxt�
 0 replacetext replaceText�	 0 etext eText ��
� 
errn� 0 enumber eNumber �� 
� 
erob�  0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  
� 
errn
� 
erob
� 
errt� � "0 astextparameter asTextParameter�&(��,E�O���,FO�kv��l j �jvk��k/�,mvE[�k/E�Z[�l/E�Z[�m/E�ZO�� �[�\[Z�\Z�2�6FY hO �l��-j kh �kE�O��,�[�\[�/\�i/2�,E�O�� �[�\[Z�\Z�2E�Y �E�O ��k+ 
�&�6FW X  )����a a �%O�kE�O���/�,kE�O�� �[�\[Z�\Z�2�6FY h[OY�rOa ��,FY b  �a l+ E�O��-E�O���,FO��&E�O���,FO�� ���������
�� .Txt:Srchnull���     ctxt�� 0 thetext theText�� ����
�� 
For_�� 0 fortext forText ��	
�� 
Usin {�������� 0 matchformat matchFormat��  
�� SerECmpI	 ��

�� 
Repl
 {�������� 0 newtext newText��  
�� 
msng ����
�� 
Retu {�������� 0 resultformat resultFormat��  
�� RetEMatT��   ������������������������ 0 thetext theText�� 0 fortext forText�� 0 matchformat matchFormat�� 0 newtext newText�� 0 resultformat resultFormat�� &0 includenonmatches includeNonMatches��  0 includematches includeMatches�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo 0������������������������������������+����56��������Z��pq����������'��4������ "0 astextparameter asTextParameter
�� 
leng
�� 
errn���Y
�� 
erob�� 
�� 
msng
�� RetEMatT
�� 
pcls�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 	foundtext 	foundText�� 
�� 
cobj
�� RetEUmaT
�� RetEAllT�� >0 throwinvalidconstantparameter throwInvalidConstantParameter
�� SerECmpI�� 0 	_findtext 	_findText
�� SerECmpP�� 0 _findpattern _findPattern
�� SerECmpC
�� SerECmpE
�� SerECmpD�� 0 _replacetext _replaceText�� "0 _replacepattern _replacePattern�� 0 etext eText ����
�� 
errn�� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  �� �� 
0 _error  ��P;b  ��l+ E�Ob  ��l+ E�O��,j  )�����Y hO�� L��,j  $��  jvY �b  �k�j��a kvY hO��  felvE[a k/E�Z[a l/E�ZY S�a   eflvE[a k/E�Z[a l/E�ZY 1�a   eelvE[a k/E�Z[a l/E�ZY b  �a l+ O�a   a a  *�����+ VY ��a   *�����+ Y w�a   a g *�����+ VY Z�a   a a   *�����+ VY ;�a !  &�a "  )����a #Y hO*�����+ Y b  �a $l+ Y ���,j  	a %Y hO�a   a a  *���m+ &VY ��a   *���m+ 'Y t�a   a a   *���m+ &VY V�a   a g *���m+ &VY :�a !  %�a (  )����a )Y hO*���m+ &Y b  �a *l+ W X + ,*a -����a .+ /� �D���
� .Txt:EPatnull���     ctxt� 0 thetext theText�   ������ 0 thetext theText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo ��X����f��
� misccura� *0 nsregularexpression NSRegularExpression� "0 astextparameter asTextParameter� 40 escapedpatternforstring_ escapedPatternForString_
� 
ctxt� 0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � + ��,b  ��l+ k+ �&W X  *衢���+ 
� �v���
� .Txt:ETemnull���     ctxt� 0 thetext theText�   ������ 0 thetext theText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo ����������
� misccura� *0 nsregularexpression NSRegularExpression� "0 astextparameter asTextParameter� 60 escapedtemplateforstring_ escapedTemplateForString_
� 
ctxt� 0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � + ��,b  ��l+ k+ �&W X  *衢���+ 
� �����
� .Txt:UppTnull���     ctxt� 0 thetext theText� ��
� 
Loca {���� 0 
localecode 
localeCode�  �   �����~�}�|� 0 thetext theText� 0 
localecode 
localeCode� 0 
asocstring 
asocString� 0 etext eText�~ 0 enumber eNumber�} 0 efrom eFrom�| 
0 eto eTo ��{�z�y�x�w��v�u�t��s�r�{ "0 astextparameter asTextParameter�z 0 
asnsstring 
asNSString
�y 
msng�x "0 uppercasestring uppercaseString
�w 
ctxt�v *0 asnslocaleparameter asNSLocaleParameter�u 80 uppercasestringwithlocale_ uppercaseStringWithLocale_�t 0 etext eText �q�p
�q 
errn�p 0 enumber eNumber �o�n
�o 
erob�n 0 efrom eFrom �m�l�k
�m 
errt�l 
0 eto eTo�k  �s �r 
0 _error  � Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+ � �j�i�h !�g
�j .Txt:CapTnull���     ctxt�i 0 thetext theText�h �f"�e
�f 
Loca" {�d�c�d 0 
localecode 
localeCode�c  �e    �b�a�`�_�^�]�\�b 0 thetext theText�a 0 
localecode 
localeCode�` 0 
asocstring 
asocString�_ 0 etext eText�^ 0 enumber eNumber�] 0 efrom eFrom�\ 
0 eto eTo! #�[�Z�Y�X�W@�V�U�T#L�S�R�[ "0 astextparameter asTextParameter�Z 0 
asnsstring 
asNSString
�Y 
msng�X &0 capitalizedstring capitalizedString
�W 
ctxt�V *0 asnslocaleparameter asNSLocaleParameter�U <0 capitalizedstringwithlocale_ capitalizedStringWithLocale_�T 0 etext eText# �Q�P$
�Q 
errn�P 0 enumber eNumber$ �O�N%
�O 
erob�N 0 efrom eFrom% �M�L�K
�M 
errt�L 
0 eto eTo�K  �S �R 
0 _error  �g Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+ � �J\�I�H&'�G
�J .Txt:LowTnull���     ctxt�I 0 thetext theText�H �F(�E
�F 
Loca( {�D�Cc�D 0 
localecode 
localeCode�C  �E  & �B�A�@�?�>�=�<�B 0 thetext theText�A 0 
localecode 
localeCode�@ 0 
asocstring 
asocString�? 0 etext eText�> 0 enumber eNumber�= 0 efrom eFrom�< 
0 eto eTo' w�;�:�9�8�7��6�5�4)��3�2�; "0 astextparameter asTextParameter�: 0 
asnsstring 
asNSString
�9 
msng�8 "0 lowercasestring lowercaseString
�7 
ctxt�6 *0 asnslocaleparameter asNSLocaleParameter�5 80 lowercasestringwithlocale_ lowercaseStringWithLocale_�4 0 etext eText) �1�0*
�1 
errn�0 0 enumber eNumber* �/�.+
�/ 
erob�. 0 efrom eFrom+ �-�,�+
�- 
errt�, 
0 eto eTo�+  �3 �2 
0 _error  �G Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+ � �*��)�(,-�'
�* .Txt:FTxtnull���     ctxt�) 0 templatetext templateText�( �&�%�$
�& 
Usin�% 0 	thevalues 	theValues�$  , �#�"�!� ���������������# 0 templatetext templateText�" 0 	thevalues 	theValues�! 0 asocpattern asocPattern�  0 
asocstring 
asocString�  0 asocmatcharray asocMatchArray� 0 resulttexts resultTexts� 0 
startindex 
startIndex� 0 i  � 0 
matchrange 
matchRange� 0 thetoken theToken� 0 	itemindex 	itemIndex� 0 theitem theItem� 0 oldtids oldTIDs� 0 
resulttext 
resultText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo- (�����������
�	�������	B�� ��.����������	~	�������	���/	������ "0 aslistparameter asListParameter
� misccura� *0 nsregularexpression NSRegularExpression
� 
msng� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_� 0 
asnsstring 
asNSString� 
0 length  �
 @0 matchesinstring_options_range_ matchesInString_options_range_�	 	0 count  �  0 objectatindex_ objectAtIndex_� 0 rangeatindex_ rangeAtIndex_� 0 location  � � *0 substringwithrange_ substringWithRange_
� 
ctxt
� 
cha 
� 
long
�  
cobj��  . ������
�� 
errn���\��  
�� 
errn���\
�� 
erob
�� 
errt�� �� *0 substringfromindex_ substringFromIndex_
�� 
ascr
�� 
txdl�� 0 etext eText/ ����0
�� 
errn�� 0 enumber eNumber0 ����1
�� 
erob�� 0 efrom eFrom1 ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �'\C��;b  �k+ E�O��,�j�m+ E�Ob  �k+ E�O��jj�j+ 	lvm+ 
E�OjvE�OjE�O �j�j+ kkh ��k+ jk+ E�O���j+ ��k+ a &�6FO��k+ a &E�O�a k/a   �a l/�6FY O�a l/a &E�O�a �/E�O �a &�6FW +X  )a a a �a �/a a a a �%a %O�j+ �j+ 	E�[OY�RO��k+ a &�6FO_  a !,E�Oa "_  a !,FO�a &E�O�_  a !,FO�VW X # $*a %��] ] a &+ '� ��	�����23��
�� .Txt:NLiBnull���     ctxt�� 0 thetext theText�� ��4��
�� 
LiBr4 {�������� 0 linebreaktype lineBreakType��  
�� LiBrLiOX��  2 �������������� 0 thetext theText�� 0 linebreaktype lineBreakType�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo3 	�����
������5
������ "0 astextparameter asTextParameter
�� 
cpar�� .0 _aslinebreakparameter _asLineBreakParameter�� 0 	_jointext 	_joinText�� 0 etext eText5 ����6
�� 
errn�� 0 enumber eNumber6 ����7
�� 
erob�� 0 efrom eFrom7 ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� 0 *b  ��l+ �-*��l+ l+ W X  *袣���+ 
� ��
����89��
�� .Txt:PadTnull���     ctxt�� 0 thetext theText�� ����:
�� 
toPl�� 0 	textwidth 	textWidth: ��;<
�� 
Char; {����
(�� 0 padtext padText��  < ��=��
�� 
From= {������� 0 whichend whichEnd��  
� LeTrLCha��  8 ������������ 0 thetext theText� 0 	textwidth 	textWidth� 0 padtext padText� 0 whichend whichEnd� 0 
widthtoadd 
widthToAdd� 0 padsize padSize� 0 	padoffset 	padOffset� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo9 
<�
H��
d����
v����
���>
���� "0 astextparameter asTextParameter� (0 asintegerparameter asIntegerParameter
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
� LeTrBCha� >0 throwinvalidconstantparameter throwInvalidConstantParameter� 0 etext eText> ��?
� 
errn� 0 enumber eNumber? ��@
� 
erob� 0 efrom eFrom@ ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� �b  ��l+ E�Ob  ��l+ E�O���,E�O�j �Y hOb  ��l+ E�O��,E�O��,j  )�����Y hO h��,����%E�[OY��O��  �[�\[Zk\Z�2�%Y s��  ��,�#E�O��[�\[Zk�\Z��2%Y P��  ?�k �[�\[Zk\Z�l"2�%E�Y hO��,�#E�O��[�\[Zk�\Z��kl"2%Y b  ��l+ W X  *a ����a + � ���AB�
� .Txt:SliTnull���     ctxt� 0 thetext theText� �CD
� 
FIdxC {���� 0 
startindex 
startIndex�  
� 
msngD �E�
� 
TIdxE {���� 0 endindex endIndex�  
� 
msng�  A ��������� 0 thetext theText� 0 
startindex 
startIndex� 0 endindex endIndex� 0 	thelength 	theLength� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToB (������DQX�l�v��������~�}F@�|�{� "0 astextparameter asTextParameter
� 
leng
� 
errn��Y
� 
erob� 
� 
msng� (0 asintegerparameter asIntegerParameter
� 
ctxt��[
�~ 
bool�} 0 etext eTextF �z�yG
�z 
errn�y 0 enumber eNumberG �x�wH
�x 
erob�w 0 efrom eFromH �v�u�t
�v 
errt�u 
0 eto eTo�t  �| �{ 
0 _error  ���b  ��l+ E�O��,E�O�j  -�j  )�����Y hO�j  )�����Y hO�Y hO�� Tb  ��l+ E�O�j  )�����Y hO��  )��' �Y �� �Y �[�\[Z�\Zi2EY hY ��  )�a la Y hO�� Zb  �a l+ E�O�j  )����a Y hO��  +��' 	a Y �� �Y �[�\[Zk\Z�2EY hY hO�j �k�E�Y hO�j �k�E�Y hO��
 �k	 	�ka &a &
 ��	 	��a &a & 	a Y hO�k kE�Y �� �E�Y hO�k kE�Y �� �E�Y hO�[�\[Z�\Z�2EW X  *a ����a + � �sP�r�qIJ�p
�s .Txt:TrmTnull���     ctxt�r 0 thetext theText�q �oK�n
�o 
FromK {�m�l�k�m 0 whichend whichEnd�l  
�k LeTrBCha�n  I �j�i�h�g�f�e�d�c�j 0 thetext theText�i 0 whichend whichEnd�h 0 
startindex 
startIndex�g 0 endindex endIndex�f 0 etext eText�e 0 enumber eNumber�d 0 efrom eFrom�c 
0 eto eToJ e�b�a�`�_|�^�����]�\���[�ZL��Y�X�b "0 astextparameter asTextParameter
�a LeTrLCha
�` LeTrTCha
�_ LeTrBCha�^ >0 throwinvalidconstantparameter throwInvalidConstantParameter
�] 
cobj
�\ 
cha 
�[ 
ctxt�Z 0 etext eTextL �W�VM
�W 
errn�V 0 enumber eNumberM �U�TN
�U 
erob�T 0 efrom eFromN �S�R�Q
�S 
errt�R 
0 eto eTo�Q  �Y �X 
0 _error  �p � �b  ��l+ E�O���mv�kv b  ��l+ Y hO�� {��  �Y hOkilvE[�k/E�Z[�l/E�ZO��lv�kv  h��/� �kE�[OY��Y hO��lv�kv  h��/� �kE�[OY��Y hO�[�\[Z�\Z�2EVW X  *a ����a + � �P �O�NOP�M�P .0 _aslinebreakparameter _asLineBreakParameter�O �LQ�L Q  �K�J�K 0 linebreaktype lineBreakType�J 0 parametername parameterName�N  O �I�H�I 0 linebreaktype lineBreakType�H 0 parametername parameterNameP �G�F�E�D�C�B
�G LiBrLiOX
�F 
lnfd
�E LiBrLiCM
�D 
ret 
�C LiBrLiWi�B >0 throwinvalidconstantparameter throwInvalidConstantParameter�M 0��  �EY %��  �Y ��  	��%Y b  ��l+ � �A,�@�?RS�>�A 0 
_splittext 
_splitText�@ �=T�= T  �<�;�< 0 thetext theText�; 0 theseparator theSeparator�?  R �:�9�8�7�6�5�: 0 thetext theText�9 0 theseparator theSeparator�8 0 delimiterlist delimiterList�7 0 aref aRef�6 0 oldtids oldTIDs�5 0 
resultlist 
resultListS �4�3�2�1�0�/�.UZ_�-�,�+�*�)�4 "0 aslistparameter asListParameter
�3 
kocl
�2 
cobj
�1 .corecnte****       ****
�0 
pcnt
�/ 
ctxt�.  U �(�'�&
�( 
errn�'�\�&  �- �, 60 throwinvalidparametertype throwInvalidParameterType
�+ 
ascr
�* 
txdl
�) 
citm�> _b  �k+  E�O 5�[��l kh  ��,�&��,FW X  b  �����+ [OY��O��,E�O���,FO��-E�O���,FO�� �%��$�#VW�"�% 0 _splitpattern _splitPattern�$ �!X�! X  � ��  0 thetext theText� 0 patterntext patternText�#  V 
����������� 0 thetext theText� 0 patterntext patternText� 0 asocpattern asocPattern� 0 
asocstring 
asocString� &0 asocnonmatchstart asocNonMatchStart� 0 
resultlist 
resultList�  0 asocmatcharray asocMatchArray� 0 i  �  0 asocmatchrange asocMatchRange�  0 asocmatchstart asocMatchStartW �������������
�	��������
� 
kocl
� 
list
� .corecnte****       ****
� 
Sepa
� .Txt:JoiTnull���     ****� @0 asnsregularexpressionparameter asNSRegularExpressionParameter� ,0 asnormalizednsstring asNormalizedNSString� 
0 length  � @0 matchesinstring_options_range_ matchesInString_options_range_� 	0 count  �
  0 objectatindex_ objectAtIndex_�	 0 rangeatindex_ rangeAtIndex_� 0 location  � � *0 substringwithrange_ substringWithRange_
� 
ctxt� *0 substringfromindex_ substringFromIndex_
� 
leng
� 
cobj
� 
bool�" ӡkv��l k  ���l E�Y hOb  �j�m+ E�Ob  �k+ E�OjE�OjvE�O��jj�j+ 	lvm+ 
E�O Hj�j+ kkh ��k+ jk+ E�O�j+ E�O��驤�k+ a &�6FO��j+ 	E�[OY��O��k+ a &�6FO�a ,k 	 �a k/a ,j a & jvY hO�� � D����YZ���  0 	_jointext 	_joinText�� ��[�� [  ������ 0 thelist theList�� 0 separatortext separatorText��  Y ���������� 0 thelist theList�� 0 separatortext separatorText�� 0 oldtids oldTIDs�� 0 
resulttext 
resultTextZ ��������\������������l
�� 
ascr
�� 
txdl
�� 
ctxt��  \ ������
�� 
errn���\��  
�� 
errn���Y
�� 
erob
�� 
errt
�� 
list�� �� 6��,E�O���,FO 
��&E�W X  ���,FO)�������O���,FO�� �������]^��
�� .Txt:SplTnull���     ctxt�� 0 thetext theText�� ��_`
�� 
Sepa_ {�������� 0 theseparator theSeparator��  
�� 
msng` ��a��
�� 
Usina {�������� 0 matchformat matchFormat��  
�� SerECmpI��  ] ���������������� 0 thetext theText�� 0 theseparator theSeparator�� 0 matchformat matchFormat�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo^ ���������������������������������b%������ "0 astextparameter asTextParameter
�� 
leng
�� 
msng
�� .Txt:TrmTnull���     ctxt�� 0 _splitpattern _splitPattern
�� SerECmpI�� 0 
_splittext 
_splitText
�� SerECmpP
�� SerECmpC
�� SerECmpE
�� SerECmpD�� >0 throwinvalidconstantparameter throwInvalidConstantParameter�� 0 etext eTextb ����c
�� 
errn�� 0 enumber eNumberc ����d
�� 
erob�� 0 efrom eFromd �����
�� 
errt�� 
0 eto eTo�  �� �� 
0 _error  �� � �b  ��l+ E�O��,j  jvY hO��  *�j �l+ Y z��  �� *��l+ 
VY c��  *��l+ Y R��  �g *��l+ 
VY ;��  �a  *��l+ 
VY "�a   *��l+ 
Y b  �a l+ W X  *a ����a + � �5��ef�
� .Txt:JoiTnull���     ****� 0 thelist theList� �g�
� 
Sepag {��;� 0 separatortext separatorText�  �  e ������� 0 thelist theList� 0 separatortext separatorText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTof 	�O���h[��� "0 aslistparameter asListParameter� "0 astextparameter asTextParameter� 0 	_jointext 	_joinText� 0 etext eTexth ��i
� 
errn� 0 enumber eNumberi ��j
� 
erob� 0 efrom eFromj ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � 1  *b  �k+  b  ��l+ l+ W X  *梣���+ � �k��kl�
� .Txt:SplPnull���     ctxt� 0 thetext theText�  k ������ 0 thetext theText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTol y���m���� "0 astextparameter asTextParameter
� 
cpar� 0 etext eTextm ��n
� 
errn� 0 enumber eNumbern ��o
� 
erob� 0 efrom eFromo ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � % b  ��l+ �-EW X  *塢���+ � ����pq�
� .Txt:JoiPnull���     ****� 0 thelist theList� �r�
� 
LiBrr {���� 0 linebreaktype lineBreakType�  
� LiBrLiOX�  p ������� 0 thelist theList� 0 linebreaktype lineBreakType� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToq 	���~�}�|s��{�z� "0 aslistparameter asListParameter�~ .0 _aslinebreakparameter _asLineBreakParameter�} 0 	_jointext 	_joinText�| 0 etext eTexts �y�xt
�y 
errn�x 0 enumber eNumbert �w�vu
�w 
erob�v 0 efrom eFromu �u�t�s
�u 
errt�t 
0 eto eTo�s  �{ �z 
0 _error  � - *b  �k+  *��l+ l+ W X  *梣���+  ascr  ��ޭ