FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� FormatLib -- parse and format AppleScript values

Notes:

- NSNumberFormatters, NSDateFormatters, etc. (like all other ASOC objects) shouldn't be retained in library (or script objects returned by it) as that breaks store script/save/autosave (caveat: if there is a significant performance difference between creating a formatter once and reusing it vs creating it each time, DateFormatterObjects could be returned as an _alternative_ to using `parse date`/`format date` handlers where user really needs the extra speed; however, documentation would need to state clearly that returned object contains ASOC data so can cause autosave, etc. to fail)


TO DO:

-- TO DO: need `hexadecimal style` option or similar, for converting to/from hex representations-- TO DO: what about specifying decimal places and padding? these are common tasks, so should be optional parameter (e.g. a record containing one or more of: decimal places, minimum decimal places, rounding method, minimum integral places)


- what about `pad text`? or should that be in TextLib?

- note that `format object` is problematic to implement for some types, as it'll require an AE handler-based implementation to convert some types (e.g. records, references) as ASOC can't convert script objects to NSAppleEventDescriptors, so there's no way to call OSAKit directly (FWIW, writing a script object to temp file via `store script` and reading that into OSALanguage would probably work, but would be slow and humiliatingly hacky); a custom OSAX/event handler wouldn't need to do much: just take a script object (which `format object` would create as a portable wrapper for theData), execute it (the script would just return a value), and get source code (and/or human-readable representation) of the result

- not sure about formatting type class and symbol constants (IIRC, AS only binds application info to reference objects, not type/constant objects, in which case only terms defined in AS's own dictionary will format as keywords and the rest will format using raw chevron syntax unless the appropriate app's terminology is forcibly loaded into AS interpreter at runtime (e.g. using `run script` trickery, or when running scripts in SE)


- `format number`, `parse number` -- canonical/locale-aware options (e.g. decimal, thousands separators), min/max significant places, etc; need to see what Cocoa has available

- note that DateLib and MathLib should also provide their own standard `convert text to TYPE` and `convert TYPE to text` handlers that receive/return a canonical string (e.g. ISO8601, numbers that always use period as decimal separator); unlike using `as` operator to coerce values, this will guarantee reliable conversions from/to text without AS's own current localization settings causing inconsistent/failed results

- what, if any, localization info (via NSLocale) might be relevant/useful to AS users?


- what about NSByteCountFormatter, NSDateComponentsFormatter, NSDateIntervalFormatter, NSEnergyFormatter, NSMassFormatter, NSLengthFormatter, MKDistanceFormatter?

     � 	 	�   F o r m a t L i b   - -   p a r s e   a n d   f o r m a t   A p p l e S c r i p t   v a l u e s 
 
 N o t e s : 
 
 -   N S N u m b e r F o r m a t t e r s ,   N S D a t e F o r m a t t e r s ,   e t c .   ( l i k e   a l l   o t h e r   A S O C   o b j e c t s )   s h o u l d n ' t   b e   r e t a i n e d   i n   l i b r a r y   ( o r   s c r i p t   o b j e c t s   r e t u r n e d   b y   i t )   a s   t h a t   b r e a k s   s t o r e   s c r i p t / s a v e / a u t o s a v e   ( c a v e a t :   i f   t h e r e   i s   a   s i g n i f i c a n t   p e r f o r m a n c e   d i f f e r e n c e   b e t w e e n   c r e a t i n g   a   f o r m a t t e r   o n c e   a n d   r e u s i n g   i t   v s   c r e a t i n g   i t   e a c h   t i m e ,   D a t e F o r m a t t e r O b j e c t s   c o u l d   b e   r e t u r n e d   a s   a n   _ a l t e r n a t i v e _   t o   u s i n g   ` p a r s e   d a t e ` / ` f o r m a t   d a t e `   h a n d l e r s   w h e r e   u s e r   r e a l l y   n e e d s   t h e   e x t r a   s p e e d ;   h o w e v e r ,   d o c u m e n t a t i o n   w o u l d   n e e d   t o   s t a t e   c l e a r l y   t h a t   r e t u r n e d   o b j e c t   c o n t a i n s   A S O C   d a t a   s o   c a n   c a u s e   a u t o s a v e ,   e t c .   t o   f a i l ) 
 
 
 T O   D O : 
 
 - -   T O   D O :   n e e d   ` h e x a d e c i m a l   s t y l e `   o p t i o n   o r   s i m i l a r ,   f o r   c o n v e r t i n g   t o / f r o m   h e x   r e p r e s e n t a t i o n s   - -   T O   D O :   w h a t   a b o u t   s p e c i f y i n g   d e c i m a l   p l a c e s   a n d   p a d d i n g ?   t h e s e   a r e   c o m m o n   t a s k s ,   s o   s h o u l d   b e   o p t i o n a l   p a r a m e t e r   ( e . g .   a   r e c o r d   c o n t a i n i n g   o n e   o r   m o r e   o f :   d e c i m a l   p l a c e s ,   m i n i m u m   d e c i m a l   p l a c e s ,   r o u n d i n g   m e t h o d ,   m i n i m u m   i n t e g r a l   p l a c e s )  
 
 
 -   w h a t   a b o u t   ` p a d   t e x t ` ?   o r   s h o u l d   t h a t   b e   i n   T e x t L i b ? 
 
 -   n o t e   t h a t   ` f o r m a t   o b j e c t `   i s   p r o b l e m a t i c   t o   i m p l e m e n t   f o r   s o m e   t y p e s ,   a s   i t ' l l   r e q u i r e   a n   A E   h a n d l e r - b a s e d   i m p l e m e n t a t i o n   t o   c o n v e r t   s o m e   t y p e s   ( e . g .   r e c o r d s ,   r e f e r e n c e s )   a s   A S O C   c a n ' t   c o n v e r t   s c r i p t   o b j e c t s   t o   N S A p p l e E v e n t D e s c r i p t o r s ,   s o   t h e r e ' s   n o   w a y   t o   c a l l   O S A K i t   d i r e c t l y   ( F W I W ,   w r i t i n g   a   s c r i p t   o b j e c t   t o   t e m p   f i l e   v i a   ` s t o r e   s c r i p t `   a n d   r e a d i n g   t h a t   i n t o   O S A L a n g u a g e   w o u l d   p r o b a b l y   w o r k ,   b u t   w o u l d   b e   s l o w   a n d   h u m i l i a t i n g l y   h a c k y ) ;   a   c u s t o m   O S A X / e v e n t   h a n d l e r   w o u l d n ' t   n e e d   t o   d o   m u c h :   j u s t   t a k e   a   s c r i p t   o b j e c t   ( w h i c h   ` f o r m a t   o b j e c t `   w o u l d   c r e a t e   a s   a   p o r t a b l e   w r a p p e r   f o r   t h e D a t a ) ,   e x e c u t e   i t   ( t h e   s c r i p t   w o u l d   j u s t   r e t u r n   a   v a l u e ) ,   a n d   g e t   s o u r c e   c o d e   ( a n d / o r   h u m a n - r e a d a b l e   r e p r e s e n t a t i o n )   o f   t h e   r e s u l t 
 
 -   n o t   s u r e   a b o u t   f o r m a t t i n g   t y p e   c l a s s   a n d   s y m b o l   c o n s t a n t s   ( I I R C ,   A S   o n l y   b i n d s   a p p l i c a t i o n   i n f o   t o   r e f e r e n c e   o b j e c t s ,   n o t   t y p e / c o n s t a n t   o b j e c t s ,   i n   w h i c h   c a s e   o n l y   t e r m s   d e f i n e d   i n   A S ' s   o w n   d i c t i o n a r y   w i l l   f o r m a t   a s   k e y w o r d s   a n d   t h e   r e s t   w i l l   f o r m a t   u s i n g   r a w   c h e v r o n   s y n t a x   u n l e s s   t h e   a p p r o p r i a t e   a p p ' s   t e r m i n o l o g y   i s   f o r c i b l y   l o a d e d   i n t o   A S   i n t e r p r e t e r   a t   r u n t i m e   ( e . g .   u s i n g   ` r u n   s c r i p t `   t r i c k e r y ,   o r   w h e n   r u n n i n g   s c r i p t s   i n   S E ) 
 
 
 -   ` f o r m a t   n u m b e r ` ,   ` p a r s e   n u m b e r `   - -   c a n o n i c a l / l o c a l e - a w a r e   o p t i o n s   ( e . g .   d e c i m a l ,   t h o u s a n d s   s e p a r a t o r s ) ,   m i n / m a x   s i g n i f i c a n t   p l a c e s ,   e t c ;   n e e d   t o   s e e   w h a t   C o c o a   h a s   a v a i l a b l e 
 
 -   n o t e   t h a t   D a t e L i b   a n d   M a t h L i b   s h o u l d   a l s o   p r o v i d e   t h e i r   o w n   s t a n d a r d   ` c o n v e r t   t e x t   t o   T Y P E `   a n d   ` c o n v e r t   T Y P E   t o   t e x t `   h a n d l e r s   t h a t   r e c e i v e / r e t u r n   a   c a n o n i c a l   s t r i n g   ( e . g .   I S O 8 6 0 1 ,   n u m b e r s   t h a t   a l w a y s   u s e   p e r i o d   a s   d e c i m a l   s e p a r a t o r ) ;   u n l i k e   u s i n g   ` a s `   o p e r a t o r   t o   c o e r c e   v a l u e s ,   t h i s   w i l l   g u a r a n t e e   r e l i a b l e   c o n v e r s i o n s   f r o m / t o   t e x t   w i t h o u t   A S ' s   o w n   c u r r e n t   l o c a l i z a t i o n   s e t t i n g s   c a u s i n g   i n c o n s i s t e n t / f a i l e d   r e s u l t s 
 
 -   w h a t ,   i f   a n y ,   l o c a l i z a t i o n   i n f o   ( v i a   N S L o c a l e )   m i g h t   b e   r e l e v a n t / u s e f u l   t o   A S   u s e r s ? 
 
 
 -   w h a t   a b o u t   N S B y t e C o u n t F o r m a t t e r ,   N S D a t e C o m p o n e n t s F o r m a t t e r ,   N S D a t e I n t e r v a l F o r m a t t e r ,   N S E n e r g y F o r m a t t e r ,   N S M a s s F o r m a t t e r ,   N S L e n g t h F o r m a t t e r ,   M K D i s t a n c e F o r m a t t e r ? 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �      s u p p o r t      l     ��������  ��  ��       !   l      " # $ " j    �� %�� 0 _supportlib _supportLib % N     & & 4    �� '
�� 
scpt ' m     ( ( � ) ) " L i b r a r y S u p p o r t L i b # "  used for parameter checking    $ � * * 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g !  + , + l     ��������  ��  ��   ,  - . - l     ��������  ��  ��   .  / 0 / i    1 2 1 I      �� 3���� 
0 _error   3  4 5 4 o      ���� 0 handlername handlerName 5  6 7 6 o      ���� 0 etext eText 7  8 9 8 o      ���� 0 enumber eNumber 9  : ; : o      ���� 0 efrom eFrom ;  <�� < o      ���� 
0 eto eTo��  ��   2 n     = > = I    �� ?���� &0 throwcommanderror throwCommandError ?  @ A @ m     B B � C C  F o r m a t L i b A  D E D o    ���� 0 handlername handlerName E  F G F o    ���� 0 etext eText G  H I H o    	���� 0 enumber eNumber I  J K J o   	 
���� 0 efrom eFrom K  L�� L o   
 ���� 
0 eto eTo��  ��   > o     ���� 0 _supportlib _supportLib 0  M N M l     ��������  ��  ��   N  O P O l     ��������  ��  ��   P  Q R Q l     �� S T��   S J D--------------------------------------------------------------------    T � U U � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - R  V W V l     �� X Y��   X   locale support    Y � Z Z    l o c a l e   s u p p o r t W  [ \ [ l     ��������  ��  ��   \  ] ^ ] i    _ ` _ I      �� a����  0 _localeforcode _localeForCode a  b�� b o      ���� 0 
localecode 
localeCode��  ��   ` k     	 c c  d e d l     �� f g��   f ( " TO DO: error if unrecognized code    g � h h D   T O   D O :   e r r o r   i f   u n r e c o g n i z e d   c o d e e  i�� i L     	 j j n     k l k I    �� m���� :0 localewithlocaleidentifier_ localeWithLocaleIdentifier_ m  n�� n o    ���� 0 
localecode 
localeCode��  ��   l n     o p o o    ���� 0 nslocale NSLocale p m     ��
�� misccura��   ^  q r q l     ��������  ��  ��   r  s t s l     �� u v��   u  -----    v � w w 
 - - - - - t  x y x l     ��������  ��  ��   y  z { z i    | } | I     ������
�� .Fmt:LLocnull��� ��� null��  ��   } l     ~  � ~ L      � � c      � � � l     ����� � n     � � � I    �� ����� 60 sortedarrayusingselector_ sortedArrayUsingSelector_ �  ��� � m     � � � � �  c o m p a r e :��  ��   � n     � � � I    �������� 80 availablelocaleidentifiers availableLocaleIdentifiers��  ��   � n     � � � o    ���� 0 nslocale NSLocale � m     ��
�� misccura��  ��   � m    ��
�� 
list  , &> {"af", "af_NA", "af_ZA", "agq", ...}    � � � � L >   { " a f " ,   " a f _ N A " ,   " a f _ Z A " ,   " a g q " ,   . . . } {  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �� � ���   �   numbers    � � � �    n u m b e r s �  � � � l     ��������  ��  ��   �  � � � i   ! � � � I      �� �����  0 _makeformatter _makeFormatter �  � � � o      ���� 0 formatstyle formatStyle �  ��� � o      ���� 0 
localecode 
localeCode��  ��   � k     � � �  � � � r      � � � n     � � � I    �������� 0 init  ��  ��   � n     � � � I    �������� 	0 alloc  ��  ��   � n     � � � o    ���� &0 nsnumberformatter NSNumberFormatter � m     ��
�� misccura � o      ���� 0 theformatter theFormatter �  � � � Z    � � � � � � =    � � � o    ���� 0 formatstyle formatStyle � m    ��
�� FNStFNS0 � n    � � � I    �� ����� "0 setnumberstyle_ setNumberStyle_ �  ��� � l    ����� � n    � � � o    ���� 40 nsnumberformatternostyle NSNumberFormatterNoStyle � m    ��
�� misccura��  ��  ��  ��   � o    ���� 0 theformatter theFormatter �  � � � =   " � � � o     ���� 0 formatstyle formatStyle � m     !��
�� FNStFNS1 �  � � � l  % - � � � � n  % - � � � I   & -�� ����� "0 setnumberstyle_ setNumberStyle_ �  ��� � l  & ) ����� � n  & ) � � � o   ' )���� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle � m   & '�
� misccura��  ��  ��  ��   � o   % &�~�~ 0 theformatter theFormatter � - ' uses thousands separators, no exponent    � � � � N   u s e s   t h o u s a n d s   s e p a r a t o r s ,   n o   e x p o n e n t �  � � � =  0 3 � � � o   0 1�}�} 0 formatstyle formatStyle � m   1 2�|
�| FNStFNS2 �  � � � l  6 > � � � � n  6 > � � � I   7 >�{ ��z�{ "0 setnumberstyle_ setNumberStyle_ �  ��y � l  7 : ��x�w � n  7 : � � � o   8 :�v�v @0 nsnumberformattercurrencystyle NSNumberFormatterCurrencyStyle � m   7 8�u
�u misccura�x  �w  �y  �z   � o   6 7�t�t 0 theformatter theFormatter �   adds currency symbol    � � � � *   a d d s   c u r r e n c y   s y m b o l �  � � � =  A D � � � o   A B�s�s 0 formatstyle formatStyle � m   B C�r
�r FNStFNS3 �  � � � l  G O � � � � n  G O � � � I   H O�q ��p�q "0 setnumberstyle_ setNumberStyle_ �  ��o � l  H K ��n�m � n  H K � � � o   I K�l�l >0 nsnumberformatterpercentstyle NSNumberFormatterPercentStyle � m   H I�k
�k misccura�n  �m  �o  �p   � o   G H�j�j 0 theformatter theFormatter � ( " multiplies by 100 and appends '%'    � � � � D   m u l t i p l i e s   b y   1 0 0   a n d   a p p e n d s   ' % ' �  � � � =  R U � � � o   R S�i�i 0 formatstyle formatStyle � m   S T�h
�h FNStFNS4 �  � � � n  X ` � � � I   Y `�g ��f�g "0 setnumberstyle_ setNumberStyle_ �  ��e � l  Y \ ��d�c � n  Y \   o   Z \�b�b D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle m   Y Z�a
�a misccura�d  �c  �e  �f   � o   X Y�`�` 0 theformatter theFormatter �  =  c f o   c d�_�_ 0 formatstyle formatStyle m   d e�^
�^ FNStFNS5 �] l  i s	 n  i s

 I   j s�\�[�\ "0 setnumberstyle_ setNumberStyle_ �Z l  j o�Y�X n  j o o   k o�W�W @0 nsnumberformatterspelloutstyle NSNumberFormatterSpellOutStyle m   j k�V
�V misccura�Y  �X  �Z  �[   o   i j�U�U 0 theformatter theFormatter  	 as words   	 �    a s   w o r d s�]   � R   v ��T
�T .ascrerr ****      � **** m   � � � b I n v a l i d    i n    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) . �S
�S 
errn m   z }�R�R�Y �Q
�Q 
erob o   � ��P�P 0 formatstyle formatStyle �O�N
�O 
errt m   � ��M
�M 
enum�N   �  Z   � ��L�K >  � �  o   � ��J�J 0 
localecode 
localeCode  m   � ��I
�I 
msng n  � �!"! I   � ��H#�G�H 0 
setlocale_ 
setLocale_# $�F$ I   � ��E%�D�E  0 _localeforcode _localeForCode% &�C& n  � �'(' I   � ��B)�A�B "0 astextparameter asTextParameter) *+* o   � ��@�@ 0 
localecode 
localeCode+ ,�?, m   � �-- �..  f o r   l o c a l e�?  �A  ( o   � ��>�> 0 _supportlib _supportLib�C  �D  �F  �G  " o   � ��=�= 0 theformatter theFormatter�L  �K   /�</ L   � �00 o   � ��;�; 0 theformatter theFormatter�<   � 121 l     �:�9�8�:  �9  �8  2 343 l     �7�6�5�7  �6  �5  4 565 l     �4�3�2�4  �3  �2  6 787 i  " %9:9 I     �1;<
�1 .Fmt:FNumnull���     nmbr; o      �0�0 0 	thenumber 	theNumber< �/=>
�/ 
Usin= |�.�-?�,@�.  �-  ? o      �+�+ 0 formatstyle formatStyle�,  @ l     A�*�)A m      �(
�( FNStFNS0�*  �)  > �'B�&
�' 
LocaB |�%�$C�#D�%  �$  C o      �"�" 0 
localecode 
localeCode�#  D l     E�!� E m      �
� 
msng�!  �   �&  : Q     HFGHF k    6II JKJ r    LML n   NON I    �P�� &0 asnumberparameter asNumberParameterP QRQ o    	�� 0 	thenumber 	theNumberR S�S m   	 
TT �UU  �  �  O o    �� 0 _supportlib _supportLibM o      �� 0 	thenumber 	theNumberK VWV r    XYX I    �Z��  0 _makeformatter _makeFormatterZ [\[ o    �� 0 formatstyle formatStyle\ ]�] o    �� 0 
localecode 
localeCode�  �  Y o      �� 0 theformatter theFormatterW ^_^ r    #`a` n   !bcb I    !�d�� &0 stringfromnumber_ stringFromNumber_d e�e o    �� 0 	thenumber 	theNumber�  �  c o    �� 0 theformatter theFormattera o      �� 0 	theresult 	theResult_ f�f Z  $ 6gh��
g =  $ 'iji o   $ %�	�	 0 	theresult 	theResultj m   % &�
� 
msngh R   * 2�kl
� .ascrerr ****      � ****k m   0 1mm �nn . C o u l d n ' t   f o r m a t   n u m b e r .l �op
� 
errno m   , -���Yp �q�
� 
erobq o   . /�� 0 	thenumber 	theNumber�  �  �
  �  G R      �rs
� .ascrerr ****      � ****r o      � �  0 etext eTexts ��tu
�� 
errnt o      ���� 0 enumber eNumberu ��vw
�� 
erobv o      ���� 0 efrom eFromw ��x��
�� 
errtx o      ���� 
0 eto eTo��  H I   > H��y���� 
0 _error  y z{z m   ? @|| �}}  f o r m a t   n u m b e r{ ~~ o   @ A���� 0 etext eText ��� o   A B���� 0 enumber eNumber� ��� o   B C���� 0 efrom eFrom� ���� o   C D���� 
0 eto eTo��  ��  8 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  & )��� I     ����
�� .Fmt:PNumnull���     ctxt� o      ���� 0 	thenumber 	theNumber� ����
�� 
Usin� |����������  ��  � o      ���� 0 formatstyle formatStyle��  � l     ������ m      ��
�� FNStFNS0��  ��  � �����
�� 
Loca� |����������  ��  � o      ���� 0 
localecode 
localeCode��  � l     ������ m      ��
�� 
msng��  ��  ��  � Q     ������  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I    ������� 
0 _error  � ��� m    �� ���  p a r s e   n u m b e r� ��� o    ���� 0 etext eText� ��� o    ���� 0 enumber eNumber� ��� o    ���� 0 efrom eFrom� ���� o    ���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   dates   � ���    d a t e s� ��� l     ��������  ��  ��  � ��� i  * -��� I     ����
�� .Fmt:FDatnull���     ldt � o      ���� 0 thedate theDate� ����
�� 
Usin� |����������  ��  � o      ���� 0 thetemplate theTemplate��  � l     ������ J      �� ���� m      ��
�� FDStFDS1��  ��  ��  � �����
�� 
Loca� |����������  ��  � o      ���� 0 
localecode 
localeCode��  � l     ������ m      ��
�� 
msng��  ��  ��  � Q     ������  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I    ������� 
0 _error  � ��� m    �� ���  f o r m a t   d a t e� ��� o    ���� 0 etext eText� ��� o    ���� 0 enumber eNumber� ��� o    ���� 0 efrom eFrom� ���� o    ���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� i  . 1��� I     ����
�� .Fmt:PDatnull���     ctxt� o      ���� 0 thedate theDate� ����
�� 
Usin� |����������  ��  � o      ���� 0 thetemplate theTemplate��  � l     ������ J      �� ���� m      ��
�� FDStFDS1��  ��  ��  � �����
�� 
Loca� |����������  ��  � o      ���� 0 
localecode 
localeCode��  � l     ������ m      ��
�� 
msng��  ��  ��  � Q     ������  � R      ���
� .ascrerr ****      � ****� o      �~�~ 0 etext eText� �}��
�} 
errn� o      �|�| 0 enumber eNumber� �{��
�{ 
erob� o      �z�z 0 efrom eFrom� �y��x
�y 
errt� o      �w�w 
0 eto eTo�x  � I    �v��u�v 
0 _error  �    m     �  p a r s e   d a t e  o    �t�t 0 etext eText  o    �s�s 0 enumber eNumber 	 o    �r�r 0 efrom eFrom	 
�q
 o    �p�p 
0 eto eTo�q  �u  �  l     �o�n�m�o  �n  �m    l     �l�k�j�l  �k  �j    l     �i�i   J D--------------------------------------------------------------------    � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     �h�h     JSON    � 
   J S O N  l     �g�f�e�g  �f  �e    l     �d�d   J D--------------------------------------------------------------------    � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  !  l     �c"#�c  "   general   # �$$    g e n e r a l! %&% l     �b�a�`�b  �a  �`  & '(' i  2 5)*) I     �_�^+
�_ .Fmt:FObjnull��� ��� null�^  + �],-
�] 
From, o      �\�\ 0 thedata theData- �[./
�[ 
Usin. |�Z�Y0�X1�Z  �Y  0 o      �W�W 0 thetemplate theTemplate�X  1 l     2�V�U2 m      �T
�T 
msng�V  �U  / �S34
�S 
Loca3 |�R�Q5�P6�R  �Q  5 o      �O�O 0 
localecode 
localeCode�P  6 l     7�N�M7 m      �L
�L 
msng�N  �M  4 �K8�J
�K 
Code8 |�I�H9�G:�I  �H  9 o      �F�F 0 	codestyle 	codeStyle�G  : l     ;�E�D; m      �C
�C boovfals�E  �D  �J  * Q     <=>< k    ?? @A@ l   �B�A�@�B  �A  �@  A BCB l   �?DE�?  D � � if theTemplate is missing value, format theData as-is; if it's text then convert theData to list and replace template's $1, $2, etc. placeholder   E �FF"   i f   t h e T e m p l a t e   i s   m i s s i n g   v a l u e ,   f o r m a t   t h e D a t a   a s - i s ;   i f   i t ' s   t e x t   t h e n   c o n v e r t   t h e D a t a   t o   l i s t   a n d   r e p l a c e   t e m p l a t e ' s   $ 1 ,   $ 2 ,   e t c .   p l a c e h o l d e rC GHG l   �>�=�<�>  �=  �<  H IJI l   �;KL�;  K � � codeStyle determines OSADisplay rendering style (note that most value types can be rendered using vanilla code; only specifiers and records have to be rendered via OSA APIs; will need to see which is faster)   L �MM�   c o d e S t y l e   d e t e r m i n e s   O S A D i s p l a y   r e n d e r i n g   s t y l e   ( n o t e   t h a t   m o s t   v a l u e   t y p e s   c a n   b e   r e n d e r e d   u s i n g   v a n i l l a   c o d e ;   o n l y   s p e c i f i e r s   a n d   r e c o r d s   h a v e   t o   b e   r e n d e r e d   v i a   O S A   A P I s ;   w i l l   n e e d   t o   s e e   w h i c h   i s   f a s t e r )J NON l   �:�9�8�:  �9  �8  O P�7P l   �6QR�6  Q�� rendering arbitrary AS values requires wrapping the value in a script object (to preserve context info such as an object specifier's target application), converting that script to a typeScript descriptor (e.g. by packing it into an Apple event and sending it to a previously installed AE handler), passing that object to OSALoad and executing it to return the value as a new OSAID which can then be rendered via OSADisplay   R �SSN   r e n d e r i n g   a r b i t r a r y   A S   v a l u e s   r e q u i r e s   w r a p p i n g   t h e   v a l u e   i n   a   s c r i p t   o b j e c t   ( t o   p r e s e r v e   c o n t e x t   i n f o   s u c h   a s   a n   o b j e c t   s p e c i f i e r ' s   t a r g e t   a p p l i c a t i o n ) ,   c o n v e r t i n g   t h a t   s c r i p t   t o   a   t y p e S c r i p t   d e s c r i p t o r   ( e . g .   b y   p a c k i n g   i t   i n t o   a n   A p p l e   e v e n t   a n d   s e n d i n g   i t   t o   a   p r e v i o u s l y   i n s t a l l e d   A E   h a n d l e r ) ,   p a s s i n g   t h a t   o b j e c t   t o   O S A L o a d   a n d   e x e c u t i n g   i t   t o   r e t u r n   t h e   v a l u e   a s   a   n e w   O S A I D   w h i c h   c a n   t h e n   b e   r e n d e r e d   v i a   O S A D i s p l a y�7  = R      �5TU
�5 .ascrerr ****      � ****T o      �4�4 0 etext eTextU �3VW
�3 
errnV o      �2�2 0 enumber eNumberW �1XY
�1 
erobX o      �0�0 0 efrom eFromY �/Z�.
�/ 
errtZ o      �-�- 
0 eto eTo�.  > I    �,[�+�, 
0 _error  [ \]\ m    ^^ �__  p a r s e   n u m b e r] `a` o    �*�* 0 etext eTexta bcb o    �)�) 0 enumber eNumberc ded o    �(�( 0 efrom eFrome f�'f o    �&�& 
0 eto eTo�'  �+  ( ghg l     �%�$�#�%  �$  �#  h iji l     �"�!� �"  �!  �   j klk l     �mn�  m 5 / TO DO: convert from text theText [to TYPE] ...   n �oo ^   T O   D O :   c o n v e r t   f r o m   t e x t   t h e T e x t   [ t o   T Y P E ]   . . .l pqp l     ����  �  �  q r�r l     ����  �  �  �       �stuvwxyz{|}~�  s �����������
� 
pimr� 0 _supportlib _supportLib� 
0 _error  �  0 _localeforcode _localeForCode
� .Fmt:LLocnull��� ��� null�  0 _makeformatter _makeFormatter
� .Fmt:FNumnull���     nmbr
� .Fmt:PNumnull���     ctxt
� .Fmt:FDatnull���     ldt 
� .Fmt:PDatnull���     ctxt
� .Fmt:FObjnull��� ��� nullt ��   �� �
��	
�
 
cobj� ��   � 
� 
frmk�	  u ��   � (
� 
scptv � 2������ 
0 _error  � ��� �  �� ������� 0 handlername handlerName�  0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�  � ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�  B������ �� &0 throwcommanderror throwCommandError� b  ࠡ����+ w �� `����������  0 _localeforcode _localeForCode�� ����� �  ���� 0 
localecode 
localeCode��  � ���� 0 
localecode 
localeCode� ������
�� misccura�� 0 nslocale NSLocale�� :0 localewithlocaleidentifier_ localeWithLocaleIdentifier_�� 
��,�k+ x �� }��������
�� .Fmt:LLocnull��� ��� null��  ��  �  � ������ �����
�� misccura�� 0 nslocale NSLocale�� 80 availablelocaleidentifiers availableLocaleIdentifiers�� 60 sortedarrayusingselector_ sortedArrayUsingSelector_
�� 
list�� ��,j+ �k+ �&y �� �����������  0 _makeformatter _makeFormatter�� ����� �  ������ 0 formatstyle formatStyle�� 0 
localecode 
localeCode��  � �������� 0 formatstyle formatStyle�� 0 
localecode 
localeCode�� 0 theformatter theFormatter� ������������������������������������������������-������
�� misccura�� &0 nsnumberformatter NSNumberFormatter�� 	0 alloc  �� 0 init  
�� FNStFNS0�� 40 nsnumberformatternostyle NSNumberFormatterNoStyle�� "0 setnumberstyle_ setNumberStyle_
�� FNStFNS1�� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle
�� FNStFNS2�� @0 nsnumberformattercurrencystyle NSNumberFormatterCurrencyStyle
�� FNStFNS3�� >0 nsnumberformatterpercentstyle NSNumberFormatterPercentStyle
�� FNStFNS4�� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle
�� FNStFNS5�� @0 nsnumberformatterspelloutstyle NSNumberFormatterSpellOutStyle
�� 
errn���Y
�� 
erob
�� 
errt
�� 
enum�� 
�� 
msng�� "0 astextparameter asTextParameter��  0 _localeforcode _localeForCode�� 0 
setlocale_ 
setLocale_�� ���,j+ j+ E�O��  ���,k+ Y q��  ���,k+ Y `��  ���,k+ Y O��  ���,k+ Y >��  ���,k+ Y -��  ��a ,k+ Y )a a a �a a a a O�a  �*b  �a l+ k+ k+ Y hO�z ��:��������
�� .Fmt:FNumnull���     nmbr�� 0 	thenumber 	theNumber�� ����
�� 
Usin� {�������� 0 formatstyle formatStyle��  
�� FNStFNS0� �����
�� 
Loca� {�������� 0 
localecode 
localeCode��  
�� 
msng��  � 	�������������������� 0 	thenumber 	theNumber�� 0 formatstyle formatStyle�� 0 
localecode 
localeCode�� 0 theformatter theFormatter�� 0 	theresult 	theResult�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� T����������������m���|������ &0 asnumberparameter asNumberParameter��  0 _makeformatter _makeFormatter�� &0 stringfromnumber_ stringFromNumber_
�� 
msng
�� 
errn���Y
�� 
erob�� �� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� I 8b  ��l+ E�O*��l+ E�O��k+ E�O��  )�����Y hW X 
 *쥦���+ { �����������
�� .Fmt:PNumnull���     ctxt�� 0 	thenumber 	theNumber�� ����
�� 
Usin� {�������� 0 formatstyle formatStyle��  
�� FNStFNS0� �����
�� 
Loca� {�������� 0 
localecode 
localeCode��  
�� 
msng��  � ���������������� 0 	thenumber 	theNumber�� 0 formatstyle formatStyle�� 0 
localecode 
localeCode�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ��������� 0 etext eText� �~�}�
�~ 
errn�} 0 enumber eNumber� �|�{�
�| 
erob�{ 0 efrom eFrom� �z�y�x
�z 
errt�y 
0 eto eTo�x  �� � 
0 _error  ��  hW X   *⣤���+ | �w��v�u���t
�w .Fmt:FDatnull���     ldt �v 0 thedate theDate�u �s��
�s 
Usin� {�r�q��r 0 thetemplate theTemplate�q  � �p��p �  �o
�o FDStFDS1� �n��m
�n 
Loca� {�l�k�j�l 0 
localecode 
localeCode�k  
�j 
msng�m  � �i�h�g�f�e�d�c�i 0 thedate theDate�h 0 thetemplate theTemplate�g 0 
localecode 
localeCode�f 0 etext eText�e 0 enumber eNumber�d 0 efrom eFrom�c 
0 eto eTo� �b���a�`�b 0 etext eText� �_�^�
�_ 
errn�^ 0 enumber eNumber� �]�\�
�] 
erob�\ 0 efrom eFrom� �[�Z�Y
�[ 
errt�Z 
0 eto eTo�Y  �a �` 
0 _error  �t  hW X   *⣤���+ } �X��W�V���U
�X .Fmt:PDatnull���     ctxt�W 0 thedate theDate�V �T��
�T 
Usin� {�S�R��S 0 thetemplate theTemplate�R  � �Q��Q �  �P
�P FDStFDS1� �O��N
�O 
Loca� {�M�L�K�M 0 
localecode 
localeCode�L  
�K 
msng�N  � �J�I�H�G�F�E�D�J 0 thedate theDate�I 0 thetemplate theTemplate�H 0 
localecode 
localeCode�G 0 etext eText�F 0 enumber eNumber�E 0 efrom eFrom�D 
0 eto eTo� �C��B�A�C 0 etext eText� �@�?�
�@ 
errn�? 0 enumber eNumber� �>�=�
�> 
erob�= 0 efrom eFrom� �<�;�:
�< 
errt�; 
0 eto eTo�:  �B �A 
0 _error  �U  hW X   *⣤���+ ~ �9*�8�7���6
�9 .Fmt:FObjnull��� ��� null�8  �7 �5�4�
�5 
From�4 0 thedata theData� �3��
�3 
Usin� {�2�1�0�2 0 thetemplate theTemplate�1  
�0 
msng� �/��
�/ 
Loca� {�.�-�,�. 0 
localecode 
localeCode�-  
�, 
msng� �+��*
�+ 
Code� {�)�(�'�) 0 	codestyle 	codeStyle�(  
�' boovfals�*  � �&�%�$�#�"�!� ��& 0 thedata theData�% 0 thetemplate theTemplate�$ 0 
localecode 
localeCode�# 0 	codestyle 	codeStyle�" 0 etext eText�! 0 enumber eNumber�  0 efrom eFrom� 
0 eto eTo� ��^��� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �6  hW X   *⤥���+ ascr  ��ޭ