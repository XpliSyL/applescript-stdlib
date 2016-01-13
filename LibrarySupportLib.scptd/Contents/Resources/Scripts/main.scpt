FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� LibrarySupportLib -- various standardized handlers for coercing and checking parameters and throwing errors

Notes:

- Because AS errors don't include stack traces, a library's public handlers must trap and rethrow all errors, prefixing error string with library and handler name (and, in script object methods, the object's display/documentation name) so that user can identify the handler in which an error occurred. Special attention should also be paid to coercing and/or validating public handlers' parameters, and throwing descriptive errors if an inappropriate value is given.

- This library wouldn't be necessary if AppleScript had decent parameter type annotations and proper exception objects (with full stack trace support). But as it doesn't these handlers at least take some of the endless pain out of sanitizing user-supplied inputs and generating consistent error messages when those inputs are inappropriate, or anything else in the handler needs to throw an error (or just goes plain old wrong).

- When coercing a text value to integer/real/number, or an integer or real value to text, the text is parsed/formatted using the current user's localization settings.

- When coercing a list to text, AppleScript's current text item delimiters are used. (This may change in future.)


Caution:

- When checking if a string is empty in a library handler, it is *essential* either to check its length=0 or else wrap the string comparison (e.g. `aString is ""`) in a `considering hyphens, punctuation and white space block` to ensure that it really is empty and not a non-empty text value that contains only characters being ignored by the caller's current considering/ignoring settings. Similarly, when comparing for a non-empty string, the considering block *must* be used.

- When performing comparisons using <,�,>,� operators or concatenating values with & operator, it is *essential* to ensure the left operand is of the correct type (number/text/date/list) as AS will coerce the RH operand to the same type as the LH operand, and in some cases even casts *both* (e.g. `1&2`->`{1}&{2}`->`{1,2}`). Conversely, when using =/� operators, if the two operands are not the same type then this will almost always result in `false` (the obvious exception being integer/real comparisons, e.g. `1=1.0`->true), even though type-only differences are often ignored by other operators/commands (e.g. `1<"1"->false, `1<{1}`->false). Fully sanitizing all handler parameters before using them should generally avoid such problems subsequently manifesting in the handler, but eternal vigilance is still required to ensure extremely obscure/nasty/unpredictable/almost-impossible-to-troubleshoot bugs don't sneak in.

TO DO: 

- should asTextParameter() always throw an error if value is a list? (i.e. avoids inconsistent concatenation results due to TIDs); another option would be to whitelist some or all known 'safe' types (integer/real, text, date, alias/file/furl, etc) and reject everything else; this should ensure stable predictable behavior - even where additional custom coercion handlers are installed (users can still use other types of values, of course; they just have to explicitly coerce them first using `as` operator)

- should as<NumericType>Parameter() handlers explicitly check for and reject non-number-like values that AS would normally coerce to numbers? Probably, e.g. just because January..December and Monday..Sunday constants _can_ coerce doesn't mean they should, as if they're being passed to a handler that expects a regular number then it almost certainly indicates a mistake in the user's code that should be drawn to her attention. For example, using Standard Additions:

	random number from January to December --> 0.0-1.0 (wrong! this is a bug in `random number` osax handler where it silently ignores non-numeric parameter types instead of reporting coercion error)	random number from (January as integer) to (December as integer) --> 1-12

     � 	 	   L i b r a r y S u p p o r t L i b   - -   v a r i o u s   s t a n d a r d i z e d   h a n d l e r s   f o r   c o e r c i n g   a n d   c h e c k i n g   p a r a m e t e r s   a n d   t h r o w i n g   e r r o r s 
 
 N o t e s : 
 
 -   B e c a u s e   A S   e r r o r s   d o n ' t   i n c l u d e   s t a c k   t r a c e s ,   a   l i b r a r y ' s   p u b l i c   h a n d l e r s   m u s t   t r a p   a n d   r e t h r o w   a l l   e r r o r s ,   p r e f i x i n g   e r r o r   s t r i n g   w i t h   l i b r a r y   a n d   h a n d l e r   n a m e   ( a n d ,   i n   s c r i p t   o b j e c t   m e t h o d s ,   t h e   o b j e c t ' s   d i s p l a y / d o c u m e n t a t i o n   n a m e )   s o   t h a t   u s e r   c a n   i d e n t i f y   t h e   h a n d l e r   i n   w h i c h   a n   e r r o r   o c c u r r e d .   S p e c i a l   a t t e n t i o n   s h o u l d   a l s o   b e   p a i d   t o   c o e r c i n g   a n d / o r   v a l i d a t i n g   p u b l i c   h a n d l e r s '   p a r a m e t e r s ,   a n d   t h r o w i n g   d e s c r i p t i v e   e r r o r s   i f   a n   i n a p p r o p r i a t e   v a l u e   i s   g i v e n . 
 
 -   T h i s   l i b r a r y   w o u l d n ' t   b e   n e c e s s a r y   i f   A p p l e S c r i p t   h a d   d e c e n t   p a r a m e t e r   t y p e   a n n o t a t i o n s   a n d   p r o p e r   e x c e p t i o n   o b j e c t s   ( w i t h   f u l l   s t a c k   t r a c e   s u p p o r t ) .   B u t   a s   i t   d o e s n ' t   t h e s e   h a n d l e r s   a t   l e a s t   t a k e   s o m e   o f   t h e   e n d l e s s   p a i n   o u t   o f   s a n i t i z i n g   u s e r - s u p p l i e d   i n p u t s   a n d   g e n e r a t i n g   c o n s i s t e n t   e r r o r   m e s s a g e s   w h e n   t h o s e   i n p u t s   a r e   i n a p p r o p r i a t e ,   o r   a n y t h i n g   e l s e   i n   t h e   h a n d l e r   n e e d s   t o   t h r o w   a n   e r r o r   ( o r   j u s t   g o e s   p l a i n   o l d   w r o n g ) . 
 
 -   W h e n   c o e r c i n g   a   t e x t   v a l u e   t o   i n t e g e r / r e a l / n u m b e r ,   o r   a n   i n t e g e r   o r   r e a l   v a l u e   t o   t e x t ,   t h e   t e x t   i s   p a r s e d / f o r m a t t e d   u s i n g   t h e   c u r r e n t   u s e r ' s   l o c a l i z a t i o n   s e t t i n g s . 
 
 -   W h e n   c o e r c i n g   a   l i s t   t o   t e x t ,   A p p l e S c r i p t ' s   c u r r e n t   t e x t   i t e m   d e l i m i t e r s   a r e   u s e d .   ( T h i s   m a y   c h a n g e   i n   f u t u r e . ) 
 
 
 C a u t i o n : 
 
 -   W h e n   c h e c k i n g   i f   a   s t r i n g   i s   e m p t y   i n   a   l i b r a r y   h a n d l e r ,   i t   i s   * e s s e n t i a l *   e i t h e r   t o   c h e c k   i t s   l e n g t h = 0   o r   e l s e   w r a p   t h e   s t r i n g   c o m p a r i s o n   ( e . g .   ` a S t r i n g   i s   " " ` )   i n   a   ` c o n s i d e r i n g   h y p h e n s ,   p u n c t u a t i o n   a n d   w h i t e   s p a c e   b l o c k `   t o   e n s u r e   t h a t   i t   r e a l l y   i s   e m p t y   a n d   n o t   a   n o n - e m p t y   t e x t   v a l u e   t h a t   c o n t a i n s   o n l y   c h a r a c t e r s   b e i n g   i g n o r e d   b y   t h e   c a l l e r ' s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s .   S i m i l a r l y ,   w h e n   c o m p a r i n g   f o r   a   n o n - e m p t y   s t r i n g ,   t h e   c o n s i d e r i n g   b l o c k   * m u s t *   b e   u s e d . 
 
 -   W h e n   p e r f o r m i n g   c o m p a r i s o n s   u s i n g   < ,"d , > ,"e   o p e r a t o r s   o r   c o n c a t e n a t i n g   v a l u e s   w i t h   &   o p e r a t o r ,   i t   i s   * e s s e n t i a l *   t o   e n s u r e   t h e   l e f t   o p e r a n d   i s   o f   t h e   c o r r e c t   t y p e   ( n u m b e r / t e x t / d a t e / l i s t )   a s   A S   w i l l   c o e r c e   t h e   R H   o p e r a n d   t o   t h e   s a m e   t y p e   a s   t h e   L H   o p e r a n d ,   a n d   i n   s o m e   c a s e s   e v e n   c a s t s   * b o t h *   ( e . g .   ` 1 & 2 ` - > ` { 1 } & { 2 } ` - > ` { 1 , 2 } ` ) .   C o n v e r s e l y ,   w h e n   u s i n g   = /"`   o p e r a t o r s ,   i f   t h e   t w o   o p e r a n d s   a r e   n o t   t h e   s a m e   t y p e   t h e n   t h i s   w i l l   a l m o s t   a l w a y s   r e s u l t   i n   ` f a l s e `   ( t h e   o b v i o u s   e x c e p t i o n   b e i n g   i n t e g e r / r e a l   c o m p a r i s o n s ,   e . g .   ` 1 = 1 . 0 ` - > t r u e ) ,   e v e n   t h o u g h   t y p e - o n l y   d i f f e r e n c e s   a r e   o f t e n   i g n o r e d   b y   o t h e r   o p e r a t o r s / c o m m a n d s   ( e . g .   ` 1 < " 1 " - > f a l s e ,   ` 1 < { 1 } ` - > f a l s e ) .   F u l l y   s a n i t i z i n g   a l l   h a n d l e r   p a r a m e t e r s   b e f o r e   u s i n g   t h e m   s h o u l d   g e n e r a l l y   a v o i d   s u c h   p r o b l e m s   s u b s e q u e n t l y   m a n i f e s t i n g   i n   t h e   h a n d l e r ,   b u t   e t e r n a l   v i g i l a n c e   i s   s t i l l   r e q u i r e d   t o   e n s u r e   e x t r e m e l y   o b s c u r e / n a s t y / u n p r e d i c t a b l e / a l m o s t - i m p o s s i b l e - t o - t r o u b l e s h o o t   b u g s   d o n ' t   s n e a k   i n . 
 
 T O   D O :   
 
 -   s h o u l d   a s T e x t P a r a m e t e r ( )   a l w a y s   t h r o w   a n   e r r o r   i f   v a l u e   i s   a   l i s t ?   ( i . e .   a v o i d s   i n c o n s i s t e n t   c o n c a t e n a t i o n   r e s u l t s   d u e   t o   T I D s ) ;   a n o t h e r   o p t i o n   w o u l d   b e   t o   w h i t e l i s t   s o m e   o r   a l l   k n o w n   ' s a f e '   t y p e s   ( i n t e g e r / r e a l ,   t e x t ,   d a t e ,   a l i a s / f i l e / f u r l ,   e t c )   a n d   r e j e c t   e v e r y t h i n g   e l s e ;   t h i s   s h o u l d   e n s u r e   s t a b l e   p r e d i c t a b l e   b e h a v i o r   -   e v e n   w h e r e   a d d i t i o n a l   c u s t o m   c o e r c i o n   h a n d l e r s   a r e   i n s t a l l e d   ( u s e r s   c a n   s t i l l   u s e   o t h e r   t y p e s   o f   v a l u e s ,   o f   c o u r s e ;   t h e y   j u s t   h a v e   t o   e x p l i c i t l y   c o e r c e   t h e m   f i r s t   u s i n g   ` a s `   o p e r a t o r )  
 
 -   s h o u l d   a s < N u m e r i c T y p e > P a r a m e t e r ( )   h a n d l e r s   e x p l i c i t l y   c h e c k   f o r   a n d   r e j e c t   n o n - n u m b e r - l i k e   v a l u e s   t h a t   A S   w o u l d   n o r m a l l y   c o e r c e   t o   n u m b e r s ?   P r o b a b l y ,   e . g .   j u s t   b e c a u s e   J a n u a r y . . D e c e m b e r   a n d   M o n d a y . . S u n d a y   c o n s t a n t s   _ c a n _   c o e r c e   d o e s n ' t   m e a n   t h e y   s h o u l d ,   a s   i f   t h e y ' r e   b e i n g   p a s s e d   t o   a   h a n d l e r   t h a t   e x p e c t s   a   r e g u l a r   n u m b e r   t h e n   i t   a l m o s t   c e r t a i n l y   i n d i c a t e s   a   m i s t a k e   i n   t h e   u s e r ' s   c o d e   t h a t   s h o u l d   b e   d r a w n   t o   h e r   a t t e n t i o n .   F o r   e x a m p l e ,   u s i n g   S t a n d a r d   A d d i t i o n s : 
 
 	 r a n d o m   n u m b e r   f r o m   J a n u a r y   t o   D e c e m b e r   - - >   0 . 0 - 1 . 0   ( w r o n g !   t h i s   i s   a   b u g   i n   ` r a n d o m   n u m b e r `   o s a x   h a n d l e r   w h e r e   i t   s i l e n t l y   i g n o r e s   n o n - n u m e r i c   p a r a m e t e r   t y p e s   i n s t e a d   o f   r e p o r t i n g   c o e r c i o n   e r r o r )   	 r a n d o m   n u m b e r   f r o m   ( J a n u a r y   a s   i n t e g e r )   t o   ( D e c e m b e r   a s   i n t e g e r )   - - >   1 - 1 2 
  
   
  
 l     ��������  ��  ��        l     ��������  ��  ��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��    � � convenience handlers for raising common errors; using these improves consistency, ensuring all error messages and parameters follow same general structure, and that all library handlers automatically benefit from any future improvements made here     �  �   c o n v e n i e n c e   h a n d l e r s   f o r   r a i s i n g   c o m m o n   e r r o r s ;   u s i n g   t h e s e   i m p r o v e s   c o n s i s t e n c y ,   e n s u r i n g   a l l   e r r o r   m e s s a g e s   a n d   p a r a m e t e r s   f o l l o w   s a m e   g e n e r a l   s t r u c t u r e ,   a n d   t h a t   a l l   l i b r a r y   h a n d l e r s   a u t o m a t i c a l l y   b e n e f i t   f r o m   a n y   f u t u r e   i m p r o v e m e n t s   m a d e   h e r e      l     ��������  ��  ��        i        I      ��  ���� 60 throwinvalidparametertype throwInvalidParameterType    ! " ! o      ���� 0 thevalue theValue "  # $ # o      ���� 0 parametername parameterName $  % & % o      ���� $0 expectedtypename expectedTypeName &  '�� ' o      ���� 0 expectedtype expectedType��  ��    k     ^ ( (  ) * ) Z      + ,�� - + =      . / . n     0 1 0 1    ��
�� 
leng 1 o     ���� 0 parametername parameterName / m    ����   , r     2 3 2 m    	 4 4 � 5 5  d i r e c t 3 o      ���� 0 parametername parameterName��   - r     6 7 6 b     8 9 8 b     : ; : m     < < � = =   ; o    ���� 0 parametername parameterName 9 m     > > � ? ?   7 o      ���� 0 parametername parameterName *  @ A @ Q    ? B C D B Z    4 E F�� G E ?    $ H I H l   " J���� J I   "�� K L
�� .corecnte****       **** K J     M M  N�� N o    ���� 0 thevalue theValue��   L �� O��
�� 
kocl O m    ��
�� 
obj ��  ��  ��   I m   " #����   F r   ' * P Q P m   ' ( R R � S S .   b u t   r e c e i v e d   s p e c i f i e r Q o      ����  0 actualtypename actualTypeName��   G l  - 4 T U V T r   - 4 W X W b   - 2 Y Z Y m   - . [ [ � \ \    b u t   r e c e i v e d   Z l  . 1 ]���� ] n  . 1 ^ _ ^ m   / 1��
�� 
pcls _ o   . /���� 0 thevalue theValue��  ��   X o      ����  0 actualtypename actualTypeName U include the value's type name in error message; note: this will display as raw four-char code when terminology isn't available, or may be a custom value in the case of records and scripts, but this can't be helped as it's a limitation of AppleScript itself    V � ` `   i n c l u d e   t h e   v a l u e ' s   t y p e   n a m e   i n   e r r o r   m e s s a g e ;   n o t e :   t h i s   w i l l   d i s p l a y   a s   r a w   f o u r - c h a r   c o d e   w h e n   t e r m i n o l o g y   i s n ' t   a v a i l a b l e ,   o r   m a y   b e   a   c u s t o m   v a l u e   i n   t h e   c a s e   o f   r e c o r d s   a n d   s c r i p t s ,   b u t   t h i s   c a n ' t   b e   h e l p e d   a s   i t ' s   a   l i m i t a t i o n   o f   A p p l e S c r i p t   i t s e l f C R      ������
�� .ascrerr ****      � ****��  ��   D r   < ? a b a m   < = c c � d d   b o      ����  0 actualtypename actualTypeName A  e�� e R   @ ^�� f g
�� .ascrerr ****      � **** f b   L ] h i h b   L Y j k j b   L W l m l b   L U n o n b   L Q p q p m   L O r r � s s  I n v a l i d   q o   O P���� 0 parametername parameterName o m   Q T t t � u u *   p a r a m e t e r   ( e x p e c t e d   m o   U V���� $0 expectedtypename expectedTypeName k o   W X����  0 actualtypename actualTypeName i m   Y \ v v � w w  ) . g �� x y
�� 
errn x m   B C�����Y y �� z {
�� 
erob z o   D E���� 0 thevalue theValue { �� |��
�� 
errt | o   H I���� 0 expectedtype expectedType��  ��     } ~ } l     ��������  ��  ��   ~   �  l     ��������  ��  ��   �  � � � i    � � � I      �� ����� 0 rethrowerror rethrowError �  � � � o      ���� 0 libraryname libraryName �  � � � o      ���� 0 handlername handlerName �  � � � o      ���� 0 etext eText �  � � � o      ���� 0 enumber eNumber �  � � � o      ���� 0 efrom eFrom �  � � � o      ���� 
0 eto eTo �  � � � o      ���� $0 targetobjectname targetObjectName �  ��� � o      ���� 0 partialresult partialResult��  ��   � l    = � � � � k     = � �  � � � r      � � � b     	 � � � b      � � � b      � � � b      � � � o     ���� 0 libraryname libraryName � m     � � � � �    c a n  t   � o    ���� 0 handlername handlerName � m     � � � � �  :   � o    ���� 0 etext eText � o      ���� 0 etext eText �  � � � Z    � ����� � >    � � � o    ���� $0 targetobjectname targetObjectName � m    ��
�� 
msng � r     � � � b     � � � b     � � � o    ���� $0 targetobjectname targetObjectName � m     � � � � �    o f   � o    ���� 0 etext eText � o      ���� 0 etext eText��  ��   �  ��� � Z    = � ��� � � =   ! � � � o    ���� 0 partialresult partialResult � m     ��
�� 
msng � R   $ .�� � �
�� .ascrerr ****      � **** � o   , -���� 0 etext eText � �� � �
�� 
errn � o   & '���� 0 enumber eNumber � �� � �
�� 
erob � o   ( )���� 0 efrom eFrom � �� ���
�� 
errt � o   * +���� 
0 eto eTo��  ��   � R   1 =�� � �
�� .ascrerr ****      � **** � o   ; <���� 0 etext eText � �� � �
�� 
errn � o   3 4���� 0 enumber eNumber � �� � �
�� 
erob � o   5 6���� 0 efrom eFrom � �� � �
�� 
errt � o   7 8���� 
0 eto eTo � �� ���
�� 
ptlr � o   9 :���� 0 partialresult partialResult��  ��   � ~ x targetObjectName and partialResult should be `missing value` if unused; if eTo is unused, AS seems to be to pass `item`    � � � � �   t a r g e t O b j e c t N a m e   a n d   p a r t i a l R e s u l t   s h o u l d   b e   ` m i s s i n g   v a l u e `   i f   u n u s e d ;   i f   e T o   i s   u n u s e d ,   A S   s e e m s   t o   b e   t o   p a s s   ` i t e m ` �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � q k convenience shortcuts for rethrowError() when targetObjectName and/or partialResult parameters aren't used    � � � � �   c o n v e n i e n c e   s h o r t c u t s   f o r   r e t h r o w E r r o r ( )   w h e n   t a r g e t O b j e c t N a m e   a n d / o r   p a r t i a l R e s u l t   p a r a m e t e r s   a r e n ' t   u s e d �  � � � l     ��������  ��  ��   �  � � � i    � � � I      �� ����� &0 throwcommanderror throwCommandError �  � � � o      ���� 0 libraryname libraryName �  � � � o      ���� 0 handlername handlerName �  � � � o      �� 0 etext eText �  � � � o      �~�~ 0 enumber eNumber �  � � � o      �}�} 0 efrom eFrom �  ��| � o      �{�{ 
0 eto eTo�|  ��   � R     �z ��y
�z .ascrerr ****      � **** � I    �x ��w�x 0 rethrowerror rethrowError �  � � � o    �v�v 0 libraryname libraryName �  � � � o    �u�u 0 handlername handlerName �  � � � o    �t�t 0 etext eText �  � � � o    �s�s 0 enumber eNumber �  � � � o    �r�r 0 efrom eFrom �  � � � o    	�q�q 
0 eto eTo �  � � � m   	 
�p
�p 
msng �  ��o � m   
 �n
�n 
msng�o  �w  �y   �  � � � l     �m�l�k�m  �l  �k   �  � � � l     �j�i�h�j  �i  �h   �  � � � i      I      �g�f�g $0 throwmethoderror throwMethodError  o      �e�e 0 libraryname libraryName  o      �d�d $0 targetobjectname targetObjectName  o      �c�c 0 handlername handlerName 	
	 o      �b�b 0 etext eText
  o      �a�a 0 enumber eNumber  o      �`�` 0 efrom eFrom �_ o      �^�^ 
0 eto eTo�_  �f   R     �]�\
�] .ascrerr ****      � **** I    �[�Z�[ 0 rethrowerror rethrowError  o    �Y�Y 0 libraryname libraryName  o    �X�X 0 handlername handlerName  o    �W�W 0 etext eText  o    �V�V 0 enumber eNumber  o    �U�U 0 efrom eFrom  o    	�T�T 
0 eto eTo  o   	 
�S�S $0 targetobjectname targetObjectName  �R  m   
 �Q
�Q 
msng�R  �Z  �\   � !"! l     �P�O�N�P  �O  �N  " #$# l     �M�L�K�M  �L  �K  $ %&% l     �J'(�J  ' J D--------------------------------------------------------------------   ( �)) � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -& *+* l     �I,-�I  ,f` convenience handlers for coercing parameters to commonly-used types, throwing a descriptive error if the coercion fails; use these to ensure parameters to library handlers are of the correct type (while AS handlers allow parameters to be directly annotated with `as TYPE` clauses, these are limited in capability and do not produce descriptive errors)   - �..�   c o n v e n i e n c e   h a n d l e r s   f o r   c o e r c i n g   p a r a m e t e r s   t o   c o m m o n l y - u s e d   t y p e s ,   t h r o w i n g   a   d e s c r i p t i v e   e r r o r   i f   t h e   c o e r c i o n   f a i l s ;   u s e   t h e s e   t o   e n s u r e   p a r a m e t e r s   t o   l i b r a r y   h a n d l e r s   a r e   o f   t h e   c o r r e c t   t y p e   ( w h i l e   A S   h a n d l e r s   a l l o w   p a r a m e t e r s   t o   b e   d i r e c t l y   a n n o t a t e d   w i t h   ` a s   T Y P E `   c l a u s e s ,   t h e s e   a r e   l i m i t e d   i n   c a p a b i l i t y   a n d   d o   n o t   p r o d u c e   d e s c r i p t i v e   e r r o r s )+ /0/ l     �H�G�F�H  �G  �F  0 121 l     �E�D�C�E  �D  �C  2 343 i   565 I      �B7�A�B (0 asbooleanparameter asBooleanParameter7 898 o      �@�@ 0 thevalue theValue9 :�?: o      �>�> 0 parametername parameterName�?  �A  6 Q     ;<=; L    >> c    ?@? o    �=�= 0 thevalue theValue@ m    �<
�< 
bool< R      �;�:A
�; .ascrerr ****      � ****�:  A �9B�8
�9 
errnB d      CC m      �7�7��8  = I    �6D�5�6 60 throwinvalidparametertype throwInvalidParameterTypeD EFE o    �4�4 0 thevalue theValueF GHG o    �3�3 0 parametername parameterNameH IJI m    KK �LL  b o o l e a nJ M�2M m    �1
�1 
bool�2  �5  4 NON l     �0�/�.�0  �/  �.  O PQP l     �-�,�+�-  �,  �+  Q RSR i   TUT I      �*V�)�* (0 asintegerparameter asIntegerParameterV WXW o      �(�( 0 thevalue theValueX Y�'Y o      �&�& 0 parametername parameterName�'  �)  U Q     Z[\Z L    ]] c    ^_^ o    �%�% 0 thevalue theValue_ m    �$
�$ 
long[ R      �#�"`
�# .ascrerr ****      � ****�"  ` �!a� 
�! 
errna d      bb m      ����   \ I    �c�� 60 throwinvalidparametertype throwInvalidParameterTypec ded o    �� 0 thevalue theValuee fgf o    �� 0 parametername parameterNameg hih m    jj �kk  i n t e g e ri l�l m    �
� 
long�  �  S mnm l     ����  �  �  n opo l     ����  �  �  p qrq i   sts I      �u�� "0 asrealparameter asRealParameteru vwv o      �� 0 thevalue theValuew x�x o      �� 0 parametername parameterName�  �  t Q     yz{y L    || c    }~} o    �� 0 thevalue theValue~ m    �
� 
doubz R      ��

� .ascrerr ****      � ****�
   �	��
�	 
errn� d      �� m      ����  { I    ���� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    �� 0 thevalue theValue� ��� o    �� 0 parametername parameterName� ��� m    �� ���  r e a l� ��� m    �
� 
doub�  �  r ��� l     � �����   ��  ��  � ��� l     ��������  ��  ��  � ��� i   ��� I      ������� &0 asnumberparameter asNumberParameter� ��� o      ���� 0 thevalue theValue� ���� o      ���� 0 parametername parameterName��  ��  � Q     ���� L    �� c    ��� o    ���� 0 thevalue theValue� m    ��
�� 
nmbr� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 thevalue theValue� ��� o    ���� 0 parametername parameterName� ��� m    �� ���  n u m b e r� ���� m    ��
�� 
nmbr��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i    #��� I      ������� "0 astextparameter asTextParameter� ��� o      ���� 0 thevalue theValue� ���� o      ���� 0 parametername parameterName��  ��  � Q     ���� l   ���� L    �� c    ��� o    ���� 0 thevalue theValue� m    ��
�� 
ctxt� � � note: AS requires `as` operator's RH operand to be literal type name, so can't be parameterized; instead, a separate as...Parameter() handler must be defined for each type   � ���X   n o t e :   A S   r e q u i r e s   ` a s `   o p e r a t o r ' s   R H   o p e r a n d   t o   b e   l i t e r a l   t y p e   n a m e ,   s o   c a n ' t   b e   p a r a m e t e r i z e d ;   i n s t e a d ,   a   s e p a r a t e   a s . . . P a r a m e t e r ( )   h a n d l e r   m u s t   b e   d e f i n e d   f o r   e a c h   t y p e� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 thevalue theValue� ��� o    ���� 0 parametername parameterName� ��� m    �� ���  t e x t� ���� m    ��
�� 
ctxt��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  $ '��� I      ������� "0 asdateparameter asDateParameter� ��� o      ���� 0 thevalue theValue� ���� o      ���� 0 parametername parameterName��  ��  � Q     ���� l   ���� L    �� c    ��� o    ���� 0 thevalue theValue� m    ��
�� 
ldt � 7 1 TO DO: if theValue is text, use `date theValue`?   � ��� b   T O   D O :   i f   t h e V a l u e   i s   t e x t ,   u s e   ` d a t e   t h e V a l u e ` ?� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 thevalue theValue� ��� o    ���� 0 parametername parameterName� ��� m    �� ���  d a t e� ���� m    ��
�� 
ldt ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  ( +��� I      ������� "0 aslistparameter asListParameter� ���� o      ���� 0 thevalue theValue��  ��  � k     �� ��� l     ������  �ic a more robust alternative to `theValue as list` that handles records correctly, e.g. `asListParameter({a:1,b:2})` returns `{{a:1,b:2}}` instead of `{1,2}` (AS's record-to-list coercion handler stupidly strips the record's keys, returning just its values, whereas its other TYPE-to-list coercion handlers simply wrap non-list values as a single-item list)   � �  �   a   m o r e   r o b u s t   a l t e r n a t i v e   t o   ` t h e V a l u e   a s   l i s t `   t h a t   h a n d l e s   r e c o r d s   c o r r e c t l y ,   e . g .   ` a s L i s t P a r a m e t e r ( { a : 1 , b : 2 } ) `   r e t u r n s   ` { { a : 1 , b : 2 } } `   i n s t e a d   o f   ` { 1 , 2 } `   ( A S ' s   r e c o r d - t o - l i s t   c o e r c i o n   h a n d l e r   s t u p i d l y   s t r i p s   t h e   r e c o r d ' s   k e y s ,   r e t u r n i n g   j u s t   i t s   v a l u e s ,   w h e r e a s   i t s   o t h e r   T Y P E - t o - l i s t   c o e r c i o n   h a n d l e r s   s i m p l y   w r a p   n o n - l i s t   v a l u e s   a s   a   s i n g l e - i t e m   l i s t )�  l     ����   � � note that unlike other as...Parameter handlers this doesn't take a parameterName parameter as it should never fail as *any* value can be successfully converted to a one-item list    �f   n o t e   t h a t   u n l i k e   o t h e r   a s . . . P a r a m e t e r   h a n d l e r s   t h i s   d o e s n ' t   t a k e   a   p a r a m e t e r N a m e   p a r a m e t e r   a s   i t   s h o u l d   n e v e r   f a i l   a s   * a n y *   v a l u e   c a n   b e   s u c c e s s f u l l y   c o n v e r t e d   t o   a   o n e - i t e m   l i s t  l     ��	��  
 caution: if the value is a list, it is returned as-is; handlers should not modify user-supplied lists in-place (unless that is an explicitly documented feature), but instead shallow copy it when needed, e.g. `set theListCopy to items of asListParameter(theList,"")`   	 �

   c a u t i o n :   i f   t h e   v a l u e   i s   a   l i s t ,   i t   i s   r e t u r n e d   a s - i s ;   h a n d l e r s   s h o u l d   n o t   m o d i f y   u s e r - s u p p l i e d   l i s t s   i n - p l a c e   ( u n l e s s   t h a t   i s   a n   e x p l i c i t l y   d o c u m e n t e d   f e a t u r e ) ,   b u t   i n s t e a d   s h a l l o w   c o p y   i t   w h e n   n e e d e d ,   e . g .   ` s e t   t h e L i s t C o p y   t o   i t e m s   o f   a s L i s t P a r a m e t e r ( t h e L i s t , " " ) ` �� Z     �� ?      l    	���� I    	��
�� .corecnte****       **** J      �� o     ���� 0 thevalue theValue��   ����
�� 
kocl m    ��
�� 
list��  ��  ��   m   	 
����   L     o    ���� 0 thevalue theValue��   L     J     �� o    ���� 0 thevalue theValue��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��     i  , /!"! I      ��#���� &0 asrecordparameter asRecordParameter# $%$ o      ���� 0 thevalue theValue% &��& o      ���� 0 parametername parameterName��  ��  " Q     '()' L    ** c    +,+ o    ���� 0 thevalue theValue, m    ��
�� 
reco( R      ����-
�� .ascrerr ****      � ****��  - ��.��
�� 
errn. d      // m      �������  ) I    ��0���� 60 throwinvalidparametertype throwInvalidParameterType0 121 o    ���� 0 thevalue theValue2 343 o    ���� 0 parametername parameterName4 565 m    77 �88  r e c o r d6 9��9 m    ��
�� 
reco��  ��    :;: l     ��������  ��  ��  ; <=< l     ��������  ��  ��  = >?> i  0 3@A@ I      �B�~� &0 asscriptparameter asScriptParameterB CDC o      �}�} 0 thevalue theValueD E�|E o      �{�{ 0 parametername parameterName�|  �~  A Q     FGHF L    II c    JKJ o    �z�z 0 thevalue theValueK m    �y
�y 
scptG R      �x�wL
�x .ascrerr ****      � ****�w  L �vM�u
�v 
errnM d      NN m      �t�t��u  H I    �sO�r�s 60 throwinvalidparametertype throwInvalidParameterTypeO PQP o    �q�q 0 thevalue theValueQ RSR o    �p�p 0 parametername parameterNameS TUT m    VV �WW  s c r i p tU X�oX m    �n
�n 
scpt�o  �r  ? YZY l     �m�l�k�m  �l  �k  Z [\[ l     �j�i�h�j  �i  �h  \ ]^] i  4 7_`_ I      �ga�f�g "0 astypeparameter asTypeParametera bcb o      �e�e 0 thevalue theValuec d�dd o      �c�c 0 parametername parameterName�d  �f  ` Q     efge L    hh c    iji o    �b�b 0 thevalue theValuej m    �a
�a 
typef R      �`�_k
�` .ascrerr ****      � ****�_  k �^l�]
�^ 
errnl d      mm m      �\�\��]  g I    �[n�Z�[ 60 throwinvalidparametertype throwInvalidParameterTypen opo o    �Y�Y 0 thevalue theValuep qrq o    �X�X 0 parametername parameterNamer sts m    uu �vv  t y p et w�Ww m    �V
�V 
type�W  �Z  ^ xyx l     �U�T�S�U  �T  �S  y z{z l     �R�Q�P�R  �Q  �P  { |}| i  8 ;~~ I      �O��N�O ,0 asposixpathparameter asPOSIXPathParameter� ��� o      �M�M 0 thevalue theValue� ��L� o      �K�K 0 parametername parameterName�L  �N   l    .���� Z     .���J�� ?     ��� l    	��I�H� I    	�G��
�G .corecnte****       ****� J     �� ��F� o     �E�E 0 thevalue theValue�F  � �D��C
�D 
kocl� m    �B
�B 
ctxt�C  �I  �H  � m   	 
�A�A  � l   ���� L    �� o    �@�@ 0 thevalue theValue�jd TO DO: what if any validation should be done here? (e.g. might want to check for leading slash, and/or absence of illegal chars; would running it through NSURL help?); might be best to have separate versions of this for absolute vs relative paths (e.g. `join path` accepts either, whereas `read file` probably wants absolute path) - need to think about it   � ����   T O   D O :   w h a t   i f   a n y   v a l i d a t i o n   s h o u l d   b e   d o n e   h e r e ?   ( e . g .   m i g h t   w a n t   t o   c h e c k   f o r   l e a d i n g   s l a s h ,   a n d / o r   a b s e n c e   o f   i l l e g a l   c h a r s ;   w o u l d   r u n n i n g   i t   t h r o u g h   N S U R L   h e l p ? ) ;   m i g h t   b e   b e s t   t o   h a v e   s e p a r a t e   v e r s i o n s   o f   t h i s   f o r   a b s o l u t e   v s   r e l a t i v e   p a t h s   ( e . g .   ` j o i n   p a t h `   a c c e p t s   e i t h e r ,   w h e r e a s   ` r e a d   f i l e `   p r o b a b l y   w a n t s   a b s o l u t e   p a t h )   -   n e e d   t o   t h i n k   a b o u t   i t�J  � Q    .���� L    �� n    ��� 1    �?
�? 
psxp� l   ��>�=� c    ��� o    �<�< 0 thevalue theValue� m    �;
�; 
furl�>  �=  � R      �:�9�
�: .ascrerr ****      � ****�9  � �8��7
�8 
errn� d      �� m      �6�6��7  � I   % .�5��4�5 60 throwinvalidparametertype throwInvalidParameterType� ��� o   & '�3�3 0 thevalue theValue� ��� o   ' (�2�2 0 parametername parameterName� ��� m   ( )�� ���  P O S I X   p a t h� ��1� m   ) *�0
�0 
ctxt�1  �4  � � � given any of AS's various file identifier objects (alias, �class furl�, etc) or a POSIX path string, returns a POSIX path string   � ���   g i v e n   a n y   o f   A S ' s   v a r i o u s   f i l e   i d e n t i f i e r   o b j e c t s   ( a l i a s ,   � c l a s s   f u r l � ,   e t c )   o r   a   P O S I X   p a t h   s t r i n g ,   r e t u r n s   a   P O S I X   p a t h   s t r i n g} ��� l     �/�.�-�/  �.  �-  � ��� l     �,�+�*�,  �+  �*  � ��)� l     �(�'�&�(  �'  �&  �)       �%�����������������%  � �$�#�"�!� �����������$ 60 throwinvalidparametertype throwInvalidParameterType�# 0 rethrowerror rethrowError�" &0 throwcommanderror throwCommandError�! $0 throwmethoderror throwMethodError�  (0 asbooleanparameter asBooleanParameter� (0 asintegerparameter asIntegerParameter� "0 asrealparameter asRealParameter� &0 asnumberparameter asNumberParameter� "0 astextparameter asTextParameter� "0 asdateparameter asDateParameter� "0 aslistparameter asListParameter� &0 asrecordparameter asRecordParameter� &0 asscriptparameter asScriptParameter� "0 astypeparameter asTypeParameter� ,0 asposixpathparameter asPOSIXPathParameter� � ������ 60 throwinvalidparametertype throwInvalidParameterType� ��� �  ����� 0 thevalue theValue� 0 parametername parameterName� $0 expectedtypename expectedTypeName� 0 expectedtype expectedType�  � ���
�	�� 0 thevalue theValue� 0 parametername parameterName�
 $0 expectedtypename expectedTypeName�	 0 expectedtype expectedType�  0 actualtypename actualTypeName� � 4 < >��� R [��� c� �������� r t v
� 
leng
� 
kocl
� 
obj 
� .corecnte****       ****
� 
pcls�  �  
�  
errn���Y
�� 
erob
�� 
errt�� � _��,j  �E�Y 	�%�%E�O  �kv��l j �E�Y 	��,%E�W 
X 
 �E�O)���a �a a �%a %�%�%a %� �� ����������� 0 rethrowerror rethrowError�� ����� �  ������������������ 0 libraryname libraryName�� 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� $0 targetobjectname targetObjectName�� 0 partialresult partialResult��  � ������������������ 0 libraryname libraryName�� 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� $0 targetobjectname targetObjectName�� 0 partialresult partialResult� 
 � ��� �������������
�� 
msng
�� 
errn
�� 
erob
�� 
errt�� 
�� 
ptlr�� �� >��%�%�%�%E�O�� ��%�%E�Y hO��  )����Y )������ �� ����������� &0 throwcommanderror throwCommandError�� ����� �  �������������� 0 libraryname libraryName�� 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo��  � �������������� 0 libraryname libraryName�� 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ������
�� 
msng�� �� 0 rethrowerror rethrowError�� )j*���������+ � ������������ $0 throwmethoderror throwMethodError�� ����� �  ���������������� 0 libraryname libraryName�� $0 targetobjectname targetObjectName�� 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo��  � ���������������� 0 libraryname libraryName�� $0 targetobjectname targetObjectName�� 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ������
�� 
msng�� �� 0 rethrowerror rethrowError�� )j*���������+ � ��6���������� (0 asbooleanparameter asBooleanParameter�� ����� �  ������ 0 thevalue theValue�� 0 parametername parameterName��  � ������ 0 thevalue theValue�� 0 parametername parameterName� �����K����
�� 
bool��  � ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType��  	��&W X  *�����+ � ��U���������� (0 asintegerparameter asIntegerParameter�� ����� �  ������ 0 thevalue theValue�� 0 parametername parameterName��  � ������ 0 thevalue theValue�� 0 parametername parameterName� �����j����
�� 
long��  � ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType��  	��&W X  *�����+ � ��t���������� "0 asrealparameter asRealParameter�� ����� �  ������ 0 thevalue theValue�� 0 parametername parameterName��  � ������ 0 thevalue theValue�� 0 parametername parameterName� ����������
�� 
doub��  � ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType��  	��&W X  *�����+ � ������������� &0 asnumberparameter asNumberParameter�� ����� �  ����� 0 thevalue theValue� 0 parametername parameterName��  � �~�}�~ 0 thevalue theValue�} 0 parametername parameterName� �|�{���z�y
�| 
nmbr�{  � �x�w�v
�x 
errn�w�\�v  �z �y 60 throwinvalidparametertype throwInvalidParameterType��  	��&W X  *�����+ � �u��t�s���r�u "0 astextparameter asTextParameter�t �q��q �  �p�o�p 0 thevalue theValue�o 0 parametername parameterName�s  � �n�m�n 0 thevalue theValue�m 0 parametername parameterName� �l�k���j�i
�l 
ctxt�k  � �h�g�f
�h 
errn�g�\�f  �j �i 60 throwinvalidparametertype throwInvalidParameterType�r  	��&W X  *�����+ � �e��d�c���b�e "0 asdateparameter asDateParameter�d �a��a �  �`�_�` 0 thevalue theValue�_ 0 parametername parameterName�c  � �^�]�^ 0 thevalue theValue�] 0 parametername parameterName� �\�[���Z�Y
�\ 
ldt �[  � �X�W�V
�X 
errn�W�\�V  �Z �Y 60 throwinvalidparametertype throwInvalidParameterType�b  	��&W X  *�����+ � �U��T�S���R�U "0 aslistparameter asListParameter�T �Q��Q �  �P�P 0 thevalue theValue�S  � �O�O 0 thevalue theValue� �N�M�L
�N 
kocl
�M 
list
�L .corecnte****       ****�R �kv��l j �Y �kv� �K"�J�I���H�K &0 asrecordparameter asRecordParameter�J �G��G �  �F�E�F 0 thevalue theValue�E 0 parametername parameterName�I  � �D�C�D 0 thevalue theValue�C 0 parametername parameterName� �B�A�7�@�?
�B 
reco�A  � �>�=�<
�> 
errn�=�\�<  �@ �? 60 throwinvalidparametertype throwInvalidParameterType�H  	��&W X  *�����+ � �;A�:�9���8�; &0 asscriptparameter asScriptParameter�: �7��7 �  �6�5�6 0 thevalue theValue�5 0 parametername parameterName�9  � �4�3�4 0 thevalue theValue�3 0 parametername parameterName� �2�1�V�0�/
�2 
scpt�1  � �.�-�,
�. 
errn�-�\�,  �0 �/ 60 throwinvalidparametertype throwInvalidParameterType�8  	��&W X  *�����+ � �+`�*�)���(�+ "0 astypeparameter asTypeParameter�* �'��' �  �&�%�& 0 thevalue theValue�% 0 parametername parameterName�)  � �$�#�$ 0 thevalue theValue�# 0 parametername parameterName� �"�!�u� �
�" 
type�!  � ���
� 
errn��\�  �  � 60 throwinvalidparametertype throwInvalidParameterType�(  	��&W X  *�����+ � ������� ,0 asposixpathparameter asPOSIXPathParameter� ��� �  ��� 0 thevalue theValue� 0 parametername parameterName�  � ��� 0 thevalue theValue� 0 parametername parameterName� 
����������
� 
kocl
� 
ctxt
� .corecnte****       ****
� 
furl
� 
psxp�  � �
�	�
�
 
errn�	�\�  � � 60 throwinvalidparametertype throwInvalidParameterType� /�kv��l j �Y  ��&�,EW X  *�����+ 	ascr  ��ޭ