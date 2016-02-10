FasdUAS 1.101.10   ��   ��    k             l      ��  ��   	�	� List -- manipulate AppleScript lists 

See also:

- Text library's `split text` and `join text` commands


TO DO:


- text comparator should implement exactly the same predefined considering/ignoring options as Text's `search text`, etc. (currently they are inconsistent on whether to consider or ignore diacriticals)


- stable sorting? A. currently out of scope: a non-stable sort is still better than no sort at all, although `sort list` documentation does need to state that it isn't stable sort so items that are 'equal' aren't guaranteed to maintain their original order, e.g. sorting {{name:"Bob", age:33}, {name:"Jan", age:33}} on age only can return either {{name:"Bob", age:33}, {name:"Jan", age:33}} or {{name:"Jan", age:33}, {name:"Bob", age:33}}


- boolean comparator? would be better to have a more general-purpose 'ordered comparator for {enum_1, enum_2, ..., enum_N}' command that works for any enumeration

- if list is almost ordered then tell _sort() to use insertionsort, as that will be quicker than quicksorting the whole thing (will need to run some profiling tests to determine what a good cutoff point is)
		- what about lists containing lots of duplicates, e.g. when sorting a large list containing only numbers from 0 to 10, or only true/false? basic quicksort gets pathological on those cases, so a three-way quicksort or a mergesort would work much better there


- might consider using NSMutableArray when sorting simple uniform lists of text or number without a user-supplied comparator (would need to compare costs of ASOC bridging vs native sorting to see which performs better); not sure about dates given that they're mutable (ASOC will perform deep copy of list, so resulting list will contain copies of the original date objects, whereas native sort preserves the original date objects); complex values (e.g. list of records) will still be sorted natively, of course (though even there it might be possible to use NSArray to sort an array of [key,valueIndex] and then iterate the result to reposition values in output list, making the [slow] AS part of the code O(2n))


- would it be worth implementing an ArrayCollection object that encapsulates list lookup kludges, and just encouraging users to use that for manipulating lists (in which case some/most of the below handlers might be as well made into methods on that); A. out of scope for stdlib: since it's an AS flaw it should be fixed at source, though would be useful as a 3rd-partly library

     � 	 	v   L i s t   - -   m a n i p u l a t e   A p p l e S c r i p t   l i s t s   
 
 S e e   a l s o : 
 
 -   T e x t   l i b r a r y ' s   ` s p l i t   t e x t `   a n d   ` j o i n   t e x t `   c o m m a n d s 
 
 
 T O   D O : 
 
 
 -   t e x t   c o m p a r a t o r   s h o u l d   i m p l e m e n t   e x a c t l y   t h e   s a m e   p r e d e f i n e d   c o n s i d e r i n g / i g n o r i n g   o p t i o n s   a s   T e x t ' s   ` s e a r c h   t e x t ` ,   e t c .   ( c u r r e n t l y   t h e y   a r e   i n c o n s i s t e n t   o n   w h e t h e r   t o   c o n s i d e r   o r   i g n o r e   d i a c r i t i c a l s ) 
 
 
 -   s t a b l e   s o r t i n g ?   A .   c u r r e n t l y   o u t   o f   s c o p e :   a   n o n - s t a b l e   s o r t   i s   s t i l l   b e t t e r   t h a n   n o   s o r t   a t   a l l ,   a l t h o u g h   ` s o r t   l i s t `   d o c u m e n t a t i o n   d o e s   n e e d   t o   s t a t e   t h a t   i t   i s n ' t   s t a b l e   s o r t   s o   i t e m s   t h a t   a r e   ' e q u a l '   a r e n ' t   g u a r a n t e e d   t o   m a i n t a i n   t h e i r   o r i g i n a l   o r d e r ,   e . g .   s o r t i n g   { { n a m e : " B o b " ,   a g e : 3 3 } ,   { n a m e : " J a n " ,   a g e : 3 3 } }   o n   a g e   o n l y   c a n   r e t u r n   e i t h e r   { { n a m e : " B o b " ,   a g e : 3 3 } ,   { n a m e : " J a n " ,   a g e : 3 3 } }   o r   { { n a m e : " J a n " ,   a g e : 3 3 } ,   { n a m e : " B o b " ,   a g e : 3 3 } } 
 
 
 -   b o o l e a n   c o m p a r a t o r ?   w o u l d   b e   b e t t e r   t o   h a v e   a   m o r e   g e n e r a l - p u r p o s e   ' o r d e r e d   c o m p a r a t o r   f o r   { e n u m _ 1 ,   e n u m _ 2 ,   . . . ,   e n u m _ N } '   c o m m a n d   t h a t   w o r k s   f o r   a n y   e n u m e r a t i o n 
 
 -   i f   l i s t   i s   a l m o s t   o r d e r e d   t h e n   t e l l   _ s o r t ( )   t o   u s e   i n s e r t i o n s o r t ,   a s   t h a t   w i l l   b e   q u i c k e r   t h a n   q u i c k s o r t i n g   t h e   w h o l e   t h i n g   ( w i l l   n e e d   t o   r u n   s o m e   p r o f i l i n g   t e s t s   t o   d e t e r m i n e   w h a t   a   g o o d   c u t o f f   p o i n t   i s ) 
 	 	  -   w h a t   a b o u t   l i s t s   c o n t a i n i n g   l o t s   o f   d u p l i c a t e s ,   e . g .   w h e n   s o r t i n g   a   l a r g e   l i s t   c o n t a i n i n g   o n l y   n u m b e r s   f r o m   0   t o   1 0 ,   o r   o n l y   t r u e / f a l s e ?   b a s i c   q u i c k s o r t   g e t s   p a t h o l o g i c a l   o n   t h o s e   c a s e s ,   s o   a   t h r e e - w a y   q u i c k s o r t   o r   a   m e r g e s o r t   w o u l d   w o r k   m u c h   b e t t e r   t h e r e 
 
 
 -   m i g h t   c o n s i d e r   u s i n g   N S M u t a b l e A r r a y   w h e n   s o r t i n g   s i m p l e   u n i f o r m   l i s t s   o f   t e x t   o r   n u m b e r   w i t h o u t   a   u s e r - s u p p l i e d   c o m p a r a t o r   ( w o u l d   n e e d   t o   c o m p a r e   c o s t s   o f   A S O C   b r i d g i n g   v s   n a t i v e   s o r t i n g   t o   s e e   w h i c h   p e r f o r m s   b e t t e r ) ;   n o t   s u r e   a b o u t   d a t e s   g i v e n   t h a t   t h e y ' r e   m u t a b l e   ( A S O C   w i l l   p e r f o r m   d e e p   c o p y   o f   l i s t ,   s o   r e s u l t i n g   l i s t   w i l l   c o n t a i n   c o p i e s   o f   t h e   o r i g i n a l   d a t e   o b j e c t s ,   w h e r e a s   n a t i v e   s o r t   p r e s e r v e s   t h e   o r i g i n a l   d a t e   o b j e c t s ) ;   c o m p l e x   v a l u e s   ( e . g .   l i s t   o f   r e c o r d s )   w i l l   s t i l l   b e   s o r t e d   n a t i v e l y ,   o f   c o u r s e   ( t h o u g h   e v e n   t h e r e   i t   m i g h t   b e   p o s s i b l e   t o   u s e   N S A r r a y   t o   s o r t   a n   a r r a y   o f   [ k e y , v a l u e I n d e x ]   a n d   t h e n   i t e r a t e   t h e   r e s u l t   t o   r e p o s i t i o n   v a l u e s   i n   o u t p u t   l i s t ,   m a k i n g   t h e   [ s l o w ]   A S   p a r t   o f   t h e   c o d e   O ( 2 n ) ) 
 
 
 -   w o u l d   i t   b e   w o r t h   i m p l e m e n t i n g   a n   A r r a y C o l l e c t i o n   o b j e c t   t h a t   e n c a p s u l a t e s   l i s t   l o o k u p   k l u d g e s ,   a n d   j u s t   e n c o u r a g i n g   u s e r s   t o   u s e   t h a t   f o r   m a n i p u l a t i n g   l i s t s   ( i n   w h i c h   c a s e   s o m e / m o s t   o f   t h e   b e l o w   h a n d l e r s   m i g h t   b e   a s   w e l l   m a d e   i n t o   m e t h o d s   o n   t h a t ) ;   A .   o u t   o f   s c o p e   f o r   s t d l i b :   s i n c e   i t ' s   a n   A S   f l a w   i t   s h o u l d   b e   f i x e d   a t   s o u r c e ,   t h o u g h   w o u l d   b e   u s e f u l   a s   a   3 r d - p a r t l y   l i b r a r y 
 
   
  
 l     ��������  ��  ��        x     
�� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �      s u p p o r t      l     ��������  ��  ��        l         !  j   
 �� "�� 0 _support   " N   
  # # 4   
 �� $
�� 
scpt $ m     % % � & &  T y p e S u p p o r t   "  used for parameter checking    ! � ' ' 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g   ( ) ( l     ��������  ��  ��   )  * + * i    , - , I      �� .���� 
0 _error   .  / 0 / o      ���� 0 handlername handlerName 0  1 2 1 o      ���� 0 etext eText 2  3 4 3 o      ���� 0 enumber eNumber 4  5 6 5 o      ���� 0 efrom eFrom 6  7�� 7 o      ���� 
0 eto eTo��  ��   - I     �� 8���� 20 _errorwithpartialresult _errorWithPartialResult 8  9 : 9 o    ���� 0 handlername handlerName :  ; < ; o    ���� 0 etext eText <  = > = o    ���� 0 enumber eNumber >  ? @ ? o    ���� 0 efrom eFrom @  A B A o    ���� 
0 eto eTo B  C�� C m    ��
�� 
msng��  ��   +  D E D l     ��������  ��  ��   E  F G F i    H I H I      �� J���� 20 _errorwithpartialresult _errorWithPartialResult J  K L K o      ���� 0 handlername handlerName L  M N M o      ���� 0 etext eText N  O P O o      ���� 0 enumber eNumber P  Q R Q o      ���� 0 efrom eFrom R  S T S o      ���� 
0 eto eTo T  U�� U o      ���� 0 epartial ePartial��  ��   I n     V W V I    �� X���� 0 rethrowerror rethrowError X  Y Z Y m     [ [ � \ \  L i s t Z  ] ^ ] o    ���� 0 handlername handlerName ^  _ ` _ o    ���� 0 etext eText `  a b a o    	���� 0 enumber eNumber b  c d c o   	 
���� 0 efrom eFrom d  e f e o   
 ���� 
0 eto eTo f  g h g m    ��
�� 
msng h  i�� i o    ���� 0 epartial ePartial��  ��   W o     ���� 0 _support   G  j k j l     ��������  ��  ��   k  l m l l     ��������  ��  ��   m  n o n l     �� p q��   p  -----    q � r r 
 - - - - - o  s t s l     ��������  ��  ��   t  u v u i    w x w I      �� y���� "0 _makelistobject _makeListObject y  z { z o      ���� 0 len   {  |�� | o      ���� 0 padvalue padValue��  ��   x l    _ } ~  } k     _ � �  � � � h     �� ��� 0 
listobject 
listObject � j     �� ��� 
0 _list_   � J     ����   �  � � � Z    Y � ����� � ?     � � � o    	���� 0 len   � m   	 
����   � k    U � �  � � � r     � � � J     � �  � � � o    ���� 0 padvalue padValue �  � � � o    ���� 0 padvalue padValue �  � � � o    ���� 0 padvalue padValue �  ��� � o    ���� 0 padvalue padValue��   � n      � � � o    ���� 
0 _list_   � o    ���� 0 
listobject 
listObject �  � � � V    5 � � � r   % 0 � � � b   % , � � � n  % ( � � � o   & (���� 
0 _list_   � o   % &���� 0 
listobject 
listObject � n  ( + � � � o   ) +���� 
0 _list_   � o   ( )���� 0 
listobject 
listObject � n      � � � o   - /���� 
0 _list_   � o   , -���� 0 
listobject 
listObject � A    $ � � � n   " � � � 1     "��
�� 
leng � n     � � � o     ���� 
0 _list_   � o    ���� 0 
listobject 
listObject � o   " #���� 0 len   �  ��� � Z  6 U � ����� � ?   6 = � � � n  6 ; � � � 1   9 ;��
�� 
leng � n  6 9 � � � o   7 9���� 
0 _list_   � o   6 7���� 0 
listobject 
listObject � o   ; <���� 0 len   � r   @ Q � � � n   @ M � � � 7  C M�� � �
�� 
cobj � m   G I����  � o   J L���� 0 len   � n  @ C � � � o   A C���� 
0 _list_   � o   @ A���� 0 
listobject 
listObject � n      � � � o   N P���� 
0 _list_   � o   M N���� 0 
listobject 
listObject��  ��  ��  ��  ��   �  ��� � L   Z _ � � n  Z ^ � � � o   [ ]���� 
0 _list_   � o   Z [���� 0 
listobject 
listObject��   ~ � � make a new list of specified length using the supplied value as padding; caution: padValue will not be copied, so should be an immutable type (e.g. number, string, constant; not date/list/record/script/reference)     � � ��   m a k e   a   n e w   l i s t   o f   s p e c i f i e d   l e n g t h   u s i n g   t h e   s u p p l i e d   v a l u e   a s   p a d d i n g ;   c a u t i o n :   p a d V a l u e   w i l l   n o t   b e   c o p i e d ,   s o   s h o u l d   b e   a n   i m m u t a b l e   t y p e   ( e . g .   n u m b e r ,   s t r i n g ,   c o n s t a n t ;   n o t   d a t e / l i s t / r e c o r d / s c r i p t / r e f e r e n c e ) v  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 0 	_pinindex 	_pinIndex �  � � � o      ���� 0 theindex theIndex �  ��� � o      ���� 0 
textlength 
textLength��  ��   � l    % � � � � Z     % � � � � � ?      � � � o     �� 0 theindex theIndex � o    �~�~ 0 
textlength 
textLength � L     � � o    �}�} 0 
textlength 
textLength �  � � � A     � � � o    �|�| 0 theindex theIndex � d     � � o    �{�{ 0 
textlength 
textLength �  � � � L     � � d     � � o    �z�z 0 
textlength 
textLength �  � � � =     � � � o    �y�y 0 theindex theIndex � m    �x�x   �  ��w � L      � � m    �v�v �w   � L   # % � � o   # $�u�u 0 theindex theIndex �   used by `slice text`     � � � � ,   u s e d   b y   ` s l i c e   t e x t `   �  � � � l     �t�s�r�t  �s  �r   �  � � � l     �q�p�o�q  �p  �o   �  � � � l     �n � ��n   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �m � ��m   �   basic operations    � � � � "   b a s i c   o p e r a t i o n s �  � � � l     �l�k�j�l  �k  �j   �  � � � i  ! $ �  � I     �i
�i .Lst:Instnull���     **** o      �h�h 0 thelist theList �g
�g 
Valu o      �f�f 0 thevalue theValue �e
�e 
Befo |�d�c�b�d  �c   o      �a�a 0 beforeindex beforeIndex�b   l     	�`�_	 m      �^
�^ 
msng�`  �_   �]

�] 
Afte
 |�\�[�Z�\  �[   o      �Y�Y 0 
afterindex 
afterIndex�Z   l     �X�W m      �V
�V 
msng�X  �W   �U�T
�U 
Conc |�S�R�Q�S  �R   o      �P�P 0 isjoin isJoin�Q   l     �O�N m      �M
�M boovfals�O  �N  �T    k    �  l     �L�L  .( In addition to inserting before/after the list's actual indexes, this also recognizes three 'virtual' indexes: the `after item` parameter uses index 0 and index `-length - 1` to indicate the start of the list; the `before item` parameter uses index `length + 1` to indicate the end of the list.     �P   I n   a d d i t i o n   t o   i n s e r t i n g   b e f o r e / a f t e r   t h e   l i s t ' s   a c t u a l   i n d e x e s ,   t h i s   a l s o   r e c o g n i z e s   t h r e e   ' v i r t u a l '   i n d e x e s :   t h e   ` a f t e r   i t e m `   p a r a m e t e r   u s e s   i n d e x   0   a n d   i n d e x   ` - l e n g t h   -   1 `   t o   i n d i c a t e   t h e   s t a r t   o f   t h e   l i s t ;   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   u s e s   i n d e x   ` l e n g t h   +   1 `   t o   i n d i c a t e   t h e   e n d   o f   t h e   l i s t .    l     �K�K  ~x Note that the `before item` parameter cannot indicate the end of a list using a negative index. (Problem: the next 'virtual' index after -1 would be 0, but index 0 is already used by the `after item` parameter to represent the *start* of a list, and it's easier to disallow `before item 0` than explain to user how 'index 0' can be at both the start *and* the end of a list.)    ��   N o t e   t h a t   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   c a n n o t   i n d i c a t e   t h e   e n d   o f   a   l i s t   u s i n g   a   n e g a t i v e   i n d e x .   ( P r o b l e m :   t h e   n e x t   ' v i r t u a l '   i n d e x   a f t e r   - 1   w o u l d   b e   0 ,   b u t   i n d e x   0   i s   a l r e a d y   u s e d   b y   t h e   ` a f t e r   i t e m `   p a r a m e t e r   t o   r e p r e s e n t   t h e   * s t a r t *   o f   a   l i s t ,   a n d   i t ' s   e a s i e r   t o   d i s a l l o w   ` b e f o r e   i t e m   0 `   t h a n   e x p l a i n   t o   u s e r   h o w   ' i n d e x   0 '   c a n   b e   a t   b o t h   t h e   s t a r t   * a n d *   t h e   e n d   o f   a   l i s t . ) �J Q    � ! k   �"" #$# h    
�I%�I 0 
listobject 
listObject% j     �H&�H 
0 _list_  & n    '(' I    �G)�F�G "0 aslistparameter asListParameter) *+* o    
�E�E 0 thelist theList+ ,�D, m   
 -- �..  �D  �F  ( o     �C�C 0 _support  $ /0/ Z   )12�B�A1 G    343 H    55 o    �@�@ 0 isjoin isJoin4 =    676 l   8�?�>8 I   �=9:
�= .corecnte****       ****9 J    ;; <�<< o    �;�; 0 thevalue theValue�<  : �:=�9
�: 
kocl= m    �8
�8 
list�9  �?  �>  7 m    �7�7  2 r     %>?> J     #@@ A�6A o     !�5�5 0 thevalue theValue�6  ? o      �4�4 0 thevalue theValue�B  �A  0 BCB Z   *7DEFGD >  * -HIH o   * +�3�3 0 
afterindex 
afterIndexI m   + ,�2
�2 
msngE k   0 �JJ KLK Z  0 @MN�1�0M >  0 3OPO o   0 1�/�/ 0 beforeindex beforeIndexP m   1 2�.
�. 
msngN R   6 <�-QR
�- .ascrerr ****      � ****Q m   : ;SS �TT ( T o o   m a n y   p a r a m e t e r s .R �,U�+
�, 
errnU m   8 9�*�*�Y�+  �1  �0  L VWV r   A NXYX n  A LZ[Z I   F L�)\�(�) (0 asintegerparameter asIntegerParameter\ ]^] o   F G�'�' 0 
afterindex 
afterIndex^ _�&_ m   G H`` �aa  a f t e r   i t e m�&  �(  [ o   A F�%�% 0 _support  Y o      �$�$ 0 
afterindex 
afterIndexW bcb r   O \ded n  O Zfgf I   T Z�#h�"�# (0 asbooleanparameter asBooleanParameterh iji o   T U�!�! 0 isjoin isJoinj k� k m   U Vll �mm  c o n c a t e n a t i o n�   �"  g o   O T�� 0 _support  e o      �� 0 isjoin isJoinc non Z  ] tpq��p A   ] `rsr o   ] ^�� 0 
afterindex 
afterIndexs m   ^ _��  q r   c ptut [   c nvwv [   c lxyx l  c jz��z n  c j{|{ 1   f j�
� 
leng| n  c f}~} o   d f�� 
0 _list_  ~ o   c d�� 0 
listobject 
listObject�  �  y o   j k�� 0 
afterindex 
afterIndexw m   l m�� u o      �� 0 
afterindex 
afterIndex�  �  o � Z   u ������ ?   u ~��� o   u v�� 0 
afterindex 
afterIndex� l  v }���� n  v }��� 1   y }�
� 
leng� n  v y��� o   w y�
�
 
0 _list_  � o   v w�	�	 0 
listobject 
listObject�  �  � R   � ����
� .ascrerr ****      � ****� m   � ��� ��� , I n d e x   i s   o u t   o f   r a n g e .� ���
� 
errn� m   � ����@� ���
� 
erob� l  � ����� N   � ��� n   � ���� 9   � ��
� 
insl� n   � ���� 4   � �� �
�  
cobj� o   � ����� 0 
afterindex 
afterIndex� l  � ������� e   � ��� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject��  ��  �  �  �  �  �  �  F ��� >  � ���� o   � ����� 0 beforeindex beforeIndex� m   � ���
�� 
msng� ���� k   �0�� ��� r   � ���� n  � ���� I   � �������� (0 asintegerparameter asIntegerParameter� ��� o   � ����� 0 beforeindex beforeIndex� ���� m   � ��� ���  b e f o r e   i t e m��  ��  � o   � ����� 0 _support  � o      ���� 0 beforeindex beforeIndex� ��� Z   � ������ ?   � ���� o   � ����� 0 beforeindex beforeIndex� m   � �����  � r   � ���� \   � ���� o   � ����� 0 beforeindex beforeIndex� m   � ����� � o      ���� 0 
afterindex 
afterIndex� ��� A   � ���� o   � ����� 0 beforeindex beforeIndex� m   � �����  � ���� r   � ���� [   � ���� l  � ������� n  � ���� 1   � ���
�� 
leng� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject��  ��  � o   � ����� 0 beforeindex beforeIndex� o      ���� 0 
afterindex 
afterIndex��  � l  � ����� R   � �����
�� .ascrerr ****      � ****� m   � ��� ���  I n v a l i d   i n d e x .� ����
�� 
errn� m   � ������@� �����
�� 
erob� l  � ������� N   � ��� n   � ���� 8   � ���
�� 
insl� n   � ���� 4   � ����
�� 
cobj� o   � ����� 0 beforeindex beforeIndex� l  � ������� e   � ��� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject��  ��  ��  ��  ��  � � � the `before item` parameter cannot identify the end of a list by negative index, so throw 'invalid index' error if `before item 0` is used   � ���   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   c a n n o t   i d e n t i f y   t h e   e n d   o f   a   l i s t   b y   n e g a t i v e   i n d e x ,   s o   t h r o w   ' i n v a l i d   i n d e x '   e r r o r   i f   ` b e f o r e   i t e m   0 `   i s   u s e d� ���� Z   �0������� G   ���� ?   ���� o   � ����� 0 
afterindex 
afterIndex� l  ������� n  ���� 1   ���
�� 
leng� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject��  ��  � A  
��� o  ���� 0 
afterindex 
afterIndex� m  	����  � R  ,����
�� .ascrerr ****      � ****� m  (+�� ��� , I n d e x   i s   o u t   o f   r a n g e .� ����
�� 
errn� m  �����@� �����
�� 
erob� l %������ N  %�� n  $��� 8   $��
�� 
insl� n   ��� 4   ���
�� 
cobj� o  ���� 0 beforeindex beforeIndex� l ������ e  �� n ��� o  ���� 
0 _list_  � o  ���� 0 
listobject 
listObject��  ��  ��  ��  ��  ��  ��  ��  ��  G l 37���� L  37   b  36 o  34���� 0 thelist theList o  45���� 0 thevalue theValue� #  default is to append to list   � � :   d e f a u l t   i s   t o   a p p e n d   t o   l i s tC �� Z  8� =  8;	
	 o  89���� 0 
afterindex 
afterIndex
 m  9:����   L  >D b  >C o  >?���� 0 thevalue theValue n ?B o  @B���� 
0 _list_   o  ?@���� 0 
listobject 
listObject  =  GP o  GH���� 0 
afterindex 
afterIndex n HO 1  KO��
�� 
leng n HK o  IK���� 
0 _list_   o  HI���� 0 
listobject 
listObject �� L  SY b  SX n SV o  TV���� 
0 _list_   o  ST���� 0 
listobject 
listObject o  VW���� 0 thevalue theValue��   L  \� b  \  b  \m!"! l \k#����# n  \k$%$ 7 _k��&'
�� 
cobj& m  eg���� ' o  hj���� 0 
afterindex 
afterIndex% n \_()( o  ]_���� 
0 _list_  ) o  \]���� 0 
listobject 
listObject��  ��  " o  kl���� 0 thevalue theValue  l m~*����* n  m~+,+ 7 p~��-.
�� 
cobj- l vz/����/ [  vz010 o  wx���� 0 
afterindex 
afterIndex1 m  xy���� ��  ��  . m  {}������, n mp232 o  np���� 
0 _list_  3 o  mn���� 0 
listobject 
listObject��  ��  ��    R      ��45
�� .ascrerr ****      � ****4 o      ���� 0 etext eText5 ��67
�� 
errn6 o      ���� 0 enumber eNumber7 ��89
�� 
erob8 o      ���� 0 efrom eFrom9 ��:��
�� 
errt: o      ���� 
0 eto eTo��  ! I  ����;���� 
0 _error  ; <=< m  ��>> �??   i n s e r t   i n t o   l i s t= @A@ o  ������ 0 etext eTextA BCB o  ������ 0 enumber eNumberC DED o  ������ 0 efrom eFromE F��F o  ������ 
0 eto eTo��  ��  �J   � GHG l     ��������  ��  ��  H IJI l     ��������  ��  ��  J KLK i  % (MNM I     ��OP
�� .Lst:Delenull���     ****O o      ���� 0 thelist theListP ��QR
�� 
IndxQ |���S�~T��  �  S o      �}�} 0 theindex theIndex�~  T l     U�|�{U d      VV m      �z�z �|  �{  R �yWX
�y 
FIdxW |�x�wY�vZ�x  �w  Y o      �u�u 0 	fromindex 	fromIndex�v  Z l     [�t�s[ m      �r
�r 
msng�t  �s  X �q\�p
�q 
TIdx\ |�o�n]�m^�o  �n  ] o      �l�l 0 toindex toIndex�m  ^ l     _�k�j_ m      �i
�i 
msng�k  �j  �p  N Q    �`ab` k   �cc ded h    
�hf�h 0 
listobject 
listObjectf j     �gg�g 
0 _list_  g n    hih I    �fj�e�f "0 aslistparameter asListParameterj klk o    
�d�d 0 thelist theListl m�cm m   
 nn �oo  �c  �e  i o     �b�b 0 _support  e pqp r    rsr n   tut 1    �a
�a 
lengu n   vwv o    �`�` 
0 _list_  w o    �_�_ 0 
listobject 
listObjects o      �^�^ 0 
listlength 
listLengthq xyx Z   *z{�]�\z >   |}| o    �[�[ 0 	fromindex 	fromIndex} m    �Z
�Z 
msng{ r    &~~ n   $��� I    $�Y��X�Y (0 asintegerparameter asIntegerParameter� ��� o    �W�W 0 	fromindex 	fromIndex� ��V� m     �� ���  f r o m   i t e m�V  �X  � o    �U�U 0 _support   o      �T�T 0 	fromindex 	fromIndex�]  �\  y ��� Z  + B���S�R� >  + .��� o   + ,�Q�Q 0 toindex toIndex� m   , -�P
�P 
msng� r   1 >��� n  1 <��� I   6 <�O��N�O (0 asintegerparameter asIntegerParameter� ��� o   6 7�M�M 0 toindex toIndex� ��L� m   7 8�� ���  t o   i t e m�L  �N  � o   1 6�K�K 0 _support  � o      �J�J 0 toindex toIndex�S  �R  � ��� Z   C ���I�� F   C N��� =  C F��� o   C D�H�H 0 	fromindex 	fromIndex� m   D E�G
�G 
msng� =  I L��� o   I J�F�F 0 toindex toIndex� m   J K�E
�E 
msng� k   Q ��� ��� r   Q ^��� n  Q \��� I   V \�D��C�D (0 asintegerparameter asIntegerParameter� ��� o   V W�B�B 0 theindex theIndex� ��A� m   W X�� ���  i t e m�A  �C  � o   Q V�@�@ 0 _support  � o      �?�? 0 	fromindex 	fromIndex� ��� r   _ b��� o   _ `�>�> 0 	fromindex 	fromIndex� o      �=�= 0 toindex toIndex� ��� Z  c t���<�;� A   c f��� o   c d�:�: 0 	fromindex 	fromIndex� m   d e�9�9  � r   i p��� \   i n��� [   i l��� o   i j�8�8 0 
listlength 
listLength� m   j k�7�7 � o   l m�6�6 0 	fromindex 	fromIndex� o      �5�5 0 	fromindex 	fromIndex�<  �;  � ��4� Z  u ����3�2� G   u ���� =   u x��� o   u v�1�1 0 	fromindex 	fromIndex� m   v w�0�0  � ?   { ~��� o   { |�/�/ 0 	fromindex 	fromIndex� o   | }�.�. 0 
listlength 
listLength� R   � ��-��
�- .ascrerr ****      � ****� m   � ��� ��� b I n v a l i d   i n d e x   (  i t e m    p a r a m e t e r   i s   o u t   o f   r a n g e ) .� �,��
�, 
errn� m   � ��+�+�@� �*��)
�* 
erob� l  � ���(�'� N   � ��� n   � ���� 4   � ��&�
�& 
cobj� o   � ��%�% 0 	fromindex 	fromIndex� l  � ���$�#� e   � ��� n  � ���� o   � ��"�" 
0 _list_  � o   � ��!�! 0 
listobject 
listObject�$  �#  �(  �'  �)  �3  �2  �4  �I  � k   � �� ��� Z   � ����� � =  � ���� o   � ��� 0 	fromindex 	fromIndex� m   � ��
� 
msng� r   � ���� m   � ��� � o      �� 0 	fromindex 	fromIndex� ��� =  � ���� o   � ��� 0 toindex toIndex� m   � ��
� 
msng� ��� r   � ���� o   � ��� 0 
listlength 
listLength� o      �� 0 toindex toIndex�  �   � ��� Z  � ������ A   � ���� o   � ��� 0 	fromindex 	fromIndex� m   � ���  � r   � ���� [   � ���� [   � ���� o   � ��� 0 
listlength 
listLength� m   � ��� � o   � ��� 0 	fromindex 	fromIndex� o      �� 0 	fromindex 	fromIndex�  �  � ��� Z  � ������ A   � ���� o   � ��� 0 toindex toIndex� m   � ���  � r   � ���� [   � ���� [   � �   o   � ��
�
 0 
listlength 
listLength m   � ��	�	 � o   � ��� 0 toindex toIndex� o      �� 0 toindex toIndex�  �  �  Z  � ��� G   � � =   � �	 o   � ��� 0 	fromindex 	fromIndex	 m   � ���   ?   � �

 o   � ��� 0 	fromindex 	fromIndex o   � ��� 0 
listlength 
listLength R   � �� 
�  .ascrerr ****      � **** m   � � � l I n v a l i d   i n d e x   (  f r o m   i t e m    p a r a m e t e r   i s   o u t   o f   r a n g e ) . ��
�� 
errn m   � ������@ ����
�� 
erob l  � ����� N   � � n   � � 4   � ���
�� 
cobj o   � ����� 0 	fromindex 	fromIndex l  � ����� e   � � n  � � o   � ����� 
0 _list_   o   � ����� 0 
listobject 
listObject��  ��  ��  ��  ��  �  �   �� Z  � ���� G   �  =   � !"! o   � ����� 0 toindex toIndex" m   � �����    ?  #$# o  ���� 0 toindex toIndex$ o  ���� 0 
listlength 
listLength R  ��%&
�� .ascrerr ****      � ****% m  '' �(( h I n v a l i d   i n d e x   (  t o   i t e m    p a r a m e t e r   i s   o u t   o f   r a n g e ) .& ��)*
�� 
errn) m  �����@* ��+��
�� 
erob+ l ,����, N  -- n  ./. 4  ��0
�� 
cobj0 o  ���� 0 toindex toIndex/ l 1����1 e  22 n 343 o  ���� 
0 _list_  4 o  ���� 0 
listobject 
listObject��  ��  ��  ��  ��  ��  ��  ��  � 565 Z !>78����7 ?  !$9:9 o  !"���� 0 	fromindex 	fromIndex: o  "#���� 0 toindex toIndex8 r  ':;<; J  '+== >?> o  '(���� 0 toindex toIndex? @��@ o  ()���� 0 	fromindex 	fromIndex��  < J      AA BCB o      ���� 0 	fromindex 	fromIndexC D��D o      ���� 0 toindex toIndex��  ��  ��  6 EFE Z  ?sGH��IG =  ?BJKJ o  ?@���� 0 	fromindex 	fromIndexK m  @A���� H k  E_LL MNM Z EZOP����O G  EPQRQ =  EHSTS o  EF���� 0 	fromindex 	fromIndexT o  FG���� 0 
listlength 
listLengthR =  KNUVU o  KL���� 0 toindex toIndexV o  LM���� 0 
listlength 
listLengthP L  SVWW J  SU����  ��  ��  N X��X r  [_YZY J  []����  Z o      ���� 0 	startlist 	startList��  ��  I r  bs[\[ n bq]^] 7 eq��_`
�� 
cobj_ m  ik���� ` l lpa����a \  lpbcb o  mn���� 0 	fromindex 	fromIndexc m  no���� ��  ��  ^ n beded o  ce���� 
0 _list_  e o  bc���� 0 
listobject 
listObject\ o      ���� 0 	startlist 	startListF fgf Z  t�hi��jh =  twklk o  tu���� 0 toindex toIndexl o  uv���� 0 
listlength 
listLengthi r  z~mnm J  z|����  n o      ���� 0 endlist endList��  j r  ��opo n ��qrq 7 ����st
�� 
cobjs l ��u����u [  ��vwv o  ������ 0 toindex toIndexw m  ������ ��  ��  t m  ��������r n ��xyx o  ������ 
0 _list_  y o  ������ 0 
listobject 
listObjectp o      ���� 0 endlist endListg z��z L  ��{{ b  ��|}| o  ������ 0 	startlist 	startList} o  ������ 0 endlist endList��  a R      ��~
�� .ascrerr ****      � ****~ o      ���� 0 etext eText ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  b I  ��������� 
0 _error  � ��� m  ���� ���   d e l e t e   f r o m   l i s t� ��� o  ������ 0 etext eText� ��� o  ������ 0 enumber eNumber� ��� o  ������ 0 efrom eFrom� ���� o  ������ 
0 eto eTo��  ��  L ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  ) ,��� I     �����
�� .Lst:RDuLnull���     ****� o      ���� 0 thelist theList��  � Q     ����� k    ��� ��� h    
����� 0 
listobject 
listObject� j     ����� 
0 _list_  � n    ��� 2   ��
�� 
cobj� n    ��� I    ������� "0 aslistparameter asListParameter� ���� o    
���� 0 thelist theList��  ��  � o     ���� 0 _support  � ��� l   ������  �jd not the fastest algorithm as it's O(Nn) (the repeat loop is O(N) and each `is in` test is O(n)), but simple and consistent with AS's existing behaviors (for large lists it'd be more efficient to put each item into an NSMutableSet where practical then check for uniqueness against that, but that wouldn't respect AS's current considering/ignoring settings)   � ����   n o t   t h e   f a s t e s t   a l g o r i t h m   a s   i t ' s   O ( N n )   ( t h e   r e p e a t   l o o p   i s   O ( N )   a n d   e a c h   ` i s   i n `   t e s t   i s   O ( n ) ) ,   b u t   s i m p l e   a n d   c o n s i s t e n t   w i t h   A S ' s   e x i s t i n g   b e h a v i o r s   ( f o r   l a r g e   l i s t s   i t ' d   b e   m o r e   e f f i c i e n t   t o   p u t   e a c h   i t e m   i n t o   a n   N S M u t a b l e S e t   w h e r e   p r a c t i c a l   t h e n   c h e c k   f o r   u n i q u e n e s s   a g a i n s t   t h a t ,   b u t   t h a t   w o u l d n ' t   r e s p e c t   A S ' s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s )� ��� r    *��� J    �� ��� m    ���� � ��� m    ���� � ���� n   ��� 1    ��
�� 
leng� n   ��� o    ���� 
0 _list_  � o    ���� 0 
listobject 
listObject��  � J      �� ��� o      ���� 0 i  � ��� o      ���� 0 u  � ���� o      ���� 0 
listlength 
listLength��  � ��� W   + ���� k   3 ��� ��� V   3 r��� k   N m�� ��� r   N S��� [   N Q��� o   N O���� 0 i  � m   O P���� � o      ���� 0 i  � ��� Z  T m���~�}� ?   T W��� o   T U�|�| 0 i  � o   U V�{�{ 0 
listlength 
listLength� L   Z i�� n  Z h��� 7  ] g�z��
�z 
cobj� m   a c�y�y � o   d f�x�x 0 u  � n  Z ]��� o   [ ]�w�w 
0 _list_  � o   Z [�v�v 0 
listobject 
listObject�~  �}  �  � E  7 M��� n  7 D��� 7  : D�u��
�u 
cobj� m   > @�t�t � o   A C�s�s 0 u  � n  7 :��� o   8 :�r�r 
0 _list_  � o   7 8�q�q 0 
listobject 
listObject� J   D L�� ��p� n  D J��� 4   G J�o�
�o 
cobj� o   H I�n�n 0 i  � n  D G��� o   E G�m�m 
0 _list_  � o   D E�l�l 0 
listobject 
listObject�p  � ��� r   s x��� [   s v��� o   s t�k�k 0 u  � m   t u�j�j � o      �i�i 0 u  � ��� r   y ���� n  y ��� 4   | �h�
�h 
cobj� o   } ~�g�g 0 i  � n  y |��� o   z |�f�f 
0 _list_  � o   y z�e�e 0 
listobject 
listObject� n     ��� 4   � ��d�
�d 
cobj� o   � ��c�c 0 u  � n   ���� o   � ��b�b 
0 _list_  � o    ��a�a 0 
listobject 
listObject�  �`  r   � � [   � � o   � ��_�_ 0 i   m   � ��^�^  o      �]�] 0 i  �`  � ?   / 2 o   / 0�\�\ 0 i   o   0 1�[�[ 0 
listlength 
listLength� �Z L   � � n  � �	
	 7  � ��Y
�Y 
cobj m   � ��X�X  o   � ��W�W 0 u  
 n  � � o   � ��V�V 
0 _list_   o   � ��U�U 0 
listobject 
listObject�Z  � R      �T
�T .ascrerr ****      � **** o      �S�S 0 etext eText �R
�R 
errn o      �Q�Q 0 enumber eNumber �P
�P 
erob o      �O�O 0 efrom eFrom �N�M
�N 
errt o      �L�L 
0 eto eTo�M  � I   � ��K�J�K 
0 _error    m   � � � 6 r e m o v e   d u p l i c a t e s   f r o m   l i s t  o   � ��I�I 0 etext eText  o   � ��H�H 0 enumber eNumber   o   � ��G�G 0 efrom eFrom  !�F! o   � ��E�E 
0 eto eTo�F  �J  � "#" l     �D�C�B�D  �C  �B  # $%$ l     �A�@�?�A  �@  �?  % &'& i  - 0()( I     �>*+
�> .Lst:SliLnull���     ***** o      �=�= 0 thelist theList+ �<,-
�< 
FIdx, |�;�:.�9/�;  �:  . o      �8�8 0 
startindex 
startIndex�9  / l     0�7�60 m      �5
�5 
msng�7  �6  - �41�3
�4 
TIdx1 |�2�12�03�2  �1  2 o      �/�/ 0 endindex endIndex�0  3 l     4�.�-4 m      �,
�, 
msng�.  �-  �3  ) Q    �5675 k   r88 9:9 r    ;<; n   =>= I    �+?�*�+ "0 aslistparameter asListParameter? @�)@ o    	�(�( 0 thelist theList�)  �*  > o    �'�' 0 _support  < o      �&�& 0 thelist theList: ABA r    CDC n   EFE 1    �%
�% 
lengF o    �$�$ 0 thelist theListD o      �#�# 0 	thelength 	theLengthB GHG Z    �IJK�"I >   LML o    �!�! 0 
startindex 
startIndexM m    � 
�  
msngJ k    oNN OPO r    )QRQ n   'STS I   ! '�U�� (0 asintegerparameter asIntegerParameterU VWV o   ! "�� 0 
startindex 
startIndexW X�X m   " #YY �ZZ  f r o m   i t e m�  �  T o    !�� 0 _support  R o      �� 0 
startindex 
startIndexP [\[ l  * *�]^�  ] J D note: index 0 is disallowed as it makes behavior confusing to users   ^ �__ �   n o t e :   i n d e x   0   i s   d i s a l l o w e d   a s   i t   m a k e s   b e h a v i o r   c o n f u s i n g   t o   u s e r s\ `a` Z  * <bc��b =   * -ded o   * +�� 0 
startindex 
startIndexe m   + ,��  c R   0 8�fg
� .ascrerr ****      � ****f m   6 7hh �ii d I n v a l i d   i n d e x   (  f r o m   i t e m    p a r a m e t e r   c a n n o t   b e   0 ) .g �jk
� 
errnj m   2 3���Yk �l�
� 
erobl o   4 5�� 0 
startindex 
startIndex�  �  �  a m�m Z   = ono��n =  = @pqp o   = >�� 0 endindex endIndexq m   > ?�

�
 
msngo Z   C krstur A   C Gvwv o   C D�	�	 0 
startindex 
startIndexw d   D Fxx o   D E�� 0 	thelength 	theLengths L   J Oyy n  J Nz{z 2  K M�
� 
cobj{ o   J K�� 0 thelist theListt |}| ?   R U~~ o   R S�� 0 
startindex 
startIndex o   S T�� 0 	thelength 	theLength} ��� L   X [�� J   X Z��  �  u L   ^ k�� n  ^ j��� 7  _ i���
� 
ctxt� o   c e� �  0 
startindex 
startIndex� m   f h������� o   ^ _���� 0 thelist theList�  �  �  K ��� =  r u��� o   r s���� 0 endindex endIndex� m   s t��
�� 
msng� ���� R   x ~����
�� .ascrerr ****      � ****� m   | }�� ��� ^ M i s s i n g    f r o m   i t e m    a n d / o r    t o   i t e m    p a r a m e t e r .� �����
�� 
errn� m   z {�����[��  ��  �"  H ��� Z   � �������� >  � ���� o   � ����� 0 endindex endIndex� m   � ���
�� 
msng� k   � ��� ��� r   � ���� n  � ���� I   � �������� (0 asintegerparameter asIntegerParameter� ��� o   � ����� 0 endindex endIndex� ���� m   � ��� ���  t o   i t e m��  ��  � o   � ����� 0 _support  � o      ���� 0 endindex endIndex� ��� Z  � �������� =   � ���� o   � ����� 0 endindex endIndex� m   � �����  � R   � �����
�� .ascrerr ****      � ****� m   � ��� ��� ` I n v a l i d   i n d e x   (  t o   i t e m    p a r a m e t e r   c a n n o t   b e   0 ) .� ����
�� 
errn� m   � ������Y� �����
�� 
erob� o   � ����� 0 endindex endIndex��  ��  ��  � ���� Z   � �������� =  � ���� o   � ����� 0 
startindex 
startIndex� m   � ���
�� 
msng� Z   � ������ A   � ���� o   � ����� 0 endindex endIndex� d   � ��� o   � ����� 0 	thelength 	theLength� L   � ��� J   � �����  � ��� ?   � ���� o   � ����� 0 endindex endIndex� o   � ����� 0 	thelength 	theLength� ���� L   � ��� n  � ���� 2  � ���
�� 
cobj� o   � ����� 0 thelist theList��  � L   � ��� n  � ���� 7  � �����
�� 
ctxt� m   � ����� � o   � ����� 0 endindex endIndex� o   � ����� 0 thelist theList��  ��  ��  ��  ��  � ��� l  � �������  � + % both start and end indexes are given   � ��� J   b o t h   s t a r t   a n d   e n d   i n d e x e s   a r e   g i v e n� ��� Z  � �������� A   � ���� o   � ����� 0 
startindex 
startIndex� m   � �����  � r   � ���� [   � ���� [   � ���� o   � ����� 0 	thelength 	theLength� m   � ����� � o   � ����� 0 
startindex 
startIndex� o      ���� 0 
startindex 
startIndex��  ��  � ��� Z  �������� A   � ���� o   � ����� 0 endindex endIndex� m   � �����  � r   � ��� [   � ���� [   � ���� o   � ����� 0 	thelength 	theLength� m   � ����� � o   � ����� 0 endindex endIndex� o      ���� 0 endindex endIndex��  ��  � ��� Z 0������� G  &��� F  ��� A  ��� o  ���� 0 
startindex 
startIndex� m  ���� � A  ��� o  ���� 0 endindex endIndex� l 
������ m  ���� ��  ��  � F  "��� ?  ��� o  ���� 0 
startindex 
startIndex� o  ���� 0 	thelength 	theLength� ?  ��� o  ���� 0 endindex endIndex� o  ���� 0 	thelength 	theLength� L  ),�� J  )+����  ��  ��  � ��� Z  1J�� ��� A  14 o  12���� 0 
startindex 
startIndex m  23���� � r  7: m  78����  o      ���� 0 
startindex 
startIndex   ?  =@ o  =>���� 0 
startindex 
startIndex o  >?���� 0 	thelength 	theLength 	��	 r  CF

 o  CD���� 0 	thelength 	theLength o      ���� 0 
startindex 
startIndex��  ��  �  Z  Kd�� A  KN o  KL���� 0 endindex endIndex m  LM����  r  QT m  QR����  o      ���� 0 endindex endIndex  ?  WZ o  WX���� 0 endindex endIndex o  XY���� 0 	thelength 	theLength �� r  ]` o  ]^���� 0 	thelength 	theLength o      ���� 0 endindex endIndex��  ��   �� L  er n  eq 7 fp�� !
�� 
cobj  o  jl���� 0 
startindex 
startIndex! o  mo���� 0 endindex endIndex o  ef���� 0 thelist theList��  6 R      ��"#
�� .ascrerr ****      � ****" o      ���� 0 etext eText# ��$%
�� 
errn$ o      ���� 0 enumber eNumber% ��&'
�� 
erob& o      ���� 0 efrom eFrom' ��(��
�� 
errt( o      ���� 
0 eto eTo��  7 I  z���)���� 
0 _error  ) *+* m  {~,, �--  s l i c e   l i s t+ ./. o  ~���� 0 etext eText/ 010 o  ����� 0 enumber eNumber1 232 o  ������ 0 efrom eFrom3 4��4 o  ������ 
0 eto eTo��  ��  ' 565 l     ��������  ��  ��  6 787 l     ��������  ��  ��  8 9:9 i  1 4;<; I     ��=>
�� .Lst:Trannull���     ****= o      ���� 0 thelist theList> ��?@
�� 
Whil? |����A�B��  ��  A o      �~�~ 0 unevenoption unevenOption�  B l     C�}�|C m      �{
�{ LTrhLTrR�}  �|  @ �zD�y
�z 
PadID |�x�wE�vF�x  �w  E o      �u�u 0 padvalue padValue�v  F l     G�t�sG m      �r
�r 
msng�t  �s  �y  < Q    �HIJH k   KK LML Z   NO�q�pN =   PQP o    �o�o 0 thelist theListQ J    �n�n  O L   
 RR J   
 �m�m  �q  �p  M STS Z   >UV�l�kU G    /WXW =    YZY l   [�j�i[ I   �h\]
�h .corecnte****       ****\ J    ^^ _�g_ o    �f�f 0 thelist theList�g  ] �e`�d
�e 
kocl` m    �c
�c 
list�d  �j  �i  Z m    �b�b  X >     -aba l    'c�a�`c I    '�_de
�_ .corecnte****       ****d o     !�^�^ 0 thelist theListe �]f�\
�] 
koclf m   " #�[
�[ 
list�\  �a  �`  b l  ' ,g�Z�Yg I  ' ,�Xh�W
�X .corecnte****       ****h o   ' (�V�V 0 thelist theList�W  �Z  �Y  V R   2 :�Uij
�U .ascrerr ****      � ****i m   8 9kk �ll ( N o t   a   l i s t   o f   l i s t s .j �Tmn
�T 
errnm m   4 5�S�S�Yn �Ro�Q
�R 
erobo o   6 7�P�P 0 thelist theList�Q  �l  �k  T pqp h   ? F�Or�O 0 
listobject 
listObjectr k      ss tut j     �Nv�N 
0 _list_  v o     �M�M 0 thelist theListu w�Lw j    
�Kx�K 0 _resultlist_ _resultList_x J    	�J�J  �L  q yzy r   G Q{|{ n   G O}~} 1   M O�I
�I 
leng~ n  G M� 4   J M�H�
�H 
cobj� m   K L�G�G � n  G J��� o   H J�F�F 
0 _list_  � o   G H�E�E 0 
listobject 
listObject| o      �D�D $0 resultlistlength resultListLengthz ��� l  R R�C���C  � K E find the longest/shortest sublist; this will be length of resultList   � ��� �   f i n d   t h e   l o n g e s t / s h o r t e s t   s u b l i s t ;   t h i s   w i l l   b e   l e n g t h   o f   r e s u l t L i s t� ��� Z   R����� =  R U��� o   R S�B�B 0 unevenoption unevenOption� m   S T�A
�A LTrhLTrR� X   X ���@�� Z  j ����?�>� >   j o��� n  j m��� 1   k m�=
�= 
leng� o   j k�<�< 0 aref aRef� o   m n�;�; $0 resultlistlength resultListLength� R   r ~�:��
�: .ascrerr ****      � ****� m   z }�� ��� x I n v a l i d   d i r e c t   p a r a m e t e r   ( s u b l i s t s   a r e   n o t   a l l   s a m e   l e n g t h ) .� �9��
�9 
errn� m   t u�8�8�Y� �7��6
�7 
erob� l  v y��5�4� n  v y��� o   w y�3�3 
0 _list_  � o   v w�2�2 0 
listobject 
listObject�5  �4  �6  �?  �>  �@ 0 aref aRef� n  [ ^��� o   \ ^�1�1 
0 _list_  � o   [ \�0�0 0 
listobject 
listObject� ��� =  � ���� o   � ��/�/ 0 unevenoption unevenOption� m   � ��.
�. LTrhLTrP� ��� X   � ���-�� Z  � ����,�+� ?   � ���� n  � ���� 1   � ��*
�* 
leng� o   � ��)�) 0 aref aRef� o   � ��(�( $0 resultlistlength resultListLength� r   � ���� n  � ���� 1   � ��'
�' 
leng� o   � ��&�& 0 aref aRef� o      �%�% $0 resultlistlength resultListLength�,  �+  �- 0 aref aRef� n  � ���� o   � ��$�$ 
0 _list_  � o   � ��#�# 0 
listobject 
listObject� ��� =  � ���� o   � ��"�" 0 unevenoption unevenOption� m   � ��!
�! LTrhLTrT� �� � X   � ����� Z  � ������ A   � ���� n  � ���� 1   � ��
� 
leng� o   � ��� 0 aref aRef� o   � ��� $0 resultlistlength resultListLength� r   � ���� n  � ���� 1   � ��
� 
leng� o   � ��� 0 aref aRef� o      �� $0 resultlistlength resultListLength�  �  � 0 aref aRef� n  � ���� o   � ��� 
0 _list_  � o   � ��� 0 
listobject 
listObject�   � R   ����
� .ascrerr ****      � ****� m   ��� ��� h I n v a l i d    w h i l e    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .� ���
� 
errn� m   � ����Y� ���
� 
erob� o   � ��� 0 unevenoption unevenOption� ���
� 
errt� m   � ��
� 
enum�  � ��� l ����  � � � build empty matrix (due to inefficiencies of AS's list implementation, when populating large lists, it's probably quicker to create a padded list then set its items rather than start with an empty list and append items)   � ����   b u i l d   e m p t y   m a t r i x   ( d u e   t o   i n e f f i c i e n c i e s   o f   A S ' s   l i s t   i m p l e m e n t a t i o n ,   w h e n   p o p u l a t i n g   l a r g e   l i s t s ,   i t ' s   p r o b a b l y   q u i c k e r   t o   c r e a t e   a   p a d d e d   l i s t   t h e n   s e t   i t s   i t e m s   r a t h e r   t h a n   s t a r t   w i t h   a n   e m p t y   l i s t   a n d   a p p e n d   i t e m s )� ��� r  ��� I  ���
� "0 _makelistobject _makeListObject� ��� n 	��� 1  	�	
�	 
leng� n ��� o  �� 
0 _list_  � o  �� 0 
listobject 
listObject� ��� o  	
�� 0 padvalue padValue�  �
  � o      �� (0 emptyresultsublist emptyResultSubList� ��� Y  -������ l (���� r  (��� l !��� � e  !�� n !��� 2  ��
�� 
cobj� o  ���� (0 emptyresultsublist emptyResultSubList�  �   � n      ���  ;  &'� n !&��� o  "&���� 0 _resultlist_ _resultList_� o  !"���� 0 
listobject 
listObject�   shallow copy   � ���    s h a l l o w   c o p y� 0 i  � m  ���� � l ������ \  ��� o  ���� $0 resultlistlength resultListLength� m  ���� ��  ��  �  � ��� r  .6��� o  ./���� (0 emptyresultsublist emptyResultSubList� n          ;  45 n /4 o  04���� 0 _resultlist_ _resultList_ o  /0���� 0 
listobject 
listObject�  l 77����     populate matrix    �     p o p u l a t e   m a t r i x 	
	 Y  7w���� Y  Fr���� r  Xm n  Xa 4  ^a��
�� 
cobj o  _`���� 0 j   n  X^ 4  [^��
�� 
cobj o  \]���� 0 i   n X[ o  Y[���� 
0 _list_   o  XY���� 0 
listobject 
listObject n       4  il��
�� 
cobj o  jk���� 0 i   n  ai 4  fi�� 
�� 
cobj  o  gh���� 0 j   n af!"! o  bf���� 0 _resultlist_ _resultList_" o  ab���� 0 
listobject 
listObject�� 0 j   m  IJ����  n  JS#$# 1  PR��
�� 
leng$ n JP%&% 4  MP��'
�� 
cobj' o  NO���� 0 i  & n JM()( o  KM���� 
0 _list_  ) o  JK���� 0 
listobject 
listObject��  �� 0 i   m  :;����  n ;A*+* 1  >@��
�� 
leng+ n ;>,-, o  <>���� 
0 _list_  - o  ;<���� 0 
listobject 
listObject��  
 .��. L  x// n x~010 o  y}���� 0 _resultlist_ _resultList_1 o  xy���� 0 
listobject 
listObject��  I R      ��23
�� .ascrerr ****      � ****2 o      ���� 0 etext eText3 ��45
�� 
errn4 o      ���� 0 enumber eNumber5 ��67
�� 
erob6 o      ���� 0 efrom eFrom7 ��8��
�� 
errt8 o      ���� 
0 eto eTo��  J I  ����9���� 
0 _error  9 :;: m  ��<< �==  t r a n s p o s e   l i s t; >?> o  ������ 0 etext eText? @A@ o  ������ 0 enumber eNumberA BCB o  ������ 0 efrom eFromC D��D o  ������ 
0 eto eTo��  ��  : EFE l     ��������  ��  ��  F GHG l     ��������  ��  ��  H IJI l     ��KL��  K J D--------------------------------------------------------------------   L �MM � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -J NON l     ��PQ��  P   search   Q �RR    s e a r c hO STS l     ��������  ��  ��  T UVU i  5 8WXW I     ��YZ
�� .Lst:Findnull���     ****Y o      ���� 0 thelist theListZ ��[\
�� 
Valu[ o      ���� 0 theitem theItem\ ��]��
�� 
Retu] |����^��_��  ��  ^ o      ���� (0 findingoccurrences findingOccurrences��  _ l     `����` m      ��
�� LFWhLFWA��  ��  ��  X Q     �abca k    �dd efe h    
��g�� 0 
listobject 
listObjectg k      hh iji j     ��k�� 
0 _list_  k n    lml I    ��n���� "0 aslistparameter asListParametern opo o    
���� 0 thelist theListp q��q m   
 rr �ss  ��  ��  m o     ���� 0 _support  j t��t j    ��u�� 0 _result_  u J    ����  ��  f vwv Z    �xyz{x =   |}| o    ���� (0 findingoccurrences findingOccurrences} m    ��
�� LFWhLFWAy Y    :~�����~ Z     5������� =    (��� n     &��� 4   # &���
�� 
cobj� o   $ %���� 0 i  � n    #��� o   ! #���� 
0 _list_  � o     !���� 0 
listobject 
listObject� o   & '���� 0 theitem theItem� r   + 1��� o   + ,���� 0 i  � n      ���  ;   / 0� n  , /��� o   - /���� 0 _result_  � o   , -���� 0 
listobject 
listObject��  ��  �� 0 i   m    ���� � n    ��� 1    ��
�� 
leng� n   ��� o    ���� 
0 _list_  � o    ���� 0 
listobject 
listObject��  z ��� =  = @��� o   = >���� (0 findingoccurrences findingOccurrences� m   > ?��
�� LFWhLFWF� ��� Y   C n�������� Z   R i������� =  R Z��� n   R X��� 4   U X���
�� 
cobj� o   V W���� 0 i  � n  R U��� o   S U���� 
0 _list_  � o   R S���� 0 
listobject 
listObject� o   X Y���� 0 theitem theItem� k   ] e�� ��� r   ] c��� o   ] ^���� 0 i  � n      ���  ;   a b� n  ^ a��� o   _ a���� 0 _result_  � o   ^ _���� 0 
listobject 
listObject� ����  S   d e��  ��  ��  �� 0 i  � m   F G���� � n   G M��� 1   J L��
�� 
leng� n  G J��� o   H J���� 
0 _list_  � o   G H�� 0 
listobject 
listObject��  � ��� =  q t��� o   q r�~�~ (0 findingoccurrences findingOccurrences� m   r s�}
�} LFWhLFWL� ��|� Y   w ���{���� Z   � ����z�y� =  � ���� n   � ���� 4   � ��x�
�x 
cobj� o   � ��w�w 0 i  � n  � ���� o   � ��v�v 
0 _list_  � o   � ��u�u 0 
listobject 
listObject� o   � ��t�t 0 theitem theItem� k   � ��� ��� r   � ���� o   � ��s�s 0 i  � n      ���  ;   � �� n  � ���� o   � ��r�r 0 _result_  � o   � ��q�q 0 
listobject 
listObject� ��p�  S   � ��p  �z  �y  �{ 0 i  � n   z ���� 1   } �o
�o 
leng� n  z }��� o   { }�n�n 
0 _list_  � o   z {�m�m 0 
listobject 
listObject� m   � ��l�l � m   � ��k�k���|  { R   � ��j��
�j .ascrerr ****      � ****� m   � ��� ��� p I n v a l i d    r e t u r n i n g    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .� �i��
�i 
errn� m   � ��h�h�Y� �g��
�g 
erob� o   � ��f�f (0 findingoccurrences findingOccurrences� �e��d
�e 
errt� m   � ��c
�c 
enum�d  w ��b� L   � ��� n  � ���� o   � ��a�a 0 _result_  � o   � ��`�` 0 
listobject 
listObject�b  b R      �_��
�_ .ascrerr ****      � ****� o      �^�^ 0 etext eText� �]��
�] 
errn� o      �\�\ 0 enumber eNumber� �[��
�[ 
erob� o      �Z�Z 0 efrom eFrom� �Y��X
�Y 
errt� o      �W�W 
0 eto eTo�X  c I   � ��V��U�V 
0 _error  � ��� m   � ��� ���  f i n d   i n   l i s t� ��� o   � ��T�T 0 etext eText� ��� o   � ��S�S 0 enumber eNumber� ��� o   � ��R�R 0 efrom eFrom� ��Q� o   � ��P�P 
0 eto eTo�Q  �U  V ��� l     �O�N�M�O  �N  �M  � ��� l     �L�K�J�L  �K  �J  � ��� l     �I���I  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �H� �H  �ZT map, filter, reduce (these operations are relatively trivial to perform in AS without the need for callbacks; however, these handlers are more flexible when the convert/check/combine operations are parameterized and also provide more advanced users with idiomatic examples of how to parameterize a general-purpose handler's exact behavior)     ��   m a p ,   f i l t e r ,   r e d u c e   ( t h e s e   o p e r a t i o n s   a r e   r e l a t i v e l y   t r i v i a l   t o   p e r f o r m   i n   A S   w i t h o u t   t h e   n e e d   f o r   c a l l b a c k s ;   h o w e v e r ,   t h e s e   h a n d l e r s   a r e   m o r e   f l e x i b l e   w h e n   t h e   c o n v e r t / c h e c k / c o m b i n e   o p e r a t i o n s   a r e   p a r a m e t e r i z e d   a n d   a l s o   p r o v i d e   m o r e   a d v a n c e d   u s e r s   w i t h   i d i o m a t i c   e x a m p l e s   o f   h o w   t o   p a r a m e t e r i z e   a   g e n e r a l - p u r p o s e   h a n d l e r ' s   e x a c t   b e h a v i o r )�  l     �G�F�E�G  �F  �E    l     �D�D   � � note: while these handlers prevent the script object from modifying the input list directly, it cannot stop them modifying mutable (date/list/record/script/reference) items within the input list (doing so would be very bad practice, however)    ��   n o t e :   w h i l e   t h e s e   h a n d l e r s   p r e v e n t   t h e   s c r i p t   o b j e c t   f r o m   m o d i f y i n g   t h e   i n p u t   l i s t   d i r e c t l y ,   i t   c a n n o t   s t o p   t h e m   m o d i f y i n g   m u t a b l e   ( d a t e / l i s t / r e c o r d / s c r i p t / r e f e r e n c e )   i t e m s   w i t h i n   t h e   i n p u t   l i s t   ( d o i n g   s o   w o u l d   b e   v e r y   b a d   p r a c t i c e ,   h o w e v e r ) 	
	 l     �C�B�A�C  �B  �A  
  i  9 < I     �@
�@ .Lst:Map_null���     **** o      �?�? 0 thelist theList �>�=
�> 
Usin o      �<�< 0 	thescript 	theScript�=   Q     � k    �  h    
�;�; $0 resultlistobject resultListObject j     �:�: 
0 _list_   n      2   �9
�9 
cobj n     I    �8�7�8 "0 aslistparameter asListParameter   o    
�6�6 0 thelist theList  !�5! m   
 "" �##  �5  �7   o     �4�4 0 _support   $%$ r    &'& n   ()( I    �3*�2�3 &0 asscriptparameter asScriptParameter* +,+ o    �1�1 0 	thescript 	theScript, -�0- m    .. �// 
 u s i n g�0  �2  ) o    �/�/ 0 _support  ' o      �.�. 0 	thescript 	theScript% 010 Q    �2342 Y    B5�-67�,5 l  + =89:8 r   + =;<; n  + 6=>= I   , 6�+?�*�+ 0 convertitem convertItem? @�)@ n   , 2ABA 4   / 2�(C
�( 
cobjC o   0 1�'�' 0 i  B n  , /DED o   - /�&�& 
0 _list_  E o   , -�%�% $0 resultlistobject resultListObject�)  �*  > o   + ,�$�$ 0 	thescript 	theScript< n      FGF 4   9 <�#H
�# 
cobjH o   : ;�"�" 0 i  G n  6 9IJI o   7 9�!�! 
0 _list_  J o   6 7� �  $0 resultlistobject resultListObject9 � ~ use counting loop rather than `repeat with aRef in theList` as the item's index is also used when constructing error messages   : �KK �   u s e   c o u n t i n g   l o o p   r a t h e r   t h a n   ` r e p e a t   w i t h   a R e f   i n   t h e L i s t `   a s   t h e   i t e m ' s   i n d e x   i s   a l s o   u s e d   w h e n   c o n s t r u c t i n g   e r r o r   m e s s a g e s�- 0 i  6 m     �� 7 n     &LML 1   # %�
� 
lengM n    #NON o   ! #�� 
0 _list_  O o     !�� $0 resultlistobject resultListObject�,  3 R      �PQ
� .ascrerr ****      � ****P o      �� 0 etext eTextQ �RS
� 
errnR o      �� 0 enumber eNumberS �T�
� 
errtT o      �� 
0 eto eTo�  4 k   J �UU VWV Z   J hXY�ZX ?   J M[\[ o   J K�� 0 i  \ m   K L�� Y r   P a]^] n   P __`_ 7  S _�ab
� 
cobja m   W Y�� b l  Z ^c��c \   Z ^ded o   [ \�� 0 i  e m   \ ]�� �  �  ` n  P Sfgf o   Q S�� 
0 _list_  g o   P Q�
�
 $0 resultlistobject resultListObject^ o      �	�	 0 epartial ePartial�  Z r   d hhih J   d f��  i o      �� 0 epartial ePartialW j�j R   i ��kl
� .ascrerr ****      � ****k b   z �mnm b   z �opo b   z qrq m   z }ss �tt , C o u l d n ' t   c o n v e r t   i t e m  r o   } ~�� 0 i  p m    �uu �vv  :  n o   � ��� 0 etext eTextl �wx
� 
errnw o   k l�� 0 enumber eNumberx � yz
�  
eroby l  m u{����{ N   m u|| n   m t}~} 4   q t��
�� 
cobj o   r s���� 0 i  ~ l  m q������ e   m q�� n  m q��� o   n p���� 
0 _list_  � o   m n���� 0 
listobject 
listObject��  ��  ��  ��  z ����
�� 
errt� o   v w���� 
0 eto eTo� �����
�� 
ptlr� o   x y���� 0 epartial ePartial��  �  1 ���� L   � ��� n  � ���� o   � ����� 
0 _list_  � o   � ����� $0 resultlistobject resultListObject��   R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� ����
�� 
errt� o      ���� 
0 eto eTo� �����
�� 
ptlr� o      ���� 0 epartial ePartial��   I   � �������� 20 _errorwithpartialresult _errorWithPartialResult� ��� m   � ��� ���  m a p   l i s t� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ��� o   � ����� 
0 eto eTo� ���� o   � ����� 0 epartial ePartial��  ��   ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  = @��� I     ����
�� .Lst:Filtnull���     ****� o      ���� 0 thelist theList� �����
�� 
Usin� o      ���� 0 	thescript 	theScript��  � Q     ����� k    ��� ��� h    
����� $0 resultlistobject resultListObject� j     ����� 
0 _list_  � n     ��� 2   ��
�� 
cobj� n    ��� I    ������� "0 aslistparameter asListParameter� ��� o    
���� 0 thelist theList� ���� m   
 �� ���  ��  ��  � o     ���� 0 _support  � ��� r    ��� n   ��� I    ������� &0 asscriptparameter asScriptParameter� ��� o    ���� 0 	thescript 	theScript� ���� m    �� ��� 
 u s i n g��  ��  � o    ���� 0 _support  � o      ���� 0 	thescript 	theScript� ��� r    ��� m    ����  � o      ���� 0 	lastindex 	lastIndex� ��� Q    ����� Y     X�������� k   / S�� ��� r   / 7��� n   / 5��� 4   2 5���
�� 
cobj� o   3 4���� 0 i  � n  / 2��� o   0 2���� 
0 _list_  � o   / 0���� $0 resultlistobject resultListObject� o      ���� 0 theitem theItem� ���� Z   8 S������� n  8 >��� I   9 >������� 0 	checkitem 	checkItem� ���� o   9 :���� 0 theitem theItem��  ��  � o   8 9���� 0 	thescript 	theScript� k   A O�� ��� r   A F��� [   A D��� o   A B���� 0 	lastindex 	lastIndex� m   B C���� � o      ���� 0 	lastindex 	lastIndex� ���� r   G O��� o   G H���� 0 theitem theItem� n      ��� 4   K N���
�� 
cobj� o   L M���� 0 	lastindex 	lastIndex� n  H K��� o   I K���� 
0 _list_  � o   H I���� $0 resultlistobject resultListObject��  ��  ��  ��  �� 0 i  � m   # $���� � n   $ *��� 1   ' )��
�� 
leng� n  $ '��� o   % '���� 
0 _list_  � o   $ %���� $0 resultlistobject resultListObject��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� �����
�� 
errt� o      ���� 
0 eto eTo��  � k   ` �    Z   ` ~�� ?   ` c o   ` a���� 0 	lastindex 	lastIndex m   a b����  r   f w	 n   f u

 7  i u��
�� 
cobj m   m o����  l  p t���� \   p t o   q r���� 0 	lastindex 	lastIndex m   r s���� ��  ��   n  f i o   g i���� 
0 _list_   o   f g���� $0 resultlistobject resultListObject	 o      ���� 0 epartial ePartial��   r   z ~ J   z |����   o      ���� 0 epartial ePartial �� R    ���
�� .ascrerr ****      � **** b   � � b   � � b   � � m   � � � * C o u l d n ' t   f i l t e r   i t e m   o   � ����� 0 i   m   � �   �!!  :   o   � ����� 0 etext eText ��"#
�� 
errn" o   � ����� 0 enumber eNumber# ��$%
�� 
erob$ l  � �&����& N   � �'' n   � �()( 4   � ���*
�� 
cobj* o   � ����� 0 i  ) l  � �+����+ e   � �,, n  � �-.- o   � ����� 
0 _list_  . o   � ����� 0 
listobject 
listObject��  ��  ��  ��  % ��/0
�� 
errt/ o   � ����� 
0 eto eTo0 �1�~
� 
ptlr1 o   � ��}�} 0 epartial ePartial�~  ��  � 232 Z  � �45�|�{4 =   � �676 o   � ��z�z 0 	lastindex 	lastIndex7 m   � ��y�y  5 L   � �88 J   � ��x�x  �|  �{  3 9�w9 L   � �:: n  � �;<; 7  � ��v=>
�v 
cobj= m   � ��u�u > o   � ��t�t 0 	lastindex 	lastIndex< n  � �?@? o   � ��s�s 
0 _list_  @ o   � ��r�r $0 resultlistobject resultListObject�w  � R      �qAB
�q .ascrerr ****      � ****A o      �p�p 0 etext eTextB �oCD
�o 
errnC o      �n�n 0 enumber eNumberD �mEF
�m 
erobE o      �l�l 0 efrom eFromF �kGH
�k 
errtG o      �j�j 
0 eto eToH �iI�h
�i 
ptlrI o      �g�g 0 epartial ePartial�h  � I   � ��fJ�e�f 20 _errorwithpartialresult _errorWithPartialResultJ KLK m   � �MM �NN  f i l t e r   l i s tL OPO o   � ��d�d 0 etext eTextP QRQ o   � ��c�c 0 enumber eNumberR STS o   � ��b�b 0 efrom eFromT UVU o   � ��a�a 
0 eto eToV W�`W o   � ��_�_ 0 epartial ePartial�`  �e  � XYX l     �^�]�\�^  �]  �\  Y Z[Z l     �[�Z�Y�[  �Z  �Y  [ \]\ i  A D^_^ I     �X`a
�X .Lst:Redunull���     ****` o      �W�W 0 thelist theLista �Vb�U
�V 
Usinb o      �T�T 0 	thescript 	theScript�U  _ k     �cc ded r     fgf o     �S�S 0 missingvalue missingValueg o      �R�R 0 	theresult 	theResulte h�Qh Q    �ijki k    �ll mnm h    �Po�P 0 
listobject 
listObjecto j     �Op�O 
0 _list_  p n    qrq I    �Ns�M�N "0 aslistparameter asListParameters tut o    
�L�L 0 thelist theListu v�Kv m   
 ww �xx  �K  �M  r o     �J�J 0 _support  n yzy Z   &{|�I�H{ =    }~} n    � 1    �G
�G 
leng� n   ��� o    �F�F 
0 _list_  � o    �E�E 0 
listobject 
listObject~ m    �D�D  | R    "�C��
�C .ascrerr ****      � ****� m     !�� ���  L i s t   i s   e m p t y .� �B��
�B 
errn� m    �A�A�Y� �@��?
�@ 
erob� J    �>�>  �?  �I  �H  z ��� r   ' 4��� n  ' 2��� I   , 2�=��<�= &0 asscriptparameter asScriptParameter� ��� o   , -�;�; 0 	thescript 	theScript� ��:� m   - .�� ��� 
 u s i n g�:  �<  � o   ' ,�9�9 0 _support  � o      �8�8 0 	thescript 	theScript� ��� r   5 =��� n   5 ;��� 4   8 ;�7�
�7 
cobj� m   9 :�6�6 � n  5 8��� o   6 8�5�5 
0 _list_  � o   5 6�4�4 0 
listobject 
listObject� o      �3�3 0 	theresult 	theResult� ��� Q   > ����� Y   A c��2���1� r   P ^��� n  P \��� I   Q \�0��/�0 0 combineitems combineItems� ��� o   Q R�.�. 0 	theresult 	theResult� ��-� n   R X��� 4   U X�,�
�, 
cobj� o   V W�+�+ 0 i  � n  R U��� o   S U�*�* 
0 _list_  � o   R S�)�) 0 
listobject 
listObject�-  �/  � o   P Q�(�( 0 	thescript 	theScript� o      �'�' 0 	theresult 	theResult�2 0 i  � m   D E�&�& � n   E K��� 1   H J�%
�% 
leng� n  E H��� o   F H�$�$ 
0 _list_  � o   E F�#�# 0 
listobject 
listObject�1  � R      �"��
�" .ascrerr ****      � ****� o      �!�! 0 etext eText� � ��
�  
errn� o      �� 0 enumber eNumber� ���
� 
errt� o      �� 
0 eto eTo�  � R   k ����
� .ascrerr ****      � ****� b   ~ ���� b   ~ ���� b   ~ ���� m   ~ ��� ��� * C o u l d n ' t   r e d u c e   i t e m  � o   � ��� 0 i  � m   � ��� ���  :  � o   � ��� 0 etext eText� ���
� 
errn� o   m n�� 0 enumber eNumber� ���
� 
erob� l  o w���� N   o w�� n   o v��� 4   s v��
� 
cobj� o   t u�� 0 i  � l  o s���� e   o s�� n  o s��� o   p r�� 
0 _list_  � o   o p�� 0 
listobject 
listObject�  �  �  �  � ���
� 
errt� o   z {�� 
0 eto eTo�  � ��
� L   � ��� o   � ��	�	 0 	theresult 	theResult�
  j R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      � �  
0 eto eTo�  k I   � �������� 20 _errorwithpartialresult _errorWithPartialResult� ��� m   � ��� ���  r e d u c e   l i s t� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ��� o   � ����� 
0 eto eTo� ���� o   � ����� 0 	theresult 	theResult��  ��  �Q  ] ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   sort   � ��� 
   s o r t� ��� l     ��������  ��  ��  � ��� l      ��	 	��  	 �� Notes: 

- Quicksort provides between [best case] O(n * log n) and [worst case] O(n * n) efficiency, typically leaning towards the former in all but the most pathological cases.

- One limitation of quicksort is that it isn't stable, i.e. items that compare as equal can appear in any order in the resulting list; their original order isn't preserved. An alternate algorithm such as Heapsort would avoid this, but would likely be significantly slower on average (while heapsort is guaranteed to be O(n * log n), it has much higher constant overhead than quicksort which tends to be fast in all but the most degenerate cases).

- This implementation trades some speed for greater robustness and flexibility, sorting a 10,000-number list in ~1sec, whereas a bare-bones quicksort might be 2x faster. OTOH, if you want fast code then AppleScript's the absolute last language you want to be using anyway, (e.g. Python's `sorted` function is 100x faster). For sorting simple lists of number/text/date values it's probably much quicker to send the AS list across the ASOC bridge and use -[NSArray sortedArray...], but that doesn't generalize to other use cases so isn't used here.

   	 �			0   N o t e s :   
 
 -   Q u i c k s o r t   p r o v i d e s   b e t w e e n   [ b e s t   c a s e ]   O ( n   *   l o g   n )   a n d   [ w o r s t   c a s e ]   O ( n   *   n )   e f f i c i e n c y ,   t y p i c a l l y   l e a n i n g   t o w a r d s   t h e   f o r m e r   i n   a l l   b u t   t h e   m o s t   p a t h o l o g i c a l   c a s e s . 
 
 -   O n e   l i m i t a t i o n   o f   q u i c k s o r t   i s   t h a t   i t   i s n ' t   s t a b l e ,   i . e .   i t e m s   t h a t   c o m p a r e   a s   e q u a l   c a n   a p p e a r   i n   a n y   o r d e r   i n   t h e   r e s u l t i n g   l i s t ;   t h e i r   o r i g i n a l   o r d e r   i s n ' t   p r e s e r v e d .   A n   a l t e r n a t e   a l g o r i t h m   s u c h   a s   H e a p s o r t   w o u l d   a v o i d   t h i s ,   b u t   w o u l d   l i k e l y   b e   s i g n i f i c a n t l y   s l o w e r   o n   a v e r a g e   ( w h i l e   h e a p s o r t   i s   g u a r a n t e e d   t o   b e   O ( n   *   l o g   n ) ,   i t   h a s   m u c h   h i g h e r   c o n s t a n t   o v e r h e a d   t h a n   q u i c k s o r t   w h i c h   t e n d s   t o   b e   f a s t   i n   a l l   b u t   t h e   m o s t   d e g e n e r a t e   c a s e s ) . 
 
 -   T h i s   i m p l e m e n t a t i o n   t r a d e s   s o m e   s p e e d   f o r   g r e a t e r   r o b u s t n e s s   a n d   f l e x i b i l i t y ,   s o r t i n g   a   1 0 , 0 0 0 - n u m b e r   l i s t   i n   ~ 1 s e c ,   w h e r e a s   a   b a r e - b o n e s   q u i c k s o r t   m i g h t   b e   2 x   f a s t e r .   O T O H ,   i f   y o u   w a n t   f a s t   c o d e   t h e n   A p p l e S c r i p t ' s   t h e   a b s o l u t e   l a s t   l a n g u a g e   y o u   w a n t   t o   b e   u s i n g   a n y w a y ,   ( e . g .   P y t h o n ' s   ` s o r t e d `   f u n c t i o n   i s   1 0 0 x   f a s t e r ) .   F o r   s o r t i n g   s i m p l e   l i s t s   o f   n u m b e r / t e x t / d a t e   v a l u e s   i t ' s   p r o b a b l y   m u c h   q u i c k e r   t o   s e n d   t h e   A S   l i s t   a c r o s s   t h e   A S O C   b r i d g e   a n d   u s e   - [ N S A r r a y   s o r t e d A r r a y . . . ] ,   b u t   t h a t   d o e s n ' t   g e n e r a l i z e   t o   o t h e r   u s e   c a s e s   s o   i s n ' t   u s e d   h e r e . 
 
� 			 l     ��������  ��  ��  	 			 l     ��������  ��  ��  	 			 l     			
			 j   E I��	�� *0 _quicksortthreshold _quicksortThreshold	 m   E H���� 	
 T N shorter ranges are sorted using insertion sort; longer ranges using quicksort   	 �		 �   s h o r t e r   r a n g e s   a r e   s o r t e d   u s i n g   i n s e r t i o n   s o r t ;   l o n g e r   r a n g e s   u s i n g   q u i c k s o r t	 			 l     ��������  ��  ��  	 			 i  J M			 I      ��	���� 	0 _sort  	 			 o      ���� $0 resultlistobject resultListObject	 			 o      ���� 0 	fromindex 	fromIndex	 			 o      ���� 0 toindex toIndex	 			 o      ����  0 sortcomparator sortComparator	 	��	 o      ���� 0 usequicksort useQuickSort��  ��  	 l   			 	 k    	!	! 	"	#	" Z    t	$	%����	$ o     ���� 0 usequicksort useQuickSort	% l  p	&	'	(	& k   p	)	) 	*	+	* Z   	,	-����	, A    		.	/	. \    	0	1	0 o    ���� 0 toindex toIndex	1 o    ���� 0 	fromindex 	fromIndex	/ m    ���� 	- L    ����  ��  ��  	+ 	2	3	2 r    &	4	5	4 J    	6	6 	7	8	7 o    ���� 0 	fromindex 	fromIndex	8 	9��	9 o    ���� 0 toindex toIndex��  	5 J      	:	: 	;	<	; o      ���� 0 	leftindex 	leftIndex	< 	=��	= o      ���� 0 
rightindex 
rightIndex��  	3 	>	?	> l  ' 8	@	A	B	@ r   ' 8	C	D	C n   ' 6	E	F	E 3   4 6��
�� 
cobj	F n   ' 4	G	H	G 7  * 4��	I	J
�� 
cobj	I o   . 0���� 0 	fromindex 	fromIndex	J o   1 3���� 0 toindex toIndex	H n  ' *	K	L	K o   ( *���� 
0 _keys_  	L o   ' (���� $0 resultlistobject resultListObject	D o      ���� 0 
pivotvalue 
pivotValue	A � � TO DO: if resultListObject's _list_'s length>someLargeThreshold then use median of 3 items? (TBH, picking a good midrange pivot is probably least of its problems performancewise)   	B �	M	Mf   T O   D O :   i f   r e s u l t L i s t O b j e c t ' s   _ l i s t _ ' s   l e n g t h > s o m e L a r g e T h r e s h o l d   t h e n   u s e   m e d i a n   o f   3   i t e m s ?   ( T B H ,   p i c k i n g   a   g o o d   m i d r a n g e   p i v o t   i s   p r o b a b l y   l e a s t   o f   i t s   p r o b l e m s   p e r f o r m a n c e w i s e )	? 	N	O	N V   9;	P	Q	P k   A6	R	R 	S	T	S Q   A �	U	V	W	U V   D d	X	Y	X l  Z _	Z	[	\	Z r   Z _	]	^	] [   Z ]	_	`	_ o   Z [���� 0 	leftindex 	leftIndex	` m   [ \���� 	^ o      ���� 0 	leftindex 	leftIndex	[ � z while cmp returns -1; note that if compareKeys() returns a non-numeric value/no result, this will throw -1700/-2763 error   	\ �	a	a �   w h i l e   c m p   r e t u r n s   - 1 ;   n o t e   t h a t   i f   c o m p a r e K e y s ( )   r e t u r n s   a   n o n - n u m e r i c   v a l u e / n o   r e s u l t ,   t h i s   w i l l   t h r o w   - 1 7 0 0 / - 2 7 6 3   e r r o r	Y A   H Y	b	c	b c   H W	d	e	d n  H U	f	g	f I   I U��	h���� 0 comparekeys compareKeys	h 	i	j	i e   I P	k	k n   I P	l	m	l 4   L O��	n
�� 
cobj	n o   M N���� 0 	leftindex 	leftIndex	m n  I L	o	p	o o   J L���� 
0 _keys_  	p o   I J���� $0 resultlistobject resultListObject	j 	q��	q o   P Q���� 0 
pivotvalue 
pivotValue��  ��  	g o   H I����  0 sortcomparator sortComparator	e m   U V��
�� 
nmbr	c m   W X����  	V R      ��	r	s
�� .ascrerr ****      � ****	r o      ���� 0 etext eText	s ��	t	u
�� 
errn	t o      ���� 0 enum eNum	u ��	v	w
�� 
erob	v o      ���� 0 efrom eFrom	w ��	x��
�� 
errt	x o      ���� 
0 eto eTo��  	W R   l ���	y	z
�� .ascrerr ****      � ****	y b   | 	{	|	{ m   | }	}	} �	~	~ < C o u l d n ' t   c o m p a r e   o b j e c t   k e y s :  	| o   } ~���� 0 etext eText	z ��		�
�� 
errn	 o   n o���� 0 enum eNum	� ��	�	�
�� 
erob	� J   p y	�	� 	�	�	� n   p v	�	�	� 4   s v��	�
�� 
cobj	� o   t u���� 0 	leftindex 	leftIndex	� n  p s	�	�	� o   q s���� 
0 _keys_  	� o   p q���� $0 resultlistobject resultListObject	� 	���	� o   v w���� 0 
pivotvalue 
pivotValue��  	� ��	���
�� 
errt	� o   z {���� 
0 eto eTo��  	T 	�	�	� Q   � �	�	�	�	� V   � �	�	�	� l  � �	�	�	�	� r   � �	�	�	� \   � �	�	�	� o   � ����� 0 
rightindex 
rightIndex	� m   � ����� 	� o      ���� 0 
rightindex 
rightIndex	�   while cmp returns 1;    	� �	�	� ,   w h i l e   c m p   r e t u r n s   1 ;  	� ?   � �	�	�	� c   � �	�	�	� n  � �	�	�	� I   � ���	����� 0 comparekeys compareKeys	� 	�	�	� n   � �	�	�	� 4   � ���	�
�� 
cobj	� o   � ����� 0 
rightindex 
rightIndex	� n  � �	�	�	� o   � ����� 
0 _keys_  	� o   � ����� $0 resultlistobject resultListObject	� 	���	� o   � ����� 0 
pivotvalue 
pivotValue��  ��  	� o   � �����  0 sortcomparator sortComparator	� m   � ���
�� 
nmbr	� m   � �����  	� R      ��	�	�
�� .ascrerr ****      � ****	� o      ���� 0 etext eText	� ��	�	�
�� 
errn	� o      ���� 0 enum eNum	� ��	�	�
�� 
erob	� o      ���� 0 efrom eFrom	� ��	���
�� 
errt	� o      ���� 
0 eto eTo��  	� R   � ���	�	�
�� .ascrerr ****      � ****	� b   � �	�	�	� m   � �	�	� �	�	� < C o u l d n ' t   c o m p a r e   o b j e c t   k e y s :  	� o   � ����� 0 etext eText	� ��	�	�
�� 
errn	� o   � ����� 0 enum eNum	� ��	�	�
�� 
erob	� J   � �	�	� 	�	�	� n   � �	�	�	� 4   � ���	�
�� 
cobj	� o   � ����� 0 
rightindex 
rightIndex	� n  � �	�	�	� o   � ��� 
0 _keys_  	� o   � ��~�~ $0 resultlistobject resultListObject	� 	��}	� o   � ��|�| 0 
pivotvalue 
pivotValue�}  	� �{	��z
�{ 
errt	� o   � ��y�y 
0 eto eTo�z  	� 	��x	� Z   �6	�	��w�v	� l  � �	��u�t	� H   � �	�	� ?   � �	�	�	� o   � ��s�s 0 	leftindex 	leftIndex	� o   � ��r�r 0 
rightindex 
rightIndex�u  �t  	� k   �2	�	� 	�	�	� r   � �	�	�	� J   � �	�	� 	�	�	� e   � �	�	� n   � �	�	�	� 4   � ��q	�
�q 
cobj	� o   � ��p�p 0 
rightindex 
rightIndex	� n  � �	�	�	� o   � ��o�o 
0 _keys_  	� o   � ��n�n $0 resultlistobject resultListObject	� 	��m	� e   � �	�	� n   � �	�	�	� 4   � ��l	�
�l 
cobj	� o   � ��k�k 0 	leftindex 	leftIndex	� n  � �	�	�	� o   � ��j�j 
0 _keys_  	� o   � ��i�i $0 resultlistobject resultListObject�m  	� J      	�	� 	�	�	� n      	�	�	� 4   � ��h	�
�h 
cobj	� o   � ��g�g 0 	leftindex 	leftIndex	� n  � �	�	�	� o   � ��f�f 
0 _keys_  	� o   � ��e�e $0 resultlistobject resultListObject	� 	��d	� n      	�	�	� 4   � ��c	�
�c 
cobj	� o   � ��b�b 0 
rightindex 
rightIndex	� n  � �	�	�	� o   � ��a�a 
0 _keys_  	� o   � ��`�` $0 resultlistobject resultListObject�d  	� 	�	�	� r   �	�	�	� J   �	�	� 	�	�	� e   � �	�	� n   � �	�	�	� 4   � ��_	�
�_ 
cobj	� o   � ��^�^ 0 
rightindex 
rightIndex	� n  � �	�	�	� o   � ��]�] 
0 _list_  	� o   � ��\�\ $0 resultlistobject resultListObject	� 	��[	� e   � �	�	� n   � �	�
 	� 4   � ��Z

�Z 
cobj
 o   � ��Y�Y 0 	leftindex 	leftIndex
  n  � �


 o   � ��X�X 
0 _list_  
 o   � ��W�W $0 resultlistobject resultListObject�[  	� J      

 


 n      


 4  	�V
	
�V 
cobj
	 o  
�U�U 0 	leftindex 	leftIndex
 n 	




 o  	�T�T 
0 _list_  
 o  �S�S $0 resultlistobject resultListObject
 
�R
 n      


 4  �Q

�Q 
cobj
 o  �P�P 0 
rightindex 
rightIndex
 n 


 o  �O�O 
0 _list_  
 o  �N�N $0 resultlistobject resultListObject�R  	� 
�M
 r  2


 J  #

 


 [  


 o  �L�L 0 	leftindex 	leftIndex
 m  �K�K 
 
�J
 \  !


 o  �I�I 0 
rightindex 
rightIndex
 m   �H�H �J  
 J      

 


 o      �G�G 0 	leftindex 	leftIndex
 
 �F
  o      �E�E 0 
rightindex 
rightIndex�F  �M  �w  �v  �x  	Q B   = @
!
"
! o   = >�D�D 0 	leftindex 	leftIndex
" o   > ?�C�C 0 
rightindex 
rightIndex	O 
#�B
# Q  <p
$
%
&
$ k  ?g
'
' 
(
)
( I  ?Q�A
*�@�A 	0 _sort  
* 
+
,
+ o  @A�?�? $0 resultlistobject resultListObject
, 
-
.
- o  AB�>�> 0 	fromindex 	fromIndex
. 
/
0
/ o  BC�=�= 0 
rightindex 
rightIndex
0 
1
2
1 o  CD�<�<  0 sortcomparator sortComparator
2 
3�;
3 ?  DM
4
5
4 \  DG
6
7
6 o  DE�:�: 0 
rightindex 
rightIndex
7 o  EF�9�9 0 	fromindex 	fromIndex
5 o  GL�8�8 *0 _quicksortthreshold _quicksortThreshold�;  �@  
) 
8
9
8 I  Rd�7
:�6�7 	0 _sort  
: 
;
<
; o  ST�5�5 $0 resultlistobject resultListObject
< 
=
>
= o  TU�4�4 0 	leftindex 	leftIndex
> 
?
@
? o  UV�3�3 0 toindex toIndex
@ 
A
B
A o  VW�2�2  0 sortcomparator sortComparator
B 
C�1
C ?  W`
D
E
D \  WZ
F
G
F o  WX�0�0 0 toindex toIndex
G o  XY�/�/ 0 	leftindex 	leftIndex
E o  Z_�.�. *0 _quicksortthreshold _quicksortThreshold�1  �6  
9 
H�-
H L  eg�,�,  �-  
% R      �+�*
I
�+ .ascrerr ****      � ****�*  
I �)
J�(
�) 
errn
J d      
K
K m      �'�'
��(  
& l oo�&
L
M�&  
L r l stack overflow, so fall-through to use non-recursive insertion sort (this should rarely happen in practice)   
M �
N
N �   s t a c k   o v e r f l o w ,   s o   f a l l - t h r o u g h   t o   u s e   n o n - r e c u r s i v e   i n s e r t i o n   s o r t   ( t h i s   s h o u l d   r a r e l y   h a p p e n   i n   p r a c t i c e )�B  	' � � sort mostly uses quicksort, but falls through to insertionsort when sorting small number of items (<8), or when sorting a mostly-sorted list, or when quicksort recursion exceeds AS's stack depth   	( �
O
O�   s o r t   m o s t l y   u s e s   q u i c k s o r t ,   b u t   f a l l s   t h r o u g h   t o   i n s e r t i o n s o r t   w h e n   s o r t i n g   s m a l l   n u m b e r   o f   i t e m s   ( < 8 ) ,   o r   w h e n   s o r t i n g   a   m o s t l y - s o r t e d   l i s t ,   o r   w h e n   q u i c k s o r t   r e c u r s i o n   e x c e e d s   A S ' s   s t a c k   d e p t h��  ��  	# 
P
Q
P l uu�%
R
S�%  
R � � fall-through to use loop-based insertion sort when sorting a small number of items (for which it is faster than quicksort), or when quicksort recursion overflows AppleScript's call stack   
S �
T
Tv   f a l l - t h r o u g h   t o   u s e   l o o p - b a s e d   i n s e r t i o n   s o r t   w h e n   s o r t i n g   a   s m a l l   n u m b e r   o f   i t e m s   ( f o r   w h i c h   i t   i s   f a s t e r   t h a n   q u i c k s o r t ) ,   o r   w h e n   q u i c k s o r t   r e c u r s i o n   o v e r f l o w s   A p p l e S c r i p t ' s   c a l l   s t a c k
Q 
U
V
U r  uz
W
X
W [  ux
Y
Z
Y o  uv�$�$ 0 	fromindex 	fromIndex
Z m  vw�#�# 
X o      �"�" 0 	fromindex 	fromIndex
V 
[�!
[ Y  {
\� 
]
^�
\ Y  �
_�
`
a
b
_ k  �
c
c 
d
e
d r  ��
f
g
f J  ��
h
h 
i
j
i e  ��
k
k n  ��
l
m
l 4  ���
n
� 
cobj
n l ��
o��
o \  ��
p
q
p o  ���� 0 j  
q m  ���� �  �  
m n ��
r
s
r o  ���� 
0 _keys_  
s o  ���� $0 resultlistobject resultListObject
j 
t�
t e  ��
u
u n  ��
v
w
v 4  ���
x
� 
cobj
x o  ���� 0 j  
w n ��
y
z
y o  ���� 
0 _keys_  
z o  ���� $0 resultlistobject resultListObject�  
g J      
{
{ 
|
}
| o      �� 0 leftkey leftKey
} 
~�
~ o      �� 0 rightkey rightKey�  
e 

�
 l ��
�
�
�
� Z ��
�
���
� A  ��
�
�
� n ��
�
�
� I  ���
��� 0 comparekeys compareKeys
� 
�
�
� o  ���
�
 0 leftkey leftKey
� 
��	
� o  ���� 0 rightkey rightKey�	  �  
� o  ����  0 sortcomparator sortComparator
� m  ���� 
�  S  ���  �  
� !  stop when leftKey�rightKey   
� �
�
� 6   s t o p   w h e n   l e f t K e y"d r i g h t K e y
� 
�
�
� r  ��
�
�
� J  ��
�
� 
�
�
� o  ���� 0 rightkey rightKey
� 
��
� o  ���� 0 leftkey leftKey�  
� J      
�
� 
�
�
� n      
�
�
� 4  ���
�
� 
cobj
� l ��
��� 
� \  ��
�
�
� o  ������ 0 j  
� m  ������ �  �   
� n ��
�
�
� o  ������ 
0 _keys_  
� o  ������ $0 resultlistobject resultListObject
� 
���
� n      
�
�
� 4  ����
�
�� 
cobj
� o  ������ 0 j  
� n ��
�
�
� o  ������ 
0 _keys_  
� o  ������ $0 resultlistobject resultListObject��  
� 
���
� r  �
�
�
� J  ��
�
� 
�
�
� e  ��
�
� n  ��
�
�
� 4  ����
�
�� 
cobj
� o  ������ 0 j  
� n ��
�
�
� o  ������ 
0 _list_  
� o  ������ $0 resultlistobject resultListObject
� 
���
� e  ��
�
� n  ��
�
�
� 4  ����
�
�� 
cobj
� l ��
�����
� \  ��
�
�
� o  ������ 0 j  
� m  ������ ��  ��  
� n ��
�
�
� o  ������ 
0 _list_  
� o  ������ $0 resultlistobject resultListObject��  
� J      
�
� 
�
�
� n      
�
�
� 4  ���
�
�� 
cobj
� l �
�����
� \  �
�
�
� o  ������ 0 j  
� m  � ���� ��  ��  
� n ��
�
�
� o  ������ 
0 _list_  
� o  ������ $0 resultlistobject resultListObject
� 
���
� n      
�
�
� 4  ��
�
�� 
cobj
� o  ���� 0 j  
� n 
�
�
� o  	���� 
0 _list_  
� o  	���� $0 resultlistobject resultListObject��  ��  � 0 j  
` o  ������ 0 i  
a o  ������ 0 	fromindex 	fromIndex
b m  ���������  0 i  
] o  ~���� 0 	fromindex 	fromIndex
^ o  ����� 0 toindex toIndex�  �!  	 1 + performs in-place quicksort/insertionsort	   	  �
�
� V   p e r f o r m s   i n - p l a c e   q u i c k s o r t / i n s e r t i o n s o r t 		 
�
�
� l     ��������  ��  ��  
� 
�
�
� l     ��������  ��  ��  
� 
�
�
� l     ��������  ��  ��  
� 
�
�
� i  N Q
�
�
� I     ��
�
�
�� .Lst:Sortnull���     ****
� o      ���� 0 thelist theList
� ��
���
�� 
Comp
� |����
���
���  ��  
� o      ����  0 sortcomparator sortComparator��  
� l     
�����
� m      ��
�� 
msng��  ��  ��  
� k    �
�
� 
�
�
� l     ��
�
���  
�.( note that `sort list` currently doesn't implement a `reversed order` parameter as its quicksort algorithm isn't stable (i.e. items that compare as equal will appear in any order, not the order in which they were supplied), so such an option would be useless in practice and rather misleading too. (To get a list in descending order, just get the returned list's `reverse` property or else pass a comparator containing a suitable compareKeys handler.) This parameter can always be added in future if/when a stable sorting algorithm is ever implemented.   
� �
�
�P   n o t e   t h a t   ` s o r t   l i s t `   c u r r e n t l y   d o e s n ' t   i m p l e m e n t   a   ` r e v e r s e d   o r d e r `   p a r a m e t e r   a s   i t s   q u i c k s o r t   a l g o r i t h m   i s n ' t   s t a b l e   ( i . e .   i t e m s   t h a t   c o m p a r e   a s   e q u a l   w i l l   a p p e a r   i n   a n y   o r d e r ,   n o t   t h e   o r d e r   i n   w h i c h   t h e y   w e r e   s u p p l i e d ) ,   s o   s u c h   a n   o p t i o n   w o u l d   b e   u s e l e s s   i n   p r a c t i c e   a n d   r a t h e r   m i s l e a d i n g   t o o .   ( T o   g e t   a   l i s t   i n   d e s c e n d i n g   o r d e r ,   j u s t   g e t   t h e   r e t u r n e d   l i s t ' s   ` r e v e r s e `   p r o p e r t y   o r   e l s e   p a s s   a   c o m p a r a t o r   c o n t a i n i n g   a   s u i t a b l e   c o m p a r e K e y s   h a n d l e r . )   T h i s   p a r a m e t e r   c a n   a l w a y s   b e   a d d e d   i n   f u t u r e   i f / w h e n   a   s t a b l e   s o r t i n g   a l g o r i t h m   i s   e v e r   i m p l e m e n t e d .
� 
���
� Q    �
�
�
�
� k   o
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
����� "0 aslistparameter asListParameter
� 
�
�
� o    	���� 0 thelist theList
� 
���
� m   	 

�
� �
�
�  ��  ��  
� o    ���� 0 _support  
� o      ���� 0 thelist theList
� 
�
�
� h    ��
��� $0 resultlistobject resultListObject
� k      
�
� 
�
�
� l     
�
�
�
� j     	�� �� 
0 _keys_    n      2   ��
�� 
cobj o     ���� 0 thelist theList
� ~ x (replacing items in an existing list of the correct length is a little faster than appending items to a new empty list)   
� � �   ( r e p l a c i n g   i t e m s   i n   a n   e x i s t i n g   l i s t   o f   t h e   c o r r e c t   l e n g t h   i s   a   l i t t l e   f a s t e r   t h a n   a p p e n d i n g   i t e m s   t o   a   n e w   e m p t y   l i s t )
� �� j   
 ���� 
0 _list_   n   
  2   ��
�� 
cobj o   
 ���� 0 thelist theList��  
� 	 Z   ,
����
 A      n    1    ��
�� 
leng n    o    ���� 
0 _list_   o    ���� $0 resultlistobject resultListObject m    ����  L   # ( n  # ' o   $ &���� 
0 _list_   o   # $���� $0 resultlistobject resultListObject��  ��  	  Z   - J�� =  - 0 o   - .����  0 sortcomparator sortComparator m   . /��
�� 
msng r   3 : I  3 8������
�� .Lst:DeSonull��� ��� null��  ��   o      ����  0 sortcomparator sortComparator��   r   = J n  = H !  I   B H��"���� &0 asscriptparameter asScriptParameter" #$# o   B C����  0 sortcomparator sortComparator$ %��% m   C D&& �'' 
 u s i n g��  ��  ! o   = B���� 0 _support   o      ����  0 sortcomparator sortComparator ()( l  K K��*+��  * M G call comparator's makeKey method to generate each sortable key in turn   + �,, �   c a l l   c o m p a r a t o r ' s   m a k e K e y   m e t h o d   t o   g e n e r a t e   e a c h   s o r t a b l e   k e y   i n   t u r n) -.- l  K ^/01/ r   K ^232 J   K O44 565 m   K L����  6 7��7 m   L M����  ��  3 J      88 9:9 o      ����  0 ascendingcount ascendingCount: ;��; o      ���� "0 descendingcount descendingCount��  0 � � while generating keys also check if list is already almost/fully sorted (either ascending or descending) and if it is use insertionsort/return as-is   1 �<<*   w h i l e   g e n e r a t i n g   k e y s   a l s o   c h e c k   i f   l i s t   i s   a l r e a d y   a l m o s t / f u l l y   s o r t e d   ( e i t h e r   a s c e n d i n g   o r   d e s c e n d i n g )   a n d   i f   i t   i s   u s e   i n s e r t i o n s o r t / r e t u r n   a s - i s. =>= Q   _@?@A? k   b&BB CDC Q   b �EFGE r   e sHIH n  e qJKJ I   f q��L���� 0 makekey makeKeyL M��M e   f mNN n   f mOPO 4   i l��Q
�� 
cobjQ m   j k���� P n  f iRSR o   g i���� 
0 _keys_  S o   f g���� $0 resultlistobject resultListObject��  ��  K o   e f����  0 sortcomparator sortComparatorI o      ���� 0 previouskey previousKeyF R      ��TU
�� .ascrerr ****      � ****T o      ���� 0 etext eTextU ��VW
�� 
errnV o      ���� 0 enum eNumW ��X��
�� 
errtX o      ���� 
0 eto eTo��  G R   { ���YZ
�� .ascrerr ****      � ****Y b   � �[\[ m   � �]] �^^ : C o u l d n ' t   m a k e K e y   f o r   i t e m   1 :  \ o   � ����� 0 etext eTextZ ��_`
�� 
errn_ o    ����� 0 enum eNum` ��ab
�� 
eroba l  � �c����c N   � �dd n   � �efe 4   � ���g
�� 
cobjg m   � ����� f l  � �h��~h e   � �ii n  � �jkj o   � ��}�} 
0 _list_  k o   � ��|�| $0 resultlistobject resultListObject�  �~  ��  ��  b �{l�z
�{ 
errtl o   � ��y�y 
0 eto eTo�z  D mnm r   � �opo o   � ��x�x 0 previouskey previousKeyp n      qrq 4   � ��ws
�w 
cobjs m   � ��v�v r n  � �tut o   � ��u�u 
0 _keys_  u o   � ��t�t $0 resultlistobject resultListObjectn v�sv Y   �&w�rxy�qw k   �!zz {|{ Q   � �}~} r   � ���� n  � ���� I   � ��p��o�p 0 makekey makeKey� ��n� n   � ���� 4   � ��m�
�m 
cobj� o   � ��l�l 0 i  � n  � ���� o   � ��k�k 
0 _keys_  � o   � ��j�j $0 resultlistobject resultListObject�n  �o  � o   � ��i�i  0 sortcomparator sortComparator� o      �h�h 0 
currentkey 
currentKey~ R      �g��
�g .ascrerr ****      � ****� o      �f�f 0 etext eText� �e��
�e 
errn� o      �d�d 0 enum eNum� �c��b
�c 
errt� o      �a�a 
0 eto eTo�b   R   � ��`��
�` .ascrerr ****      � ****� b   � ���� b   � ���� b   � ���� m   � ��� ��� 4 C o u l d n ' t   m a k e K e y   f o r   i t e m  � o   � ��_�_ 0 i  � m   � ��� ���  :  � o   � ��^�^ 0 etext eText� �]��
�] 
errn� o   � ��\�\ 0 enum eNum� �[��
�[ 
erob� l  � ���Z�Y� N   � ��� n   � ���� 4   � ��X�
�X 
cobj� o   � ��W�W 0 i  � l  � ���V�U� e   � ��� n  � ���� o   � ��T�T 
0 _list_  � o   � ��S�S $0 resultlistobject resultListObject�V  �U  �Z  �Y  � �R��Q
�R 
errt� o   � ��P�P 
0 eto eTo�Q  | ��� r   � ���� o   � ��O�O 0 
currentkey 
currentKey� n      ��� 4   � ��N�
�N 
cobj� o   � ��M�M 0 i  � n  � ���� o   � ��L�L 
0 _keys_  � o   � ��K�K $0 resultlistobject resultListObject� ��� r   � ���� n  � ���� I   � ��J��I�J 0 comparekeys compareKeys� ��� o   � ��H�H 0 previouskey previousKey� ��G� o   � ��F�F 0 
currentkey 
currentKey�G  �I  � o   � ��E�E  0 sortcomparator sortComparator� o      �D�D 0 keycomparison keyComparison� ��� Z   ����C� A   ��� o   �B�B 0 keycomparison keyComparison� m  �A�A  � l ���� r  ��� [  	��� o  �@�@  0 ascendingcount ascendingCount� m  �?�? � o      �>�>  0 ascendingcount ascendingCount�   current key is larger   � ��� ,   c u r r e n t   k e y   i s   l a r g e r� ��� ?  ��� o  �=�= 0 keycomparison keyComparison� m  �<�<  � ��;� l ���� r  ��� [  ��� o  �:�: "0 descendingcount descendingCount� m  �9�9 � o      �8�8 "0 descendingcount descendingCount�   previous key is larger   � ��� .   p r e v i o u s   k e y   i s   l a r g e r�;  �C  � ��7� r  !��� o  �6�6 0 
currentkey 
currentKey� o      �5�5 0 previouskey previousKey�7  �r 0 i  x m   � ��4�4 y n  � ���� 1   � ��3
�3 
leng� n  � ���� o   � ��2�2 
0 _keys_  � o   � ��1�1 $0 resultlistobject resultListObject�q  �s  @ R      �0��
�0 .ascrerr ****      � ****� o      �/�/ 0 etext eText� �.��
�. 
errn� o      �-�- 0 enum eNum� �,��
�, 
erob� o      �+�+ 0 efrom eFrom� �*��)
�* 
errt� o      �(�( 
0 eto eTo�)  A R  .@�'��
�' .ascrerr ****      � ****� o  >?�&�& 0 etext eText� �%��
�% 
errn� o  23�$�$ 0 enum eNum� �#��
�# 
erob� o  67�"�" 0 efrom eFrom� �!�� 
�! 
errt� o  :;�� 
0 eto eTo�   > ��� l AA����  � � �	log "   ORDEREDNESS=" & (ascendingCount * 100 div ((resultListObject's _list_'s length) - 1)) & " " & (descendingCount * 100 div ((resultListObject's _list_'s length) - 1))   � ���Z 	 l o g   "       O R D E R E D N E S S = "   &   ( a s c e n d i n g C o u n t   *   1 0 0   d i v   ( ( r e s u l t L i s t O b j e c t ' s   _ l i s t _ ' s   l e n g t h )   -   1 ) )   &   "   "   &   ( d e s c e n d i n g C o u n t   *   1 0 0   d i v   ( ( r e s u l t L i s t O b j e c t ' s   _ l i s t _ ' s   l e n g t h )   -   1 ) )� ��� l AA����  � B <		log "  ASC=" & ascendingCount & " DESC=" & descendingCount   � ��� x 	 	 l o g   "     A S C = "   &   a s c e n d i n g C o u n t   &   "   D E S C = "   &   d e s c e n d i n g C o u n t� ��� Z  Ai����� ?  AD��� o  AB�� "0 descendingcount descendingCount� m  BC��  � l Ge�� � k  Ge  l GT r  GT l GR	��	 ?  GR

 n GL 1  JL�
� 
leng n GJ o  HJ�� 
0 _list_   o  GH�� $0 resultlistobject resultListObject o  LQ�� *0 _quicksortthreshold _quicksortThreshold�  �   o      �� 0 usequicksort useQuickSort B < TO DO: or if list is nearly ordered then use insertion sort    � x   T O   D O :   o r   i f   l i s t   i s   n e a r l y   o r d e r e d   t h e n   u s e   i n s e r t i o n   s o r t � I  Ue��� 	0 _sort    o  VW�� $0 resultlistobject resultListObject  m  WX��   n X] 1  []�
� 
leng n X[ o  Y[�� 
0 _list_   o  XY�
�
 $0 resultlistobject resultListObject  o  ]^�	�	  0 sortcomparator sortComparator � o  ^_�� 0 usequicksort useQuickSort�  �  �  �   some sorting required     �   ,   s o m e   s o r t i n g   r e q u i r e d�  �  � !�! L  jo"" n jn#$# o  km�� 
0 _list_  $ o  jk�� $0 resultlistobject resultListObject�  
� R      �%&
� .ascrerr ****      � ****% o      �� 0 etext eText& �'(
� 
errn' o      � �  0 enumber eNumber( ��)*
�� 
erob) o      ���� 0 efrom eFrom* ��+��
�� 
errt+ o      ���� 
0 eto eTo��  
� I  w���,���� 
0 _error  , -.- m  x{// �00  s o r t   l i s t. 121 o  {|���� 0 etext eText2 343 o  |}���� 0 enumber eNumber4 565 o  }~���� 0 efrom eFrom6 7��7 o  ~���� 
0 eto eTo��  ��  ��  
� 898 l     ��������  ��  ��  9 :;: l     ��������  ��  ��  ; <=< i  R U>?> I     ������
�� .Lst:DeSonull��� ��� null��  ��  ? h     ��@�� &0 defaultcomparator DefaultComparator@ k      AA BCB j     ��D�� "0 _supportedtypes _supportedTypesD J     EE FGF m     ��
�� 
nmbrG HIH m    ��
�� 
ctxtI J��J m    ��
�� 
ldt ��  C KLK j    	��M�� 	0 _type  M m    ��
�� 
msngL NON i   
 PQP I      ��R���� 0 makekey makeKeyR S��S o      ���� 0 anobject anObject��  ��  Q k     }TT UVU Z     zWXY��W =    Z[Z o     ���� 	0 _type  [ m    ��
�� 
msngX k   
 K\\ ]^] X   
 B_��`_ Z    =ab����a ?    *cdc l   (e����e I   (��fg
�� .corecnte****       ****f J    hh i��i o    ���� 0 anobject anObject��  g ��j��
�� 
koclj l    $k����k e     $ll n    $mnm 1   ! #��
�� 
pcntn o     !���� 0 aref aRef��  ��  ��  ��  ��  d m   ( )����  b k   - 9oo pqp r   - 6rsr n  - 0tut 1   . 0��
�� 
pcntu o   - .���� 0 aref aRefs o      ���� 	0 _type  q v��v L   7 9ww o   7 8���� 0 anobject anObject��  ��  ��  �� 0 aref aRef` n   xyx o    ���� "0 _supportedtypes _supportedTypesy  f    ^ z��z R   C K��{|
�� .ascrerr ****      � ****{ m   I J}} �~~ � I n v a l i d   i t e m   t y p e   ( d e f a u l t   c o m p a r a t o r   c a n   o n l y   c o m p a r e   i n t e g e r / r e a l ,   t e x t ,   o r   d a t e   t y p e s ) .| ���
�� 
errn m   E F�����\� �����
�� 
erob� o   G H���� 0 anobject anObject��  ��  Y ��� =   N ]��� l  N [������ I  N [����
�� .corecnte****       ****� J   N Q�� ���� o   N O���� 0 anobject anObject��  � �����
�� 
kocl� o   R W���� 	0 _type  ��  ��  ��  � m   [ \����  � ���� R   ` v����
�� .ascrerr ****      � ****� b   f u��� b   f s��� b   f o��� b   f m��� m   f g�� ��� ^ I n v a l i d   i t e m   t y p e   ( d e f a u l t   c o m p a r a t o r   e x p e c t e d  � o   g l���� 	0 _type  � m   m n�� ���    b u t   r e c e i v e d  � l  o r������ n   o r��� m   p r��
�� 
pcls� o   o p���� 0 anobject anObject��  ��  � m   s t�� ���  ) .� ����
�� 
errn� m   b c�����\� �����
�� 
erob� o   d e���� 0 anobject anObject��  ��  ��  V ���� L   { }�� o   { |���� 0 anobject anObject��  O ���� i   ��� I      ������� 0 comparekeys compareKeys� ��� o      ���� 0 
leftobject 
leftObject� ���� o      ���� 0 rightobject rightObject��  ��  � Z     ����� A     ��� o     ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject� L    �� m    ������� ��� ?    ��� o    ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject� ���� L    �� m    ���� ��  � L    �� m    ����  ��  = ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  V Y��� I     ������
�� .Lst:NuSonull��� ��� null��  ��  � h     ����� &0 numericcomparator NumericComparator� k      �� ��� i    ��� I      ������� 0 makekey makeKey� ���� o      ���� 0 anobject anObject��  ��  � L     �� c     ��� o     ���� 0 anobject anObject� m    ��
�� 
nmbr� ���� i   ��� I      ������� 0 comparekeys compareKeys� ��� o      ���� 0 
leftobject 
leftObject� ���� o      ���� 0 rightobject rightObject��  ��  � l    ���� L     �� \     ��� o     ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject��� note: since compareKeys' return value can be any -ve/0/+ve number, a single subtraction operation is sufficient for numbers and dates. (Caveat: this doesn't take into account minor differences due to real imprecision. Currently this doesn't matter as quicksort isn't stable anyway so makes no guarantees about the order of [imprecisely] equal items; however, if quicksort ever gets replaced with a stable sorting algorithm then this method will need revised to use Number library's `cmp` instead.)   � ����   n o t e :   s i n c e   c o m p a r e K e y s '   r e t u r n   v a l u e   c a n   b e   a n y   - v e / 0 / + v e   n u m b e r ,   a   s i n g l e   s u b t r a c t i o n   o p e r a t i o n   i s   s u f f i c i e n t   f o r   n u m b e r s   a n d   d a t e s .   ( C a v e a t :   t h i s   d o e s n ' t   t a k e   i n t o   a c c o u n t   m i n o r   d i f f e r e n c e s   d u e   t o   r e a l   i m p r e c i s i o n .   C u r r e n t l y   t h i s   d o e s n ' t   m a t t e r   a s   q u i c k s o r t   i s n ' t   s t a b l e   a n y w a y   s o   m a k e s   n o   g u a r a n t e e s   a b o u t   t h e   o r d e r   o f   [ i m p r e c i s e l y ]   e q u a l   i t e m s ;   h o w e v e r ,   i f   q u i c k s o r t   e v e r   g e t s   r e p l a c e d   w i t h   a   s t a b l e   s o r t i n g   a l g o r i t h m   t h e n   t h i s   m e t h o d   w i l l   n e e d   r e v i s e d   t o   u s e   N u m b e r   l i b r a r y ' s   ` c m p `   i n s t e a d . )��  � ��� l     ��������  ��  ��  � ��� l     ��~�}�  �~  �}  � ��� i  Z ]��� I     �|�{�z
�| .Lst:DaSonull��� ��� null�{  �z  � h     �y��y  0 datecomparator DateComparator� k      �� ��� i    ��� I      �x��w�x 0 makekey makeKey� ��v� o      �u�u 0 anobject anObject�v  �w  � L     �� c     ��� o     �t�t 0 anobject anObject� m    �s
�s 
ldt � ��r� i   ��� I      �q��p�q 0 comparekeys compareKeys� ��� o      �o�o 0 
leftobject 
leftObject� ��n� o      �m�m 0 rightobject rightObject�n  �p  � l    ���� L     �� \     ��� o     �l�l 0 
leftobject 
leftObject� o    �k�k 0 rightobject rightObject� Y S as in NumericComparator, a simple subtraction operation produces a suitable result   � ��� �   a s   i n   N u m e r i c C o m p a r a t o r ,   a   s i m p l e   s u b t r a c t i o n   o p e r a t i o n   p r o d u c e s   a   s u i t a b l e   r e s u l t�r  � ��� l     �j�i�h�j  �i  �h  � ��� l     �g�f�e�g  �f  �e  �    i  ^ a I     �d�c
�d .Lst:TeSonull��� ��� null�c   �b�a
�b 
Cons |�`�_�^�`  �_   o      �]�]  0 orderingoption orderingOption�^   l     �\�[ m      �Z
�Z SrtECmpI�\  �[  �a   l    b	
	 Q     b k    L  h    
�Y�Y B0 currentconsiderationscomparator CurrentConsiderationsComparator k        i     I      �X�W�X 0 makekey makeKey �V o      �U�U 0 anobject anObject�V  �W   l     L      c      o     �T�T 0 anobject anObject m    �S
�S 
ctxt _ Y TO DO: what if item is a list [of text]? currently it coerces to text using current TIDs    �   �   T O   D O :   w h a t   i f   i t e m   i s   a   l i s t   [ o f   t e x t ] ?   c u r r e n t l y   i t   c o e r c e s   t o   t e x t   u s i n g   c u r r e n t   T I D s !�R! i   "#" I      �Q$�P�Q 0 comparekeys compareKeys$ %&% o      �O�O 0 
leftobject 
leftObject& '�N' o      �M�M 0 rightobject rightObject�N  �P  # Z     ()*+( A     ,-, o     �L�L 0 
leftobject 
leftObject- o    �K�K 0 rightobject rightObject) L    .. m    �J�J��* /0/ ?    121 o    �I�I 0 
leftobject 
leftObject2 o    �H�H 0 rightobject rightObject0 3�G3 L    44 m    �F�F �G  + L    55 m    �E�E  �R   6�D6 Z    L789:7 =   ;<; o    �C�C  0 orderingoption orderingOption< m    �B
�B SrtECmpI8 k    == >?> h    �A@�A >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator@ k      AA BCB j     �@D
�@ 
pareD o     �?�? B0 currentconsiderationscomparator CurrentConsiderationsComparatorC E�>E i  	 FGF I      �=H�<�= 0 comparekeys compareKeysH IJI o      �;�; 0 
leftobject 
leftObjectJ K�:K o      �9�9 0 rightobject rightObject�:  �<  G P     LMNL L    OO M    PP I      �8Q�7�8 0 comparekeys compareKeysQ RSR o    �6�6 0 
leftobject 
leftObjectS T�5T o    �4�4 0 rightobject rightObject�5  �7  M �3U
�3 conshyphU �2V
�2 conspuncV �1W
�1 conswhitW �0�/
�0 consnume�/  N �.X
�. conscaseX �-�,
�- consdiac�,  �>  ? Y�+Y L    ZZ o    �*�* >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator�+  9 [\[ =   !]^] o    �)�)  0 orderingoption orderingOption^ m     �(
�( SrtECmpC\ _`_ k   $ .aa bcb h   $ +�'d�' :0 casesensitivetextcomparator CaseSensitiveTextComparatord k      ee fgf j     �&h
�& 
pareh o     �%�% B0 currentconsiderationscomparator CurrentConsiderationsComparatorg i�$i i  	 jkj I      �#l�"�# 0 comparekeys compareKeysl mnm o      �!�! 0 
leftobject 
leftObjectn o� o o      �� 0 rightobject rightObject�   �"  k P     pqrp L    ss M    tt I      �u�� 0 comparekeys compareKeysu vwv o    �� 0 
leftobject 
leftObjectw x�x o    �� 0 rightobject rightObject�  �  q �y
� conscasey �z
� conshyphz �{
� conspunc{ �|
� conswhit| ��
� consnume�  r ��
� consdiac�  �$  c }�} L   , .~~ o   , -�� :0 casesensitivetextcomparator CaseSensitiveTextComparator�  ` � =  1 4��� o   1 2��  0 orderingoption orderingOption� m   2 3�
� SrtECmpD� ��� L   7 9�� o   7 8�� B0 currentconsiderationscomparator CurrentConsiderationsComparator�  : R   < L���
� .ascrerr ****      � ****� m   H K�� ��� d I n v a l i d    f o r    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .� �
��
�
 
errn� m   > ?�	�	�Y� ���
� 
erob� o   @ A��  0 orderingoption orderingOption� ���
� 
errt� m   B E�
� 
enum�  �D   R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      � �  0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��   I   T b������� 
0 _error  � ��� m   U X�� ���  t e x t   c o m p a r a t o r� ��� o   X Y���� 0 etext eText� ��� o   Y Z���� 0 enumber eNumber� ��� o   Z [���� 0 efrom eFrom� ���� o   [ \���� 
0 eto eTo��  ��  
 � � TO DO: also provide `exact match` option that considers case, diacriticals, hyphens, punctuation and white space but ignores numeric strings?    ���   T O   D O :   a l s o   p r o v i d e   ` e x a c t   m a t c h `   o p t i o n   t h a t   c o n s i d e r s   c a s e ,   d i a c r i t i c a l s ,   h y p h e n s ,   p u n c t u a t i o n   a n d   w h i t e   s p a c e   b u t   i g n o r e s   n u m e r i c   s t r i n g s ? ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  b e��� I     �����
�� .Lst:LiSonull��� ��� null��  � �����
�� 
Comp� |����������  ��  � o      ����  0 comparatorlist comparatorList��  � l     ������ m      ��
�� 
msng��  ��  ��  � Q     T���� Z    @������ =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ����  0 comparatorlist comparatorList��  � �����
�� 
kocl� m    ��
�� 
list��  ��  ��  � m    ����  � k    6�� ��� Z    .������ =   ��� o    ����  0 comparatorlist comparatorList� m    ��
�� 
msng� r    ��� I   ������
�� .Lst:DeSonull��� ��� null��  ��  � o      ���� $0 comparatorobject comparatorObject��  � r   ! .��� n  ! ,��� I   & ,������� &0 asscriptparameter asScriptParameter� ��� o   & '����  0 comparatorlist comparatorList� ���� m   ' (�� ���  f o r��  ��  � o   ! &���� 0 _support  � o      ���� $0 comparatorobject comparatorObject� ���� h   / 6����� .0 uniformlistcomparator UniformListComparator� l     ���� k      �� ��� l     ��������  ��  ��  � ��� i    ��� I      ������� 0 makekey makeKey� ���� o      ���� 0 sublist subList��  ��  � h     ����� 0 	keyobject 	KeyObject� k      �� ��� j     ����� 
0 _list_  � o     ���� 0 sublist subList� ��� l     ���� j    
����� 
0 _keys_  � J    	����  �   cached keys   � ���    c a c h e d   k e y s� ��� l     ��������  ��  ��  � ���� i   ��� I      ������� 0 getkey getKey� ���� o      ���� 0 	itemindex 	itemIndex��  ��  � k     0�� ��� V     '��� r    "��� n   ��� I    ������� 0 makekey makeKey� ���� n    ��� 4    ���
�� 
cobj� o    ���� 0 	itemindex 	itemIndex� n      o    ���� 
0 _list_    f    ��  ��  � o    ���� $0 comparatorobject comparatorObject� n        ;     ! o     ���� 
0 _keys_  � ?     o    ���� 0 	itemindex 	itemIndex n    
 1    
��
�� 
leng n   	 o    ���� 
0 _keys_  	  f    � 
��
 L   ( 0 n   ( / 4   + .��
�� 
cobj o   , -���� 0 	itemindex 	itemIndex n  ( + o   ) +���� 
0 _keys_    f   ( )��  ��  �  l     ��������  ��  ��    i    I      ������ 0 comparekeys compareKeys  o      ���� 0 leftkeyobject leftKeyObject �� o      ����  0 rightkeyobject rightKeyObject��  ��   k     z  r      J        !"! n    #$# 1    ��
�� 
leng$ n    %&% o    ���� 
0 _list_  & o     ���� 0 leftkeyobject leftKeyObject" '��' n   
()( 1    
��
�� 
leng) n   *+* o    ���� 
0 _list_  + o    ����  0 rightkeyobject rightKeyObject��   J      ,, -.- o      ���� 0 
leftlength 
leftLength. /��/ o      ���� 0 rightlength rightLength��   010 r    232 o    ���� 0 
leftlength 
leftLength3 o      ���� 0 commonlength commonLength1 454 Z    -67����6 A     #898 o     !���� 0 rightlength rightLength9 o   ! "���� 0 commonlength commonLength7 r   & ):;: o   & '���� 0 rightlength rightLength; o      ���� 0 commonlength commonLength��  ��  5 <=< Y   . a>��?@��> l  8 \ABCA k   8 \DD EFE r   8 OGHG n  8 MIJI I   = M��K���� 0 comparekeys compareKeysK LML n  = CNON I   > C��P���� 0 getkey getKeyP Q��Q o   > ?���� 0 i  ��  ��  O o   = >���� 0 leftkeyobject leftKeyObjectM R��R n  C ISTS I   D I��U���� 0 getkey getKeyU V��V o   D E�� 0 i  ��  ��  T o   C D�~�~  0 rightkeyobject rightKeyObject��  ��  J o   8 =�}�} $0 comparatorobject comparatorObjectH o      �|�| $0 comparisonresult comparisonResultF W�{W Z  P \XY�z�yX >   P SZ[Z o   P Q�x�x $0 comparisonresult comparisonResult[ m   Q R�w�w  Y L   V X\\ o   V W�v�v $0 comparisonresult comparisonResult�z  �y  �{  B E ? iterate over item indexes common to both lists, comparing keys   C �]] ~   i t e r a t e   o v e r   i t e m   i n d e x e s   c o m m o n   t o   b o t h   l i s t s ,   c o m p a r i n g   k e y s�� 0 i  ? m   1 2�u�u @ o   2 3�t�t 0 commonlength commonLength��  = ^�s^ Z   b z_`ab_ A   b ecdc o   b c�r�r 0 
leftlength 
leftLengthd o   c d�q�q 0 rightlength rightLength` l  h jefge L   h jhh m   h i�p�p��f A ; left sublist is shorter than right sublist, so comes first   g �ii v   l e f t   s u b l i s t   i s   s h o r t e r   t h a n   r i g h t   s u b l i s t ,   s o   c o m e s   f i r s ta jkj ?   m plml o   m n�o�o 0 
leftlength 
leftLengthm o   n o�n�n 0 rightlength rightLengthk n�mn l  s uopqo L   s urr m   s t�l�l p A ; right sublist is shorter than left sublist, so comes first   q �ss v   r i g h t   s u b l i s t   i s   s h o r t e r   t h a n   l e f t   s u b l i s t ,   s o   c o m e s   f i r s t�m  b l  x ztuvt L   x zww m   x y�k�k  u   both lists are identical   v �xx 2   b o t h   l i s t s   a r e   i d e n t i c a l�s   y�jy l     �i�h�g�i  �h  �g  �j  � 9 3 compares sublists of same type and variable length   � �zz f   c o m p a r e s   s u b l i s t s   o f   s a m e   t y p e   a n d   v a r i a b l e   l e n g t h��  ��  � h   9 @�f{�f *0 mixedlistcomparator MixedListComparator{ l     |}~| k       ��� l     �e�d�c�e  �d  �c  � ��� i    ��� I      �b��a�b 0 makekey makeKey� ��`� o      �_�_ 0 sublist subList�`  �a  � h     �^��^ 0 	keyobject 	KeyObject� k      �� ��� j     �]��] 
0 _list_  � o     �\�\ 0 sublist subList� ��� j    
�[��[ 
0 _keys_  � J    	�Z�Z  � ��� l     �Y�X�W�Y  �X  �W  � ��V� i   ��� I      �U��T�U 0 getkey getKey� ��S� o      �R�R "0 comparatorindex comparatorIndex�S  �T  � k     o�� ��� V     f��� k    a�� ��� l   �Q���Q  � ? 9 TO DO: catch error here if not a valid comparator record   � ��� r   T O   D O :   c a t c h   e r r o r   h e r e   i f   n o t   a   v a l i d   c o m p a r a t o r   r e c o r d� ��� r    %��� n    ��� 4    �P�
�P 
cobj� o    �O�O "0 comparatorindex comparatorIndex� o    �N�N  0 comparatorlist comparatorList� K      �� �M���M 0 	itemindex 	itemIndex� o      �L�L 0 i  � �K��J�K  0 itemcomparator itemComparator� o      �I�I $0 comparatorobject comparatorObject�J  � ��� Q   & O���� r   ) 1��� n   ) /��� 4   , /�H�
�H 
cobj� o   - .�G�G 0 i  � n  ) ,��� o   * ,�F�F 
0 _list_  �  f   ) *� o      �E�E 0 subitem subItem� R      �D�C�
�D .ascrerr ****      � ****�C  � �B��A
�B 
errn� d      �� m      �@�@��A  � R   9 O�?��
�? .ascrerr ****      � ****� b   G N��� b   G L��� m   G H�� ��� & C a n  t   c o m p a r e   i t e m  � l  H K��>�=� n  H K��� o   I K�<�< 0 	itemindex 	itemIndex� o   H I�;�; (0 listitemcomparator listItemComparator�>  �=  � m   L M�� ��� F   o f   s u b l i s t   ( s u b l i s t   i s   t o o   s h o r t ) .� �:��
�: 
errn� m   ; <�9�9�@� �8��7
�8 
erob� l  = F��6�5� N   = F�� n  = E��� 4   B E�4�
�4 
cobj� o   C D�3�3 0 i  � o   = B�2�2 0 sublist subList�6  �5  �7  � ��1� r   P a��� n  P Z��� I   U Z�0��/�0 0 makekey makeKey� ��.� o   U V�-�- 0 subitem subItem�.  �/  � o   P U�,�, $0 comparatorobject comparatorObject� n      ���  ;   _ `� o   Z _�+�+ 
0 _keys_  �1  � ?    ��� o    �*�* "0 comparatorindex comparatorIndex� n    
��� 1    
�)
�) 
leng� n   ��� o    �(�( 
0 _keys_  �  f    � ��'� L   g o�� n   g n��� 4   j m�&�
�& 
cobj� o   k l�%�% "0 comparatorindex comparatorIndex� n  g j��� o   h j�$�$ 
0 _keys_  �  f   g h�'  �V  � ��� l     �#�"�!�#  �"  �!  � ��� i   ��� I      � ���  0 comparekeys compareKeys� ��� o      �� 0 leftkeyobject leftKeyObject� ��� o      ��  0 rightkeyobject rightKeyObject�  �  � k     B�� ��� Y     ?������ k    :�� ��� r    -��� n   +��� I    +���� 0 comparekeys compareKeys� � � n   ! I    !��� 0 getkey getKey � o    �� 0 i  �  �   o    �� 0 leftkeyobject leftKeyObject  � n  ! ' I   " '��� 0 getkey getKey 	�	 o   " #�� 0 i  �  �   o   ! "��  0 rightkeyobject rightKeyObject�  �  � l   
��
 n    o    �
�
  0 itemcomparator itemComparator n    4    �	
�	 
cobj o    �� 0 i   o    ��  0 comparatorlist comparatorList�  �  � o      �� $0 comparisonresult comparisonResult� � Z  . :�� >   . 1 o   . /�� $0 comparisonresult comparisonResult m   / 0��   L   4 6 o   4 5� �  $0 comparisonresult comparisonResult�  �  �  � 0 i  � m    ���� � n    1   	 ��
�� 
leng o    	����  0 comparatorlist comparatorList�  � �� l  @ B L   @ B m   @ A����     both lists are identical    � 2   b o t h   l i s t s   a r e   i d e n t i c a l��  � �� l     ��������  ��  ��  ��  } 9 3 compares sublists of same length and variable type   ~ � f   c o m p a r e s   s u b l i s t s   o f   s a m e   l e n g t h   a n d   v a r i a b l e   t y p e� R      �� !
�� .ascrerr ****      � ****  o      ���� 0 etext eText! ��"#
�� 
errn" o      ���� 0 enumber eNumber# ��$%
�� 
erob$ o      ���� 0 efrom eFrom% ��&��
�� 
errt& o      ���� 
0 eto eTo��  � I   H T��'���� 
0 _error  ' ()( m   I J** �++  l i s t   c o m p a r a t o r) ,-, o   J K���� 0 etext eText- ./. o   K L���� 0 enumber eNumber/ 010 o   L M���� 0 efrom eFrom1 2��2 o   M N���� 
0 eto eTo��  ��  � 343 l     ��������  ��  ��  4 565 l     ��������  ��  ��  6 787 i  f i9:9 I     ����;
�� .Lst:ReSonull��� ��� null��  ; ��<��
�� 
Comp< |����=��>��  ��  = o      ���� $0 comparatorobject comparatorObject��  > l     ?����? m      ��
�� 
msng��  ��  ��  : Q     :@AB@ k    (CC DED Z     FG��HF =   IJI o    ���� $0 comparatorobject comparatorObjectJ m    ��
�� 
msngG r   	 KLK I  	 ������
�� .Lst:DeSonull��� ��� null��  ��  L o      ���� $0 comparatorobject comparatorObject��  H r     MNM n   OPO I    ��Q���� &0 asscriptparameter asScriptParameterQ RSR o    ���� $0 comparatorobject comparatorObjectS T��T m    UU �VV  f o r��  ��  P o    ���� 0 _support  N o      ���� $0 comparatorobject comparatorObjectE W��W h   ! (��X�� &0 reversecomparator ReverseComparatorX k      YY Z[Z j     ��\
�� 
pare\ o     ���� $0 comparatorobject comparatorObject[ ]��] i  	 ^_^ I      ��`���� 0 comparekeys compareKeys` aba o      ���� 0 leftkey leftKeyb c��c o      ���� 0 rightkey rightKey��  ��  _ l    defd L     gg d     
hh l    	i����i M     	jj I      ��k���� 0 comparekeys compareKeysk lml o    ���� 0 leftkey leftKeym n��n o    ���� 0 rightkey rightKey��  ��  ��  ��  e 4 . flip negative flag to positive and vice-versa   f �oo \   f l i p   n e g a t i v e   f l a g   t o   p o s i t i v e   a n d   v i c e - v e r s a��  ��  A R      ��pq
�� .ascrerr ****      � ****p o      ���� 0 etext eTextq ��rs
�� 
errnr o      ���� 0 enumber eNumbers ��tu
�� 
erobt o      ���� 0 efrom eFromu ��v��
�� 
errtv o      ���� 
0 eto eTo��  B I   0 :��w���� 
0 _error  w xyx m   1 2zz �{{ $ r e v e r s e   c o m p a r a t o ry |}| o   2 3���� 0 etext eText} ~~ o   3 4���� 0 enumber eNumber ��� o   4 5���� 0 efrom eFrom� ���� o   5 6���� 
0 eto eTo��  ��  8 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  j m��� I     �����
�� .Lst:LiUSnull���     ****� o      ���� 0 thelist theList��  � Q     t���� k    b�� ��� h    
����� $0 resultlistobject resultListObject� j     ����� 
0 _list_  � n     ��� 2   ��
�� 
cobj� n    ��� I    ������� "0 aslistparameter asListParameter� ��� o    
���� 0 thelist theList� ���� m   
 �� ���  ��  ��  � o     ���� 0 _support  � ��� r    ��� n    ��� 1    ��
�� 
leng� n   ��� o    ���� 
0 _list_  � o    ���� $0 resultlistobject resultListObject� o      ���� 0 len  � ��� Y    \�������� k    W�� ��� r    -��� I   +����� z����
�� .sysorandnmbr    ��� nmbr
�� misccura��  � ����
�� 
from� m   # $���� � �����
�� 
to  � o   % &���� 0 len  ��  � o      ���� 0 idx2  � ���� r   . W��� J   . >�� ��� e   . 5�� n  . 5��� 4   1 4���
�� 
cobj� o   2 3�� 0 idx2  � n  . 1��� o   / 1�~�~ 
0 _list_  � o   . /�}�} $0 resultlistobject resultListObject� ��|� e   5 <�� n  5 <��� 4   8 ;�{�
�{ 
cobj� o   9 :�z�z 0 idx1  � n  5 8��� o   6 8�y�y 
0 _list_  � o   5 6�x�x $0 resultlistobject resultListObject�|  � J      �� ��� n     ��� 4   F I�w�
�w 
cobj� o   G H�v�v 0 idx1  � n  C F��� o   D F�u�u 
0 _list_  � o   C D�t�t $0 resultlistobject resultListObject� ��s� n     ��� 4   R U�r�
�r 
cobj� o   S T�q�q 0 idx2  � n  O R��� o   P R�p�p 
0 _list_  � o   O P�o�o $0 resultlistobject resultListObject�s  ��  �� 0 idx1  � m    �n�n � o    �m�m 0 len  ��  � ��l� L   ] b�� n  ] a��� o   ^ `�k�k 
0 _list_  � o   ] ^�j�j $0 resultlistobject resultListObject�l  � R      �i��
�i .ascrerr ****      � ****� o      �h�h 0 etext eText� �g��
�g 
errn� o      �f�f 0 enumber eNumber� �e��
�e 
erob� o      �d�d 0 efrom eFrom� �c��b
�c 
errt� o      �a�a 
0 eto eTo�b  � I   j t�`��_�` 
0 _error  � ��� m   k l�� ���  u n s o r t   l i s t� ��� o   l m�^�^ 0 etext eText� ��� o   m n�]�] 0 enumber eNumber� ��� o   n o�\�\ 0 efrom eFrom� ��[� o   o p�Z�Z 
0 eto eTo�[  �_  � ��� l     �Y�X�W�Y  �X  �W  � ��V� l     �U�T�S�U  �T  �S  �V       �R������������ �Q	
�R  � �P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;�:�9�8
�P 
pimr�O 0 _support  �N 
0 _error  �M 20 _errorwithpartialresult _errorWithPartialResult�L "0 _makelistobject _makeListObject�K 0 	_pinindex 	_pinIndex
�J .Lst:Instnull���     ****
�I .Lst:Delenull���     ****
�H .Lst:RDuLnull���     ****
�G .Lst:SliLnull���     ****
�F .Lst:Trannull���     ****
�E .Lst:Findnull���     ****
�D .Lst:Map_null���     ****
�C .Lst:Filtnull���     ****
�B .Lst:Redunull���     ****�A *0 _quicksortthreshold _quicksortThreshold�@ 	0 _sort  
�? .Lst:Sortnull���     ****
�> .Lst:DeSonull��� ��� null
�= .Lst:NuSonull��� ��� null
�< .Lst:DaSonull��� ��� null
�; .Lst:TeSonull��� ��� null
�: .Lst:LiSonull��� ��� null
�9 .Lst:ReSonull��� ��� null
�8 .Lst:LiUSnull���     ****� �7�7    �6�5
�6 
cobj    �4
�4 
osax�5  �    �3 %
�3 
scpt� �2 -�1�0�/�2 
0 _error  �1 �.�.   �-�,�+�*�)�- 0 handlername handlerName�, 0 etext eText�+ 0 enumber eNumber�* 0 efrom eFrom�) 
0 eto eTo�0   �(�'�&�%�$�( 0 handlername handlerName�' 0 etext eText�& 0 enumber eNumber�% 0 efrom eFrom�$ 
0 eto eTo �#�"�!
�# 
msng�" �! 20 _errorwithpartialresult _errorWithPartialResult�/ *�������+ � �  I����  20 _errorwithpartialresult _errorWithPartialResult� ��   ������� 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� 0 epartial ePartial�   ������� 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� 0 epartial ePartial  [���
� 
msng� � 0 rethrowerror rethrowError� b  ࠡ�����+ � � x��
�	� "0 _makelistobject _makeListObject� ��   ��� 0 len  � 0 padvalue padValue�
   ���� 0 len  � 0 padvalue padValue� 0 
listobject 
listObject � ��� ����� 0 
listobject 
listObject ��������
�� .ascrinit****      � **** k       �����  ��  ��   ���� 
0 _list_   ���� 
0 _list_  �� jv�� �  
0 _list_  
�� 
leng
�� 
cobj�	 `��K S�O�j L�����v��,FO h��,�,���,��,%��,F[OY��O��,�,� ��,[�\[Zk\Z�2��,FY hY hO��,E� �� ����� !���� 0 	_pinindex 	_pinIndex�� ��"�� "  ������ 0 theindex theIndex�� 0 
textlength 
textLength��    ������ 0 theindex theIndex�� 0 
textlength 
textLength!  �� &�� �Y ��' �'Y �j  kY �� �� ����#$��
�� .Lst:Instnull���     ****�� 0 thelist theList�� ����%
�� 
Valu�� 0 thevalue theValue% ��&'
�� 
Befo& {�������� 0 beforeindex beforeIndex��  
�� 
msng' ��()
�� 
Afte( {�������� 0 
afterindex 
afterIndex��  
�� 
msng) ��*��
�� 
Conc* {�������� 0 isjoin isJoin��  
�� boovfals��  # 
���������������������� 0 thelist theList�� 0 thevalue theValue�� 0 beforeindex beforeIndex�� 0 
afterindex 
afterIndex�� 0 isjoin isJoin�� 0 
listobject 
listObject�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo$ ��%+��������������S`��l����������������������,>������ 0 
listobject 
listObject+ ��-����./��
�� .ascrinit****      � ****- k     00 %����  ��  ��  . ���� 
0 _list_  / -������ "0 aslistparameter asListParameter�� 
0 _list_  �� b  b   �l+ �
�� 
kocl
�� 
list
�� .corecnte****       ****
�� 
bool
�� 
msng
�� 
errn���Y�� (0 asintegerparameter asIntegerParameter�� (0 asbooleanparameter asBooleanParameter�� 
0 _list_  
�� 
leng���@
�� 
erob
�� 
cobj
�� 
insl�� �� 0 etext eText, ����1
�� 
errn�� 0 enumber eNumber1 ����2
�� 
erob�� 0 efrom eFrom2 ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ������K S�O�
 �kv��l j �& 
�kvE�Y hO�� w�� )��l�Y hOb  ��l+ E�Ob  ��l+ E�O�j ��,a ,�kE�Y hO���,a , ")�a a ��,Ea �/a 4a a Y hY ��� �b  �a l+ E�O�j 
�kE�Y 3�j ��,a ,�E�Y )�a a ��,Ea �/a 3a a O���,a ,
 �j�& ")�a a ��,Ea �/a 3a a Y hY ��%O�j  ���,%Y ;���,a ,  ��,�%Y &��,[a \[Zk\Z�2�%��,[a \[Z�k\Zi2%W X  *a ����a + � ��N����34��
�� .Lst:Delenull���     ****�� 0 thelist theList�� ��56
�� 
Indx5 {�������� 0 theindex theIndex��  ����6 ��78
�� 
FIdx7 {�������� 0 	fromindex 	fromIndex��  
�� 
msng8 ��9��
�� 
TIdx9 {�������� 0 toindex toIndex��  
�� 
msng��  3 �������������������������� 0 thelist theList�� 0 theindex theIndex�� 0 	fromindex 	fromIndex�� 0 toindex toIndex�� 0 
listobject 
listObject�� 0 
listlength 
listLength�� 0 	startlist 	startList�� 0 endlist endList�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo4 ��f:��������������'�;����� 0 
listobject 
listObject: �<��=>�
� .ascrinit****      � ****< k     ?? f�~�~  �  �  = �}�} 
0 _list_  > n�|�{�| "0 aslistparameter asListParameter�{ 
0 _list_  � b  b   �l+ �� 
0 _list_  
� 
leng
� 
msng� (0 asintegerparameter asIntegerParameter
� 
bool
� 
errn��@
� 
erob
� 
cobj� � 0 etext eText; �z�y@
�z 
errn�y 0 enumber eNumber@ �x�wA
�x 
erob�w 0 efrom eFromA �v�u�t
�v 
errt�u 
0 eto eTo�t  � � 
0 _error  ������K S�O��,�,E�O�� b  ��l+ E�Y hO�� b  ��l+ E�Y hO�� 	 �� �& Lb  ��l+ E�O�E�O�j �k�E�Y hO�j 
 ���& )�����,E�/�a Y hY ���  kE�Y ��  �E�Y hO�j �k�E�Y hO�j �k�E�Y hO�j 
 ���& )�����,E�/�a Y hO�j 
 ���& )�����,E�/�a Y hO�� ��lvE[�k/E�Z[�l/E�ZY hO�k  �� 
 �� �& jvY hOjvE�Y ��,[�\[Zk\Z�k2E�O��  	jvE�Y ��,[�\[Z�k\Zi2E�O��%W X  *a ����a + � �s��r�qBC�p
�s .Lst:RDuLnull���     ****�r 0 thelist theList�q  B 	�o�n�m�l�k�j�i�h�g�o 0 thelist theList�n 0 
listobject 
listObject�m 0 i  �l 0 u  �k 0 
listlength 
listLength�j 0 etext eText�i 0 enumber eNumber�h 0 efrom eFrom�g 
0 eto eToC �f�D�e�d�c�bE�a�`�f 0 
listobject 
listObjectD �_F�^�]GH�\
�_ .ascrinit****      � ****F k     II ��[�[  �^  �]  G �Z�Z 
0 _list_  H �Y�X�W�Y "0 aslistparameter asListParameter
�X 
cobj�W 
0 _list_  �\ b  b   k+  �-E��e 
0 _list_  
�d 
leng
�c 
cobj�b 0 etext eTextE �V�UJ
�V 
errn�U 0 enumber eNumberJ �T�SK
�T 
erob�S 0 efrom eFromK �R�Q�P
�R 
errt�Q 
0 eto eTo�P  �a �` 
0 _error  �p � ���K S�Olk��,�,mvE[�k/E�Z[�l/E�Z[�m/E�ZO eh�� >h��,[�\[Zk\Z�2��,�/kv�kE�O�� ��,[�\[Zk\Z�2EY h[OY��O�kE�O��,�/��,�/FO�kE�[OY��O��,[�\[Zk\Z�2EW X  *襦���+ 
� �O)�N�MLM�L
�O .Lst:SliLnull���     ****�N 0 thelist theList�M �KNO
�K 
FIdxN {�J�I�H�J 0 
startindex 
startIndex�I  
�H 
msngO �GP�F
�G 
TIdxP {�E�D�C�E 0 endindex endIndex�D  
�C 
msng�F  L �B�A�@�?�>�=�<�;�B 0 thelist theList�A 0 
startindex 
startIndex�@ 0 endindex endIndex�? 0 	thelength 	theLength�> 0 etext eText�= 0 enumber eNumber�< 0 efrom eFrom�; 
0 eto eToM �:�9�8Y�7�6�5�4�3h�2�1�0����/�.Q,�-�,�: "0 aslistparameter asListParameter
�9 
leng
�8 
msng�7 (0 asintegerparameter asIntegerParameter
�6 
errn�5�Y
�4 
erob�3 
�2 
cobj
�1 
ctxt�0�[
�/ 
bool�. 0 etext eTextQ �+�*R
�+ 
errn�* 0 enumber eNumberR �)�(S
�) 
erob�( 0 efrom eFromS �'�&�%
�' 
errt�& 
0 eto eTo�%  �- �, 
0 _error  �L�tb  �k+  E�O��,E�O�� Xb  ��l+ E�O�j  )�����Y hO��  -��' 
��-EY �� jvY �[�\[Z�\Zi2EY hY ��  )��l�Y hO�� Xb  ��l+ E�O�j  )�����Y hO��  -��' jvY �� 
��-EY �[�\[Zk\Z�2EY hY hO�j �k�E�Y hO�j �k�E�Y hO�k	 	�ka &
 ��	 	��a &a & jvY hO�k kE�Y �� �E�Y hO�k kE�Y �� �E�Y hO�[�\[Z�\Z�2EW X  *a ����a + � �$<�#�"TU�!
�$ .Lst:Trannull���     ****�# 0 thelist theList�" � VW
�  
WhilV {���� 0 unevenoption unevenOption�  
� LTrhLTrRW �X�
� 
PadIX {���� 0 padvalue padValue�  
� 
msng�  T �������������� 0 thelist theList� 0 unevenoption unevenOption� 0 padvalue padValue� 0 
listobject 
listObject� $0 resultlistlength resultListLength� 0 aref aRef� (0 emptyresultsublist emptyResultSubList� 0 i  � 0 j  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToU �
�	������k�rY�� ����������������������Z<����
�
 
kocl
�	 
list
� .corecnte****       ****
� 
bool
� 
errn��Y
� 
erob� � 0 
listobject 
listObjectY ��[����\]��
�� .ascrinit****      � ****[ k     
^^ t__ w����  ��  ��  \ ������ 
0 _list_  �� 0 _resultlist_ _resultList_] ������ 
0 _list_  �� 0 _resultlist_ _resultList_�� b   �Ojv�� 
0 _list_  
�  
cobj
�� 
leng
�� LTrhLTrR
�� LTrhLTrP
�� LTrhLTrT
�� 
errt
�� 
enum�� �� "0 _makelistobject _makeListObject�� 0 _resultlist_ _resultList_�� 0 etext eTextZ ����`
�� 
errn�� 0 enumber eNumber` ����a
�� 
erob�� 0 efrom eFroma ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �!���jv  jvY hO�kv��l j 
 ���l �j �& )�����Y hO��K S�O��,�k/�,E�O��  4 .��,[��l kh ��,� )����,�a Y h[OY��Y z�a   - '��,[��l kh ��,� 
��,E�Y h[OY��Y G�a   - '��,[��l kh ��,� 
��,E�Y h[OY��Y )���a a a a O*��,�,�l+ E�O k�kkh ��-E�a ,6F[OY��O��a ,6FO ?k��,�,Ekh  +k��,��/�,Ekh ��,��/��/�a ,��/��/F[OY��[OY��O�a ,EW X  *a ����a +   ��X����bc��
�� .Lst:Findnull���     ****�� 0 thelist theList�� ����d
�� 
Valu�� 0 theitem theItemd ��e��
�� 
Retue {�������� (0 findingoccurrences findingOccurrences��  
�� LFWhLFWA��  b 	�������������������� 0 thelist theList�� 0 theitem theItem�� (0 findingoccurrences findingOccurrences�� 0 
listobject 
listObject�� 0 i  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToc ��gf�����������������������������g������ 0 
listobject 
listObjectf �h��ij�
� .ascrinit****      � ****h k     kk ill t��  �  �  i ��� 
0 _list_  � 0 _result_  j r���� "0 aslistparameter asListParameter� 
0 _list_  � 0 _result_  � b  b   �l+ �Ojv�
�� LFWhLFWA�� 
0 _list_  
�� 
leng
�� 
cobj�� 0 _result_  
�� LFWhLFWF
�� LFWhLFWL
�� 
errn���Y
�� 
erob
�� 
errt
�� 
enum�� �� 0 etext eTextg ��m
� 
errn� 0 enumber eNumberm ��n
� 
erob� 0 efrom eFromn ���
� 
errt� 
0 eto eTo�  �� � 
0 _error  �� � ���K S�O��  . (k��,�,Ekh ��,�/�  ���,6FY h[OY��Y v��  0 *k��,�,Ekh ��,�/�  ���,6FOY h[OY��Y B��  0 *��,�,Ekih ��,�/�  ���,6FOY h[OY��Y )������a O��,EW X  *a ����a +  ���op�
� .Lst:Map_null���     ****� 0 thelist theList� ���
� 
Usin� 0 	thescript 	theScript�  o 
����������� 0 thelist theList� 0 	thescript 	theScript� $0 resultlistobject resultListObject� 0 i  � 0 etext eText� 0 enumber eNumber� 
0 eto eTo� 0 epartial ePartial� 0 
listobject 
listObject� 0 efrom eFromp �q.������r�����sus���� $0 resultlistobject resultListObjectq �t��uv�
� .ascrinit****      � ****t k     ww ��  �  �  u �� 
0 _list_  v "���� "0 aslistparameter asListParameter
� 
cobj� 
0 _list_  � b  b   �l+ �-E�� &0 asscriptparameter asScriptParameter� 
0 _list_  
� 
leng
� 
cobj� 0 convertitem convertItem� 0 etext eTextr ��x
� 
errn� 0 enumber eNumberx ���
� 
errt� 
0 eto eTo�  
� 
errn
� 
erob
� 
errt
� 
ptlr� s ��y
� 
errn� 0 enumber eNumbery �~�}z
�~ 
erob�} 0 efrom eFromz �|�{{
�| 
errt�{ 
0 eto eTo{ �z�y�x
�z 
ptlr�y 0 epartial ePartial�x  � � 20 _errorwithpartialresult _errorWithPartialResult� � ���K S�Ob  ��l+ E�O + %k��,�,Ekh ���,�/k+ ��,�/F[OY��W CX 	 
�k ��,[�\[Zk\Z�k2E�Y jvE�O)���,E�/����a �%a %�%O��,EW X 	 *a �����a +  �w��v�u|}�t
�w .Lst:Filtnull���     ****�v 0 thelist theList�u �s�r�q
�s 
Usin�r 0 	thescript 	theScript�q  | �p�o�n�m�l�k�j�i�h�g�f�e�p 0 thelist theList�o 0 	thescript 	theScript�n $0 resultlistobject resultListObject�m 0 	lastindex 	lastIndex�l 0 i  �k 0 theitem theItem�j 0 etext eText�i 0 enumber eNumber�h 
0 eto eTo�g 0 epartial ePartial�f 0 
listobject 
listObject�e 0 efrom eFrom} �d�~��c�b�a�`�_�^�]�\�[�Z�Y �M�X�W�d $0 resultlistobject resultListObject~ �V��U�T���S
�V .ascrinit****      � ****� k     �� ��R�R  �U  �T  � �Q�Q 
0 _list_  � ��P�O�N�P "0 aslistparameter asListParameter
�O 
cobj�N 
0 _list_  �S b  b   �l+ �-E��c &0 asscriptparameter asScriptParameter�b 
0 _list_  
�a 
leng
�` 
cobj�_ 0 	checkitem 	checkItem�^ 0 etext eText �M�L�
�M 
errn�L 0 enumber eNumber� �K�J�I
�K 
errt�J 
0 eto eTo�I  
�] 
errn
�\ 
erob
�[ 
errt
�Z 
ptlr�Y � �H�G�
�H 
errn�G 0 enumber eNumber� �F�E�
�F 
erob�E 0 efrom eFrom� �D�C�
�D 
errt�C 
0 eto eTo� �B�A�@
�B 
ptlr�A 0 epartial ePartial�@  �X �W 20 _errorwithpartialresult _errorWithPartialResult�t � ���K S�Ob  ��l+ E�OjE�O = 7k��,�,Ekh ��,�/E�O��k+  �kE�O���,�/FY h[OY��W CX 	 
�k ��,[�\[Zk\Z�k2E�Y jvE�O)���,E�/����a �%a %�%O�j  jvY hO��,[�\[Zk\Z�2EW X 	 *a �����a +  �?_�>�=���<
�? .Lst:Redunull���     ****�> 0 thelist theList�= �;�:�9
�; 
Usin�: 0 	thescript 	theScript�9  � 
�8�7�6�5�4�3�2�1�0�/�8 0 thelist theList�7 0 	thescript 	theScript�6 0 missingvalue missingValue�5 0 	theresult 	theResult�4 0 
listobject 
listObject�3 0 i  �2 0 etext eText�1 0 enumber eNumber�0 
0 eto eTo�/ 0 efrom eFrom� �.o��-�,�+�*�)�(���'�&�%�$��#�"�����!�. 0 
listobject 
listObject� � ������
�  .ascrinit****      � ****� k     �� o��  �  �  � �� 
0 _list_  � w��� "0 aslistparameter asListParameter� 
0 _list_  � b  b   �l+ ��- 
0 _list_  
�, 
leng
�+ 
errn�*�Y
�) 
erob�( �' &0 asscriptparameter asScriptParameter
�& 
cobj�% 0 combineitems combineItems�$ 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
errt� 
0 eto eTo�  
�# 
errt�" � ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  �! 20 _errorwithpartialresult _errorWithPartialResult�< ��E�O ���K S�O��,�,j  )���jv��Y hOb  ��l+ E�O��,�k/E�O ' !l��,�,Ekh ����,�/l+ E�[OY��W &X  )���,E�/a �a a �%a %�%O�W X  *a �����a + �Q  �	��
���	� 	0 _sort  � ��� �  ������ $0 resultlistobject resultListObject� 0 	fromindex 	fromIndex� 0 toindex toIndex�  0 sortcomparator sortComparator� 0 usequicksort useQuickSort�
  � ��� ��������������������������� $0 resultlistobject resultListObject� 0 	fromindex 	fromIndex�  0 toindex toIndex��  0 sortcomparator sortComparator�� 0 usequicksort useQuickSort�� 0 	leftindex 	leftIndex�� 0 
rightindex 
rightIndex�� 0 
pivotvalue 
pivotValue�� 0 etext eText�� 0 enum eNum�� 0 efrom eFrom�� 
0 eto eTo�� 0 i  �� 0 j  �� 0 leftkey leftKey�� 0 rightkey rightKey� �������������������	}	����������
�� 
cobj�� 
0 _keys_  �� 0 comparekeys compareKeys
�� 
nmbr�� 0 etext eText� �����
�� 
errn�� 0 enum eNum� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  
�� 
errn
�� 
erob
�� 
errt�� �� 
0 _list_  �� �� 	0 _sort  ��  � ������
�� 
errn���n��  �	�q��k hY hO��lvE[�k/E�Z[�l/E�ZO��,[�\[Z�\Z�2�.E�Oh�� % h���,�/E�l+ �&j�kE�[OY��W X  )���,�/�lv���%O $ h���,�/�l+ �&j�kE�[OY��W X  )���,�/�lv���%O�� p��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZO��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZO�k�klvE[�k/E�Z[�l/E�ZY h[OY�O -*������b  �+ O*������b  �+ OhW X  hY hO�kE�O ���kh  ���ih ��,�k/E��,�/ElvE[�k/E�Z[�l/E�ZO���l+ k Y hO��lvE[�k/��,�k/FZ[�l/��,�/FZO��,�/E��,�k/ElvE[�k/��,�k/FZ[�l/��,�/FZ[OY�y[OY�j ��
���������
�� .Lst:Sortnull���     ****�� 0 thelist theList�� �����
�� 
Comp� {��������  0 sortcomparator sortComparator��  
�� 
msng��  � �������������������������������� 0 thelist theList��  0 sortcomparator sortComparator�� $0 resultlistobject resultListObject��  0 ascendingcount ascendingCount�� "0 descendingcount descendingCount�� 0 previouskey previousKey�� 0 etext eText�� 0 enum eNum�� 
0 eto eTo�� 0 i  �� 0 
currentkey 
currentKey�� 0 keycomparison keyComparison�� 0 efrom eFrom�� 0 usequicksort useQuickSort�� 0 enumber eNumber� 
�����
��������&����������]�������/��� "0 aslistparameter asListParameter�� $0 resultlistobject resultListObject� �������
� .ascrinit****      � ****� k     �� 
��� ��  �  �  � ��� 
0 _keys_  � 
0 _list_  � ���
� 
cobj� 
0 _keys_  � 
0 _list_  � b   �-E�Ob   �-E��� 
0 _list_  
�� 
leng
� 
msng
� .Lst:DeSonull��� ��� null� &0 asscriptparameter asScriptParameter
� 
cobj� 
0 _keys_  � 0 makekey makeKey� 0 etext eText� ���
� 
errn� 0 enum eNum� ���
� 
errt� 
0 eto eTo�  
� 
errn
� 
erob
� 
errt� � 0 comparekeys compareKeys� ���
� 
errn� 0 enum eNum� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 	0 _sort  � ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � 
0 _error  ���qb  ��l+ E�O��K S�O��,�,l 
��,EY hO��  *j E�Y b  ��l+ 
E�OjjlvE[�k/E�Z[�l/E�ZO � ���,�k/Ek+ E�W $X  )a �a ��,E�k/a �a a �%O���,�k/FO �l��,�,Ekh 	 ���,�/k+ E�W *X  )a �a ��,E�/a �a a �%a %�%O���,�/FO���l+ E�O�j 
�kE�Y �j 
�kE�Y hO�E�[OY��W X  )a �a �a �a �O�j #��,�,b  E�O*�k��,�,��a + Y hO��,EW X  *a ����a +  �?�����
� .Lst:DeSonull��� ��� null�  �  � �� &0 defaultcomparator DefaultComparator� �@�� &0 defaultcomparator DefaultComparator� �������
� .ascrinit****      � ****� k     �� B�� K�� N�� ���  �  �  � ����� "0 _supportedtypes _supportedTypes� 	0 _type  � 0 makekey makeKey� 0 comparekeys compareKeys� ��������
� 
nmbr
� 
ctxt
� 
ldt � "0 _supportedtypes _supportedTypes
� 
msng� 	0 _type  � �~Q�}�|���{�~ 0 makekey makeKey�} �z��z �  �y�y 0 anobject anObject�|  � �x�w�x 0 anobject anObject�w 0 aref aRef� �v�u�t�s�r�q�p�o�n�m}���l�
�v 
msng�u "0 _supportedtypes _supportedTypes
�t 
kocl
�s 
cobj
�r .corecnte****       ****
�q 
pcnt
�p 
errn�o�\
�n 
erob�m 
�l 
pcls�{ ~b  �  F 7)�,[��l kh �kv��,El j ��,Ec  O�Y h[OY��O)�����Y .�kv�b  l j  )�����b  %�%��,%�%Y hO�� �k��j�i���h�k 0 comparekeys compareKeys�j �g��g �  �f�e�f 0 
leftobject 
leftObject�e 0 rightobject rightObject�i  � �d�c�d 0 
leftobject 
leftObject�c 0 rightobject rightObject�  �h �� iY �� kY j� ���mv�O�OL OL � ��K S� �b��a�`���_
�b .Lst:NuSonull��� ��� null�a  �`  � �^�^ &0 numericcomparator NumericComparator� �]���] &0 numericcomparator NumericComparator� �\��[�Z���Y
�\ .ascrinit****      � ****� k     �� ��� ��X�X  �[  �Z  � �W�V�W 0 makekey makeKey�V 0 comparekeys compareKeys� ��� �U��T�S���R�U 0 makekey makeKey�T �Q��Q �  �P�P 0 anobject anObject�S  � �O�O 0 anobject anObject� �N
�N 
nmbr�R ��&� �M��L�K���J�M 0 comparekeys compareKeys�L �I��I �  �H�G�H 0 
leftobject 
leftObject�G 0 rightobject rightObject�K  � �F�E�F 0 
leftobject 
leftObject�E 0 rightobject rightObject�  �J ���Y L  OL �_ ��K S� �D��C�B���A
�D .Lst:DaSonull��� ��� null�C  �B  � �@�@  0 datecomparator DateComparator� �?���?  0 datecomparator DateComparator� �>��=�<���;
�> .ascrinit****      � ****� k     �� ��� ��:�:  �=  �<  � �9�8�9 0 makekey makeKey�8 0 comparekeys compareKeys� ��� �7��6�5���4�7 0 makekey makeKey�6 �3��3 �  �2�2 0 anobject anObject�5  � �1�1 0 anobject anObject� �0
�0 
ldt �4 ��&� �/��.�-���,�/ 0 comparekeys compareKeys�. �+��+ �  �*�)�* 0 
leftobject 
leftObject�) 0 rightobject rightObject�-  � �(�'�( 0 
leftobject 
leftObject�' 0 rightobject rightObject�  �, ���; L  OL �A ��K S�	 �&�%�$���#
�& .Lst:TeSonull��� ��� null�%  �$ �"��!
�" 
Cons� {� ���   0 orderingoption orderingOption�  
� SrtECmpI�!  � ���������  0 orderingoption orderingOption� B0 currentconsiderationscomparator CurrentConsiderationsComparator� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator� :0 casesensitivetextcomparator CaseSensitiveTextComparator� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� ����@���d��������
��	����� B0 currentconsiderationscomparator CurrentConsiderationsComparator� �������
� .ascrinit****      � ****� k     �� �� !��  �  �  � �� � 0 makekey makeKey�  0 comparekeys compareKeys� ��� ������������ 0 makekey makeKey�� ����� �  ���� 0 anobject anObject��  � ���� 0 anobject anObject� ��
�� 
ctxt�� ��&� ��#���������� 0 comparekeys compareKeys�� ����� �  ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject��  � ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject�  �� �� iY �� kY j� L  OL 
� SrtECmpI� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator� �����������
�� .ascrinit****      � ****� k     �� B�� E����  ��  ��  � ����
�� 
pare�� 0 comparekeys compareKeys� ���
�� 
pare� ��G���������� 0 comparekeys compareKeys�� ����� �  ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject��  � ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject� MN���� 0 comparekeys compareKeys�� �� )��ld*J V�� b  N  OL 
� SrtECmpC� :0 casesensitivetextcomparator CaseSensitiveTextComparator� �����������
�� .ascrinit****      � ****� k     �� f   i����  ��  ��  � ����
�� 
pare�� 0 comparekeys compareKeys� ��
�� 
pare ��k�������� 0 comparekeys compareKeys�� ����   ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject��   ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject qr���� 0 comparekeys compareKeys�� �� )��ld*J V�� b  N  OL 
� SrtECmpD
� 
errn��Y
� 
erob
� 
errt
� 
enum�
 �	 0 etext eText� ����
�� 
errn�� 0 enumber eNumber ����
�� 
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  �# c N��K S�O��  ��K S�O�Y 0��  ��K 
S�O�Y ��  �Y )����a a a W X  *a ����a + 
 ���������
�� .Lst:LiSonull��� ��� null��  �� �	�
� 
Comp	 {����  0 comparatorlist comparatorList�  
� 
msng�   ���������  0 comparatorlist comparatorList� $0 comparatorobject comparatorObject� .0 uniformlistcomparator UniformListComparator� *0 mixedlistcomparator MixedListComparator� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo ���������
�{�*��
� 
kocl
� 
list
� .corecnte****       ****
� 
msng
� .Lst:DeSonull��� ��� null� &0 asscriptparameter asScriptParameter� .0 uniformlistcomparator UniformListComparator
 ����
� .ascrinit****      � **** k      � ��  �  �   ��� 0 makekey makeKey� 0 comparekeys compareKeys  ������ 0 makekey makeKey� ��   �� 0 sublist subList�   ��� 0 sublist subList� 0 	keyobject 	KeyObject ��� 0 	keyobject 	KeyObject ����
� .ascrinit****      � **** k      � � ���  �  �   ���� 
0 _list_  � 
0 _keys_  � 0 getkey getKey ��� 
0 _list_  � 
0 _keys_   ���� �� 0 getkey getKey� �!� !  �� 0 	itemindex 	itemIndex�   �� 0 	itemindex 	itemIndex  ������ 
0 _keys_  
� 
leng� 
0 _list_  
� 
cobj� 0 makekey makeKey� 1 &h�)�,�,b  )�,�/k+ b  6F[OY��O)�,�/E� b   �Ojv�OL � ��K S� ���"#�~� 0 comparekeys compareKeys� �}$�} $  �|�{�| 0 leftkeyobject leftKeyObject�{  0 rightkeyobject rightKeyObject�  " �z�y�x�w�v�u�t�z 0 leftkeyobject leftKeyObject�y  0 rightkeyobject rightKeyObject�x 0 
leftlength 
leftLength�w 0 rightlength rightLength�v 0 commonlength commonLength�u 0 i  �t $0 comparisonresult comparisonResult# �s�r�q�p�o�s 
0 _list_  
�r 
leng
�q 
cobj�p 0 getkey getKey�o 0 comparekeys compareKeys�~ {��,�,��,�,lvE[�k/E�Z[�l/E�ZO�E�O�� �E�Y hO 2k�kh b  ��k+ ��k+ l+ E�O�j �Y h[OY��O�� iY �� kY j� L  OL � *0 mixedlistcomparator MixedListComparator �n%�m�l&'�k
�n .ascrinit****      � ****% k     (( �)) ��j�j  �m  �l  & �i�h�i 0 makekey makeKey�h 0 comparekeys compareKeys' *+* �g��f�e,-�d�g 0 makekey makeKey�f �c.�c .  �b�b 0 sublist subList�e  , �a�`�a 0 sublist subList�` 0 	keyobject 	KeyObject- �_�/�_ 0 	keyobject 	KeyObject/ �^0�]�\12�[
�^ .ascrinit****      � ****0 k     33 �44 �55 ��Z�Z  �]  �\  1 �Y�X�W�Y 
0 _list_  �X 
0 _keys_  �W 0 getkey getKey2 �V�U6�V 
0 _list_  �U 
0 _keys_  6 �T��S�R78�Q�T 0 getkey getKey�S �P9�P 9  �O�O "0 comparatorindex comparatorIndex�R  7 �N�M�L�K�N "0 comparatorindex comparatorIndex�M 0 i  �L 0 subitem subItem�K (0 listitemcomparator listItemComparator8 �J�I�H�G�F�E�D:�C�B�A�@���?�J 
0 _keys_  
�I 
leng
�H 
cobj�G 0 	itemindex 	itemIndex�F  0 itemcomparator itemComparator�E 
0 _list_  �D  : �>�=�<
�> 
errn�=�@�<  
�C 
errn�B�@
�A 
erob�@ �? 0 makekey makeKey�Q p eh�)�,�,b   �/E[�,E�Z[�,Ec  ZO )�,�/E�W X  )���b   �/���,%�%Ob  �k+ b  6F[OY��O)�,�/E�[ b   �Ojv�OL �d ��K S�+ �;��:�9;<�8�; 0 comparekeys compareKeys�: �7=�7 =  �6�5�6 0 leftkeyobject leftKeyObject�5  0 rightkeyobject rightKeyObject�9  ; �4�3�2�1�4 0 leftkeyobject leftKeyObject�3  0 rightkeyobject rightKeyObject�2 0 i  �1 $0 comparisonresult comparisonResult< �0�/�.�-�,
�0 
leng
�/ 
cobj�.  0 itemcomparator itemComparator�- 0 getkey getKey�, 0 comparekeys compareKeys�8 C >kb   �,Ekh b   �/�,��k+ ��k+ l+ E�O�j �Y h[OY��Oj�k L  OL � 0 etext eText �+�*>
�+ 
errn�* 0 enumber eNumber> �)�(?
�) 
erob�( 0 efrom eFrom? �'�&�%
�' 
errt�& 
0 eto eTo�%  � � 
0 _error  �� U B�kv��l j  *��  *j E�Y b  ��l+ E�O��K 	S�Y 	��K S�W X  *拉��a +  �$:�#�"@A�!
�$ .Lst:ReSonull��� ��� null�#  �" � B�
�  
CompB {���� $0 comparatorobject comparatorObject�  
� 
msng�  @ ������� $0 comparatorobject comparatorObject� &0 reversecomparator ReverseComparator� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToA ��U��XC�Dz��
� 
msng
� .Lst:DeSonull��� ��� null� &0 asscriptparameter asScriptParameter� &0 reversecomparator ReverseComparatorC �E��FG�
� .ascrinit****      � ****E k     HH ZII ]�
�
  �  �  F �	�
�	 
pare� 0 comparekeys compareKeysG �J
� 
pareJ �_��KL�� 0 comparekeys compareKeys� �M� M  �� � 0 leftkey leftKey�  0 rightkey rightKey�  K ������ 0 leftkey leftKey�� 0 rightkey rightKeyL ���� 0 comparekeys compareKeys� )��ld*J  '� b   N  OL � 0 etext eTextD ����N
�� 
errn�� 0 enumber eNumberN ����O
�� 
erob�� 0 efrom eFromO ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  �! ; *��  *j E�Y b  ��l+ E�O��K S�W X  *颣���+  �������PQ��
�� .Lst:LiUSnull���     ****�� 0 thelist theList��  P 	�������������������� 0 thelist theList�� $0 resultlistobject resultListObject�� 0 len  �� 0 idx1  �� 0 idx2  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToQ ���R������������������S������� $0 resultlistobject resultListObjectR ��T����UV��
�� .ascrinit****      � ****T k     WW �����  ��  ��  U ���� 
0 _list_  V ��������� "0 aslistparameter asListParameter
�� 
cobj�� 
0 _list_  �� b  b   �l+ �-E��� 
0 _list_  
�� 
leng
�� misccura
�� 
from
�� 
to  �� 
�� .sysorandnmbr    ��� nmbr
�� 
cobj�� 0 etext eTextS ����X
�� 
errn�� 0 enumber eNumberX ����Y
�� 
erob�� 0 efrom eFromY ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� u d��K S�O��,�,E�O Hk�kh � *�k�� 	UE�O��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZ[OY��O��,EW X  *������+ ascr  ��ޭ