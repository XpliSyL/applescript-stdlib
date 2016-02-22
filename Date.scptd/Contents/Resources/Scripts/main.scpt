FasdUAS 1.101.10   ��   ��    k             l      ��  ��   

  Date -- make, parse, and format dates and date strings

Notes:

- `join date` and `parse date` provide robust alternatives to `date TEXT` specifier for constructing date objects, (`date dateString` has serious portability and usability problems as it requires a precisely formatted *localized* date string): `join date` takes a record of numeric year/month/day/etc values, `parse date` takes a fixed format (ISO8601) by default


Caution:

- AppleScript's date objects are mutable(!), so any time a new date object is needed, either construct it from scratch using ASOC's `(NSDate's date...()) as date`, Standard Additions' `current date` command, or `copy _defaultDate to newDate` and work on the *copy*. NEVER use, modify, or return _defaultDate (or any other retained date object) directly, as allowing a shared mutable object to escape from this library and run loose around users' programs is a guaranteed recipe for chaos and disaster. (It's bad enough when lists and records do this, but dates don't look like mutable collections so users are even less likely to realize they contain shareable state.)


TO DO: 

- add optional `timezone` parameter to `format date` to specify timezone to use (AS dates always use host machine's timezone, so extra info is needed to format dates for any other tz)


- should `join date` implement optional `with/without rollover allowed` parameter to determine if out-of-range values should be allowed to rollover or not (default: error if rollover detected) check for any out-of-range properties, as AS will silently roll over (Q. what about leap-seconds?) TBH, probably be simpler and safer to range-check year+month+hours+minutes (all those ranges are fixed, so as long as the rec's properties are anywhere within those ranges they're ok), and comparison-check the day (allowing some flexibility in the event that a leap second nudges it over to the next day), and finally check the seconds isn't obviously invalid (e.g. -1, 70)


- what about timezone support? (obviously this is problematic as AS's date type and AEM's typeLongDateTime support current TZ only, but for general date manipulation tasks a script object wrapper, or (perhaps preferable from user's POV since it's transparent) a {class:date with timezone,time:...,timezone:...} record, could be defined that stores an arbitrary TZ in addition to standard date value); see also `time to GMT` in StandardAdditions (Q. would a `offset for timezone` command that returns difference between current tz and any other be more useful?); see also NSTimeZone

     � 	 	    D a t e   - -   m a k e ,   p a r s e ,   a n d   f o r m a t   d a t e s   a n d   d a t e   s t r i n g s 
 
 N o t e s : 
 
 -   ` j o i n   d a t e `   a n d   ` p a r s e   d a t e `   p r o v i d e   r o b u s t   a l t e r n a t i v e s   t o   ` d a t e   T E X T `   s p e c i f i e r   f o r   c o n s t r u c t i n g   d a t e   o b j e c t s ,   ( ` d a t e   d a t e S t r i n g `   h a s   s e r i o u s   p o r t a b i l i t y   a n d   u s a b i l i t y   p r o b l e m s   a s   i t   r e q u i r e s   a   p r e c i s e l y   f o r m a t t e d   * l o c a l i z e d *   d a t e   s t r i n g ) :   ` j o i n   d a t e `   t a k e s   a   r e c o r d   o f   n u m e r i c   y e a r / m o n t h / d a y / e t c   v a l u e s ,   ` p a r s e   d a t e `   t a k e s   a   f i x e d   f o r m a t   ( I S O 8 6 0 1 )   b y   d e f a u l t  
 
 
 C a u t i o n : 
 
 -   A p p l e S c r i p t ' s   d a t e   o b j e c t s   a r e   m u t a b l e ( ! ) ,   s o   a n y   t i m e   a   n e w   d a t e   o b j e c t   i s   n e e d e d ,   e i t h e r   c o n s t r u c t   i t   f r o m   s c r a t c h   u s i n g   A S O C ' s   ` ( N S D a t e ' s   d a t e . . . ( ) )   a s   d a t e ` ,   S t a n d a r d   A d d i t i o n s '   ` c u r r e n t   d a t e `   c o m m a n d ,   o r   ` c o p y   _ d e f a u l t D a t e   t o   n e w D a t e `   a n d   w o r k   o n   t h e   * c o p y * .   N E V E R   u s e ,   m o d i f y ,   o r   r e t u r n   _ d e f a u l t D a t e   ( o r   a n y   o t h e r   r e t a i n e d   d a t e   o b j e c t )   d i r e c t l y ,   a s   a l l o w i n g   a   s h a r e d   m u t a b l e   o b j e c t   t o   e s c a p e   f r o m   t h i s   l i b r a r y   a n d   r u n   l o o s e   a r o u n d   u s e r s '   p r o g r a m s   i s   a   g u a r a n t e e d   r e c i p e   f o r   c h a o s   a n d   d i s a s t e r .   ( I t ' s   b a d   e n o u g h   w h e n   l i s t s   a n d   r e c o r d s   d o   t h i s ,   b u t   d a t e s   d o n ' t   l o o k   l i k e   m u t a b l e   c o l l e c t i o n s   s o   u s e r s   a r e   e v e n   l e s s   l i k e l y   t o   r e a l i z e   t h e y   c o n t a i n   s h a r e a b l e   s t a t e . ) 
 
 
 T O   D O :   
 
 -   a d d   o p t i o n a l   ` t i m e z o n e `   p a r a m e t e r   t o   ` f o r m a t   d a t e `   t o   s p e c i f y   t i m e z o n e   t o   u s e   ( A S   d a t e s   a l w a y s   u s e   h o s t   m a c h i n e ' s   t i m e z o n e ,   s o   e x t r a   i n f o   i s   n e e d e d   t o   f o r m a t   d a t e s   f o r   a n y   o t h e r   t z )  
 
 
 -   s h o u l d   ` j o i n   d a t e `   i m p l e m e n t   o p t i o n a l   ` w i t h / w i t h o u t   r o l l o v e r   a l l o w e d `   p a r a m e t e r   t o   d e t e r m i n e   i f   o u t - o f - r a n g e   v a l u e s   s h o u l d   b e   a l l o w e d   t o   r o l l o v e r   o r   n o t   ( d e f a u l t :   e r r o r   i f   r o l l o v e r   d e t e c t e d )   c h e c k   f o r   a n y   o u t - o f - r a n g e   p r o p e r t i e s ,   a s   A S   w i l l   s i l e n t l y   r o l l   o v e r   ( Q .   w h a t   a b o u t   l e a p - s e c o n d s ? )   T B H ,   p r o b a b l y   b e   s i m p l e r   a n d   s a f e r   t o   r a n g e - c h e c k   y e a r + m o n t h + h o u r s + m i n u t e s   ( a l l   t h o s e   r a n g e s   a r e   f i x e d ,   s o   a s   l o n g   a s   t h e   r e c ' s   p r o p e r t i e s   a r e   a n y w h e r e   w i t h i n   t h o s e   r a n g e s   t h e y ' r e   o k ) ,   a n d   c o m p a r i s o n - c h e c k   t h e   d a y   ( a l l o w i n g   s o m e   f l e x i b i l i t y   i n   t h e   e v e n t   t h a t   a   l e a p   s e c o n d   n u d g e s   i t   o v e r   t o   t h e   n e x t   d a y ) ,   a n d   f i n a l l y   c h e c k   t h e   s e c o n d s   i s n ' t   o b v i o u s l y   i n v a l i d   ( e . g .   - 1 ,   7 0 ) 
 
 
 -   w h a t   a b o u t   t i m e z o n e   s u p p o r t ?   ( o b v i o u s l y   t h i s   i s   p r o b l e m a t i c   a s   A S ' s   d a t e   t y p e   a n d   A E M ' s   t y p e L o n g D a t e T i m e   s u p p o r t   c u r r e n t   T Z   o n l y ,   b u t   f o r   g e n e r a l   d a t e   m a n i p u l a t i o n   t a s k s   a   s c r i p t   o b j e c t   w r a p p e r ,   o r   ( p e r h a p s   p r e f e r a b l e   f r o m   u s e r ' s   P O V   s i n c e   i t ' s   t r a n s p a r e n t )   a   { c l a s s : d a t e   w i t h   t i m e z o n e , t i m e : . . . , t i m e z o n e : . . . }   r e c o r d ,   c o u l d   b e   d e f i n e d   t h a t   s t o r e s   a n   a r b i t r a r y   T Z   i n   a d d i t i o n   t o   s t a n d a r d   d a t e   v a l u e ) ;   s e e   a l s o   ` t i m e   t o   G M T `   i n   S t a n d a r d A d d i t i o n s   ( Q .   w o u l d   a   ` o f f s e t   f o r   t i m e z o n e `   c o m m a n d   t h a t   r e t u r n s   d i f f e r e n c e   b e t w e e n   c u r r e n t   t z   a n d   a n y   o t h e r   b e   m o r e   u s e f u l ? ) ;   s e e   a l s o   N S T i m e Z o n e 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �        s u p p o r t   ! " ! l     ��������  ��  ��   "  # $ # l      % & ' % j    �� (�� 0 _support   ( N     ) ) 4    �� *
�� 
scpt * m     + + � , ,  T y p e S u p p o r t & "  used for parameter checking    ' � - - 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g $  . / . l     ��������  ��  ��   /  0 1 0 i   ! 2 3 2 I      �� 4���� 
0 _error   4  5 6 5 o      ���� 0 handlername handlerName 6  7 8 7 o      ���� 0 etext eText 8  9 : 9 o      ���� 0 enumber eNumber :  ; < ; o      ���� 0 efrom eFrom <  =�� = o      ���� 
0 eto eTo��  ��   3 n     > ? > I    �� @���� &0 throwcommanderror throwCommandError @  A B A m     C C � D D  D a t e B  E F E o    ���� 0 handlername handlerName F  G H G o    ���� 0 etext eText H  I J I o    	���� 0 enumber eNumber J  K L K o   	 
���� 0 efrom eFrom L  M�� M o   
 ���� 
0 eto eTo��  ��   ? o     ���� 0 _support   1  N O N l     ��������  ��  ��   O  P Q P l     ��������  ��  ��   Q  R S R l     ��������  ��  ��   S  T U T i  " % V W V I      �������� $0 _makedefaultdate _makeDefaultDate��  ��   W l    E X Y Z X O     E [ \ [ k    D ] ]  ^ _ ^ r    ) ` a ` J     b b  c d c m    	����� d  e f e m   	 
����  f  g�� g m   
 ���� ��   a J       h h  i j i n      k l k 1    ��
�� 
year l  g     j  m n m n      o p o m    ��
�� 
mnth p  g     n  q�� q n      r s r 1   % '��
�� 
day  s  g   $ %��   _  t u t l  * A v w x v r   * A y z y J   * . { {  | } | m   * +����  }  ~�� ~ m   + ,����  ��   z J          � � � n      � � � m   4 6��
�� 
mnth �  g   3 4 �  ��� � n      � � � 1   = ?��
�� 
time �  g   < =��   w=7 note: month property normally needs set twice as it may have rolled over to next month if date's original `day` property was greater than no. of days in the new month (it doesn't actually matter in this particular case as January always has 31 days, but it's included anyway as a cautionary reminder to others)    x � � �n   n o t e :   m o n t h   p r o p e r t y   n o r m a l l y   n e e d s   s e t   t w i c e   a s   i t   m a y   h a v e   r o l l e d   o v e r   t o   n e x t   m o n t h   i f   d a t e ' s   o r i g i n a l   ` d a y `   p r o p e r t y   w a s   g r e a t e r   t h a n   n o .   o f   d a y s   i n   t h e   n e w   m o n t h   ( i t   d o e s n ' t   a c t u a l l y   m a t t e r   i n   t h i s   p a r t i c u l a r   c a s e   a s   J a n u a r y   a l w a y s   h a s   3 1   d a y s ,   b u t   i t ' s   i n c l u d e d   a n y w a y   a s   a   c a u t i o n a r y   r e m i n d e r   t o   o t h e r s ) u  ��� � L   B D � �  g   B C��   \ l     ����� � I    ������
�� .misccurdldt    ��� null��  ��  ��  ��   Y � � kludge that avoids having to use AppleScript's `date "..."` specifier syntax in this code (which requires the string literal to be written in the host system's localized date format, making the source code non-portable)    Z � � ��   k l u d g e   t h a t   a v o i d s   h a v i n g   t o   u s e   A p p l e S c r i p t ' s   ` d a t e   " . . . " `   s p e c i f i e r   s y n t a x   i n   t h i s   c o d e   ( w h i c h   r e q u i r e s   t h e   s t r i n g   l i t e r a l   t o   b e   w r i t t e n   i n   t h e   h o s t   s y s t e m ' s   l o c a l i z e d   d a t e   f o r m a t ,   m a k i n g   t h e   s o u r c e   c o d e   n o n - p o r t a b l e ) U  � � � l     ��������  ��  ��   �  � � � l      � � � � j   & ,�� ��� 0 _defaultdate _defaultDate � I   & +�������� $0 _makedefaultdate _makeDefaultDate��  ��   � 1 + 1 January 2001, 00:00:00, i.e. Cocoa epoch    � � � � V   1   J a n u a r y   2 0 0 1 ,   0 0 : 0 0 : 0 0 ,   i . e .   C o c o a   e p o c h �  � � � l     ��������  ��  ��   �  � � � j   - L�� ��� 0 _months   � J   - K � �  � � � m   - .��
�� 
jan  �  � � � m   . /��
�� 
feb  �  � � � m   / 0��
�� 
mar  �  � � � m   0 1��
�� 
apr  �  � � � m   1 2��
�� 
may  �  � � � m   2 5��
�� 
jun  �  � � � m   5 8��
�� 
jul  �  � � � m   8 ;��
�� 
aug  �  � � � m   ; >��
�� 
sep  �  � � � m   > A��
�� 
oct  �  � � � m   A D��
�� 
nov  �  ��� � m   D G��
�� 
dec ��   �  � � � j   M g�� ��� 0 	_weekdays   � J   M f � �  � � � m   M P��
�� 
mon  �  � � � m   P S��
�� 
tue  �  � � � m   S V��
�� 
wed  �  � � � m   V Y��
�� 
thu  �  � � � m   Y \��
�� 
fri  �  � � � m   \ _��
�� 
sat  �  ��� � m   _ b��
�� 
sun ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �� � ���   �   constants     � � � �    c o n s t a n t s   �  � � � l     ��������  ��  ��   �  � � � i  h k � � � I     ������
�� .Dat:Mthsnull��� ��� null��  ��   � l    	 � � � � L     	 � � n      � � � 2   ��
�� 
cobj � o     ���� 0 _months   � �  shallow copy list before returning it to ensure any changes the user might make to the returned list won't affect the original    � � � � �   s h a l l o w   c o p y   l i s t   b e f o r e   r e t u r n i n g   i t   t o   e n s u r e   a n y   c h a n g e s   t h e   u s e r   m i g h t   m a k e   t o   t h e   r e t u r n e d   l i s t   w o n ' t   a f f e c t   t h e   o r i g i n a l �  � � � l     ��������  ��  ��   �  � � � i  l o � � � I     ������
�� .Dat:Wkdsnull��� ��� null��  ��   � l    	 � � � � L     	 � � n      � � � 2   �
� 
cobj � o     �~�~ 0 	_weekdays   �   ditto    � � � �    d i t t o �  � � � l     �}�|�{�}  �|  �{   �  � � � l     �z�y�x�z  �y  �x   �  � � � l     �w � ��w   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �v � ��v   �   dates    � � � �    d a t e s �  � � � l     �u�t�s�u  �t  �s   �  � � � i  p s � � � I      �r ��q�r 0 
_datestyle 
_dateStyle �    o      �p�p 0 	theformat 	theFormat �o o      �n�n 0 formatstyles formatStyles�o  �q   � Z     � =     o     �m�m 0 	theformat 	theFormat m    �l
�l FDStFDS1 L    		 J    

  m    �k
�k boovtrue �j n    o    
�i�i 60 nsdateformattershortstyle NSDateFormatterShortStyle m    �h
�h misccura�j    =    o    �g�g 0 	theformat 	theFormat m    �f
�f FDStFDS2  L     J      m    �e
�e boovtrue �d n    o    �c�c 80 nsdateformattermediumstyle NSDateFormatterMediumStyle m    �b
�b misccura�d    =  " %  o   " #�a�a 0 	theformat 	theFormat  m   # $�`
�` FDStFDS3 !"! L   ( /## J   ( .$$ %�_% n  ( ,&'& o   ) +�^�^ 40 nsdateformatterlongstyle NSDateFormatterLongStyle' m   ( )�]
�] misccura�_  " ()( =  2 5*+* o   2 3�\�\ 0 	theformat 	theFormat+ m   3 4�[
�[ FDStFDS4) ,-, L   8 ?.. J   8 >// 0�Z0 n  8 <121 o   9 ;�Y�Y 40 nsdateformatterfullstyle NSDateFormatterFullStyle2 m   8 9�X
�X misccura�Z  - 343 =  B E565 o   B C�W�W 0 	theformat 	theFormat6 m   C D�V
�V FDStFDS64 787 L   H P99 J   H O:: ;<; m   H I�U
�U boovfals< =�T= n  I M>?> o   J L�S�S 60 nsdateformattershortstyle NSDateFormatterShortStyle? m   I J�R
�R misccura�T  8 @A@ =  S VBCB o   S T�Q�Q 0 	theformat 	theFormatC m   T U�P
�P FDStFDS7A DED L   Y aFF J   Y `GG HIH m   Y Z�O
�O boovfalsI J�NJ n  Z ^KLK o   [ ]�M�M 80 nsdateformattermediumstyle NSDateFormatterMediumStyleL m   Z [�L
�L misccura�N  E MNM =  d gOPO o   d e�K�K 0 	theformat 	theFormatP m   e f�J
�J FDStFDS8N QRQ L   j rSS J   j qTT UVU m   j k�I
�I boovfalsV W�HW n  k oXYX o   l n�G�G 40 nsdateformatterlongstyle NSDateFormatterLongStyleY m   k l�F
�F misccura�H  R Z[Z =  u x\]\ o   u v�E�E 0 	theformat 	theFormat] m   v w�D
�D FDStFDS9[ ^�C^ L   { �__ J   { �`` aba m   { |�B
�B boovfalsb c�Ac n  | �ded o   } �@�@ 40 nsdateformatterfullstyle NSDateFormatterFullStylee m   | }�?
�? misccura�A  �C   R   � ��>fg
�> .ascrerr ****      � ****f m   � �hh �ii h I n v a l i d    u s i n g    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .g �=jk
�= 
errnj m   � ��<�<�Yk �;lm
�; 
erobl o   � ��:�: 0 formatstyles formatStylesm �9n�8
�9 
errtn m   � ��7
�7 
enum�8   � opo l     �6�5�4�6  �5  �4  p qrq l     �3�2�1�3  �2  �1  r sts i  t wuvu I      �0w�/�0 (0 _makedateformatter _makeDateFormatterw xyx o      �.�. 0 	theformat 	theFormaty z�-z o      �,�, 0 
localecode 
localeCode�-  �/  v k    *{{ |}| r     ~~ n    ��� I    �+�*�)�+ 0 init  �*  �)  � n    ��� I    �(�'�&�( 	0 alloc  �'  �&  � n    ��� o    �%�% "0 nsdateformatter NSDateFormatter� m     �$
�$ misccura o      �#�# 0 asocformatter asocFormatter} ��� Z   ���"�� =    ��� l   ��!� � I   ���
� .corecnte****       ****� J    �� ��� o    �� 0 	theformat 	theFormat�  � ���
� 
kocl� m    �
� 
ctxt�  �!  �   � m    �� � l   ,���� n   ,��� I    ,����  0 setdateformat_ setDateFormat_� ��� l   (���� n   (��� I   " (���� "0 astextparameter asTextParameter� ��� o   " #�� 0 	theformat 	theFormat� ��� m   # $�� ��� 
 u s i n g�  �  � o    "�� 0 _support  �  �  �  �  � o    �� 0 asocformatter asocFormatter�   use custom format string   � ��� 2   u s e   c u s t o m   f o r m a t   s t r i n g�"  � l  /���� k   /�� ��� r   / ;��� n  / 9��� I   4 9���� "0 aslistparameter asListParameter� ��� o   4 5�
�
 0 	theformat 	theFormat�  �  � o   / 4�	�	 0 _support  � o      �� 0 formattypes formatTypes� ��� Z   < ^����� =  < A��� o   < =�� 0 formattypes formatTypes� J   = @�� ��� m   = >�
� FDStFDS0�  � l  D Z���� k   D Z�� ��� n  D J��� I   E J����  0 setdateformat_ setDateFormat_� �� � m   E F�� ��� 4 y y y y - M M - d d ' T ' H H : m m : s s Z Z Z Z Z�   �  � o   D E���� 0 asocformatter asocFormatter� ��� n  K W��� I   L W������� 0 
setlocale_ 
setLocale_� ���� l  L S������ n  L S��� I   O S�������� 0 systemlocale systemLocale��  ��  � n  L O��� o   M O���� 0 nslocale NSLocale� m   L M��
�� misccura��  ��  ��  ��  � o   K L���� 0 asocformatter asocFormatter� ���� L   X Z�� o   X Y���� 0 asocformatter asocFormatter��  �   return ISO8601 formatter   � ��� 2   r e t u r n   I S O 8 6 0 1   f o r m a t t e r�  �  � ��� n  _ i��� I   ` i������� 0 setdatestyle_ setDateStyle_� ���� l  ` e������ n  ` e��� o   a e���� 00 nsdateformatternostyle NSDateFormatterNoStyle� m   ` a��
�� misccura��  ��  ��  ��  � o   _ `���� 0 asocformatter asocFormatter� ��� n  j t��� I   k t������� 0 settimestyle_ setTimeStyle_� ���� l  k p������ n  k p��� o   l p���� 00 nsdateformatternostyle NSDateFormatterNoStyle� m   k l��
�� misccura��  ��  ��  ��  � o   j k���� 0 asocformatter asocFormatter� ��� r   u ���� J   u y�� ��� m   u v��
�� boovfals� ���� m   v w��
�� boovfals��  � J      �� ��� o      ���� 0 	isdateset 	isDateSet� ���� o      ���� 0 	istimeset 	isTimeSet��  � ���� X   ������ k   ��� ��� r   � ���� I      ������� 0 
_datestyle 
_dateStyle� ��� n  � ���� 1   � ���
�� 
pcnt� o   � ����� 0 aref aRef� ���� o   � ����� 0 	theformat 	theFormat��  ��  � J      �� � � o      ���� 0 isdate isDate  �� o      ���� 0 
asocoption 
asocOption��  � �� Z   ��� o   � ����� 0 isdate isDate k   � �  Z  � �	
����	 o   � ����� 0 	isdateset 	isDateSet
 R   � ���
�� .ascrerr ****      � **** m   � � � d I n v a l i d    u s i n g    p a r a m e t e r   ( t o o   m a n y   d a t e   f o r m a t s ) . ��
�� 
errn m   � ������Y ����
�� 
erob o   � ����� 0 formattypes formatTypes��  ��  ��    l  � ����� n  � � I   � ������� 0 setdatestyle_ setDateStyle_ �� o   � ����� 0 
asocoption 
asocOption��  ��   o   � ����� 0 asocformatter asocFormatter��  ��   �� r   � � m   � ���
�� boovtrue o      ���� 0 	isdateset 	isDateSet��  ��   k   �  Z  � ���� o   � ����� 0 	istimeset 	isTimeSet  R   � ��!"
�� .ascrerr ****      � ****! m   � �## �$$ d I n v a l i d    u s i n g    p a r a m e t e r   ( t o o   m a n y   t i m e   f o r m a t s ) ." ��%&
�� 
errn% m   � ������Y& ��'��
�� 
erob' o   � ����� 0 formattypes formatTypes��  ��  ��   ()( l *����* n +,+ I  ��-���� 0 settimestyle_ setTimeStyle_- .��. o  ���� 0 
asocoption 
asocOption��  ��  , o  ���� 0 asocformatter asocFormatter��  ��  ) /��/ r  010 m  ��
�� boovtrue1 o      ���� 0 	istimeset 	isTimeSet��  ��  �� 0 aref aRef� o   � ����� 0 formattypes formatTypes��  � < 6 use predefined date-style and/or time-style constants   � �22 l   u s e   p r e d e f i n e d   d a t e - s t y l e   a n d / o r   t i m e - s t y l e   c o n s t a n t s� 343 n '565 I  '��7���� 0 
setlocale_ 
setLocale_7 8��8 l #9����9 n #:;: I  #��<���� *0 asnslocaleparameter asNSLocaleParameter< =>= o  ���� 0 
localecode 
localeCode> ?��? m  @@ �AA  f o r   l o c a l e��  ��  ; o  ���� 0 _support  ��  ��  ��  ��  6 o  ���� 0 asocformatter asocFormatter4 B��B L  (*CC o  ()���� 0 asocformatter asocFormatter��  t DED l     ��������  ��  ��  E FGF l     ��������  ��  ��  G HIH l     ��������  ��  ��  I JKJ i  x {LML I     ��NO
�� .Dat:FDatnull���     ldt N o      ���� 0 thedate theDateO ��PQ
�� 
UsinP |����R��S��  ��  R o      ���� 0 	theformat 	theFormat��  S l     T����T J      UU V��V m      ��
�� FDStFDS0��  ��  ��  Q ��W��
�� 
LocaW |����X��Y��  ��  X o      ���� 0 
localecode 
localeCode��  Y l     Z��~Z m      �}
�} 
msng�  �~  ��  M Q     6[\][ k    $^^ _`_ r    aba n   cdc I    �|e�{�| "0 asdateparameter asDateParametere fgf o    	�z�z 0 thedate theDateg h�yh m   	 
ii �jj  �y  �{  d o    �x�x 0 _support  b o      �w�w 0 thedate theDate` klk r    mnm I    �vo�u�v (0 _makedateformatter _makeDateFormattero pqp o    �t�t 0 	theformat 	theFormatq r�sr o    �r�r 0 
localecode 
localeCode�s  �u  n o      �q�q 0 asocformatter asocFormatterl s�ps L    $tt c    #uvu l   !w�o�nw n   !xyx I    !�mz�l�m "0 stringfromdate_ stringFromDate_z {�k{ o    �j�j 0 thedate theDate�k  �l  y o    �i�i 0 asocformatter asocFormatter�o  �n  v m   ! "�h
�h 
ctxt�p  \ R      �g|}
�g .ascrerr ****      � ****| o      �f�f 0 etext eText} �e~
�e 
errn~ o      �d�d 0 enumber eNumber �c��
�c 
erob� o      �b�b 0 efrom eFrom� �a��`
�a 
errt� o      �_�_ 
0 eto eTo�`  ] I   , 6�^��]�^ 
0 _error  � ��� m   - .�� ���  f o r m a t   d a t e� ��� o   . /�\�\ 0 etext eText� ��� o   / 0�[�[ 0 enumber eNumber� ��� o   0 1�Z�Z 0 efrom eFrom� ��Y� o   1 2�X�X 
0 eto eTo�Y  �]  K ��� l     �W�V�U�W  �V  �U  � ��� l     �T�S�R�T  �S  �R  � ��� i  | ��� I     �Q��
�Q .Dat:PDatnull���     ctxt� o      �P�P 0 thetext theText� �O��
�O 
Usin� |�N�M��L��N  �M  � o      �K�K 0 	theformat 	theFormat�L  � l     ��J�I� J      �� ��H� m      �G
�G FDStFDS0�H  �J  �I  � �F��E
�F 
Loca� |�D�C��B��D  �C  � o      �A�A 0 
localecode 
localeCode�B  � l     ��@�?� m      �>
�> 
msng�@  �?  �E  � Q     ����� k    ��� ��� r    ��� n   ��� I    �=��<�= &0 stringwithstring_ stringWithString_� ��;� l   ��:�9� n   ��� I    �8��7�8 "0 astextparameter asTextParameter� ��� o    �6�6 0 thetext theText� ��5� m    �� ���  �5  �7  � o    �4�4 0 _support  �:  �9  �;  �<  � n   ��� o    �3�3 0 nsstring NSString� m    �2
�2 misccura� o      �1�1 0 asoctext asocText� ��� r    !��� I    �0��/�0 (0 _makedateformatter _makeDateFormatter� ��� o    �.�. 0 	theformat 	theFormat� ��-� o    �,�, 0 
localecode 
localeCode�-  �/  � o      �+�+ 0 asocformatter asocFormatter� ��� r   " *��� n  " (��� I   # (�*��)�* "0 datefromstring_ dateFromString_� ��(� o   # $�'�' 0 thetext theText�(  �)  � o   " #�&�& 0 asocformatter asocFormatter� o      �%�% 0 asocdate asocDate� ��� Z   + y���$�#� =  + .��� o   + ,�"�" 0 asocdate asocDate� m   , -�!
�! 
msng� k   1 u�� ��� r   1 >��� c   1 <��� n  1 :��� I   6 :� ���  $0 localeidentifier localeIdentifier�  �  � n  1 6��� I   2 6���� 
0 locale  �  �  � o   1 2�� 0 asocformatter asocFormatter� m   : ;�
� 
ctxt� o      �� $0 localeidentifier localeIdentifier� ��� Z   ? T����� =   ? D��� n  ? B��� 1   @ B�
� 
leng� o   ? @�� $0 localeidentifier localeIdentifier� m   B C��  � r   G J��� m   G H�� ���  s t a n d a r d� o      �� $0 localeidentifier localeIdentifier�  � r   M T��� b   M R��� b   M P��� m   M N�� ���  � o   N O�� $0 localeidentifier localeIdentifier� m   P Q�� ���  � o      �� $0 localeidentifier localeIdentifier� ��� R   U u���
� .ascrerr ****      � ****� l  a t���� b   a t��� b   a p��� b   a n��� b   a j��� m   a d�� �   t T e x t   i s   n o t   i n   t h e   c o r r e c t   f o r m a t   ( e x p e c t e d   d a t e   t e x t   i n   � l  d i�� n  d i I   e i�
�	��
 0 
dateformat 
dateFormat�	  �   o   d e�� 0 asocformatter asocFormatter�  �  � m   j m � "    f o r m a t   f o r   t h e  � o   n o�� $0 localeidentifier localeIdentifier� m   p s �    l o c a l e . )�  �  � �	
� 
errn m   W Z���Y	 �
�
� 
erob
 o   ] ^�� 0 thetext theText�  �  �$  �#  � �  l  z � L   z � c   z  o   z {���� 0 asocdate asocDate m   { ~��
�� 
ldt  � � note that AS dates don't include timezone info, so resulting date object always uses host machine's current tz, regardless of what tz theText used, adjusting the date object's time appropriately    ��   n o t e   t h a t   A S   d a t e s   d o n ' t   i n c l u d e   t i m e z o n e   i n f o ,   s o   r e s u l t i n g   d a t e   o b j e c t   a l w a y s   u s e s   h o s t   m a c h i n e ' s   c u r r e n t   t z ,   r e g a r d l e s s   o f   w h a t   t z   t h e T e x t   u s e d ,   a d j u s t i n g   t h e   d a t e   o b j e c t ' s   t i m e   a p p r o p r i a t e l y�   � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  � I   � ������� 
0 _error    m   � � �  p a r s e   d a t e   o   � ����� 0 etext eText  !"! o   � ����� 0 enumber eNumber" #$# o   � ����� 0 efrom eFrom$ %��% o   � ����� 
0 eto eTo��  ��  � &'& l     ��������  ��  ��  ' ()( l     ��������  ��  ��  ) *+* l     ��,-��  , J D--------------------------------------------------------------------   - �.. � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+ /0/ l     ��12��  1   Date creation   2 �33    D a t e   c r e a t i o n0 454 l     ��������  ��  ��  5 676 l     ��������  ��  ��  7 898 i  � �:;: I     ��<��
�� .Dat:ReDanull��� ��� WebC< |����=��>��  ��  = o      ����  0 dateproperties dateProperties��  > l     ?����? J      ����  ��  ��  ��  ; Q    @AB@ k   �CC DED s    FGF o    ���� 0 _defaultdate _defaultDateG o      ���� 0 newdate newDateE HIH l   *JKLJ r    *MNM l   (O����O b    (PQP n   RSR I    ��T���� &0 asrecordparameter asRecordParameterT UVU o    ����  0 dateproperties datePropertiesV W��W m    XX �YY  ��  ��  S o    ���� 0 _support  Q K    'ZZ ��[\
�� 
year[ m    �����\ ��]^
�� 
mnth] m    ���� ^ ��_`
�� 
day _ m    ���� ` ��ab
�� 
houra m    ����  b ��cd
�� 
min c m     !����  d ��ef
�� 
scnde m   " #����  f ��g��
�� 
timeg m   $ %��
�� 
msng��  ��  ��  N o      ���� 0 rec  K @ : use the Cocoa epoch (1 January 2001, 00:00:00) as default   L �hh t   u s e   t h e   C o c o a   e p o c h   ( 1   J a n u a r y   2 0 0 1 ,   0 0 : 0 0 : 0 0 )   a s   d e f a u l tI iji Q   + Xklmk r   . 7non c   . 3pqp n  . 1rsr 1   / 1��
�� 
years o   . /���� 0 rec  q m   1 2��
�� 
longo n     tut 1   4 6��
�� 
yearu o   3 4���� 0 newdate newDatel R      ��vw
�� .ascrerr ****      � ****v o      ���� 0 etext eTextw ��x��
�� 
errnx d      yy m      �������  m R   ? X��z{
�� .ascrerr ****      � ****z b   R W|}| m   R U~~ � 2 I n v a l i d    y e a r    p r o p e r t y :  } o   U V���� 0 etext eText{ ����
�� 
errn� m   A D�����Y� ����
�� 
erob� l  G K������ N   G K�� n   G J��� 1   H J��
�� 
year� o   G H����  0 dateproperties dateProperties��  ��  � �����
�� 
errt� m   N O��
�� 
long��  j ��� Z   Y ������� E  Y d��� o   Y ^���� 0 _months  � J   ^ c�� ���� n  ^ a��� m   _ a��
�� 
mnth� o   ^ _���� 0 rec  ��  � l  g n���� r   g n��� n  g j��� m   h j��
�� 
mnth� o   g h���� 0 rec  � n     ��� m   k m��
�� 
mnth� o   j k���� 0 newdate newDate� unlike year/day/time properties, which require numbers, a date object's `month` property accepts either an integer or a month constant; however, it also happily accepts weekday constants which is obviously wrong, so make sure a given constant is a valid month before assigning it   � ���0   u n l i k e   y e a r / d a y / t i m e   p r o p e r t i e s ,   w h i c h   r e q u i r e   n u m b e r s ,   a   d a t e   o b j e c t ' s   ` m o n t h `   p r o p e r t y   a c c e p t s   e i t h e r   a n   i n t e g e r   o r   a   m o n t h   c o n s t a n t ;   h o w e v e r ,   i t   a l s o   h a p p i l y   a c c e p t s   w e e k d a y   c o n s t a n t s   w h i c h   i s   o b v i o u s l y   w r o n g ,   s o   m a k e   s u r e   a   g i v e n   c o n s t a n t   i s   a   v a l i d   m o n t h   b e f o r e   a s s i g n i n g   i t��  � l  q ����� Q   q ����� r   t }��� c   t y��� n  t w��� m   u w��
�� 
mnth� o   t u���� 0 rec  � m   w x��
�� 
long� n     ��� m   z |��
�� 
mnth� o   y z���� 0 newdate newDate� R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� �����
�� 
errn� d      �� m      �������  � R   � �����
�� .ascrerr ****      � ****� b   � ���� m   � ��� ��� 4 I n v a l i d    m o n t h    p r o p e r t y :  � o   � ����� 0 etext eText� ����
�� 
errn� m   � ������Y� ����
�� 
erob� l  � ������� N   � ��� n   � ���� m   � ���
�� 
mnth� o   � �����  0 dateproperties dateProperties��  ��  � �����
�� 
errt� J   � ��� ��� m   � ���
�� 
enum� ���� m   � ���
�� 
long��  ��  � , & otherwise it must be an integer value   � ��� L   o t h e r w i s e   i t   m u s t   b e   a n   i n t e g e r   v a l u e� ��� Q   � ����� r   � ���� c   � ���� n  � ���� 1   � ���
�� 
day � o   � ����� 0 rec  � m   � ���
�� 
long� n     ��� 1   � ���
�� 
day � o   � ����� 0 newdate newDate� R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ���~
� 
errn� d      �� m      �}�}��~  � R   � ��|��
�| .ascrerr ****      � ****� b   � ���� m   � ��� ��� 0 I n v a l i d    d a y    p r o p e r t y :  � o   � ��{�{ 0 etext eText� �z��
�z 
errn� m   � ��y�y�Y� �x��
�x 
erob� l  � ���w�v� N   � ��� n   � ���� 1   � ��u
�u 
day � o   � ��t�t  0 dateproperties dateProperties�w  �v  � �s��r
�s 
errt� m   � ��q
�q 
long�r  � ��� Z   �1���p�o� F   ���� F   � ���� =   � ���� l  � ���n�m� I  � ��l��
�l .corecnte****       ****� J   � ��� ��k� n  � ���� m   � ��j
�j 
mnth� o   � ��i�i 0 rec  �k  � �h��g
�h 
kocl� m   � ��f
�f 
nmbr�g  �n  �m  � m   � ��e�e  � =   � ���� l  � ���d�c� I  � ��b��
�b .corecnte****       ****� J   � ��� ��a� n  � ���� m   � ��`
�` 
mnth� o   � ��_�_ 0 rec  �a  � �^��]
�^ 
kocl� m   � ��\
�\ 
ctxt�]  �d  �c  � m   � ��[�[  � H   �
   E  �	 o   ��Z�Z 0 _months   J   �Y n  m  �X
�X 
mnth o  �W�W 0 rec  �Y  � l -	 R  -�V

�V .ascrerr ****      � ****
 m  ), � p I n v a l i d    m o n t h    p r o p e r t y   ( e x p e c t e d   i n t e g e r   o r   c o n s t a n t ) . �U
�U 
errn m  �T�T�Y �S
�S 
erob l �R�Q N   n   m  �P
�P 
mnth o  �O�O  0 dateproperties dateProperties�R  �Q   �N�M
�N 
errt J   &  m   #�L
�L 
enum �K m  #$�J
�J 
long�K  �M   o i TO DO: revise this: first check for constant and cast if found, then try integer cast and error if fails   	 � �   T O   D O :   r e v i s e   t h i s :   f i r s t   c h e c k   f o r   c o n s t a n t   a n d   c a s t   i f   f o u n d ,   t h e n   t r y   i n t e g e r   c a s t   a n d   e r r o r   i f   f a i l s�p  �o  �  Z  2��I  = 27!"! n 25#$# 1  35�H
�H 
time$ o  23�G�G 0 rec  " m  56�F
�F 
msng k  :�%% &'& Q  :i()*( r  =H+,+ [  =F-.- o  =>�E�E 0 newdate newDate. ]  >E/0/ l >?1�D�C1 1  >?�B
�B 
hour�D  �C  0 l ?D2�A�@2 c  ?D343 n ?B565 1  @B�?
�? 
hour6 o  ?@�>�> 0 rec  4 m  BC�=
�= 
long�A  �@  , o      �<�< 0 newdate newDate) R      �;78
�; .ascrerr ****      � ****7 o      �:�: 0 etext eText8 �99�8
�9 
errn9 d      :: m      �7�7��8  * R  Pi�6;<
�6 .ascrerr ****      � ****; b  ch=>= m  cf?? �@@ 4 I n v a l i d    h o u r s    p r o p e r t y :  > o  fg�5�5 0 etext eText< �4AB
�4 
errnA m  RU�3�3�YB �2CD
�2 
erobC l X\E�1�0E N  X\FF n  X[GHG 1  Y[�/
�/ 
hourH o  XY�.�.  0 dateproperties dateProperties�1  �0  D �-I�,
�- 
errtI m  _`�+
�+ 
long�,  ' JKJ Q  j�LMNL r  mxOPO [  mvQRQ o  mn�*�* 0 newdate newDateR ]  nuSTS l noU�)�(U 1  no�'
�' 
min �)  �(  T l otV�&�%V c  otWXW n orYZY 1  pr�$
�$ 
min Z o  op�#�# 0 rec  X m  rs�"
�" 
long�&  �%  P o      �!�! 0 newdate newDateM R      � [\
�  .ascrerr ****      � ****[ o      �� 0 etext eText\ �]�
� 
errn] d      ^^ m      ����  N R  ���_`
� .ascrerr ****      � ****_ b  ��aba m  ��cc �dd 8 I n v a l i d    m i n u t e s    p r o p e r t y :  b o  ���� 0 etext eText` �ef
� 
errne m  �����Yf �gh
� 
erobg l ��i��i N  ��jj n  ��klk 1  ���
� 
min l o  ����  0 dateproperties dateProperties�  �  h �m�
� 
errtm m  ���
� 
long�  K n�n Q  ��opqo r  ��rsr [  ��tut o  ���� 0 newdate newDateu l ��v��v c  ��wxw n ��yzy m  ���
� 
scndz o  ���
�
 0 rec  x m  ���	
�	 
long�  �  s o      �� 0 newdate newDatep R      �{|
� .ascrerr ****      � ****{ o      �� 0 etext eText| �}�
� 
errn} d      ~~ m      ����  q R  ����
� .ascrerr ****      � **** b  ����� m  ���� ��� 8 I n v a l i d    s e c o n d s    p r o p e r t y :  � o  ���� 0 etext eText� � ��
�  
errn� m  �������Y� ����
�� 
erob� l �������� N  ���� n  ����� m  ����
�� 
scnd� o  ������  0 dateproperties dateProperties��  ��  � �����
�� 
errt� m  ����
�� 
long��  �  �I    Q  ������ r  ����� c  ����� n ����� 1  ����
�� 
time� o  ������ 0 rec  � m  ����
�� 
long� n     ��� 1  ����
�� 
time� o  ������ 0 newdate newDate� R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� �����
�� 
errn� d      �� m      �������  � R  ������
�� .ascrerr ****      � ****� b  ����� m  ���� ��� 2 I n v a l i d    t i m e    p r o p e r t y :  � o  ������ 0 etext eText� ����
�� 
errn� m  �������Y� ����
�� 
erob� l �������� N  ���� n  ����� 1  ����
�� 
time� o  ������  0 dateproperties dateProperties��  ��  � �����
�� 
errt� m  ����
�� 
long��   ���� L  ���� o  ������ 0 newdate newDate��  A R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  B I  ������� 
0 _error  � ��� m  �� ���  j o i n   d a t e� ��� o  ���� 0 etext eText� ��� o  ���� 0 enumber eNumber� ��� o  	���� 0 efrom eFrom� ���� o  	
���� 
0 eto eTo��  ��  9 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Dat:DaRenull��� ��� ldt � |����������  ��  � o      ���� 0 thedate theDate��  � l     ������ m      ��
�� 
msng��  ��  ��  � Q     ^���� k    H�� ��� Z     ������ =   ��� o    ���� 0 thedate theDate� m    ��
�� 
msng� r   	 ��� o   	 ���� 0 _defaultdate _defaultDate� o      ���� 0 thedate theDate��  � r     ��� n   ��� I    ������� "0 asdateparameter asDateParameter� ��� o    ���� 0 thedate theDate� ���� m    �� ���  ��  ��  � o    ���� 0 _support  � o      ���� 0 thedate theDate� ���� L   ! H�� K   ! G�� ����
�� 
year� n  " &��� 1   # %��
�� 
year� o   " #���� 0 thedate theDate� ����
�� 
mnth� c   ' ,��� n  ' *��� m   ( *��
�� 
mnth� o   ' (���� 0 thedate theDate� m   * +��
�� 
long� ����
�� 
day � n  - 1��� 1   . 0��
�� 
day � o   - .���� 0 thedate theDate� ����
�� 
hour� _   2 7��� l  2 5������ n  2 5��� 1   3 5��
�� 
time� o   2 3���� 0 thedate theDate��  ��  � m   5 6����� ����
�� 
min � `   8 ?��� _   8 =   l  8 ;���� n  8 ; 1   9 ;��
�� 
time o   8 9���� 0 thedate theDate��  ��   m   ; <���� <� m   = >���� <� ����
�� 
scnd `   @ E l  @ C���� n  @ C	
	 1   A C��
�� 
time
 o   @ A���� 0 thedate theDate��  ��   m   C D���� <��  ��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  � I   P ^������ 
0 _error    m   Q T �  s p l i t   d a t e  o   T U���� 0 etext eText  o   U V���� 0 enumber eNumber  o   V W���� 0 efrom eFrom �� o   W X���� 
0 eto eTo��  ��  �  l     ��������  ��  ��    ��  l     �������  ��  �  ��       �~!"#$%&'()*+,-./0�~  ! �}�|�{�z�y�x�w�v�u�t�s�r�q�p�o
�} 
pimr�| 0 _support  �{ 
0 _error  �z $0 _makedefaultdate _makeDefaultDate�y 0 _defaultdate _defaultDate�x 0 _months  �w 0 	_weekdays  
�v .Dat:Mthsnull��� ��� null
�u .Dat:Wkdsnull��� ��� null�t 0 
_datestyle 
_dateStyle�s (0 _makedateformatter _makeDateFormatter
�r .Dat:FDatnull���     ldt 
�q .Dat:PDatnull���     ctxt
�p .Dat:ReDanull��� ��� WebC
�o .Dat:DaRenull��� ��� ldt " �n1�n 1  232 �m4�l
�m 
cobj4 55   �k 
�k 
frmk�l  3 �j6�i
�j 
cobj6 77   �h
�h 
osax�i  # 88   �g +
�g 
scpt$ �f 3�e�d9:�c�f 
0 _error  �e �b;�b ;  �a�`�_�^�]�a 0 handlername handlerName�` 0 etext eText�_ 0 enumber eNumber�^ 0 efrom eFrom�] 
0 eto eTo�d  9 �\�[�Z�Y�X�\ 0 handlername handlerName�[ 0 etext eText�Z 0 enumber eNumber�Y 0 efrom eFrom�X 
0 eto eTo:  C�W�V�W �V &0 throwcommanderror throwCommandError�c b  ࠡ����+ % �U W�T�S<=�R�U $0 _makedefaultdate _makeDefaultDate�T  �S  <  = �Q�P�O�N�M�L�K
�Q .misccurdldt    ��� null�P�
�O 
cobj
�N 
year
�M 
mnth
�L 
day 
�K 
time�R F*j   >�kkmvE[�k/*�,FZ[�l/*�,FZ[�m/*�,FZOkjlvE[�k/*�,FZ[�l/*�,FZO*U& ldt     �uy ' �J>�J >  �I�H�G�F�E�D�C�B�A�@�?�>
�I 
jan 
�H 
feb 
�G 
mar 
�F 
apr 
�E 
may 
�D 
jun 
�C 
jul 
�B 
aug 
�A 
sep 
�@ 
oct 
�? 
nov 
�> 
dec ( �=?�= ?  �<�;�:�9�8�7�6
�< 
mon 
�; 
tue 
�: 
wed 
�9 
thu 
�8 
fri 
�7 
sat 
�6 
sun ) �5 ��4�3@A�2
�5 .Dat:Mthsnull��� ��� null�4  �3  @  A �1
�1 
cobj�2 
b  �-E* �0 ��/�.BC�-
�0 .Dat:Wkdsnull��� ��� null�/  �.  B  C �,
�, 
cobj�- 
b  �-E+ �+ ��*�)DE�(�+ 0 
_datestyle 
_dateStyle�* �'F�' F  �&�%�& 0 	theformat 	theFormat�% 0 formatstyles formatStyles�)  D �$�#�$ 0 	theformat 	theFormat�# 0 formatstyles formatStylesE �"�!� ����������������h
�" FDStFDS1
�! misccura�  60 nsdateformattershortstyle NSDateFormatterShortStyle
� FDStFDS2� 80 nsdateformattermediumstyle NSDateFormatterMediumStyle
� FDStFDS3� 40 nsdateformatterlongstyle NSDateFormatterLongStyle
� FDStFDS4� 40 nsdateformatterfullstyle NSDateFormatterFullStyle
� FDStFDS6
� FDStFDS7
� FDStFDS8
� FDStFDS9
� 
errn��Y
� 
erob
� 
errt
� 
enum� �( ���  e��,ElvY ���  e��,ElvY x��  ��,EkvY h��  ��,EkvY X��  f��,ElvY G��  f��,ElvY 6��  f��,ElvY %��  f��,ElvY )���a a a a , �v��GH�� (0 _makedateformatter _makeDateFormatter� �I� I  �
�	�
 0 	theformat 	theFormat�	 0 
localecode 
localeCode�  G 	��������� � 0 	theformat 	theFormat� 0 
localecode 
localeCode� 0 asocformatter asocFormatter� 0 formattypes formatTypes� 0 	isdateset 	isDateSet� 0 	istimeset 	isTimeSet� 0 aref aRef� 0 isdate isDate�  0 
asocoption 
asocOptionH ��������������������������������������������������#@��
�� misccura�� "0 nsdateformatter NSDateFormatter�� 	0 alloc  �� 0 init  
�� 
kocl
�� 
ctxt
�� .corecnte****       ****�� "0 astextparameter asTextParameter��  0 setdateformat_ setDateFormat_�� "0 aslistparameter asListParameter
�� FDStFDS0�� 0 nslocale NSLocale�� 0 systemlocale systemLocale�� 0 
setlocale_ 
setLocale_�� 00 nsdateformatternostyle NSDateFormatterNoStyle�� 0 setdatestyle_ setDateStyle_�� 0 settimestyle_ setTimeStyle_
�� 
cobj
�� 
pcnt�� 0 
_datestyle 
_dateStyle
�� 
errn���Y
�� 
erob�� �� *0 asnslocaleparameter asNSLocaleParameter�+��,j+ j+ E�O�kv��l k  �b  ��l+ k+ 	Y �b  �k+ 
E�O��kv  ��k+ 	O���,j+ k+ O�Y hO��a ,k+ O��a ,k+ OfflvE[a k/E�Z[a l/E�ZO ��[�a l kh *�a ,�l+ E[a k/E�Z[a l/E�ZO� *� )a a a �a a Y hO��k+ OeE�Y '� )a a a �a a Y hO��k+ OeE�[OY��O�b  �a l+ k+ O�- ��M����JK��
�� .Dat:FDatnull���     ldt �� 0 thedate theDate�� ��LM
�� 
UsinL {����N�� 0 	theformat 	theFormat��  N ��O�� O  ��
�� FDStFDS0M ��P��
�� 
LocaP {�������� 0 
localecode 
localeCode��  
�� 
msng��  J ������������������ 0 thedate theDate�� 0 	theformat 	theFormat�� 0 
localecode 
localeCode�� 0 asocformatter asocFormatter�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToK 
i����������Q������� "0 asdateparameter asDateParameter�� (0 _makedateformatter _makeDateFormatter�� "0 stringfromdate_ stringFromDate_
�� 
ctxt�� 0 etext eTextQ ����R
�� 
errn�� 0 enumber eNumberR ����S
�� 
erob�� 0 efrom eFromS ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� 7 &b  ��l+ E�O*��l+ E�O��k+ �&W X  *礥���+ 	. �������TU��
�� .Dat:PDatnull���     ctxt�� 0 thetext theText�� ��VW
�� 
UsinV {����X�� 0 	theformat 	theFormat��  X ��Y�� Y  ��
�� FDStFDS0W ��Z��
�� 
LocaZ {�������� 0 
localecode 
localeCode��  
�� 
msng��  T ������������������������ 0 thetext theText�� 0 	theformat 	theFormat�� 0 
localecode 
localeCode�� 0 asoctext asocText�� 0 asocformatter asocFormatter�� 0 asocdate asocDate�� $0 localeidentifier localeIdentifier�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToU �����������������������������������������[����
�� misccura�� 0 nsstring NSString�� "0 astextparameter asTextParameter�� &0 stringwithstring_ stringWithString_�� (0 _makedateformatter _makeDateFormatter�� "0 datefromstring_ dateFromString_
�� 
msng�� 
0 locale  �� $0 localeidentifier localeIdentifier
�� 
ctxt
�� 
leng
�� 
errn���Y
�� 
erob�� �� 0 
dateformat 
dateFormat
�� 
ldt �� 0 etext eText[ ����\
�� 
errn�� 0 enumber eNumber\ ����]
�� 
erob�� 0 efrom eFrom] ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � ���,b  ��l+ k+ E�O*��l+ E�O��k+ E�O��  I�j+ j+ 	�&E�O��,j  �E�Y 	��%�%E�O)�a a �a a �j+ %a %�%a %Y hO�a &W X  *a ����a + / ��;����^_��
�� .Dat:ReDanull��� ��� WebC�� {��������  0 dateproperties dateProperties��  ��  ��  ^ ����������������  0 dateproperties dateProperties�� 0 newdate newDate�� 0 rec  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo_ &X����~�}�|�{�z�y�x�w�v�u�t`�s�r�q�p�o~�n���m�l�k�j�i?c��a��h�g�� &0 asrecordparameter asRecordParameter
� 
year�~�
�} 
mnth
�| 
day 
�{ 
hour
�z 
min 
�y 
scnd
�x 
time
�w 
msng�v 
�u 
long�t 0 etext eText` �f�e�d
�f 
errn�e�\�d  
�s 
errn�r�Y
�q 
erob
�p 
errt�o 
�n 
enum
�m 
kocl
�l 
nmbr
�k .corecnte****       ****
�j 
ctxt
�i 
boola �c�bb
�c 
errn�b 0 enumber eNumberb �a�`c
�a 
erob�` 0 efrom eFromc �_�^�]
�_ 
errt�^ 
0 eto eTo�]  �h �g 
0 _error  ���b  EQ�Ob  ��l+ ���k�k�j�j�j���%E�O ��,�&��,FW  X  )�a a ��,a �a a �%Ob  ��,kv ��,��,FY 4 ��,�&��,FW %X  )�a a ��,a a �lva a �%O ��,�&��,FW  X  )�a a ��,a �a a �%O��,kva a l j 	 ��,kva a l j a &	 b  ��,kva & !)�a a ��,a a �lva a Y hO��,�  � �Ƣ�,�& E�W  X  )�a a ��,a �a a �%O �Ǣ�,�& E�W  X  )�a a ��,a �a a �%O ���,�&E�W  X  )�a a ��,a �a a  �%Y / ��,�&��,FW  X  )�a a ��,a �a a !�%O�W X  "*a #����a $+ %0 �\��[�Zde�Y
�\ .Dat:DaRenull��� ��� ldt �[ {�X�W�V�X 0 thedate theDate�W  
�V 
msng�Z  d �U�T�S�R�Q�U 0 thedate theDate�T 0 etext eText�S 0 enumber eNumber�R 0 efrom eFrom�Q 
0 eto eToe �P��O�N�M�L�K�J�I�H�G�F�E�D�Cf�B�A
�P 
msng�O "0 asdateparameter asDateParameter
�N 
year
�M 
mnth
�L 
long
�K 
day 
�J 
hour
�I 
time�H
�G 
min �F <
�E 
scnd�D �C 0 etext eTextf �@�?g
�@ 
errn�? 0 enumber eNumberg �>�=h
�> 
erob�= 0 efrom eFromh �<�;�:
�< 
errt�; 
0 eto eTo�:  �B �A 
0 _error  �Y _ J��  b  E�Y b  ��l+ E�O��,E��,�&��,E��,�"��,�"�#��,�#�W X  *a ����a +  ascr  ��ޭ