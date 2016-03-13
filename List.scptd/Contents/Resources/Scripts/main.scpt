FasdUAS 1.101.10   ��   ��    k             l      ��  ��   >8 List -- manipulate AppleScript lists 

Notes:

- For splitting and joining lists of text, see Text library's `split text` and `join text` commands.


TO DO:


- should text comparator implement exactly the same predefined considering/ignoring options as Text's `search text`? (currently `search text` considers diacriticals for comparison while `sort list`'s text comparison ignores diacriticals for ordering, which may or may not be appropriate)

- if list is almost ordered then tell _sort() to use insertionsort, as that will be quicker than quicksorting the whole thing (will need to run some profiling tests to determine what a good cutoff point is)

- text comparator currently performs simple text coercion; should it explicitly reject lists, constants, etc?

- would it be better if `insert into list` supported virtual 0 index only for both `before item` (-ve indexes only; would insert item last) and `after item` (+ve indexes only; would insert item first) parameters? (might be less confusing to explain; one might also argue that if some out-of-range indexes are allowed at opposing end, e.g. `before item 4` in a 3-item list then all out-of-range indexes should be allowed, c.f. `slice list`)

- should `slice list` raise -1728 on index 0? (currently raises -1703 to indicate invalid parameter rather than out of range)

     � 	 	
p   L i s t   - -   m a n i p u l a t e   A p p l e S c r i p t   l i s t s   
 
 N o t e s : 
 
 -   F o r   s p l i t t i n g   a n d   j o i n i n g   l i s t s   o f   t e x t ,   s e e   T e x t   l i b r a r y ' s   ` s p l i t   t e x t `   a n d   ` j o i n   t e x t `   c o m m a n d s . 
 
 
 T O   D O : 
 
 
 -   s h o u l d   t e x t   c o m p a r a t o r   i m p l e m e n t   e x a c t l y   t h e   s a m e   p r e d e f i n e d   c o n s i d e r i n g / i g n o r i n g   o p t i o n s   a s   T e x t ' s   ` s e a r c h   t e x t ` ?   ( c u r r e n t l y   ` s e a r c h   t e x t `   c o n s i d e r s   d i a c r i t i c a l s   f o r   c o m p a r i s o n   w h i l e   ` s o r t   l i s t ` ' s   t e x t   c o m p a r i s o n   i g n o r e s   d i a c r i t i c a l s   f o r   o r d e r i n g ,   w h i c h   m a y   o r   m a y   n o t   b e   a p p r o p r i a t e ) 
 
 -   i f   l i s t   i s   a l m o s t   o r d e r e d   t h e n   t e l l   _ s o r t ( )   t o   u s e   i n s e r t i o n s o r t ,   a s   t h a t   w i l l   b e   q u i c k e r   t h a n   q u i c k s o r t i n g   t h e   w h o l e   t h i n g   ( w i l l   n e e d   t o   r u n   s o m e   p r o f i l i n g   t e s t s   t o   d e t e r m i n e   w h a t   a   g o o d   c u t o f f   p o i n t   i s ) 
 
 -   t e x t   c o m p a r a t o r   c u r r e n t l y   p e r f o r m s   s i m p l e   t e x t   c o e r c i o n ;   s h o u l d   i t   e x p l i c i t l y   r e j e c t   l i s t s ,   c o n s t a n t s ,   e t c ? 
 
 -   w o u l d   i t   b e   b e t t e r   i f   ` i n s e r t   i n t o   l i s t `   s u p p o r t e d   v i r t u a l   0   i n d e x   o n l y   f o r   b o t h   ` b e f o r e   i t e m `   ( - v e   i n d e x e s   o n l y ;   w o u l d   i n s e r t   i t e m   l a s t )   a n d   ` a f t e r   i t e m `   ( + v e   i n d e x e s   o n l y ;   w o u l d   i n s e r t   i t e m   f i r s t )   p a r a m e t e r s ?   ( m i g h t   b e   l e s s   c o n f u s i n g   t o   e x p l a i n ;   o n e   m i g h t   a l s o   a r g u e   t h a t   i f   s o m e   o u t - o f - r a n g e   i n d e x e s   a r e   a l l o w e d   a t   o p p o s i n g   e n d ,   e . g .   ` b e f o r e   i t e m   4 `   i n   a   3 - i t e m   l i s t   t h e n   a l l   o u t - o f - r a n g e   i n d e x e s   s h o u l d   b e   a l l o w e d ,   c . f .   ` s l i c e   l i s t ` ) 
 
 -   s h o u l d   ` s l i c e   l i s t `   r a i s e   - 1 7 2 8   o n   i n d e x   0 ?   ( c u r r e n t l y   r a i s e s   - 1 7 0 3   t o   i n d i c a t e   i n v a l i d   p a r a m e t e r   r a t h e r   t h a n   o u t   o f   r a n g e ) 
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
listObject��   ~ � � make a new list of specified length using the supplied value as padding; caution: padValue will not be copied, so should be an immutable type (e.g. number, string, constant; not date/list/record/script/reference)     � � ��   m a k e   a   n e w   l i s t   o f   s p e c i f i e d   l e n g t h   u s i n g   t h e   s u p p l i e d   v a l u e   a s   p a d d i n g ;   c a u t i o n :   p a d V a l u e   w i l l   n o t   b e   c o p i e d ,   s o   s h o u l d   b e   a n   i m m u t a b l e   t y p e   ( e . g .   n u m b e r ,   s t r i n g ,   c o n s t a n t ;   n o t   d a t e / l i s t / r e c o r d / s c r i p t / r e f e r e n c e ) v  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �� � ���   �   basic operations    � � � � "   b a s i c   o p e r a t i o n s �  � � � l     ��������  ��  ��   �  � � � i     � � � I     � � �
� .Lst:Instnull���     **** � o      �~�~ 0 thelist theList � �} � �
�} 
Valu � o      �|�| 0 thevalue theValue � �{ � �
�{ 
Befo � |�z�y ��x ��z  �y   � o      �w�w 0 beforeindex beforeIndex�x   � l      ��v�u � m      �t
�t 
msng�v  �u   � �s � �
�s 
Afte � |�r�q ��p ��r  �q   � o      �o�o 0 
afterindex 
afterIndex�p   � l      ��n�m � m      �l
�l 
msng�n  �m   � �k ��j
�k 
Conc � |�i�h ��g ��i  �h   � o      �f�f 0 isjoin isJoin�g   � l      ��e�d � m      �c
�c boovfals�e  �d  �j   � k    � � �  � � � l     �b � ��b   �.( In addition to inserting before/after the list's actual indexes, this also recognizes three 'virtual' indexes: the `after item` parameter uses index 0 and index `-length - 1` to indicate the start of the list; the `before item` parameter uses index `length + 1` to indicate the end of the list.     � � � �P   I n   a d d i t i o n   t o   i n s e r t i n g   b e f o r e / a f t e r   t h e   l i s t ' s   a c t u a l   i n d e x e s ,   t h i s   a l s o   r e c o g n i z e s   t h r e e   ' v i r t u a l '   i n d e x e s :   t h e   ` a f t e r   i t e m `   p a r a m e t e r   u s e s   i n d e x   0   a n d   i n d e x   ` - l e n g t h   -   1 `   t o   i n d i c a t e   t h e   s t a r t   o f   t h e   l i s t ;   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   u s e s   i n d e x   ` l e n g t h   +   1 `   t o   i n d i c a t e   t h e   e n d   o f   t h e   l i s t .   �  � � � l     �a � ��a   �~x Note that the `before item` parameter cannot indicate the end of a list using a negative index. (Problem: the next 'virtual' index after -1 would be 0, but index 0 is already used by the `after item` parameter to represent the *start* of a list, and it's easier to disallow `before item 0` than explain to user how 'index 0' can be at both the start *and* the end of a list.)    � � � ��   N o t e   t h a t   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   c a n n o t   i n d i c a t e   t h e   e n d   o f   a   l i s t   u s i n g   a   n e g a t i v e   i n d e x .   ( P r o b l e m :   t h e   n e x t   ' v i r t u a l '   i n d e x   a f t e r   - 1   w o u l d   b e   0 ,   b u t   i n d e x   0   i s   a l r e a d y   u s e d   b y   t h e   ` a f t e r   i t e m `   p a r a m e t e r   t o   r e p r e s e n t   t h e   * s t a r t *   o f   a   l i s t ,   a n d   i t ' s   e a s i e r   t o   d i s a l l o w   ` b e f o r e   i t e m   0 `   t h a n   e x p l a i n   t o   u s e r   h o w   ' i n d e x   0 '   c a n   b e   a t   b o t h   t h e   s t a r t   * a n d *   t h e   e n d   o f   a   l i s t . ) �  ��` � Q    � � � � � k   w � �  � � � h    
�_ ��_ 0 
listobject 
listObject � j     �^ ��^ 
0 _list_   � n       I    �]�\�] "0 aslistparameter asListParameter  o    
�[�[ 0 thelist theList �Z m   
  �  �Z  �\   o     �Y�Y 0 _support   � 	 Z   )
�X�W
 G     H     o    �V�V 0 isjoin isJoin =     l   �U�T I   �S
�S .corecnte****       **** J     �R o    �Q�Q 0 thevalue theValue�R   �P�O
�P 
kocl m    �N
�N 
list�O  �U  �T   m    �M�M   r     % J     # �L o     !�K�K 0 thevalue theValue�L   o      �J�J 0 thevalue theValue�X  �W  	  Z   *.  >  * -!"! o   * +�I�I 0 
afterindex 
afterIndex" m   + ,�H
�H 
msng k   0 �## $%$ Z  0 @&'�G�F& >  0 3()( o   0 1�E�E 0 beforeindex beforeIndex) m   1 2�D
�D 
msng' R   6 <�C*+
�C .ascrerr ****      � ***** m   : ;,, �-- � E x p e c t e d    b e f o r e   i t e m    O R    a f t e r   i t e m    p a r a m e t e r ,   b u t   r e c e i v e d   b o t h .+ �B.�A
�B 
errn. m   8 9�@�@�Y�A  �G  �F  % /0/ r   A N121 n  A L343 I   F L�?5�>�? (0 asintegerparameter asIntegerParameter5 676 o   F G�=�= 0 
afterindex 
afterIndex7 8�<8 m   G H99 �::  a f t e r   i t e m�<  �>  4 o   A F�;�; 0 _support  2 o      �:�: 0 
afterindex 
afterIndex0 ;<; r   O \=>= n  O Z?@? I   T Z�9A�8�9 (0 asbooleanparameter asBooleanParameterA BCB o   T U�7�7 0 isjoin isJoinC D�6D m   U VEE �FF  c o n c a t e n a t i o n�6  �8  @ o   O T�5�5 0 _support  > o      �4�4 0 isjoin isJoin< GHG Z  ] tIJ�3�2I A   ] `KLK o   ] ^�1�1 0 
afterindex 
afterIndexL m   ^ _�0�0  J r   c pMNM [   c nOPO [   c lQRQ l  c jS�/�.S n  c jTUT 1   f j�-
�- 
lengU n  c fVWV o   d f�,�, 
0 _list_  W o   c d�+�+ 0 
listobject 
listObject�/  �.  R o   j k�*�* 0 
afterindex 
afterIndexP m   l m�)�) N o      �(�( 0 
afterindex 
afterIndex�3  �2  H X�'X Z   u �YZ�&�%Y ?   u ~[\[ o   u v�$�$ 0 
afterindex 
afterIndex\ l  v }]�#�"] n  v }^_^ 1   y }�!
�! 
leng_ n  v y`a` o   w y� �  
0 _list_  a o   v w�� 0 
listobject 
listObject�#  �"  Z n  � �bcb I   � ��d�� 80 throwinvalidparameterindex throwInvalidParameterIndexd efe N   � �gg n   � �hih 9   � ��
� 
insli n   � �jkj 4   � ��l
� 
cobjl o   � ��� 0 
afterindex 
afterIndexk l  � �m��m e   � �nn n  � �opo o   � ��� 
0 _list_  p o   � ��� 0 
listobject 
listObject�  �  f q�q m   � �rr �ss  a f t e r   i t e m�  �  c o   � ��� 0 _support  �&  �%  �'   tut >  � �vwv o   � ��� 0 beforeindex beforeIndexw m   � ��
� 
msngu x�x k   �'yy z{z r   � �|}| n  � �~~ I   � ����� (0 asintegerparameter asIntegerParameter� ��� o   � ��� 0 beforeindex beforeIndex� ��� m   � ��� ���  b e f o r e   i t e m�  �   o   � ��� 0 _support  } o      �� 0 beforeindex beforeIndex{ ��� Z   � ������ ?   � ���� o   � ��
�
 0 beforeindex beforeIndex� m   � ��	�	  � r   � ���� \   � ���� o   � ��� 0 beforeindex beforeIndex� m   � ��� � o      �� 0 
afterindex 
afterIndex� ��� A   � ���� o   � ��� 0 beforeindex beforeIndex� m   � ���  � ��� r   � ���� [   � ���� l  � ����� n  � ���� 1   � �� 
�  
leng� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject�  �  � o   � ����� 0 beforeindex beforeIndex� o      ���� 0 
afterindex 
afterIndex�  � l  � ����� n  � ���� I   � �������� 80 throwinvalidparameterindex throwInvalidParameterIndex� ��� N   � ��� n   � ���� 8   � ���
�� 
insl� n   � ���� 4   � ����
�� 
cobj� o   � ����� 0 beforeindex beforeIndex� l  � ������� e   � ��� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject��  ��  � ���� m   � ��� ���  b e f o r e   i t e m��  ��  � o   � ����� 0 _support  � � � the `before item` parameter cannot identify the end of a list by negative index, so throw 'invalid index' error if `before item 0` is used   � ���   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   c a n n o t   i d e n t i f y   t h e   e n d   o f   a   l i s t   b y   n e g a t i v e   i n d e x ,   s o   t h r o w   ' i n v a l i d   i n d e x '   e r r o r   i f   ` b e f o r e   i t e m   0 `   i s   u s e d� ���� Z   �'������� G   ���� ?   � ���� o   � ����� 0 
afterindex 
afterIndex� l  � ������� n  � ���� 1   � ���
�� 
leng� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject��  ��  � A  ��� o  ���� 0 
afterindex 
afterIndex� m  ����  � n 	#��� I  #������� 80 throwinvalidparameterindex throwInvalidParameterIndex� ��� N  �� n  ��� 8  ��
�� 
insl� n  ��� 4  ���
�� 
cobj� o  ���� 0 beforeindex beforeIndex� l ������ e  �� n ��� o  ���� 
0 _list_  � o  ���� 0 
listobject 
listObject��  ��  � ���� m  �� ���  b e f o r e   i t e m��  ��  � o  	���� 0 _support  ��  ��  ��  �    l *.���� L  *.�� b  *-��� o  *+���� 0 thelist theList� o  +,���� 0 thevalue theValue� #  default is to append to list   � ��� :   d e f a u l t   i s   t o   a p p e n d   t o   l i s t ���� Z  /w����� =  /2��� o  /0���� 0 
afterindex 
afterIndex� m  01����  � L  5;�� b  5:��� o  56���� 0 thevalue theValue� n 69��� o  79���� 
0 _list_  � o  67���� 0 
listobject 
listObject� ��� =  >G��� o  >?���� 0 
afterindex 
afterIndex� n ?F��� 1  BF��
�� 
leng� n ?B��� o  @B���� 
0 _list_  � o  ?@���� 0 
listobject 
listObject� ���� L  JP�� b  JO��� n JM��� o  KM���� 
0 _list_  � o  JK���� 0 
listobject 
listObject� o  MN���� 0 thevalue theValue��  � L  Sw�� b  Sv��� b  Sd��� l Sb������ n  Sb��� 7 Vb��� 
�� 
cobj� m  \^����   o  _a���� 0 
afterindex 
afterIndex� n SV o  TV���� 
0 _list_   o  ST���� 0 
listobject 
listObject��  ��  � o  bc���� 0 thevalue theValue� l du���� n  du 7 gu��
�� 
cobj l mq���� [  mq	
	 o  no���� 0 
afterindex 
afterIndex
 m  op���� ��  ��   m  rt������ n dg o  eg���� 
0 _list_   o  de���� 0 
listobject 
listObject��  ��  ��   � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   � I  ������� 
0 _error    m  �� �   i n s e r t   i n t o   l i s t  o  ������ 0 etext eText  o  ������ 0 enumber eNumber  o  ������ 0 efrom eFrom �� o  ������ 
0 eto eTo��  ��  �`   �  !  l     ��������  ��  ��  ! "#" l     ��������  ��  ��  # $%$ i  ! $&'& I     ��()
�� .Lst:Delenull���     ****( o      ���� 0 thelist theList) ��*+
�� 
Indx* |����,��-��  ��  , o      ���� 0 theindex theIndex��  - l     .����. d      // m      ���� ��  ��  + ��01
�� 
FIdx0 |����2��3��  ��  2 o      ���� 0 
startindex 
startIndex��  3 l     4����4 m      ��
�� 
msng��  ��  1 ��5��
�� 
TIdx5 |����6��7��  ��  6 o      ���� 0 endindex endIndex��  7 l     8����8 m      ��
�� 
msng��  ��  ��  ' Q    �9:;9 k   �<< =>= h    
��?�� 0 
listobject 
listObject? j     ��@�� 
0 _list_  @ n    ABA I    ��C���� "0 aslistparameter asListParameterC DED o    
���� 0 thelist theListE F��F m   
 GG �HH  ��  ��  B o     ���� 0 _support  > IJI r    KLK n   MNM 1    ��
�� 
lengN n   OPO o    �� 
0 _list_  P o    �~�~ 0 
listobject 
listObjectL o      �}�} 0 
listlength 
listLengthJ QRQ Z   *ST�|�{S >   UVU o    �z�z 0 
startindex 
startIndexV m    �y
�y 
msngT r    &WXW n   $YZY I    $�x[�w�x (0 asintegerparameter asIntegerParameter[ \]\ o    �v�v 0 
startindex 
startIndex] ^�u^ m     __ �``  f r o m   i t e m�u  �w  Z o    �t�t 0 _support  X o      �s�s 0 
startindex 
startIndex�|  �{  R aba Z  + Bcd�r�qc >  + .efe o   + ,�p�p 0 endindex endIndexf m   , -�o
�o 
msngd r   1 >ghg n  1 <iji I   6 <�nk�m�n (0 asintegerparameter asIntegerParameterk lml o   6 7�l�l 0 endindex endIndexm n�kn m   7 8oo �pp  t o   i t e m�k  �m  j o   1 6�j�j 0 _support  h o      �i�i 0 endindex endIndex�r  �q  b qrq Z   C3st�hus F   C Nvwv =  C Fxyx o   C D�g�g 0 
startindex 
startIndexy m   D E�f
�f 
msngw =  I Lz{z o   I J�e�e 0 endindex endIndex{ m   J K�d
�d 
msngt k   Q �|| }~} r   Q ^� n  Q \��� I   V \�c��b�c (0 asintegerparameter asIntegerParameter� ��� o   V W�a�a 0 theindex theIndex� ��`� m   W X�� ���  i t e m�`  �b  � o   Q V�_�_ 0 _support  � o      �^�^ 0 
startindex 
startIndex~ ��� Z  _ p���]�\� A   _ b��� o   _ `�[�[ 0 
startindex 
startIndex� m   ` a�Z�Z  � r   e l��� [   e j��� [   e h��� o   e f�Y�Y 0 
listlength 
listLength� m   f g�X�X � o   h i�W�W 0 
startindex 
startIndex� o      �V�V 0 
startindex 
startIndex�]  �\  � ��� Z   q ����U�T� G   q |��� =   q t��� o   q r�S�S 0 
startindex 
startIndex� m   r s�R�R  � ?   w z��� o   w x�Q�Q 0 
startindex 
startIndex� o   x y�P�P 0 
listlength 
listLength� n   ���� I   � ��O��N�O 80 throwinvalidparameterindex throwInvalidParameterIndex� ��� N   � ��� n   � ���� 4   � ��M�
�M 
cobj� o   � ��L�L 0 
startindex 
startIndex� l  � ���K�J� e   � ��� n  � ���� o   � ��I�I 
0 _list_  � o   � ��H�H 0 
listobject 
listObject�K  �J  � ��G� m   � ��� ���  i t e m�G  �N  � o    ��F�F 0 _support  �U  �T  � ��E� r   � ���� o   � ��D�D 0 
startindex 
startIndex� o      �C�C 0 endindex endIndex�E  �h  u k   �3�� ��� Z   � �����B� =  � ���� o   � ��A�A 0 
startindex 
startIndex� m   � ��@
�@ 
msng� r   � ���� m   � ��?�? � o      �>�> 0 
startindex 
startIndex� ��� =  � ���� o   � ��=�= 0 endindex endIndex� m   � ��<
�< 
msng� ��;� r   � ���� o   � ��:�: 0 
listlength 
listLength� o      �9�9 0 endindex endIndex�;  �B  � ��� Z  � ����8�7� A   � ���� o   � ��6�6 0 
startindex 
startIndex� m   � ��5�5  � r   � ���� [   � ���� [   � ���� o   � ��4�4 0 
listlength 
listLength� m   � ��3�3 � o   � ��2�2 0 
startindex 
startIndex� o      �1�1 0 
startindex 
startIndex�8  �7  � ��� Z  � ����0�/� A   � ���� o   � ��.�. 0 endindex endIndex� m   � ��-�-  � r   � ���� [   � ���� [   � ���� o   � ��,�, 0 
listlength 
listLength� m   � ��+�+ � o   � ��*�* 0 endindex endIndex� o      �)�) 0 endindex endIndex�0  �/  � ��� Z   �!����(� G   � ���� =   � ���� o   � ��'�' 0 
startindex 
startIndex� m   � ��&�&  � ?   � ���� o   � ��%�% 0 
startindex 
startIndex� o   � ��$�$ 0 
listlength 
listLength� n  � ���� I   � ��#��"�# 80 throwinvalidparameterindex throwInvalidParameterIndex� ��� N   � ��� n   � ���� 4   � ��!�
�! 
cobj� o   � �� �  0 
startindex 
startIndex� l  � ����� e   � ��� n  � ���� o   � ��� 
0 _list_  � o   � ��� 0 
listobject 
listObject�  �  � ��� m   � ��� ���  f r o m   i t e m�  �"  � o   � ��� 0 _support  � ��� G   ���� =   � ��� o   � ��� 0 endindex endIndex� m   � ���  � ?  ��� o  �� 0 endindex endIndex� o  �� 0 
listlength 
listLength� ��� n � � I  ��� 80 throwinvalidparameterindex throwInvalidParameterIndex  N   n   4  �
� 
cobj o  �� 0 endindex endIndex l �� e  		 n 

 o  �� 
0 _list_   o  �� 0 
listobject 
listObject�  �   � m   �  t o   i t e m�  �    o  �� 0 _support  �  �(  � �
 Z "3�	� ?  "% o  "#�� 0 
startindex 
startIndex o  #$�� 0 endindex endIndex L  (/ n (. 2 +-�
� 
cobj n (+ o  )+�� 
0 _list_   o  ()�� 0 
listobject 
listObject�	  �  �
  r  Z  4h� =  47 o  45�� 0 
startindex 
startIndex m  56� �   k  :T   !"! Z :O#$����# G  :E%&% =  :='(' o  :;���� 0 
startindex 
startIndex( o  ;<���� 0 
listlength 
listLength& =  @C)*) o  @A���� 0 endindex endIndex* o  AB���� 0 
listlength 
listLength$ L  HK++ J  HJ����  ��  ��  " ,��, r  PT-.- J  PR����  . o      ���� 0 	startlist 	startList��  �   r  Wh/0/ n Wf121 7 Zf��34
�� 
cobj3 m  ^`���� 4 l ae5����5 \  ae676 o  bc���� 0 
startindex 
startIndex7 m  cd���� ��  ��  2 n WZ898 o  XZ���� 
0 _list_  9 o  WX���� 0 
listobject 
listObject0 o      ���� 0 	startlist 	startList :;: Z  i�<=��>< =  il?@? o  ij���� 0 endindex endIndex@ o  jk���� 0 
listlength 
listLength= r  osABA J  oq����  B o      ���� 0 endlist endList��  > r  v�CDC n v�EFE 7 y���GH
�� 
cobjG l }�I����I [  }�JKJ o  ~���� 0 endindex endIndexK m  ����� ��  ��  H m  ��������F n vyLML o  wy���� 
0 _list_  M o  vw���� 0 
listobject 
listObjectD o      ���� 0 endlist endList; N��N L  ��OO b  ��PQP o  ������ 0 	startlist 	startListQ o  ������ 0 endlist endList��  : R      ��RS
�� .ascrerr ****      � ****R o      ���� 0 etext eTextS ��TU
�� 
errnT o      ���� 0 enumber eNumberU ��VW
�� 
erobV o      ���� 0 efrom eFromW ��X��
�� 
errtX o      ���� 
0 eto eTo��  ; I  ����Y���� 
0 _error  Y Z[Z m  ��\\ �]]   d e l e t e   f r o m   l i s t[ ^_^ o  ������ 0 etext eText_ `a` o  ������ 0 enumber eNumbera bcb o  ������ 0 efrom eFromc d��d o  ������ 
0 eto eTo��  ��  % efe l     ��������  ��  ��  f ghg l     ��������  ��  ��  h iji i  % (klk I     ��m��
�� .Lst:RDuLnull���     ****m o      ���� 0 thelist theList��  l Q     �nopn k    �qq rsr h    
��t�� 0 
listobject 
listObjectt j     ��u�� 
0 _list_  u n    vwv 2   ��
�� 
cobjw n    xyx I    ��z���� "0 aslistparameter asListParameterz {��{ o    
���� 0 thelist theList��  ��  y o     ���� 0 _support  s |}| l   ��~��  ~jd not the fastest algorithm as it's O(Nn) (the repeat loop is O(N) and each `is in` test is O(n)), but simple and consistent with AS's existing behaviors (for large lists it'd be more efficient to put each item into an NSMutableSet where practical then check for uniqueness against that, but that wouldn't respect AS's current considering/ignoring settings)    ����   n o t   t h e   f a s t e s t   a l g o r i t h m   a s   i t ' s   O ( N n )   ( t h e   r e p e a t   l o o p   i s   O ( N )   a n d   e a c h   ` i s   i n `   t e s t   i s   O ( n ) ) ,   b u t   s i m p l e   a n d   c o n s i s t e n t   w i t h   A S ' s   e x i s t i n g   b e h a v i o r s   ( f o r   l a r g e   l i s t s   i t ' d   b e   m o r e   e f f i c i e n t   t o   p u t   e a c h   i t e m   i n t o   a n   N S M u t a b l e S e t   w h e r e   p r a c t i c a l   t h e n   c h e c k   f o r   u n i q u e n e s s   a g a i n s t   t h a t ,   b u t   t h a t   w o u l d n ' t   r e s p e c t   A S ' s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s )} ��� r    *��� J    �� ��� m    ���� � ��� m    ���� � ���� n   ��� 1    ��
�� 
leng� n   ��� o    ���� 
0 _list_  � o    ���� 0 
listobject 
listObject��  � J      �� ��� o      ���� 0 i  � ��� o      ���� 0 u  � ���� o      ���� 0 
listlength 
listLength��  � ��� Z  + 8������� =   + .��� o   + ,���� 0 
listlength 
listLength� m   , -����  � L   1 4�� J   1 3����  ��  ��  � ��� W   9 ���� k   A ��� ��� V   A ���� k   \ {�� ��� r   \ a��� [   \ _��� o   \ ]���� 0 i  � m   ] ^���� � o      ���� 0 i  � ���� Z  b {������� ?   b e��� o   b c���� 0 i  � o   c d���� 0 
listlength 
listLength� L   h w�� n  h v��� 7  k u����
�� 
cobj� m   o q���� � o   r t���� 0 u  � n  h k��� o   i k���� 
0 _list_  � o   h i���� 0 
listobject 
listObject��  ��  ��  � E  E [��� n  E R��� 7  H R����
�� 
cobj� m   L N���� � o   O Q���� 0 u  � n  E H��� o   F H���� 
0 _list_  � o   E F���� 0 
listobject 
listObject� J   R Z�� ���� n  R X��� 4   U X���
�� 
cobj� o   V W���� 0 i  � n  R U��� o   S U���� 
0 _list_  � o   R S���� 0 
listobject 
listObject��  � ��� r   � ���� [   � ���� o   � ����� 0 u  � m   � ����� � o      ���� 0 u  � ��� r   � ���� n  � ���� 4   � ����
�� 
cobj� o   � ����� 0 i  � n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject� n     ��� 4   � ����
�� 
cobj� o   � ����� 0 u  � n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject� ���� r   � ���� [   � ���� o   � ����� 0 i  � m   � ����� � o      ���� 0 i  ��  � ?   = @��� o   = >���� 0 i  � o   > ?���� 0 
listlength 
listLength� ���� L   � ��� n  � ���� 7  � �����
�� 
cobj� m   � ����� � o   � ��� 0 u  � n  � ���� o   � ��~�~ 
0 _list_  � o   � ��}�} 0 
listobject 
listObject��  o R      �|��
�| .ascrerr ****      � ****� o      �{�{ 0 etext eText� �z��
�z 
errn� o      �y�y 0 enumber eNumber� �x��
�x 
erob� o      �w�w 0 efrom eFrom� �v��u
�v 
errt� o      �t�t 
0 eto eTo�u  p I   � ��s��r�s 
0 _error  � ��� m   � ��� ��� 6 r e m o v e   d u p l i c a t e s   f r o m   l i s t� ��� o   � ��q�q 0 etext eText� ��� o   � ��p�p 0 enumber eNumber� ��� o   � ��o�o 0 efrom eFrom� ��n� o   � ��m�m 
0 eto eTo�n  �r  j ��� l     �l�k�j�l  �k  �j  � � � l     �i�h�g�i  �h  �g     i  ) , I     �f
�f .Lst:SliLnull���     **** o      �e�e 0 thelist theList �d
�d 
FIdx |�c�b	�a
�c  �b  	 o      �`�` 0 
startindex 
startIndex�a  
 l     �_�^ m      �]
�] 
msng�_  �^   �\�[
�\ 
TIdx |�Z�Y�X�Z  �Y   o      �W�W 0 endindex endIndex�X   l     �V�U m      �T
�T 
msng�V  �U  �[   Q    � k   �  r     n    I    �S�R�S "0 aslistparameter asListParameter �Q o    	�P�P 0 thelist theList�Q  �R   o    �O�O 0 _support   o      �N�N 0 thelist theList  r     n    !  1    �M
�M 
leng! o    �L�L 0 thelist theList o      �K�K 0 	thelength 	theLength "#" Z    �$%&�J$ >   '(' o    �I�I 0 
startindex 
startIndex( m    �H
�H 
msng% k    t)) *+* r    ),-, n   './. I   ! '�G0�F�G (0 asintegerparameter asIntegerParameter0 121 o   ! "�E�E 0 
startindex 
startIndex2 3�D3 m   " #44 �55  f r o m   i t e m�D  �F  / o    !�C�C 0 _support  - o      �B�B 0 
startindex 
startIndex+ 676 l  * *�A89�A  8 J D note: index 0 is disallowed as it makes behavior confusing to users   9 �:: �   n o t e :   i n d e x   0   i s   d i s a l l o w e d   a s   i t   m a k e s   b e h a v i o r   c o n f u s i n g   t o   u s e r s7 ;<; Z  * A=>�@�?= =   * -?@? o   * +�>�> 0 
startindex 
startIndex@ m   + ,�=�=  > n  0 =ABA I   5 =�<C�;�< .0 throwinvalidparameter throwInvalidParameterC DED o   5 6�:�: 0 
startindex 
startIndexE FGF m   6 7HH �II  f r o m   i t e mG JKJ m   7 8�9
�9 
longK L�8L m   8 9MM �NN " I n d e x   c a n  t   b e   0 .�8  �;  B o   0 5�7�7 0 _support  �@  �?  < O�6O Z   B tPQ�5�4P =  B ERSR o   B C�3�3 0 endindex endIndexS m   C D�2
�2 
msngQ Z   H pTUVWT A   H LXYX o   H I�1�1 0 
startindex 
startIndexY d   I KZZ o   I J�0�0 0 	thelength 	theLengthU L   O T[[ n  O S\]\ 2  P R�/
�/ 
cobj] o   O P�.�. 0 thelist theListV ^_^ ?   W Z`a` o   W X�-�- 0 
startindex 
startIndexa o   X Y�,�, 0 	thelength 	theLength_ b�+b L   ] `cc J   ] _�*�*  �+  W L   c pdd n  c oefe 7  d n�)gh
�) 
cobjg o   h j�(�( 0 
startindex 
startIndexh m   k m�'�'��f o   c d�&�& 0 thelist theList�5  �4  �6  & iji =  w zklk o   w x�%�% 0 endindex endIndexl m   x y�$
�$ 
msngj m�#m R   } ��"no
�" .ascrerr ****      � ****n m   � �pp �qq � E x p e c t e d    f r o m   i t e m    a n d / o r    t o   i t e m    p a r a m e t e r   b u t   r e c e i v e d   n e i t h e r .o �!r� 
�! 
errnr m    ����[�   �#  �J  # sts Z   � �uv��u >  � �wxw o   � ��� 0 endindex endIndexx m   � ��
� 
msngv k   � �yy z{z r   � �|}| n  � �~~ I   � ����� (0 asintegerparameter asIntegerParameter� ��� o   � ��� 0 endindex endIndex� ��� m   � ��� ���  t o   i t e m�  �   o   � ��� 0 _support  } o      �� 0 endindex endIndex{ ��� Z  � ������ =   � ���� o   � ��� 0 endindex endIndex� m   � ���  � n  � ���� I   � ����� .0 throwinvalidparameter throwInvalidParameter� ��� o   � ��� 0 endindex endIndex� ��� m   � ��� ���  t o   i t e m� ��� m   � ��
� 
long� ��� m   � ��� ��� " I n d e x   c a n  t   b e   0 .�  �  � o   � ��� 0 _support  �  �  � ��
� Z   � ����	�� =  � ���� o   � ��� 0 
startindex 
startIndex� m   � ��
� 
msng� Z   � ������ A   � ���� o   � ��� 0 endindex endIndex� d   � ��� o   � ��� 0 	thelength 	theLength� L   � ��� J   � ���  � ��� ?   � ���� o   � ��� 0 endindex endIndex� o   � ��� 0 	thelength 	theLength� �� � L   � ��� n  � ���� 2  � ���
�� 
cobj� o   � ����� 0 thelist theList�   � L   � ��� n  � ���� 7  � �����
�� 
cobj� m   � ����� � o   � ����� 0 endindex endIndex� o   � ����� 0 thelist theList�	  �  �
  �  �  t ��� l  � �������  � + % both start and end indexes are given   � ��� J   b o t h   s t a r t   a n d   e n d   i n d e x e s   a r e   g i v e n� ��� Z  � �������� A   � ���� o   � ����� 0 
startindex 
startIndex� m   � �����  � r   � ���� [   � ���� [   � ���� o   � ����� 0 	thelength 	theLength� m   � ����� � o   � ����� 0 
startindex 
startIndex� o      ���� 0 
startindex 
startIndex��  ��  � ��� Z  �������� A   ���� o   � ���� 0 endindex endIndex� m   ����  � r  ��� [  
��� [  ��� o  ���� 0 	thelength 	theLength� m  ���� � o  	���� 0 endindex endIndex� o      ���� 0 endindex endIndex��  ��  � ��� Z F������� G  <��� G  (��� ?  ��� o  ���� 0 
startindex 
startIndex� o  ���� 0 endindex endIndex� F  $��� A  ��� o  ���� 0 
startindex 
startIndex� m  ���� � A   ��� o  ���� 0 endindex endIndex� l 
������ m  ���� ��  ��  � F  +8��� ?  +.��� o  +,���� 0 
startindex 
startIndex� o  ,-���� 0 	thelength 	theLength� ?  14��� o  12���� 0 endindex endIndex� o  23���� 0 	thelength 	theLength� L  ?B�� J  ?A����  ��  ��  � ��� Z  G`������ A  GJ��� o  GH���� 0 
startindex 
startIndex� m  HI���� � r  MP��� m  MN���� � o      ���� 0 
startindex 
startIndex� ��� ?  SV��� o  ST���� 0 
startindex 
startIndex� o  TU���� 0 	thelength 	theLength� ���� r  Y\��� o  YZ���� 0 	thelength 	theLength� o      ���� 0 
startindex 
startIndex��  ��  � ��� Z  az������ A  ad��� o  ab���� 0 endindex endIndex� m  bc���� � r  gj   m  gh����  o      ���� 0 endindex endIndex�  ?  mp o  mn���� 0 endindex endIndex o  no���� 0 	thelength 	theLength �� r  sv o  st���� 0 	thelength 	theLength o      ���� 0 endindex endIndex��  ��  � 	��	 L  {�

 n  {� 7 |���
�� 
cobj o  ������ 0 
startindex 
startIndex o  ������ 0 endindex endIndex o  {|���� 0 thelist theList��   R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   I  �������� 
0 _error    m  �� �  s l i c e   l i s t  o  ������ 0 etext eText  o  ������ 0 enumber eNumber   o  ������ 0 efrom eFrom  !��! o  ������ 
0 eto eTo��  ��   "#" l     ��������  ��  ��  # $%$ l     ��������  ��  ��  % &'& i  - 0()( I     ��*+
�� .Lst:Trannull���     ***** o      ���� 0 thelist theList+ ��,-
�� 
Whil, |����.��/��  ��  . o      ���� 0 unevenoption unevenOption��  / l     0����0 m      ��
�� LTrhLTrR��  ��  - ��1��
�� 
PadI1 |����2��3��  ��  2 o      ���� 0 padvalue padValue��  3 l     4����4 m      ��
�� 
msng��  ��  ��  ) Q    �5675 k   �88 9:9 Z   ;<����; =   =>= o    ���� 0 thelist theList> J    ����  < L   
 ?? J   
 ����  ��  ��  : @A@ Z    CBC����B G    /DED =    FGF l   H����H I   ��IJ
�� .corecnte****       ****I J    KK L��L o    ���� 0 thelist theList��  J ��M��
�� 
koclM m    ��
�� 
list��  ��  ��  G m    ����  E >     -NON l    'P����P I    '��QR
�� .corecnte****       ****Q o     !���� 0 thelist theListR ��S��
�� 
koclS m   " #��
�� 
list��  ��  ��  O l  ' ,T���T I  ' ,�~U�}
�~ .corecnte****       ****U o   ' (�|�| 0 thelist theList�}  ��  �  C n  2 ?VWV I   7 ?�{X�z�{ .0 throwinvalidparameter throwInvalidParameterX YZY o   7 8�y�y 0 thelist theListZ [\[ m   8 9]] �^^  \ _`_ m   9 :�x
�x 
list` a�wa m   : ;bb �cc ( N o t   a   l i s t   o f   l i s t s .�w  �z  W o   2 7�v�v 0 _support  ��  ��  A ded h   D K�uf�u 0 
listobject 
listObjectf k      gg hih j     �tj�t 
0 _list_  j o     �s�s 0 thelist theListi k�rk j    
�ql�q 0 _resultlist_ _resultList_l J    	�p�p  �r  e mnm r   L Vopo n   L Tqrq 1   R T�o
�o 
lengr n  L Rsts 4   O R�nu
�n 
cobju m   P Q�m�m t n  L Ovwv o   M O�l�l 
0 _list_  w o   L M�k�k 0 
listobject 
listObjectp o      �j�j $0 resultlistlength resultListLengthn xyx l  W W�iz{�i  z K E find the longest/shortest sublist; this will be length of resultList   { �|| �   f i n d   t h e   l o n g e s t / s h o r t e s t   s u b l i s t ;   t h i s   w i l l   b e   l e n g t h   o f   r e s u l t L i s ty }~} Z   W��� =  W Z��� o   W X�h�h 0 unevenoption unevenOption� m   X Y�g
�g LTrhLTrR� X   ] ���f�� Z  o ����e�d� >   o t��� n  o r��� 1   p r�c
�c 
leng� o   o p�b�b 0 aref aRef� o   r s�a�a $0 resultlistlength resultListLength� n  w ���� I   | ��`��_�` .0 throwinvalidparameter throwInvalidParameter� ��� o   | }�^�^ 0 thelist theList� ��� m   } ~�� ���  � ��� m   ~ �]
�] 
list� ��\� m    ��� ��� B S u b l i s t s   a r e   n o t   a l l   s a m e   l e n g t h .�\  �_  � o   w |�[�[ 0 _support  �e  �d  �f 0 aref aRef� n  ` c��� o   a c�Z�Z 
0 _list_  � o   ` a�Y�Y 0 
listobject 
listObject� ��� =  � ���� o   � ��X�X 0 unevenoption unevenOption� m   � ��W
�W LTrhLTrP� ��� X   � ���V�� Z  � ����U�T� ?   � ���� n  � ���� 1   � ��S
�S 
leng� o   � ��R�R 0 aref aRef� o   � ��Q�Q $0 resultlistlength resultListLength� r   � ���� n  � ���� 1   � ��P
�P 
leng� o   � ��O�O 0 aref aRef� o      �N�N $0 resultlistlength resultListLength�U  �T  �V 0 aref aRef� n  � ���� o   � ��M�M 
0 _list_  � o   � ��L�L 0 
listobject 
listObject� ��� =  � ���� o   � ��K�K 0 unevenoption unevenOption� m   � ��J
�J LTrhLTrT� ��I� X   � ���H�� Z  � ����G�F� A   � ���� n  � ���� 1   � ��E
�E 
leng� o   � ��D�D 0 aref aRef� o   � ��C�C $0 resultlistlength resultListLength� r   � ���� n  � ���� 1   � ��B
�B 
leng� o   � ��A�A 0 aref aRef� o      �@�@ $0 resultlistlength resultListLength�G  �F  �H 0 aref aRef� n  � ���� o   � ��?�? 
0 _list_  � o   � ��>�> 0 
listobject 
listObject�I  � n  ���� I   ��=��<�= >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   � ��;�; 0 unevenoption unevenOption� ��:� m   ��� ���  b y�:  �<  � o   � ��9�9 0 _support  ~ ��� Z  ����8�7� ?  	��� o  �6�6 $0 resultlistlength resultListLength� m  �5�5  � k  ��� ��� l �4���4  � � � build empty matrix (due to inefficiencies of AS's list implementation, when populating large lists, it's probably quicker to create a padded list then set its items rather than start with an empty list and append items)   � ����   b u i l d   e m p t y   m a t r i x   ( d u e   t o   i n e f f i c i e n c i e s   o f   A S ' s   l i s t   i m p l e m e n t a t i o n ,   w h e n   p o p u l a t i n g   l a r g e   l i s t s ,   i t ' s   p r o b a b l y   q u i c k e r   t o   c r e a t e   a   p a d d e d   l i s t   t h e n   s e t   i t s   i t e m s   r a t h e r   t h a n   s t a r t   w i t h   a n   e m p t y   l i s t   a n d   a p p e n d   i t e m s )� ��� r  ��� n  ��� 1  �3
�3 
leng� n ��� o  �2�2 
0 _list_  � o  �1�1 0 
listobject 
listObject� o      �0�0 *0 resultsublistlength resultSubListLength� ��� r  ��� I  �/��.�/ "0 _makelistobject _makeListObject� ��� o  �-�- *0 resultsublistlength resultSubListLength� ��,� o  �+�+ 0 padvalue padValue�,  �.  � o      �*�* 0 resultsublist resultSubList� ��� r  &��� o  �)�) 0 resultsublist resultSubList� n      ���  ;  $%� n $��� o   $�(�( 0 _resultlist_ _resultList_� o   �'�' 0 
listobject 
listObject� ��� Y  'A��&���%� l 1<���� r  1<��� l 15��$�#� e  15�� n 15��� 2 24�"
�" 
cobj� o  12�!�! 0 resultsublist resultSubList�$  �#  � n      ���  ;  :;� n 5:   o  6:� �  0 _resultlist_ _resultList_ o  56�� 0 
listobject 
listObject�   shallow copy   � �    s h a l l o w   c o p y�& 0 i  � m  *+�� � o  +,�� $0 resultlistlength resultListLength�%  �  l BB��     populate matrix    �     p o p u l a t e   m a t r i x � Z  B�	
�	 = BG o  BC�� 0 unevenoption unevenOption m  CF�
� LTrhLTrP
 Y  J��� Y  T��� r  f{ n  fo 4  lo�
� 
cobj o  mn�� 0 j   n  fl 4  il�
� 
cobj o  jk�� 0 i   n fi o  gi�� 
0 _list_   o  fg�� 0 
listobject 
listObject n       4  wz� 
� 
cobj  o  xy�� 0 i   n  ow!"! 4  tw�#
� 
cobj# o  uv�
�
 0 j  " n ot$%$ o  pt�	�	 0 _resultlist_ _resultList_% o  op�� 0 
listobject 
listObject� 0 j   m  WX��  n  Xa&'& 1  ^`�
� 
leng' n X^()( 4  [^�*
� 
cobj* o  \]�� 0 i  ) n X[+,+ o  Y[�� 
0 _list_  , o  XY�� 0 
listobject 
listObject�  � 0 i   m  MN��  o  NO� �  *0 resultsublistlength resultSubListLength�  �   Y  ��-��./��- Y  ��0��12��0 r  ��343 n  ��565 4  ����7
�� 
cobj7 o  ������ 0 j  6 n  ��898 4  ����:
�� 
cobj: o  ������ 0 i  9 n ��;<; o  ������ 
0 _list_  < o  ������ 0 
listobject 
listObject4 n      =>= 4  ����?
�� 
cobj? o  ������ 0 i  > n  ��@A@ 4  ����B
�� 
cobjB o  ������ 0 j  A n ��CDC o  ������ 0 _resultlist_ _resultList_D o  ������ 0 
listobject 
listObject�� 0 j  1 m  ������ 2 o  ������ $0 resultlistlength resultListLength��  �� 0 i  . m  ������ / o  ������ *0 resultsublistlength resultSubListLength��  �  �8  �7  � E��E L  ��FF n ��GHG o  ������ 0 _resultlist_ _resultList_H o  ������ 0 
listobject 
listObject��  6 R      ��IJ
�� .ascrerr ****      � ****I o      ���� 0 etext eTextJ ��KL
�� 
errnK o      ���� 0 enumber eNumberL ��MN
�� 
erobM o      ���� 0 efrom eFromN ��O��
�� 
errtO o      ���� 
0 eto eTo��  7 I  ����P���� 
0 _error  P QRQ m  ��SS �TT  t r a n s p o s e   l i s tR UVU o  ������ 0 etext eTextV WXW o  ������ 0 enumber eNumberX YZY o  ������ 0 efrom eFromZ [��[ o  ������ 
0 eto eTo��  ��  ' \]\ l     ��������  ��  ��  ] ^_^ l     ��������  ��  ��  _ `a` l     ��bc��  b J D--------------------------------------------------------------------   c �dd � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -a efe l     ��gh��  g   search   h �ii    s e a r c hf jkj l     ��������  ��  ��  k lml i  1 4non I     ��pq
�� .Lst:Findnull���     ****p o      ���� 0 thelist theListq ��rs
�� 
Valur |����t��u��  ��  t o      ���� 0 theitem theItem��  u l     v����v m      ��
�� 
msng��  ��  s ��wx
�� 
Usinw |����y��z��  ��  y o      ���� 0 	thescript 	theScript��  z l     {����{ m      ��
�� 
msng��  ��  x ��|��
�� 
Retu| |����}��~��  ��  } o      ���� (0 findingoccurrences findingOccurrences��  ~ l     ���� m      ��
�� LFWhLFWA��  ��  ��  o Q    ����� k   ��� ��� h    
����� 0 
listobject 
listObject� k      �� ��� j     ����� 
0 _list_  � n    ��� I    ������� "0 aslistparameter asListParameter� ��� o    
���� 0 thelist theList� ���� m   
 �� ���  ��  ��  � o     ���� 0 _support  � ���� j    ����� 0 _result_  � J    ����  ��  � ��� Z   ����� =   ��� o    ���� (0 findingoccurrences findingOccurrences� m    ��
�� LFWhLFWA� Z    }������ =   ��� o    ���� 0 	thescript 	theScript� m    ��
�� 
msng� Y    @�������� Z   & ;������� =  & .��� n   & ,��� 4   ) ,���
�� 
cobj� o   * +���� 0 i  � n  & )��� o   ' )���� 
0 _list_  � o   & '���� 0 
listobject 
listObject� o   , -���� 0 theitem theItem� r   1 7��� o   1 2���� 0 i  � n      ���  ;   5 6� n  2 5��� o   3 5���� 0 _result_  � o   2 3���� 0 
listobject 
listObject��  ��  �� 0 i  � m    ���� � n    !��� 1     ��
�� 
leng� n   ��� o    ���� 
0 _list_  � o    ���� 0 
listobject 
listObject��  ��  � k   C }�� ��� r   C P��� n  C N��� I   H N������� &0 asscriptparameter asScriptParameter� ��� o   H I���� 0 	thescript 	theScript� ���� m   I J�� ��� 
 u s i n g��  ��  � o   C H���� 0 _support  � o      ���� 0 	thescript 	theScript� ���� Y   Q }�������� Z   ` x������� n  ` k��� I   a k������� 0 
filteritem 
filterItem� ���� n   a g��� 4   d g���
�� 
cobj� o   e f���� 0 i  � n  a d��� o   b d���� 
0 _list_  � o   a b���� 0 
listobject 
listObject��  ��  � o   ` a���� 0 	thescript 	theScript� r   n t��� o   n o���� 0 i  � n      ���  ;   r s� n  o r��� o   p r�� 0 _result_  � o   o p�~�~ 0 
listobject 
listObject��  ��  �� 0 i  � m   T U�}�} � n   U [��� 1   X Z�|
�| 
leng� n  U X��� o   V X�{�{ 
0 _list_  � o   U V�z�z 0 
listobject 
listObject��  ��  � ��� =  � ���� o   � ��y�y (0 findingoccurrences findingOccurrences� m   � ��x
�x LFWhLFWF� ��� Z   � ����w�� =  � ���� o   � ��v�v 0 	thescript 	theScript� m   � ��u
�u 
msng� Y   � ���t���s� Z   � ����r�q� =  � ���� n   � ���� 4   � ��p�
�p 
cobj� o   � ��o�o 0 i  � n  � ���� o   � ��n�n 
0 _list_  � o   � ��m�m 0 
listobject 
listObject� o   � ��l�l 0 theitem theItem� k   � ��� ��� r   � ���� o   � ��k�k 0 i  � n      ���  ;   � �� n  � ���� o   � ��j�j 0 _result_  � o   � ��i�i 0 
listobject 
listObject� ��h�  S   � ��h  �r  �q  �t 0 i  � m   � ��g�g � n   � �� � 1   � ��f
�f 
leng  n  � � o   � ��e�e 
0 _list_   o   � ��d�d 0 
listobject 
listObject�s  �w  � k   � �  r   � � n  � �	 I   � ��c
�b�c &0 asscriptparameter asScriptParameter
  o   � ��a�a 0 	thescript 	theScript �` m   � � � 
 u s i n g�`  �b  	 o   � ��_�_ 0 _support   o      �^�^ 0 	thescript 	theScript �] Y   � ��\�[ Z   � ��Z�Y n  � � I   � ��X�W�X 0 
filteritem 
filterItem �V n   � � 4   � ��U
�U 
cobj o   � ��T�T 0 i   n  � � o   � ��S�S 
0 _list_   o   � ��R�R 0 
listobject 
listObject�V  �W   o   � ��Q�Q 0 	thescript 	theScript k   � �  !  r   � �"#" o   � ��P�P 0 i  # n      $%$  ;   � �% n  � �&'& o   � ��O�O 0 _result_  ' o   � ��N�N 0 
listobject 
listObject! (�M(  S   � ��M  �Z  �Y  �\ 0 i   m   � ��L�L  n   � �)*) 1   � ��K
�K 
leng* n  � �+,+ o   � ��J�J 
0 _list_  , o   � ��I�I 0 
listobject 
listObject�[  �]  � -.- =  � �/0/ o   � ��H�H (0 findingoccurrences findingOccurrences0 m   � ��G
�G LFWhLFWL. 1�F1 Z   �o23�E42 =  �565 o   � �D�D 0 	thescript 	theScript6 m   �C
�C 
msng3 Y  07�B89:7 Z  +;<�A�@; = =>= n  ?@? 4  �?A
�? 
cobjA o  �>�> 0 i  @ n BCB o  �=�= 
0 _list_  C o  �<�< 0 
listobject 
listObject> o  �;�; 0 theitem theItem< k  'DD EFE r  %GHG o   �:�: 0 i  H n      IJI  ;  #$J n  #KLK o  !#�9�9 0 _result_  L o   !�8�8 0 
listobject 
listObjectF M�7M  S  &'�7  �A  �@  �B 0 i  8 n  NON 1  �6
�6 
lengO n PQP o  	�5�5 
0 _list_  Q o  	�4�4 0 
listobject 
listObject9 m  �3�3 : m  �2�2���E  4 k  3oRR STS r  3@UVU n 3>WXW I  8>�1Y�0�1 &0 asscriptparameter asScriptParameterY Z[Z o  89�/�/ 0 	thescript 	theScript[ \�.\ m  9:]] �^^ 
 u s i n g�.  �0  X o  38�-�- 0 _support  V o      �,�, 0 	thescript 	theScriptT _�+_ Y  Ao`�*abc` Z  Pjde�)�(d n P[fgf I  Q[�'h�&�' 0 
filteritem 
filterItemh i�%i n  QWjkj 4  TW�$l
�$ 
cobjl o  UV�#�# 0 i  k n QTmnm o  RT�"�" 
0 _list_  n o  QR�!�! 0 
listobject 
listObject�%  �&  g o  PQ� �  0 	thescript 	theScripte k  ^foo pqp r  ^drsr o  ^_�� 0 i  s n      tut  ;  bcu n _bvwv o  `b�� 0 _result_  w o  _`�� 0 
listobject 
listObjectq x�x  S  ef�  �)  �(  �* 0 i  a n  DJyzy 1  GI�
� 
lengz n DG{|{ o  EG�� 
0 _list_  | o  DE�� 0 
listobject 
listObjectb m  JK�� c m  KL�����+  �F  � n r}~} I  w��� >0 throwinvalidconstantparameter throwInvalidConstantParameter ��� o  wx�� (0 findingoccurrences findingOccurrences� ��� m  x{�� ���  r e t u r n i n g�  �  ~ o  rw�� 0 _support  � ��� L  ���� n ����� o  ���� 0 _result_  � o  ���� 0 
listobject 
listObject�  � R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� �
��
�
 
erob� o      �	�	 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � I  ������ 
0 _error  � ��� m  ���� ���  f i n d   i n   l i s t� ��� o  ���� 0 etext eText� ��� o  ���� 0 enumber eNumber� ��� o  ���� 0 efrom eFrom� �� � o  ������ 
0 eto eTo�   �  m ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �ZT map, filter, reduce (these operations are relatively trivial to perform in AS without the need for callbacks; however, these handlers are more flexible when the convert/check/combine operations are parameterized and also provide more advanced users with idiomatic examples of how to parameterize a general-purpose handler's exact behavior)   � ����   m a p ,   f i l t e r ,   r e d u c e   ( t h e s e   o p e r a t i o n s   a r e   r e l a t i v e l y   t r i v i a l   t o   p e r f o r m   i n   A S   w i t h o u t   t h e   n e e d   f o r   c a l l b a c k s ;   h o w e v e r ,   t h e s e   h a n d l e r s   a r e   m o r e   f l e x i b l e   w h e n   t h e   c o n v e r t / c h e c k / c o m b i n e   o p e r a t i o n s   a r e   p a r a m e t e r i z e d   a n d   a l s o   p r o v i d e   m o r e   a d v a n c e d   u s e r s   w i t h   i d i o m a t i c   e x a m p l e s   o f   h o w   t o   p a r a m e t e r i z e   a   g e n e r a l - p u r p o s e   h a n d l e r ' s   e x a c t   b e h a v i o r )� ��� l     ��������  ��  ��  � ��� l     ������  � � � note: while these handlers prevent the script object from modifying the input list directly, it cannot stop them modifying mutable (date/list/record/script/reference) items within the input list (doing so would be very bad practice, however)   � ����   n o t e :   w h i l e   t h e s e   h a n d l e r s   p r e v e n t   t h e   s c r i p t   o b j e c t   f r o m   m o d i f y i n g   t h e   i n p u t   l i s t   d i r e c t l y ,   i t   c a n n o t   s t o p   t h e m   m o d i f y i n g   m u t a b l e   ( d a t e / l i s t / r e c o r d / s c r i p t / r e f e r e n c e )   i t e m s   w i t h i n   t h e   i n p u t   l i s t   ( d o i n g   s o   w o u l d   b e   v e r y   b a d   p r a c t i c e ,   h o w e v e r )� ��� l     ��������  ��  ��  � ��� i  5 8��� I     ����
�� .Lst:Map_null���     ****� o      ���� 0 thelist theList� �����
�� 
Usin� o      ���� 0 	thescript 	theScript��  � Q     ����� k    ��� ��� h    
����� $0 resultlistobject resultListObject� j     ����� 
0 _list_  � n     ��� 2   ��
�� 
cobj� n    ��� I    ������� "0 aslistparameter asListParameter� ��� o    
���� 0 thelist theList� ���� m   
 �� ���  ��  ��  � o     ���� 0 _support  � ��� r    ��� n   ��� I    ������� &0 asscriptparameter asScriptParameter� ��� o    ���� 0 	thescript 	theScript� ���� m    �� ��� 
 u s i n g��  ��  � o    ���� 0 _support  � o      ���� 0 	thescript 	theScript� ��� Q    ����� Y    B�������� l  + =���� r   + =��� n  + 6��� I   , 6������� 0 mapitem mapItem� ���� n   , 2��� 4   / 2���
�� 
cobj� o   0 1���� 0 i  � n  , /��� o   - /���� 
0 _list_  � o   , -���� $0 resultlistobject resultListObject��  ��  � o   + ,���� 0 	thescript 	theScript� n      ��� 4   9 <���
�� 
cobj� o   : ;���� 0 i  � n  6 9��� o   7 9���� 
0 _list_  � o   6 7���� $0 resultlistobject resultListObject� � ~ use counting loop rather than `repeat with aRef in theList` as the item's index is also used when constructing error messages   � ��� �   u s e   c o u n t i n g   l o o p   r a t h e r   t h a n   ` r e p e a t   w i t h   a R e f   i n   t h e L i s t `   a s   t h e   i t e m ' s   i n d e x   i s   a l s o   u s e d   w h e n   c o n s t r u c t i n g   e r r o r   m e s s a g e s�� 0 i  � m     ���� � n     &��� 1   # %��
�� 
leng� n    #��� o   ! #���� 
0 _list_  � o     !���� $0 resultlistobject resultListObject��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� �����
�� 
errt� o      ���� 
0 eto eTo��  � k   J ��� ��� Z   J h ��  ?   J M o   J K���� 0 i   m   K L����  r   P a n   P _ 7  S _��	

�� 
cobj	 m   W Y���� 
 l  Z ^���� \   Z ^ o   [ \���� 0 i   m   \ ]���� ��  ��   n  P S o   Q S���� 
0 _list_   o   P Q���� $0 resultlistobject resultListObject o      ���� 0 epartial ePartial��   r   d h J   d f����   o      ���� 0 epartial ePartial� �� R   i ���
�� .ascrerr ****      � **** b   � � b   � � b   � � m   � � � $ C o u l d n  t   m a p   i t e m   o   � ����� 0 i   m   � � �  :   o   � ����� 0 etext eText �� 
�� 
errn o   k l���� 0 enumber eNumber  ��!"
�� 
erob! l  m |#����# N   m |$$ n   m {%&% 4   x {��'
�� 
cobj' o   y z���� 0 i  & n  m x()( I   r x��*���� "0 aslistparameter asListParameter* +,+ o   r s���� 0 thelist theList, -��- m   s t.. �//  ��  ��  ) o   m r���� 0 _support  ��  ��  " ��01
�� 
errt0 o   } ~���� 
0 eto eTo1 ��2��
�� 
ptlr2 o   � ����� 0 epartial ePartial��  ��  � 3��3 L   � �44 n  � �565 o   � ����� 
0 _list_  6 o   � ����� $0 resultlistobject resultListObject��  � R      ��78
�� .ascrerr ****      � ****7 o      ���� 0 etext eText8 ��9:
�� 
errn9 o      ���� 0 enumber eNumber: ��;<
�� 
erob; o      ���� 0 efrom eFrom< ��=>
�� 
errt= o      ���� 
0 eto eTo> ��?��
�� 
ptlr? o      ���� 0 epartial ePartial��  � I   � ���@���� 20 _errorwithpartialresult _errorWithPartialResult@ ABA m   � �CC �DD  m a p   l i s tB EFE o   � ����� 0 etext eTextF GHG o   � ����� 0 enumber eNumberH IJI o   � ����� 0 efrom eFromJ KLK o   � ����� 
0 eto eToL M��M o   � ����� 0 epartial ePartial��  ��  � NON l     ��������  ��  ��  O PQP l     ��������  ��  ��  Q RSR i  9 <TUT I     ��VW
�� .Lst:Filtnull���     ****V o      ���� 0 thelist theListW ��X��
�� 
UsinX o      ���� 0 	thescript 	theScript��  U Q     �YZ[Y k    �\\ ]^] h    
�_� $0 resultlistobject resultListObject_ j     �~`�~ 
0 _list_  ` n     aba 2   �}
�} 
cobjb n    cdc I    �|e�{�| "0 aslistparameter asListParametere fgf o    
�z�z 0 thelist theListg h�yh m   
 ii �jj  �y  �{  d o     �x�x 0 _support  ^ klk r    mnm n   opo I    �wq�v�w &0 asscriptparameter asScriptParameterq rsr o    �u�u 0 	thescript 	theScripts t�tt m    uu �vv 
 u s i n g�t  �v  p o    �s�s 0 _support  n o      �r�r 0 	thescript 	theScriptl wxw r    yzy m    �q�q  z o      �p�p 0 	lastindex 	lastIndexx {|{ Q    �}~} Y     X��o���n� k   / S�� ��� r   / 7��� n   / 5��� 4   2 5�m�
�m 
cobj� o   3 4�l�l 0 i  � n  / 2��� o   0 2�k�k 
0 _list_  � o   / 0�j�j $0 resultlistobject resultListObject� o      �i�i 0 theitem theItem� ��h� Z   8 S���g�f� n  8 >��� I   9 >�e��d�e 0 
filteritem 
filterItem� ��c� o   9 :�b�b 0 theitem theItem�c  �d  � o   8 9�a�a 0 	thescript 	theScript� k   A O�� ��� r   A F��� [   A D��� o   A B�`�` 0 	lastindex 	lastIndex� m   B C�_�_ � o      �^�^ 0 	lastindex 	lastIndex� ��]� r   G O��� o   G H�\�\ 0 theitem theItem� n      ��� 4   K N�[�
�[ 
cobj� o   L M�Z�Z 0 	lastindex 	lastIndex� n  H K��� o   I K�Y�Y 
0 _list_  � o   H I�X�X $0 resultlistobject resultListObject�]  �g  �f  �h  �o 0 i  � m   # $�W�W � n   $ *��� 1   ' )�V
�V 
leng� n  $ '��� o   % '�U�U 
0 _list_  � o   $ %�T�T $0 resultlistobject resultListObject�n  ~ R      �S��
�S .ascrerr ****      � ****� o      �R�R 0 etext eText� �Q��
�Q 
errn� o      �P�P 0 enumber eNumber� �O��N
�O 
errt� o      �M�M 
0 eto eTo�N   k   ` ��� ��� Z   ` ~���L�� ?   ` c��� o   ` a�K�K 0 	lastindex 	lastIndex� m   a b�J�J � r   f w��� n   f u��� 7  i u�I��
�I 
cobj� m   m o�H�H � l  p t��G�F� \   p t��� o   q r�E�E 0 	lastindex 	lastIndex� m   r s�D�D �G  �F  � n  f i��� o   g i�C�C 
0 _list_  � o   f g�B�B $0 resultlistobject resultListObject� o      �A�A 0 epartial ePartial�L  � r   z ~��� J   z |�@�@  � o      �?�? 0 epartial ePartial� ��>� R    ��=��
�= .ascrerr ****      � ****� b   � ���� b   � ���� b   � ���� m   � ��� ��� * C o u l d n  t   f i l t e r   i t e m  � o   � ��<�< 0 i  � m   � ��� ���  :  � o   � ��;�; 0 etext eText� �:��
�: 
errn� o   � ��9�9 0 enumber eNumber� �8��
�8 
erob� l  � ���7�6� N   � ��� n   � ���� 4   � ��5�
�5 
cobj� o   � ��4�4 0 i  � n  � ���� I   � ��3��2�3 "0 aslistparameter asListParameter� ��� o   � ��1�1 0 thelist theList� ��0� m   � ��� ���  �0  �2  � o   � ��/�/ 0 _support  �7  �6  � �.��
�. 
errt� o   � ��-�- 
0 eto eTo� �,��+
�, 
ptlr� o   � ��*�* 0 epartial ePartial�+  �>  | ��� Z  � ����)�(� =   � ���� o   � ��'�' 0 	lastindex 	lastIndex� m   � ��&�&  � L   � ��� J   � ��%�%  �)  �(  � ��$� L   � ��� n  � ���� 7  � ��#��
�# 
cobj� m   � ��"�" � o   � ��!�! 0 	lastindex 	lastIndex� n  � ���� o   � �� �  
0 _list_  � o   � ��� $0 resultlistobject resultListObject�$  Z R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo� ���
� 
ptlr� o      �� 0 epartial ePartial�  [ I   � ����� 20 _errorwithpartialresult _errorWithPartialResult� ��� m   � ��� ���  f i l t e r   l i s t� �	 � o   � ��� 0 etext eText	  			 o   � ��� 0 enumber eNumber	 			 o   � ��� 0 efrom eFrom	 			 o   � ��� 
0 eto eTo	 	�	 o   � ��� 0 epartial ePartial�  �  S 				 l     ��
�	�  �
  �	  		 	
		
 l     ����  �  �  	 			 i  = @			 I     �		
� .Lst:Redunull���     ****	 o      �� 0 thelist theList	 �	�
� 
Usin	 o      �� 0 	thescript 	theScript�  	 k     �		 			 r     			 m     � 
�  
msng	 o      ���� 0 	theresult 	theResult	 	��	 Q    �				 k    �		 			 h    ��	�� 0 
listobject 
listObject	 j     ��	 �� 
0 _list_  	  n    	!	"	! I    ��	#���� "0 aslistparameter asListParameter	# 	$	%	$ o    
���� 0 thelist theList	% 	&��	& m   
 	'	' �	(	(  ��  ��  	" o     ���� 0 _support  	 	)	*	) Z   *	+	,����	+ =    	-	.	- n    	/	0	/ 1    ��
�� 
leng	0 n   	1	2	1 o    ���� 
0 _list_  	2 o    ���� 0 
listobject 
listObject	. m    ����  	, n   &	3	4	3 I    &��	5���� .0 throwinvalidparameter throwInvalidParameter	5 	6	7	6 o    ���� 0 thelist theList	7 	8	9	8 m     	:	: �	;	;  	9 	<	=	< m     !��
�� 
list	= 	>��	> m   ! "	?	? �	@	@ ( L i s t   c a n  t   b e   e m p t y .��  ��  	4 o    ���� 0 _support  ��  ��  	* 	A	B	A r   + 8	C	D	C n  + 6	E	F	E I   0 6��	G���� &0 asscriptparameter asScriptParameter	G 	H	I	H o   0 1���� 0 	thescript 	theScript	I 	J��	J m   1 2	K	K �	L	L 
 u s i n g��  ��  	F o   + 0���� 0 _support  	D o      ���� 0 	thescript 	theScript	B 	M	N	M r   9 A	O	P	O n   9 ?	Q	R	Q 4   < ?��	S
�� 
cobj	S m   = >���� 	R n  9 <	T	U	T o   : <���� 
0 _list_  	U o   9 :���� 0 
listobject 
listObject	P o      ���� 0 	theresult 	theResult	N 	V	W	V Q   B �	X	Y	Z	X Y   E g	[��	\	]��	[ r   T b	^	_	^ n  T `	`	a	` I   U `��	b���� 0 
reduceitem 
reduceItem	b 	c	d	c o   U V���� 0 	theresult 	theResult	d 	e��	e n   V \	f	g	f 4   Y \��	h
�� 
cobj	h o   Z [���� 0 i  	g n  V Y	i	j	i o   W Y���� 
0 _list_  	j o   V W���� 0 
listobject 
listObject��  ��  	a o   T U���� 0 	thescript 	theScript	_ o      ���� 0 	theresult 	theResult�� 0 i  	\ m   H I���� 	] n   I O	k	l	k 1   L N��
�� 
leng	l n  I L	m	n	m o   J L���� 
0 _list_  	n o   I J���� 0 
listobject 
listObject��  	Y R      ��	o	p
�� .ascrerr ****      � ****	o o      ���� 0 etext eText	p ��	q	r
�� 
errn	q o      ���� 0 enumber eNumber	r ��	s��
�� 
errt	s o      ���� 
0 eto eTo��  	Z R   o ���	t	u
�� .ascrerr ****      � ****	t b   � �	v	w	v b   � �	x	y	x b   � �	z	{	z m   � �	|	| �	}	} * C o u l d n  t   r e d u c e   i t e m  	{ o   � ����� 0 i  	y m   � �	~	~ �		  :  	w o   � ����� 0 etext eText	u ��	�	�
�� 
errn	� o   s t���� 0 enumber eNumber	� ��	�	�
�� 
erob	� l  w �	�����	� N   w �	�	� n   w �	�	�	� 4   � ���	�
�� 
cobj	� o   � ����� 0 i  	� n  w �	�	�	� I   | ���	����� "0 aslistparameter asListParameter	� 	�	�	� o   | }���� 0 thelist theList	� 	���	� m   } �	�	� �	�	�  ��  ��  	� o   w |���� 0 _support  ��  ��  	� ��	���
�� 
errt	� o   � ����� 
0 eto eTo��  	W 	���	� L   � �	�	� o   � ����� 0 	theresult 	theResult��  	 R      ��	�	�
�� .ascrerr ****      � ****	� o      ���� 0 etext eText	� ��	�	�
�� 
errn	� o      ���� 0 enumber eNumber	� ��	�	�
�� 
erob	� o      ���� 0 efrom eFrom	� ��	���
�� 
errt	� o      ���� 
0 eto eTo��  	 I   � ���	����� 20 _errorwithpartialresult _errorWithPartialResult	� 	�	�	� m   � �	�	� �	�	�  r e d u c e   l i s t	� 	�	�	� o   � ����� 0 etext eText	� 	�	�	� o   � ����� 0 enumber eNumber	� 	�	�	� o   � ����� 0 efrom eFrom	� 	�	�	� o   � ����� 
0 eto eTo	� 	���	� o   � ����� 0 	theresult 	theResult��  ��  ��  	 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��	�	���  	� J D--------------------------------------------------------------------   	� �	�	� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -	� 	�	�	� l     ��	�	���  	�   sort   	� �	�	� 
   s o r t	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� l      ��	�	���  	��� Notes: 

- Quicksort provides between [best case] O(n * log n) and [worst case] O(n * n) efficiency, typically leaning towards the former in all but the most pathological cases.

- One limitation of quicksort is that it isn't stable, i.e. items that compare as equal can appear in any order in the resulting list; their original order isn't preserved. An alternate algorithm such as Heapsort would avoid this, but would likely be significantly slower on average (while heapsort is guaranteed to be O(n * log n), it has much higher constant overhead than quicksort which tends to be fast in all but the most degenerate cases).

- This implementation trades some speed for greater robustness and flexibility, sorting a 10,000-number list in ~1sec, whereas a bare-bones quicksort might be 2x faster. OTOH, if you want fast code then AppleScript's the absolute last language you want to be using anyway, (e.g. Python's `sorted` function is 100x faster). For sorting simple lists of number/text/date values it's probably much quicker to send the AS list across the ASOC bridge and use -[NSArray sortedArray...], but that doesn't generalize to other use cases so isn't used here.

   	� �	�	�	0   N o t e s :   
 
 -   Q u i c k s o r t   p r o v i d e s   b e t w e e n   [ b e s t   c a s e ]   O ( n   *   l o g   n )   a n d   [ w o r s t   c a s e ]   O ( n   *   n )   e f f i c i e n c y ,   t y p i c a l l y   l e a n i n g   t o w a r d s   t h e   f o r m e r   i n   a l l   b u t   t h e   m o s t   p a t h o l o g i c a l   c a s e s . 
 
 -   O n e   l i m i t a t i o n   o f   q u i c k s o r t   i s   t h a t   i t   i s n ' t   s t a b l e ,   i . e .   i t e m s   t h a t   c o m p a r e   a s   e q u a l   c a n   a p p e a r   i n   a n y   o r d e r   i n   t h e   r e s u l t i n g   l i s t ;   t h e i r   o r i g i n a l   o r d e r   i s n ' t   p r e s e r v e d .   A n   a l t e r n a t e   a l g o r i t h m   s u c h   a s   H e a p s o r t   w o u l d   a v o i d   t h i s ,   b u t   w o u l d   l i k e l y   b e   s i g n i f i c a n t l y   s l o w e r   o n   a v e r a g e   ( w h i l e   h e a p s o r t   i s   g u a r a n t e e d   t o   b e   O ( n   *   l o g   n ) ,   i t   h a s   m u c h   h i g h e r   c o n s t a n t   o v e r h e a d   t h a n   q u i c k s o r t   w h i c h   t e n d s   t o   b e   f a s t   i n   a l l   b u t   t h e   m o s t   d e g e n e r a t e   c a s e s ) . 
 
 -   T h i s   i m p l e m e n t a t i o n   t r a d e s   s o m e   s p e e d   f o r   g r e a t e r   r o b u s t n e s s   a n d   f l e x i b i l i t y ,   s o r t i n g   a   1 0 , 0 0 0 - n u m b e r   l i s t   i n   ~ 1 s e c ,   w h e r e a s   a   b a r e - b o n e s   q u i c k s o r t   m i g h t   b e   2 x   f a s t e r .   O T O H ,   i f   y o u   w a n t   f a s t   c o d e   t h e n   A p p l e S c r i p t ' s   t h e   a b s o l u t e   l a s t   l a n g u a g e   y o u   w a n t   t o   b e   u s i n g   a n y w a y ,   ( e . g .   P y t h o n ' s   ` s o r t e d `   f u n c t i o n   i s   1 0 0 x   f a s t e r ) .   F o r   s o r t i n g   s i m p l e   l i s t s   o f   n u m b e r / t e x t / d a t e   v a l u e s   i t ' s   p r o b a b l y   m u c h   q u i c k e r   t o   s e n d   t h e   A S   l i s t   a c r o s s   t h e   A S O C   b r i d g e   a n d   u s e   - [ N S A r r a y   s o r t e d A r r a y . . . ] ,   b u t   t h a t   d o e s n ' t   g e n e r a l i z e   t o   o t h e r   u s e   c a s e s   s o   i s n ' t   u s e d   h e r e . 
 
	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     	�	�	�	� j   A E��	��� *0 _quicksortthreshold _quicksortThreshold	� m   A D���� 	� T N shorter ranges are sorted using insertion sort; longer ranges using quicksort   	� �	�	� �   s h o r t e r   r a n g e s   a r e   s o r t e d   u s i n g   i n s e r t i o n   s o r t ;   l o n g e r   r a n g e s   u s i n g   q u i c k s o r t	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  F I	�	�	� I      ��	����� 	0 _sort  	� 	�	�	� o      ���� $0 resultlistobject resultListObject	� 	�	�	� o      ���� 0 
startindex 
startIndex	� 	�	�	� o      ���� 0 endindex endIndex	� 	�	�	� o      ����  0 sortcomparator sortComparator	� 	���	� o      ���� 0 usequicksort useQuickSort��  ��  	� l   	�	�	�	� k    	�	� 	�	�	� Z    t	�	�����	� o     ���� 0 usequicksort useQuickSort	� l  p	�	�	�	� k   p	�	� 	�	�	� Z   	�	�����	� A    		�	�	� \    	�	�	� o    �� 0 endindex endIndex	� o    �~�~ 0 
startindex 
startIndex	� m    �}�} 	� L    �|�|  ��  ��  	� 	�	�	� r    &	�	�	� J    	�	� 	�	�	� o    �{�{ 0 
startindex 
startIndex	� 	��z	� o    �y�y 0 endindex endIndex�z  	� J      	�	� 	�	�	� o      �x�x 0 	leftindex 	leftIndex	� 	��w	� o      �v�v 0 
rightindex 
rightIndex�w  	� 	�	�	� r   ' 8	�	�	� n   ' 6	�	�	� 3   4 6�u
�u 
cobj	� n   ' 4	�
 	� 7  * 4�t


�t 
cobj
 o   . 0�s�s 0 
startindex 
startIndex
 o   1 3�r�r 0 endindex endIndex
  n  ' *


 o   ( *�q�q 
0 _keys_  
 o   ' (�p�p $0 resultlistobject resultListObject	� o      �o�o 0 
pivotvalue 
pivotValue	� 


 V   9;


 k   A6
	
	 




 Q   A �



 V   D d


 l  Z _



 r   Z _


 [   Z ]


 o   Z [�n�n 0 	leftindex 	leftIndex
 m   [ \�m�m 
 o      �l�l 0 	leftindex 	leftIndex
 � z while cmp returns -1; note that if compareKeys() returns a non-numeric value/no result, this will throw -1700/-2763 error   
 �

 �   w h i l e   c m p   r e t u r n s   - 1 ;   n o t e   t h a t   i f   c o m p a r e K e y s ( )   r e t u r n s   a   n o n - n u m e r i c   v a l u e / n o   r e s u l t ,   t h i s   w i l l   t h r o w   - 1 7 0 0 / - 2 7 6 3   e r r o r
 A   H Y


 c   H W


 n  H U


 I   I U�k
�j�k 0 comparekeys compareKeys
 
 
!
  e   I P
"
" n   I P
#
$
# 4   L O�i
%
�i 
cobj
% o   M N�h�h 0 	leftindex 	leftIndex
$ n  I L
&
'
& o   J L�g�g 
0 _keys_  
' o   I J�f�f $0 resultlistobject resultListObject
! 
(�e
( o   P Q�d�d 0 
pivotvalue 
pivotValue�e  �j  
 o   H I�c�c  0 sortcomparator sortComparator
 m   U V�b
�b 
nmbr
 m   W X�a�a  
 R      �`
)
*
�` .ascrerr ****      � ****
) o      �_�_ 0 etext eText
* �^
+
,
�^ 
errn
+ o      �]�] 0 enum eNum
, �\
-
.
�\ 
erob
- o      �[�[ 0 efrom eFrom
. �Z
/�Y
�Z 
errt
/ o      �X�X 
0 eto eTo�Y  
 R   l ��W
0
1
�W .ascrerr ****      � ****
0 b   | 
2
3
2 m   | }
4
4 �
5
5 < C o u l d n  t   c o m p a r e   o b j e c t   k e y s :  
3 o   } ~�V�V 0 etext eText
1 �U
6
7
�U 
errn
6 o   n o�T�T 0 enum eNum
7 �S
8
9
�S 
erob
8 J   p y
:
: 
;
<
; n   p v
=
>
= 4   s v�R
?
�R 
cobj
? o   t u�Q�Q 0 	leftindex 	leftIndex
> n  p s
@
A
@ o   q s�P�P 
0 _keys_  
A o   p q�O�O $0 resultlistobject resultListObject
< 
B�N
B o   v w�M�M 0 
pivotvalue 
pivotValue�N  
9 �L
C�K
�L 
errt
C o   z {�J�J 
0 eto eTo�K  
 
D
E
D Q   � �
F
G
H
F V   � �
I
J
I l  � �
K
L
M
K r   � �
N
O
N \   � �
P
Q
P o   � ��I�I 0 
rightindex 
rightIndex
Q m   � ��H�H 
O o      �G�G 0 
rightindex 
rightIndex
L   while cmp returns 1;    
M �
R
R ,   w h i l e   c m p   r e t u r n s   1 ;  
J ?   � �
S
T
S c   � �
U
V
U n  � �
W
X
W I   � ��F
Y�E�F 0 comparekeys compareKeys
Y 
Z
[
Z n   � �
\
]
\ 4   � ��D
^
�D 
cobj
^ o   � ��C�C 0 
rightindex 
rightIndex
] n  � �
_
`
_ o   � ��B�B 
0 _keys_  
` o   � ��A�A $0 resultlistobject resultListObject
[ 
a�@
a o   � ��?�? 0 
pivotvalue 
pivotValue�@  �E  
X o   � ��>�>  0 sortcomparator sortComparator
V m   � ��=
�= 
nmbr
T m   � ��<�<  
G R      �;
b
c
�; .ascrerr ****      � ****
b o      �:�: 0 etext eText
c �9
d
e
�9 
errn
d o      �8�8 0 enum eNum
e �7
f
g
�7 
erob
f o      �6�6 0 efrom eFrom
g �5
h�4
�5 
errt
h o      �3�3 
0 eto eTo�4  
H R   � ��2
i
j
�2 .ascrerr ****      � ****
i b   � �
k
l
k m   � �
m
m �
n
n < C o u l d n  t   c o m p a r e   o b j e c t   k e y s :  
l o   � ��1�1 0 etext eText
j �0
o
p
�0 
errn
o o   � ��/�/ 0 enum eNum
p �.
q
r
�. 
erob
q J   � �
s
s 
t
u
t n   � �
v
w
v 4   � ��-
x
�- 
cobj
x o   � ��,�, 0 
rightindex 
rightIndex
w n  � �
y
z
y o   � ��+�+ 
0 _keys_  
z o   � ��*�* $0 resultlistobject resultListObject
u 
{�)
{ o   � ��(�( 0 
pivotvalue 
pivotValue�)  
r �'
|�&
�' 
errt
| o   � ��%�% 
0 eto eTo�&  
E 
}�$
} Z   �6
~
�#�"
~ l  � �
��!� 
� H   � �
�
� ?   � �
�
�
� o   � ��� 0 	leftindex 	leftIndex
� o   � ��� 0 
rightindex 
rightIndex�!  �   
 k   �2
�
� 
�
�
� r   � �
�
�
� J   � �
�
� 
�
�
� e   � �
�
� n   � �
�
�
� 4   � ��
�
� 
cobj
� o   � ��� 0 
rightindex 
rightIndex
� n  � �
�
�
� o   � ��� 
0 _keys_  
� o   � ��� $0 resultlistobject resultListObject
� 
��
� e   � �
�
� n   � �
�
�
� 4   � ��
�
� 
cobj
� o   � ��� 0 	leftindex 	leftIndex
� n  � �
�
�
� o   � ��� 
0 _keys_  
� o   � ��� $0 resultlistobject resultListObject�  
� J      
�
� 
�
�
� n      
�
�
� 4   � ��
�
� 
cobj
� o   � ��� 0 	leftindex 	leftIndex
� n  � �
�
�
� o   � ��� 
0 _keys_  
� o   � ��� $0 resultlistobject resultListObject
� 
��
� n      
�
�
� 4   � ��
�
� 
cobj
� o   � ��� 0 
rightindex 
rightIndex
� n  � �
�
�
� o   � ��� 
0 _keys_  
� o   � ��� $0 resultlistobject resultListObject�  
� 
�
�
� r   �
�
�
� J   �
�
� 
�
�
� e   � �
�
� n   � �
�
�
� 4   � ��
�
� 
cobj
� o   � ��
�
 0 
rightindex 
rightIndex
� n  � �
�
�
� o   � ��	�	 
0 _list_  
� o   � ��� $0 resultlistobject resultListObject
� 
��
� e   � �
�
� n   � �
�
�
� 4   � ��
�
� 
cobj
� o   � ��� 0 	leftindex 	leftIndex
� n  � �
�
�
� o   � ��� 
0 _list_  
� o   � ��� $0 resultlistobject resultListObject�  
� J      
�
� 
�
�
� n      
�
�
� 4  	�
�
� 
cobj
� o  
�� 0 	leftindex 	leftIndex
� n 	
�
�
� o  	� �  
0 _list_  
� o  ���� $0 resultlistobject resultListObject
� 
���
� n      
�
�
� 4  ��
�
�� 
cobj
� o  ���� 0 
rightindex 
rightIndex
� n 
�
�
� o  ���� 
0 _list_  
� o  ���� $0 resultlistobject resultListObject��  
� 
���
� r  2
�
�
� J  #
�
� 
�
�
� [  
�
�
� o  ���� 0 	leftindex 	leftIndex
� m  ���� 
� 
���
� \  !
�
�
� o  ���� 0 
rightindex 
rightIndex
� m   ���� ��  
� J      
�
� 
�
�
� o      ���� 0 	leftindex 	leftIndex
� 
���
� o      ���� 0 
rightindex 
rightIndex��  ��  �#  �"  �$  
 B   = @
�
�
� o   = >���� 0 	leftindex 	leftIndex
� o   > ?���� 0 
rightindex 
rightIndex
 
���
� Q  <p
�
�
�
� k  ?g
�
� 
�
�
� I  ?Q��
����� 	0 _sort  
� 
�
�
� o  @A���� $0 resultlistobject resultListObject
� 
�
�
� o  AB���� 0 
startindex 
startIndex
� 
�
�
� o  BC���� 0 
rightindex 
rightIndex
� 
�
�
� o  CD����  0 sortcomparator sortComparator
� 
���
� ?  DM
�
�
� \  DG
�
�
� o  DE���� 0 
rightindex 
rightIndex
� o  EF���� 0 
startindex 
startIndex
� o  GL���� *0 _quicksortthreshold _quicksortThreshold��  ��  
� 
�
�
� I  Rd��
����� 	0 _sort  
� 
�
�
� o  ST���� $0 resultlistobject resultListObject
� 
�
�
� o  TU���� 0 	leftindex 	leftIndex
� 
�
�
� o  UV���� 0 endindex endIndex
� 
�
�
� o  VW����  0 sortcomparator sortComparator
� 
���
� ?  W`
�
�
� \  WZ
�
�
� o  WX���� 0 endindex endIndex
� o  XY���� 0 	leftindex 	leftIndex
� o  Z_���� *0 _quicksortthreshold _quicksortThreshold��  ��  
� 
���
� L  eg����  ��  
� R      ���� 
�� .ascrerr ****      � ****��    ����
�� 
errn d       m      ����
���  
� l oo����   r l stack overflow, so fall-through to use non-recursive insertion sort (this should rarely happen in practice)    � �   s t a c k   o v e r f l o w ,   s o   f a l l - t h r o u g h   t o   u s e   n o n - r e c u r s i v e   i n s e r t i o n   s o r t   ( t h i s   s h o u l d   r a r e l y   h a p p e n   i n   p r a c t i c e )��  	� � � sort mostly uses quicksort, but falls through to insertionsort when sorting small number of items (<8), or when sorting a mostly-sorted list, or when quicksort recursion exceeds AS's stack depth   	� ��   s o r t   m o s t l y   u s e s   q u i c k s o r t ,   b u t   f a l l s   t h r o u g h   t o   i n s e r t i o n s o r t   w h e n   s o r t i n g   s m a l l   n u m b e r   o f   i t e m s   ( < 8 ) ,   o r   w h e n   s o r t i n g   a   m o s t l y - s o r t e d   l i s t ,   o r   w h e n   q u i c k s o r t   r e c u r s i o n   e x c e e d s   A S ' s   s t a c k   d e p t h��  ��  	�  l uu��	
��  	 � � fall-through to use loop-based insertion sort when sorting a small number of items (for which it is faster than quicksort), or when quicksort recursion overflows AppleScript's call stack   
 �v   f a l l - t h r o u g h   t o   u s e   l o o p - b a s e d   i n s e r t i o n   s o r t   w h e n   s o r t i n g   a   s m a l l   n u m b e r   o f   i t e m s   ( f o r   w h i c h   i t   i s   f a s t e r   t h a n   q u i c k s o r t ) ,   o r   w h e n   q u i c k s o r t   r e c u r s i o n   o v e r f l o w s   A p p l e S c r i p t ' s   c a l l   s t a c k  r  uz [  ux o  uv���� 0 
startindex 
startIndex m  vw����  o      ���� 0 
startindex 
startIndex �� Y  {���� Y  ��� k  �  r  �� J  ��  !  e  ��"" n  ��#$# 4  ����%
�� 
cobj% l ��&����& \  ��'(' o  ������ 0 j  ( m  ������ ��  ��  $ n ��)*) o  ������ 
0 _keys_  * o  ������ $0 resultlistobject resultListObject! +��+ e  ��,, n  ��-.- 4  ����/
�� 
cobj/ o  ������ 0 j  . n ��010 o  ������ 
0 _keys_  1 o  ������ $0 resultlistobject resultListObject��   J      22 343 o      ���� 0 leftkey leftKey4 5��5 o      ���� 0 rightkey rightKey��   676 l ��89:8 Z ��;<����; A  ��=>= n ��?@? I  ����A���� 0 comparekeys compareKeysA BCB o  ������ 0 leftkey leftKeyC D��D o  ������ 0 rightkey rightKey��  ��  @ o  ������  0 sortcomparator sortComparator> m  ������ <  S  ����  ��  9 !  stop when leftKey�rightKey   : �EE 6   s t o p   w h e n   l e f t K e y"d r i g h t K e y7 FGF r  ��HIH J  ��JJ KLK o  ������ 0 rightkey rightKeyL M��M o  ������ 0 leftkey leftKey��  I J      NN OPO n      QRQ 4  ����S
�� 
cobjS l ��T����T \  ��UVU o  ������ 0 j  V m  ������ ��  ��  R n ��WXW o  ������ 
0 _keys_  X o  ������ $0 resultlistobject resultListObjectP Y��Y n      Z[Z 4  ����\
�� 
cobj\ o  ������ 0 j  [ n ��]^] o  ������ 
0 _keys_  ^ o  ������ $0 resultlistobject resultListObject��  G _��_ r  �`a` J  ��bb cdc e  ��ee n  ��fgf 4  ����h
�� 
cobjh o  ������ 0 j  g n ��iji o  ������ 
0 _list_  j o  ������ $0 resultlistobject resultListObjectd k��k e  ��ll n  ��mnm 4  ����o
�� 
cobjo l ��p����p \  ��qrq o  ������ 0 j  r m  ������ ��  ��  n n ��sts o  ������ 
0 _list_  t o  ������ $0 resultlistobject resultListObject��  a J      uu vwv n      xyx 4  ���z
�� 
cobjz l �{����{ \  �|}| o  ������ 0 j  } m  � ���� ��  ��  y n ��~~ o  ������ 
0 _list_   o  ������ $0 resultlistobject resultListObjectw ���� n      ��� 4  ���
�� 
cobj� o  ���� 0 j  � n ��� o  	���� 
0 _list_  � o  	���� $0 resultlistobject resultListObject��  ��  �� 0 j   o  ������ 0 i   o  ������ 0 
startindex 
startIndex m  ���������� 0 i   o  ~���� 0 
startindex 
startIndex o  ����� 0 endindex endIndex��  ��  	� 1 + performs in-place quicksort/insertionsort	   	� ��� V   p e r f o r m s   i n - p l a c e   q u i c k s o r t / i n s e r t i o n s o r t 		� ��� l     ��������  ��  ��  � ��� l     �������  ��  �  � ��� l     �~�}�|�~  �}  �|  � ��� i  J M��� I     �{��
�{ .Lst:Sortnull���     ****� o      �z�z 0 thelist theList� �y��x
�y 
Comp� |�w�v��u��w  �v  � o      �t�t  0 sortcomparator sortComparator�u  � l     ��s�r� m      �q
�q 
msng�s  �r  �x  � k    ��� ��� l     �p���p  �.( note that `sort list` currently doesn't implement a `reversed order` parameter as its quicksort algorithm isn't stable (i.e. items that compare as equal will appear in any order, not the order in which they were supplied), so such an option would be useless in practice and rather misleading too. (To get a list in descending order, just get the returned list's `reverse` property or else pass a comparator containing a suitable compareKeys handler.) This parameter can always be added in future if/when a stable sorting algorithm is ever implemented.   � ���P   n o t e   t h a t   ` s o r t   l i s t `   c u r r e n t l y   d o e s n ' t   i m p l e m e n t   a   ` r e v e r s e d   o r d e r `   p a r a m e t e r   a s   i t s   q u i c k s o r t   a l g o r i t h m   i s n ' t   s t a b l e   ( i . e .   i t e m s   t h a t   c o m p a r e   a s   e q u a l   w i l l   a p p e a r   i n   a n y   o r d e r ,   n o t   t h e   o r d e r   i n   w h i c h   t h e y   w e r e   s u p p l i e d ) ,   s o   s u c h   a n   o p t i o n   w o u l d   b e   u s e l e s s   i n   p r a c t i c e   a n d   r a t h e r   m i s l e a d i n g   t o o .   ( T o   g e t   a   l i s t   i n   d e s c e n d i n g   o r d e r ,   j u s t   g e t   t h e   r e t u r n e d   l i s t ' s   ` r e v e r s e `   p r o p e r t y   o r   e l s e   p a s s   a   c o m p a r a t o r   c o n t a i n i n g   a   s u i t a b l e   c o m p a r e K e y s   h a n d l e r . )   T h i s   p a r a m e t e r   c a n   a l w a y s   b e   a d d e d   i n   f u t u r e   i f / w h e n   a   s t a b l e   s o r t i n g   a l g o r i t h m   i s   e v e r   i m p l e m e n t e d .� ��o� Q    ����� k   o�� ��� r    ��� n   ��� I    �n��m�n "0 aslistparameter asListParameter� ��� o    	�l�l 0 thelist theList� ��k� m   	 
�� ���  �k  �m  � o    �j�j 0 _support  � o      �i�i 0 thelist theList� ��� h    �h��h $0 resultlistobject resultListObject� k      �� ��� l     ���� j     	�g��g 
0 _keys_  � n     ��� 2   �f
�f 
cobj� o     �e�e 0 thelist theList� ~ x (replacing items in an existing list of the correct length is a little faster than appending items to a new empty list)   � ��� �   ( r e p l a c i n g   i t e m s   i n   a n   e x i s t i n g   l i s t   o f   t h e   c o r r e c t   l e n g t h   i s   a   l i t t l e   f a s t e r   t h a n   a p p e n d i n g   i t e m s   t o   a   n e w   e m p t y   l i s t )� ��d� j   
 �c��c 
0 _list_  � n   
 ��� 2   �b
�b 
cobj� o   
 �a�a 0 thelist theList�d  � ��� Z   ,���`�_� A     ��� n   ��� 1    �^
�^ 
leng� n   ��� o    �]�] 
0 _list_  � o    �\�\ $0 resultlistobject resultListObject� m    �[�[ � L   # (�� n  # '��� o   $ &�Z�Z 
0 _list_  � o   # $�Y�Y $0 resultlistobject resultListObject�`  �_  � ��� Z   - J���X�� =  - 0��� o   - .�W�W  0 sortcomparator sortComparator� m   . /�V
�V 
msng� r   3 :��� I  3 8�U�T�S
�U .Lst:DeSonull��� ��� null�T  �S  � o      �R�R  0 sortcomparator sortComparator�X  � r   = J��� n  = H��� I   B H�Q��P�Q &0 asscriptparameter asScriptParameter� ��� o   B C�O�O  0 sortcomparator sortComparator� ��N� m   C D�� ��� 
 u s i n g�N  �P  � o   = B�M�M 0 _support  � o      �L�L  0 sortcomparator sortComparator� ��� l  K K�K���K  � M G call comparator's makeKey method to generate each sortable key in turn   � ��� �   c a l l   c o m p a r a t o r ' s   m a k e K e y   m e t h o d   t o   g e n e r a t e   e a c h   s o r t a b l e   k e y   i n   t u r n� ��� l  K ^���� r   K ^��� J   K O�� ��� m   K L�J�J  � ��I� m   L M�H�H  �I  � J      �� ��� o      �G�G  0 ascendingcount ascendingCount� ��F� o      �E�E "0 descendingcount descendingCount�F  � � � while generating keys also check if list is already almost/fully sorted (either ascending or descending) and if it is use insertionsort/return as-is   � ���*   w h i l e   g e n e r a t i n g   k e y s   a l s o   c h e c k   i f   l i s t   i s   a l r e a d y   a l m o s t / f u l l y   s o r t e d   ( e i t h e r   a s c e n d i n g   o r   d e s c e n d i n g )   a n d   i f   i t   i s   u s e   i n s e r t i o n s o r t / r e t u r n   a s - i s� ��� Q   _@���� k   b&�� ��� Q   b ����� r   e s� � n  e q I   f q�D�C�D 0 makekey makeKey �B e   f m n   f m 4   i l�A
�A 
cobj m   j k�@�@  n  f i	
	 o   g i�?�? 
0 _keys_  
 o   f g�>�> $0 resultlistobject resultListObject�B  �C   o   e f�=�=  0 sortcomparator sortComparator  o      �<�< 0 previouskey previousKey� R      �;
�; .ascrerr ****      � **** o      �:�: 0 etext eText �9
�9 
errn o      �8�8 0 enum eNum �7�6
�7 
errt o      �5�5 
0 eto eTo�6  � R   { ��4
�4 .ascrerr ****      � **** b   � � m   � � � : C o u l d n  t   m a k e K e y   f o r   i t e m   1 :   o   � ��3�3 0 etext eText �2
�2 
errn o    ��1�1 0 enum eNum �0
�0 
erob l  � ��/�. N   � � n   � � 4   � ��-
�- 
cobj m   � ��,�,  l  � ��+�* e   � �   n  � �!"! o   � ��)�) 
0 _list_  " o   � ��(�( $0 resultlistobject resultListObject�+  �*  �/  �.   �'#�&
�' 
errt# o   � ��%�% 
0 eto eTo�&  � $%$ r   � �&'& o   � ��$�$ 0 previouskey previousKey' n      ()( 4   � ��#*
�# 
cobj* m   � ��"�" ) n  � �+,+ o   � ��!�! 
0 _keys_  , o   � �� �  $0 resultlistobject resultListObject% -�- Y   �&.�/0�. k   �!11 232 Q   � �4564 r   � �787 n  � �9:9 I   � ��;�� 0 makekey makeKey; <�< n   � �=>= 4   � ��?
� 
cobj? o   � ��� 0 i  > n  � �@A@ o   � ��� 
0 _keys_  A o   � ��� $0 resultlistobject resultListObject�  �  : o   � ���  0 sortcomparator sortComparator8 o      �� 0 
currentkey 
currentKey5 R      �BC
� .ascrerr ****      � ****B o      �� 0 etext eTextC �DE
� 
errnD o      �� 0 enum eNumE �F�
� 
errtF o      �� 
0 eto eTo�  6 R   � ��GH
� .ascrerr ****      � ****G b   � �IJI b   � �KLK b   � �MNM m   � �OO �PP 4 C o u l d n  t   m a k e K e y   f o r   i t e m  N o   � ��� 0 i  L m   � �QQ �RR  :  J o   � ��
�
 0 etext eTextH �	ST
�	 
errnS o   � ��� 0 enum eNumT �UV
� 
erobU l  � �W��W N   � �XX n   � �YZY 4   � ��[
� 
cobj[ o   � ��� 0 i  Z l  � �\��\ e   � �]] n  � �^_^ o   � �� �  
0 _list_  _ o   � ����� $0 resultlistobject resultListObject�  �  �  �  V ��`��
�� 
errt` o   � ����� 
0 eto eTo��  3 aba r   � �cdc o   � ����� 0 
currentkey 
currentKeyd n      efe 4   � ���g
�� 
cobjg o   � ����� 0 i  f n  � �hih o   � ����� 
0 _keys_  i o   � ����� $0 resultlistobject resultListObjectb jkj r   � �lml n  � �non I   � ���p���� 0 comparekeys compareKeysp qrq o   � ����� 0 previouskey previousKeyr s��s o   � ����� 0 
currentkey 
currentKey��  ��  o o   � �����  0 sortcomparator sortComparatorm o      ���� 0 keycomparison keyComparisonk tut Z   vwx��v A   yzy o   ���� 0 keycomparison keyComparisonz m  ����  w l {|}{ r  ~~ [  	��� o  ����  0 ascendingcount ascendingCount� m  ����  o      ����  0 ascendingcount ascendingCount|   current key is larger   } ��� ,   c u r r e n t   k e y   i s   l a r g e rx ��� ?  ��� o  ���� 0 keycomparison keyComparison� m  ����  � ���� l ���� r  ��� [  ��� o  ���� "0 descendingcount descendingCount� m  ���� � o      ���� "0 descendingcount descendingCount�   previous key is larger   � ��� .   p r e v i o u s   k e y   i s   l a r g e r��  ��  u ���� r  !��� o  ���� 0 
currentkey 
currentKey� o      ���� 0 previouskey previousKey��  � 0 i  / m   � ����� 0 n  � ���� 1   � ���
�� 
leng� n  � ���� o   � ����� 
0 _keys_  � o   � ����� $0 resultlistobject resultListObject�  �  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enum eNum� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � R  .@����
�� .ascrerr ****      � ****� o  >?���� 0 etext eText� ����
�� 
errn� o  23���� 0 enum eNum� ����
�� 
erob� o  67���� 0 efrom eFrom� �����
�� 
errt� o  :;���� 
0 eto eTo��  � ��� l AA������  � � �	log "   ORDEREDNESS=" & (ascendingCount * 100 div ((resultListObject's _list_'s length) - 1)) & " " & (descendingCount * 100 div ((resultListObject's _list_'s length) - 1))   � ���Z 	 l o g   "       O R D E R E D N E S S = "   &   ( a s c e n d i n g C o u n t   *   1 0 0   d i v   ( ( r e s u l t L i s t O b j e c t ' s   _ l i s t _ ' s   l e n g t h )   -   1 ) )   &   "   "   &   ( d e s c e n d i n g C o u n t   *   1 0 0   d i v   ( ( r e s u l t L i s t O b j e c t ' s   _ l i s t _ ' s   l e n g t h )   -   1 ) )� ��� l AA������  � B <		log "  ASC=" & ascendingCount & " DESC=" & descendingCount   � ��� x 	 	 l o g   "     A S C = "   &   a s c e n d i n g C o u n t   &   "   D E S C = "   &   d e s c e n d i n g C o u n t� ��� Z  Ai������� ?  AD��� o  AB���� "0 descendingcount descendingCount� m  BC����  � l Ge���� k  Ge�� ��� l GT���� r  GT��� l GR������ ?  GR��� n GL��� 1  JL��
�� 
leng� n GJ��� o  HJ���� 
0 _list_  � o  GH���� $0 resultlistobject resultListObject� o  LQ���� *0 _quicksortthreshold _quicksortThreshold��  ��  � o      ���� 0 usequicksort useQuickSort� B < TO DO: or if list is nearly ordered then use insertion sort   � ��� x   T O   D O :   o r   i f   l i s t   i s   n e a r l y   o r d e r e d   t h e n   u s e   i n s e r t i o n   s o r t� ���� I  Ue������� 	0 _sort  � ��� o  VW���� $0 resultlistobject resultListObject� ��� m  WX���� � ��� n X]��� 1  []��
�� 
leng� n X[��� o  Y[���� 
0 _list_  � o  XY���� $0 resultlistobject resultListObject� ��� o  ]^����  0 sortcomparator sortComparator� ���� o  ^_���� 0 usequicksort useQuickSort��  ��  ��  �   some sorting required   � ��� ,   s o m e   s o r t i n g   r e q u i r e d��  ��  � ���� L  jo�� n jn��� o  km���� 
0 _list_  � o  jk���� $0 resultlistobject resultListObject��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I  w�������� 
0 _error  � ��� m  x{�� ���  s o r t   l i s t� ��� o  {|���� 0 etext eText� ��� o  |}���� 0 enumber eNumber� ��� o  }~���� 0 efrom eFrom� ���� o  ~���� 
0 eto eTo��  ��  �o  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  N Q��� I     ������
�� .Lst:DeSonull��� ��� null��  ��  � h     ����� &0 defaultcomparator DefaultComparator� k      �� ��� j     ����� "0 _supportedtypes _supportedTypes� J     �� ��� m     ��
�� 
nmbr� � � m    ��
�� 
ctxt  �� m    ��
�� 
ldt ��  �  j    	���� 	0 _type   m    ��
�� 
msng  i   
  I      ��	���� 0 makekey makeKey	 
��
 o      ���� 0 anobject anObject��  ��   k     }  Z     z�� =     o     ���� 	0 _type   m    ��
�� 
msng k   
 K  X   
 B�� Z    =���� ?    * l   (���� I   (��
�� .corecnte****       **** J      ��  o    ���� 0 anobject anObject��   �!�~
� 
kocl! l    $"�}�|" e     $## n    $$%$ 1   ! #�{
�{ 
pcnt% o     !�z�z 0 aref aRef�}  �|  �~  ��  ��   m   ( )�y�y   k   - 9&& '(' r   - 6)*) n  - 0+,+ 1   . 0�x
�x 
pcnt, o   - .�w�w 0 aref aRef* o      �v�v 	0 _type  ( -�u- L   7 9.. o   7 8�t�t 0 anobject anObject�u  ��  ��  �� 0 aref aRef n   /0/ o    �s�s "0 _supportedtypes _supportedTypes0  f     1�r1 R   C K�q23
�q .ascrerr ****      � ****2 m   I J44 �55 � I n v a l i d   i t e m   t y p e   ( d e f a u l t   c o m p a r a t o r   c a n   o n l y   c o m p a r e   i n t e g e r / r e a l ,   t e x t ,   o r   d a t e   t y p e s ) .3 �p67
�p 
errn6 m   E F�o�o�\7 �n8�m
�n 
erob8 o   G H�l�l 0 anobject anObject�m  �r   9:9 =   N ];<; l  N [=�k�j= I  N [�i>?
�i .corecnte****       ****> J   N Q@@ A�hA o   N O�g�g 0 anobject anObject�h  ? �fB�e
�f 
koclB o   R W�d�d 	0 _type  �e  �k  �j  < m   [ \�c�c  : C�bC R   ` v�aDE
�a .ascrerr ****      � ****D b   f uFGF b   f sHIH b   f oJKJ b   f mLML m   f gNN �OO ^ I n v a l i d   i t e m   t y p e   ( d e f a u l t   c o m p a r a t o r   e x p e c t e d  M o   g l�`�` 	0 _type  K m   m nPP �QQ    b u t   r e c e i v e d  I l  o rR�_�^R n   o rSTS m   p r�]
�] 
pclsT o   o p�\�\ 0 anobject anObject�_  �^  G m   s tUU �VV  ) .E �[WX
�[ 
errnW m   b c�Z�Z�\X �YY�X
�Y 
erobY o   d e�W�W 0 anobject anObject�X  �b  ��   Z�VZ L   { }[[ o   { |�U�U 0 anobject anObject�V   \�T\ i   ]^] I      �S_�R�S 0 comparekeys compareKeys_ `a` o      �Q�Q 0 
leftobject 
leftObjecta b�Pb o      �O�O 0 rightobject rightObject�P  �R  ^ Z     cdefc A     ghg o     �N�N 0 
leftobject 
leftObjecth o    �M�M 0 rightobject rightObjectd L    ii m    �L�L��e jkj ?    lml o    �K�K 0 
leftobject 
leftObjectm o    �J�J 0 rightobject rightObjectk n�In L    oo m    �H�H �I  f L    pp m    �G�G  �T  � qrq l     �F�E�D�F  �E  �D  r sts l     �C�B�A�C  �B  �A  t uvu i  R Uwxw I     �@�?�>
�@ .Lst:NuSonull��� ��� null�?  �>  x h     �=y�= &0 numericcomparator NumericComparatory k      zz {|{ i    }~} I      �<�;�< 0 makekey makeKey ��:� o      �9�9 0 anobject anObject�:  �;  ~ L     �� c     ��� o     �8�8 0 anobject anObject� m    �7
�7 
nmbr| ��6� i   ��� I      �5��4�5 0 comparekeys compareKeys� ��� o      �3�3 0 
leftobject 
leftObject� ��2� o      �1�1 0 rightobject rightObject�2  �4  � l    ���� L     �� \     ��� o     �0�0 0 
leftobject 
leftObject� o    �/�/ 0 rightobject rightObject��� note: since compareKeys' return value can be any -ve/0/+ve number, a single subtraction operation is sufficient for numbers and dates. (Caveat: this doesn't take into account minor differences due to real imprecision. Currently this doesn't matter as quicksort isn't stable anyway so makes no guarantees about the order of [imprecisely] equal items; however, if quicksort ever gets replaced with a stable sorting algorithm then this method will need revised to use Number library's `cmp` instead.)   � ����   n o t e :   s i n c e   c o m p a r e K e y s '   r e t u r n   v a l u e   c a n   b e   a n y   - v e / 0 / + v e   n u m b e r ,   a   s i n g l e   s u b t r a c t i o n   o p e r a t i o n   i s   s u f f i c i e n t   f o r   n u m b e r s   a n d   d a t e s .   ( C a v e a t :   t h i s   d o e s n ' t   t a k e   i n t o   a c c o u n t   m i n o r   d i f f e r e n c e s   d u e   t o   r e a l   i m p r e c i s i o n .   C u r r e n t l y   t h i s   d o e s n ' t   m a t t e r   a s   q u i c k s o r t   i s n ' t   s t a b l e   a n y w a y   s o   m a k e s   n o   g u a r a n t e e s   a b o u t   t h e   o r d e r   o f   [ i m p r e c i s e l y ]   e q u a l   i t e m s ;   h o w e v e r ,   i f   q u i c k s o r t   e v e r   g e t s   r e p l a c e d   w i t h   a   s t a b l e   s o r t i n g   a l g o r i t h m   t h e n   t h i s   m e t h o d   w i l l   n e e d   r e v i s e d   t o   u s e   N u m b e r   l i b r a r y ' s   ` c m p `   i n s t e a d . )�6  v ��� l     �.�-�,�.  �-  �,  � ��� l     �+�*�)�+  �*  �)  � ��� i  V Y��� I     �(�'�&
�( .Lst:DaSonull��� ��� null�'  �&  � h     �%��%  0 datecomparator DateComparator� k      �� ��� i    ��� I      �$��#�$ 0 makekey makeKey� ��"� o      �!�! 0 anobject anObject�"  �#  � L     �� c     ��� o     � �  0 anobject anObject� m    �
� 
ldt � ��� i   ��� I      ���� 0 comparekeys compareKeys� ��� o      �� 0 
leftobject 
leftObject� ��� o      �� 0 rightobject rightObject�  �  � l    ���� L     �� \     ��� o     �� 0 
leftobject 
leftObject� o    �� 0 rightobject rightObject� Y S as in NumericComparator, a simple subtraction operation produces a suitable result   � ��� �   a s   i n   N u m e r i c C o m p a r a t o r ,   a   s i m p l e   s u b t r a c t i o n   o p e r a t i o n   p r o d u c e s   a   s u i t a b l e   r e s u l t�  � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  Z ]��� I     ���
� .Lst:TeSonull��� ��� null�  � ���
� 
Cons� |����
��  �  � o      �	�	  0 orderingoption orderingOption�
  � l     ���� m      �
� SrtECmpI�  �  �  � Q     r���� k    \�� ��� h    
��� B0 currentconsiderationscomparator CurrentConsiderationsComparator� k      �� ��� i    ��� I      ���� 0 makekey makeKey� ��� o      �� 0 anobject anObject�  �  � l    ���� L     �� c     ��� o     � �  0 anobject anObject� m    ��
�� 
ctxt� _ Y TO DO: what if item is a list [of text]? currently it coerces to text using current TIDs   � ��� �   T O   D O :   w h a t   i f   i t e m   i s   a   l i s t   [ o f   t e x t ] ?   c u r r e n t l y   i t   c o e r c e s   t o   t e x t   u s i n g   c u r r e n t   T I D s� ���� i   ��� I      ������� 0 comparekeys compareKeys� ��� o      ���� 0 
leftobject 
leftObject� ���� o      ���� 0 rightobject rightObject��  ��  � Z     ����� A     ��� o     ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject� L    �� m    ������� ��� ?    ��� o    ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject� ���� L    �� m    ���� ��  � L    �� m    ����  ��  � ���� Z    \����� =   ��� o    ����  0 orderingoption orderingOption� m    ��
�� SrtECmpI� k    �� ��� h    ����� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator� k      �� ��� j     ���
�� 
pare� o     ���� B0 currentconsiderationscomparator CurrentConsiderationsComparator� ���� i  	 ��� I      ������� 0 comparekeys compareKeys� ��� o      ���� 0 
leftobject 
leftObject� ���� o      ���� 0 rightobject rightObject��  ��  � P        L     M     I      ������ 0 comparekeys compareKeys  o    ���� 0 
leftobject 
leftObject �� o    ���� 0 rightobject rightObject��  ��   ��	
�� conshyph	 ��

�� conspunc
 ��
�� conswhit ����
�� consnume��   ��
�� conscase ����
�� consdiac��  ��  � �� L     o    ���� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator��  �  =   ! o    ����  0 orderingoption orderingOption m     ��
�� SrtECmpC  k   $ .  h   $ +���� :0 casesensitivetextcomparator CaseSensitiveTextComparator k        j     ��
�� 
pare o     ���� B0 currentconsiderationscomparator CurrentConsiderationsComparator �� i  	  I      �� ���� 0 comparekeys compareKeys  !"! o      ���� 0 
leftobject 
leftObject" #��# o      ���� 0 rightobject rightObject��  ��   P     $%&$ L    '' M    (( I      ��)���� 0 comparekeys compareKeys) *+* o    ���� 0 
leftobject 
leftObject+ ,��, o    ���� 0 rightobject rightObject��  ��  % ��-
�� conscase- ��.
�� conshyph. ��/
�� conspunc/ ��0
�� conswhit0 ����
�� consnume��  & ����
�� consdiac��  ��   1��1 L   , .22 o   , -���� :0 casesensitivetextcomparator CaseSensitiveTextComparator��   343 =  1 4565 o   1 2����  0 orderingoption orderingOption6 m   2 3��
�� SrtECmpE4 787 k   7 A99 :;: h   7 >��<�� 40 exactmatchtextcomparator ExactMatchTextComparator< k      == >?> j     ��@
�� 
pare@ o     ���� B0 currentconsiderationscomparator CurrentConsiderationsComparator? A��A i  	 BCB I      ��D���� 0 comparekeys compareKeysD EFE o      ���� 0 
leftobject 
leftObjectF G��G o      ���� 0 rightobject rightObject��  ��  C P     HIJH L    KK M    LL I      ��M���� 0 comparekeys compareKeysM NON o    ���� 0 
leftobject 
leftObjectO P��P o    ���� 0 rightobject rightObject��  ��  I ��Q
�� conscaseQ ��R
�� consdiacR ��S
�� conshyphS ��T
�� conspuncT ����
�� conswhit��  J ����
�� consnume��  ��  ; U��U L   ? AVV o   ? @���� 40 exactmatchtextcomparator ExactMatchTextComparator��  8 WXW =  D GYZY o   D E����  0 orderingoption orderingOptionZ m   E F��
�� SrtECmpDX [��[ L   J L\\ o   J K���� B0 currentconsiderationscomparator CurrentConsiderationsComparator��  � n  O \]^] I   T \��_���� >0 throwinvalidconstantparameter throwInvalidConstantParameter_ `a` o   T U����  0 orderingoption orderingOptiona b��b m   U Xcc �dd  f o r��  ��  ^ o   O T���� 0 _support  ��  � R      ��ef
�� .ascrerr ****      � ****e o      ���� 0 etext eTextf ��gh
�� 
errng o      ���� 0 enumber eNumberh ��ij
�� 
erobi o      ���� 0 efrom eFromj ��k��
�� 
errtk o      ���� 
0 eto eTo��  � I   d r��l���� 
0 _error  l mnm m   e hoo �pp  t e x t   c o m p a r a t o rn qrq o   h i���� 0 etext eTextr sts o   i j���� 0 enumber eNumbert uvu o   j k���� 0 efrom eFromv w��w o   k l���� 
0 eto eTo��  ��  � xyx l     ��������  ��  ��  y z{z l     ��������  ��  ��  { |}| i  ^ a~~ I     �����
�� .Lst:LiSonull��� ��� null��  � ����
�� 
Comp� |�~�}��|��~  �}  � o      �{�{ "0 itemcomparators itemComparators�|  � l     ��z�y� m      �x
�x 
msng�z  �y  �   Q     ����� k    |�� ��� l   ���� Z   ���w�v� =    ��� l   ��u�t� I   �s��
�s .corecnte****       ****� J    �� ��r� o    �q�q "0 itemcomparators itemComparators�r  � �p��o
�p 
kocl� m    �n
�n 
reco�o  �u  �t  � m    �m�m � r    ��� J    �� ��l� o    �k�k "0 itemcomparators itemComparators�l  � o      �j�j "0 itemcomparators itemComparators�w  �v  � S M if a single `item comparator` record is given, wrap it as a single-item list   � ��� �   i f   a   s i n g l e   ` i t e m   c o m p a r a t o r `   r e c o r d   i s   g i v e n ,   w r a p   i t   a s   a   s i n g l e - i t e m   l i s t� ��i� Z    |���h�� =    &��� l   $��g�f� I   $�e��
�e .corecnte****       ****� J    �� ��d� o    �c�c "0 itemcomparators itemComparators�d  � �b��a
�b 
kocl� m     �`
�` 
list�a  �g  �f  � m   $ %�_�_  � k   ) N�� ��� Z   ) F���^�� =  ) ,��� o   ) *�]�] "0 itemcomparators itemComparators� m   * +�\
�\ 
msng� r   / 6��� I  / 4�[�Z�Y
�[ .Lst:DeSonull��� ��� null�Z  �Y  � o      �X�X $0 comparatorobject comparatorObject�^  � r   9 F��� n  9 D��� I   > D�W��V�W &0 asscriptparameter asScriptParameter� ��� o   > ?�U�U "0 itemcomparators itemComparators� ��T� m   ? @�� ���  f o r�T  �V  � o   9 >�S�S 0 _support  � o      �R�R $0 comparatorobject comparatorObject� ��Q� h   G N�P��P .0 uniformlistcomparator UniformListComparator� l     ���� k      �� ��� l     �O�N�M�O  �N  �M  � ��� i    ��� I      �L��K�L 0 makekey makeKey� ��J� o      �I�I 0 sublist  �J  �K  � h     �H��H 0 	keyobject 	KeyObject� k      �� ��� j     �G��G 
0 _list_  � o     �F�F 0 sublist  � ��� l     ���� j    
�E��E 
0 _keys_  � J    	�D�D  �   cached keys   � ���    c a c h e d   k e y s� ��� l     �C�B�A�C  �B  �A  � ��@� i   ��� I      �?��>�? 0 getkey getKey� ��=� o      �<�< 0 	itemindex 	itemIndex�=  �>  � k     0�� ��� V     '��� r    "��� n   ��� I    �;��:�; 0 makekey makeKey� ��9� n    ��� 4    �8�
�8 
cobj� o    �7�7 0 	itemindex 	itemIndex� n   ��� o    �6�6 
0 _list_  �  f    �9  �:  � o    �5�5 $0 comparatorobject comparatorObject� n      ���  ;     !� o     �4�4 
0 _keys_  � ?    ��� o    �3�3 0 	itemindex 	itemIndex� n    
��� 1    
�2
�2 
leng� n   ��� o    �1�1 
0 _keys_  �  f    � ��0� L   ( 0�� n   ( /��� 4   + .�/�
�/ 
cobj� o   , -�.�. 0 	itemindex 	itemIndex� n  ( +��� o   ) +�-�- 
0 _keys_  �  f   ( )�0  �@  � ��� l     �,�+�*�,  �+  �*  � � � i    I      �)�(�) 0 comparekeys compareKeys  o      �'�' 0 leftkeyobject leftKeyObject �& o      �%�%  0 rightkeyobject rightKeyObject�&  �(   k     z 	 r     

 J       n     1    �$
�$ 
leng n     o    �#�# 
0 _list_   o     �"�" 0 leftkeyobject leftKeyObject �! n   
 1    
� 
�  
leng n    o    �� 
0 _list_   o    ��  0 rightkeyobject rightKeyObject�!   J        o      �� 0 
leftlength 
leftLength � o      �� 0 rightlength rightLength�  	  r     o    �� 0 
leftlength 
leftLength o      �� 0 commonlength commonLength  !  Z    -"#��" A     #$%$ o     !�� 0 rightlength rightLength% o   ! "�� 0 commonlength commonLength# r   & )&'& o   & '�� 0 rightlength rightLength' o      �� 0 commonlength commonLength�  �  ! ()( Y   . a*�+,�* l  8 \-./- k   8 \00 121 r   8 O343 n  8 M565 I   = M�7�� 0 comparekeys compareKeys7 898 n  = C:;: I   > C�<�� 0 getkey getKey< =�= o   > ?�� 0 i  �  �  ; o   = >�
�
 0 leftkeyobject leftKeyObject9 >�	> n  C I?@? I   D I�A�� 0 getkey getKeyA B�B o   D E�� 0 i  �  �  @ o   C D��  0 rightkeyobject rightKeyObject�	  �  6 o   8 =�� $0 comparatorobject comparatorObject4 o      �� $0 comparisonresult comparisonResult2 C�C Z  P \DE� ��D >   P SFGF o   P Q���� $0 comparisonresult comparisonResultG m   Q R����  E L   V XHH o   V W���� $0 comparisonresult comparisonResult�   ��  �  . E ? iterate over item indexes common to both lists, comparing keys   / �II ~   i t e r a t e   o v e r   i t e m   i n d e x e s   c o m m o n   t o   b o t h   l i s t s ,   c o m p a r i n g   k e y s� 0 i  + m   1 2���� , o   2 3���� 0 commonlength commonLength�  ) J��J Z   b zKLMNK A   b eOPO o   b c���� 0 
leftlength 
leftLengthP o   c d���� 0 rightlength rightLengthL l  h jQRSQ L   h jTT m   h i������R A ; left sublist is shorter than right sublist, so comes first   S �UU v   l e f t   s u b l i s t   i s   s h o r t e r   t h a n   r i g h t   s u b l i s t ,   s o   c o m e s   f i r s tM VWV ?   m pXYX o   m n���� 0 
leftlength 
leftLengthY o   n o���� 0 rightlength rightLengthW Z��Z l  s u[\][ L   s u^^ m   s t���� \ A ; right sublist is shorter than left sublist, so comes first   ] �__ v   r i g h t   s u b l i s t   i s   s h o r t e r   t h a n   l e f t   s u b l i s t ,   s o   c o m e s   f i r s t��  N l  x z`ab` L   x zcc m   x y����  a   both lists are identical   b �dd 2   b o t h   l i s t s   a r e   i d e n t i c a l��    e��e l     ��������  ��  ��  ��  � 9 3 compares sublists of same type and variable length   � �ff f   c o m p a r e s   s u b l i s t s   o f   s a m e   t y p e   a n d   v a r i a b l e   l e n g t h�Q  �h  � k   Q |gg hih Z   Q pjk����j >   Q \lml l  Q Xn����n I  Q X��op
�� .corecnte****       ****o o   Q R���� "0 itemcomparators itemComparatorsp ��q��
�� 
koclq m   S T��
�� 
reco��  ��  ��  m n  X [rsr 1   Y [��
�� 
lengs o   X Y���� "0 itemcomparators itemComparatorsk l  _ ltuvt n  _ lwxw I   d l��y���� .0 throwinvalidparameter throwInvalidParametery z{z o   d e���� "0 itemcomparators itemComparators{ |}| m   e f~~ �  f o r} ��� m   f g��
�� 
list� ���� m   g h�� ��� P N o t   a   l i s t   o f    i t e m   c o m p a r a t o r    r e c o r d s .��  ��  x o   _ d���� 0 _support  u x r basic validation; TO DO: would it be worth checking each record here rather than catching errors in getKey below?   v ��� �   b a s i c   v a l i d a t i o n ;   T O   D O :   w o u l d   i t   b e   w o r t h   c h e c k i n g   e a c h   r e c o r d   h e r e   r a t h e r   t h a n   c a t c h i n g   e r r o r s   i n   g e t K e y   b e l o w ?��  ��  i ���� h   q |����� *0 mixedlistcomparator MixedListComparator� l     ���� k      �� ��� l     ��������  ��  ��  � ��� i    ��� I      ������� 0 makekey makeKey� ���� o      ���� 0 sublist  ��  ��  � h     ����� 0 	keyobject 	KeyObject� k      �� ��� j     ����� 
0 _list_  � o     ���� 0 sublist  � ��� j    
����� 
0 _keys_  � J    	����  � ��� l     ��������  ��  ��  � ���� i   ��� I      ������� 0 getkey getKey� ���� o      ���� "0 comparatorindex comparatorIndex��  ��  � k     ��� ��� V     ���� k    ��� ��� Q    @���� r    (��� n    ��� 4    ���
�� 
cobj� o    ���� "0 comparatorindex comparatorIndex� o    ���� "0 itemcomparators itemComparators� K      �� ������ 0 	itemindex 	itemIndex� o      ���� 0 i  � �������  0 itemcomparator itemComparator� o      ���� $0 comparatorobject comparatorObject��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � R   0 @����
�� .ascrerr ****      � ****� m   > ?�� ��� B I n v a l i d    i t e m   c o m p a r a t o r    r e c o r d .� ����
�� 
errn� m   2 3�����Y� �����
�� 
erob� l  4 =������ N   4 =�� n   4 <��� 4   9 <���
�� 
cobj� o   : ;���� "0 comparatorindex comparatorIndex� o   4 9���� "0 itemcomparators itemComparators��  ��  ��  � ��� Q   A ����� Q   D i���� r   G Q��� n   G O��� 4   J O���
�� 
cobj� l  K N������ c   K N��� o   K L���� 0 i  � m   L M��
�� 
long��  ��  � n  G J��� o   H J���� 
0 _list_  �  f   G H� o      ���� 0 subitem subItem� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � R   Y i����
�� .ascrerr ****      � ****� m   g h�� ��� B I n v a l i d    i t e m   c o m p a r a t o r    r e c o r d .� ����
�� 
errn� m   [ \�����Y� �����
�� 
erob� l  ] f������ N   ] f�� n   ] e��� 4   b e���
�� 
cobj� o   c d���� "0 comparatorindex comparatorIndex� o   ] b���� "0 itemcomparators itemComparators��  ��  ��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � R   q �����
�� .ascrerr ****      � ****� b   � ���� b   � ���� m   � ��� ��� & C a n  t   c o m p a r e   i t e m  � l  � ������� n  � ���� o   � ����� 0 	itemindex 	itemIndex� o   � ����� (0 listitemcomparator listItemComparator��  ��  � m   � ��� ��� F   o f   s u b l i s t   ( s u b l i s t   i s   t o o   s h o r t ) .� ����
�� 
errn� m   s v�����@� �����
�� 
erob� l  w ������� N   w ��� n   w ��� 4   | ���
�� 
cobj� o   } ~���� 0 i  � o   w |���� 0 sublist  ��  ��  ��  � ���� r   � �   n  � � I   � ������� 0 makekey makeKey �� o   � ����� 0 subitem subItem��  ��   o   � ����� $0 comparatorobject comparatorObject n        ;   � � o   � ��� 
0 _keys_  ��  � ?    	 o    �~�~ "0 comparatorindex comparatorIndex	 n    


 1    
�}
�} 
leng n    o    �|�| 
0 _keys_    f    � �{ L   � � n   � � 4   � ��z
�z 
cobj o   � ��y�y "0 comparatorindex comparatorIndex n  � � o   � ��x�x 
0 _keys_    f   � ��{  ��  �  l     �w�v�u�w  �v  �u    i    I      �t�s�t 0 comparekeys compareKeys  o      �r�r 0 leftkeyobject leftKeyObject �q o      �p�p  0 rightkeyobject rightKeyObject�q  �s   k     B  !  Y     ?"�o#$�n" k    :%% &'& r    -()( n   +*+* I    +�m,�l�m 0 comparekeys compareKeys, -.- n   !/0/ I    !�k1�j�k 0 getkey getKey1 2�i2 o    �h�h 0 i  �i  �j  0 o    �g�g 0 leftkeyobject leftKeyObject. 3�f3 n  ! '454 I   " '�e6�d�e 0 getkey getKey6 7�c7 o   " #�b�b 0 i  �c  �d  5 o   ! "�a�a  0 rightkeyobject rightKeyObject�f  �l  + l   8�`�_8 n   9:9 o    �^�^  0 itemcomparator itemComparator: n   ;<; 4    �]=
�] 
cobj= o    �\�\ 0 i  < o    �[�[ "0 itemcomparators itemComparators�`  �_  ) o      �Z�Z $0 comparisonresult comparisonResult' >�Y> Z  . :?@�X�W? >   . 1ABA o   . /�V�V $0 comparisonresult comparisonResultB m   / 0�U�U  @ L   4 6CC o   4 5�T�T $0 comparisonresult comparisonResult�X  �W  �Y  �o 0 i  # m    �S�S $ n   DED 1   	 �R
�R 
lengE o    	�Q�Q "0 itemcomparators itemComparators�n  ! F�PF l  @ BGHIG L   @ BJJ m   @ A�O�O  H   both lists are identical   I �KK 2   b o t h   l i s t s   a r e   i d e n t i c a l�P   L�NL l     �M�L�K�M  �L  �K  �N  � 9 3 compares sublists of same length and variable type   � �MM f   c o m p a r e s   s u b l i s t s   o f   s a m e   l e n g t h   a n d   v a r i a b l e   t y p e��  �i  � R      �JNO
�J .ascrerr ****      � ****N o      �I�I 0 etext eTextO �HPQ
�H 
errnP o      �G�G 0 enumber eNumberQ �FRS
�F 
erobR o      �E�E 0 efrom eFromS �DT�C
�D 
errtT o      �B�B 
0 eto eTo�C  � I   � ��AU�@�A 
0 _error  U VWV m   � �XX �YY  l i s t   c o m p a r a t o rW Z[Z o   � ��?�? 0 etext eText[ \]\ o   � ��>�> 0 enumber eNumber] ^_^ o   � ��=�= 0 efrom eFrom_ `�<` o   � ��;�; 
0 eto eTo�<  �@  } aba l     �:�9�8�:  �9  �8  b cdc l     �7�6�5�7  �6  �5  d efe i  b eghg I     �4�3i
�4 .Lst:ReSonull��� ��� null�3  i �2j�1
�2 
Compj |�0�/k�.l�0  �/  k o      �-�- $0 comparatorobject comparatorObject�.  l l     m�,�+m m      �*
�* 
msng�,  �+  �1  h Q     :nopn k    (qq rsr Z     tu�)vt =   wxw o    �(�( $0 comparatorobject comparatorObjectx m    �'
�' 
msngu r   	 yzy I  	 �&�%�$
�& .Lst:DeSonull��� ��� null�%  �$  z o      �#�# $0 comparatorobject comparatorObject�)  v r     {|{ n   }~} I    �"�!�" &0 asscriptparameter asScriptParameter ��� o    � �  $0 comparatorobject comparatorObject� ��� m    �� ���  f o r�  �!  ~ o    �� 0 _support  | o      �� $0 comparatorobject comparatorObjects ��� h   ! (��� &0 reversecomparator ReverseComparator� k      �� ��� j     ��
� 
pare� o     �� $0 comparatorobject comparatorObject� ��� i  	 ��� I      ���� 0 comparekeys compareKeys� ��� o      �� 0 leftkey leftKey� ��� o      �� 0 rightkey rightKey�  �  � l    ���� L     �� d     
�� l    	���� M     	�� I      ���� 0 comparekeys compareKeys� ��� o    �� 0 leftkey leftKey� ��� o    �� 0 rightkey rightKey�  �  �  �  � 4 . flip negative flag to positive and vice-versa   � ��� \   f l i p   n e g a t i v e   f l a g   t o   p o s i t i v e   a n d   v i c e - v e r s a�  �  o R      ���
� .ascrerr ****      � ****� o      �
�
 0 etext eText� �	��
�	 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  p I   0 :���� 
0 _error  � ��� m   1 2�� ��� $ r e v e r s e   c o m p a r a t o r� ��� o   2 3� �  0 etext eText� ��� o   3 4���� 0 enumber eNumber� ��� o   4 5���� 0 efrom eFrom� ���� o   5 6���� 
0 eto eTo��  �  f ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  f i��� I     �����
�� .Lst:LiUSnull���     ****� o      ���� 0 thelist theList��  � Q     t���� k    b�� ��� h    
����� $0 resultlistobject resultListObject� j     ����� 
0 _list_  � n     ��� 2   ��
�� 
cobj� n    ��� I    ������� "0 aslistparameter asListParameter� ��� o    
���� 0 thelist theList� ���� m   
 �� ���  ��  ��  � o     ���� 0 _support  � ��� r    ��� n    ��� 1    ��
�� 
leng� n   ��� o    ���� 
0 _list_  � o    ���� $0 resultlistobject resultListObject� o      ���� 0 len  � ��� Y    \�������� k    W�� ��� r    -��� I   +����� z����
�� .sysorandnmbr    ��� nmbr
�� misccura��  � ����
�� 
from� m   # $���� � �����
�� 
to  � o   % &���� 0 len  ��  � o      ���� 0 idx2  � ���� r   . W��� J   . >�� ��� e   . 5�� n  . 5��� 4   1 4���
�� 
cobj� o   2 3���� 0 idx2  � n  . 1��� o   / 1���� 
0 _list_  � o   . /���� $0 resultlistobject resultListObject� ���� e   5 <�� n  5 <��� 4   8 ;���
�� 
cobj� o   9 :���� 0 idx1  � n  5 8��� o   6 8���� 
0 _list_  � o   5 6���� $0 resultlistobject resultListObject��  � J      �� ��� n     ��� 4   F I���
�� 
cobj� o   G H���� 0 idx1  � n  C F   o   D F���� 
0 _list_   o   C D���� $0 resultlistobject resultListObject� �� n      4   R U��
�� 
cobj o   S T���� 0 idx2   n  O R o   P R���� 
0 _list_   o   O P���� $0 resultlistobject resultListObject��  ��  �� 0 idx1  � m    ���� � o    ���� 0 len  ��  � �� L   ] b		 n  ] a

 o   ^ `���� 
0 _list_   o   ] ^���� $0 resultlistobject resultListObject��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  � I   j t������ 
0 _error    m   k l �  u n s o r t   l i s t  o   l m���� 0 etext eText  o   m n���� 0 enumber eNumber  o   n o���� 0 efrom eFrom �� o   o p���� 
0 eto eTo��  ��  �   l     ��������  ��  ��    !��! l     ��������  ��  ��  ��       ��"#$%&'()*+,-./0��123456789��  " ���������������������������������������������
�� 
pimr�� 0 _support  �� 
0 _error  �� 20 _errorwithpartialresult _errorWithPartialResult�� "0 _makelistobject _makeListObject
�� .Lst:Instnull���     ****
�� .Lst:Delenull���     ****
�� .Lst:RDuLnull���     ****
�� .Lst:SliLnull���     ****
�� .Lst:Trannull���     ****
�� .Lst:Findnull���     ****
�� .Lst:Map_null���     ****
�� .Lst:Filtnull���     ****
�� .Lst:Redunull���     ****�� *0 _quicksortthreshold _quicksortThreshold�� 	0 _sort  
�� .Lst:Sortnull���     ****
�� .Lst:DeSonull��� ��� null
�� .Lst:NuSonull��� ��� null
�� .Lst:DaSonull��� ��� null
�� .Lst:TeSonull��� ��� null
� .Lst:LiSonull��� ��� null
� .Lst:ReSonull��� ��� null
� .Lst:LiUSnull���     ****# �:� :  ;; �<�
� 
cobj< ==   �
� 
osax�  $ >>   � %
� 
scpt% � -��?@�� 
0 _error  � �A� A  �����~� 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom�~ 
0 eto eTo�  ? �}�|�{�z�y�} 0 handlername handlerName�| 0 etext eText�{ 0 enumber eNumber�z 0 efrom eFrom�y 
0 eto eTo@ �x�w�v
�x 
msng�w �v 20 _errorwithpartialresult _errorWithPartialResult� *�������+ & �u I�t�sBC�r�u 20 _errorwithpartialresult _errorWithPartialResult�t �qD�q D  �p�o�n�m�l�k�p 0 handlername handlerName�o 0 etext eText�n 0 enumber eNumber�m 0 efrom eFrom�l 
0 eto eTo�k 0 epartial ePartial�s  B �j�i�h�g�f�e�j 0 handlername handlerName�i 0 etext eText�h 0 enumber eNumber�g 0 efrom eFrom�f 
0 eto eTo�e 0 epartial ePartialC  [�d�c�b
�d 
msng�c �b 0 rethrowerror rethrowError�r b  ࠡ�����+ ' �a x�`�_EF�^�a "0 _makelistobject _makeListObject�` �]G�] G  �\�[�\ 0 len  �[ 0 padvalue padValue�_  E �Z�Y�X�Z 0 len  �Y 0 padvalue padValue�X 0 
listobject 
listObjectF �W �H�V�U�T�S�W 0 
listobject 
listObjectH �RI�Q�PJK�O
�R .ascrinit****      � ****I k     LL  ��N�N  �Q  �P  J �M�M 
0 _list_  K �L�L 
0 _list_  �O jv��V �U 
0 _list_  
�T 
leng
�S 
cobj�^ `��K S�O�j L�����v��,FO h��,�,���,��,%��,F[OY��O��,�,� ��,[�\[Zk\Z�2��,FY hY hO��,E( �K ��J�IMN�H
�K .Lst:Instnull���     ****�J 0 thelist theList�I �G�FO
�G 
Valu�F 0 thevalue theValueO �EPQ
�E 
BefoP {�D�C�B�D 0 beforeindex beforeIndex�C  
�B 
msngQ �ARS
�A 
AfteR {�@�?�>�@ 0 
afterindex 
afterIndex�?  
�> 
msngS �=T�<
�= 
ConcT {�;�:�9�; 0 isjoin isJoin�:  
�9 boovfals�<  M 
�8�7�6�5�4�3�2�1�0�/�8 0 thelist theList�7 0 thevalue theValue�6 0 beforeindex beforeIndex�5 0 
afterindex 
afterIndex�4 0 isjoin isJoin�3 0 
listobject 
listObject�2 0 etext eText�1 0 enumber eNumber�0 0 efrom eFrom�/ 
0 eto eToN �. �U�-�,�+�*�)�(�',9�&E�%�$�#�"�!r� ����V���. 0 
listobject 
listObjectU �W��XY�
� .ascrinit****      � ****W k     ZZ  ���  �  �  X �� 
0 _list_  Y ��� "0 aslistparameter asListParameter� 
0 _list_  � b  b   �l+ �
�- 
kocl
�, 
list
�+ .corecnte****       ****
�* 
bool
�) 
msng
�( 
errn�'�Y�& (0 asintegerparameter asIntegerParameter�% (0 asbooleanparameter asBooleanParameter�$ 
0 _list_  
�# 
leng
�" 
cobj
�! 
insl�  80 throwinvalidparameterindex throwInvalidParameterIndex� 0 etext eTextV ��[
� 
errn� 0 enumber eNumber[ ��\
� 
erob� 0 efrom eFrom\ ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �H�y��K S�O�
 �kv��l j �& 
�kvE�Y hO�� t�� )��l�Y hOb  ��l+ E�Ob  ��l+ E�O�j ��,a ,�kE�Y hO���,a , b  ��,Ea �/a 4a l+ Y hY ��� �b  �a l+ E�O�j 
�kE�Y 0�j ��,a ,�E�Y b  ��,Ea �/a 3a l+ O���,a ,
 �j�& b  ��,Ea �/a 3a l+ Y hY ��%O�j  ���,%Y ;���,a ,  ��,�%Y &��,[a \[Zk\Z�2�%��,[a \[Z�k\Zi2%W X  *a ����a + ) �'��]^�

� .Lst:Delenull���     ****� 0 thelist theList� �	_`
�	 
Indx_ {���� 0 theindex theIndex�  ���` �ab
� 
FIdxa {���� 0 
startindex 
startIndex�  
� 
msngb �c� 
� 
TIdxc {�������� 0 endindex endIndex��  
�� 
msng�   ] �������������������������� 0 thelist theList�� 0 theindex theIndex�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 
listobject 
listObject�� 0 
listlength 
listLength�� 0 	startlist 	startList�� 0 endlist endList�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo^ ��?d������_��o�����������e\������ 0 
listobject 
listObjectd ��f����gh��
�� .ascrinit****      � ****f k     ii ?����  ��  ��  g ���� 
0 _list_  h G������ "0 aslistparameter asListParameter�� 
0 _list_  �� b  b   �l+ ��� 
0 _list_  
�� 
leng
�� 
msng�� (0 asintegerparameter asIntegerParameter
�� 
bool
�� 
cobj�� 80 throwinvalidparameterindex throwInvalidParameterIndex�� 0 etext eTexte ����j
�� 
errn�� 0 enumber eNumberj ����k
�� 
erob�� 0 efrom eFromk ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �
����K S�O��,�,E�O�� b  ��l+ E�Y hO�� b  ��l+ E�Y hO�� 	 �� �& Mb  ��l+ E�O�j �k�E�Y hO�j 
 ���& b  ��,E�/�l+ Y hO�E�Y ���  kE�Y ��  �E�Y hO�j �k�E�Y hO�j �k�E�Y hO�j 
 ���& b  ��,E�/�l+ Y &�j 
 ���& b  ��,E�/�l+ Y hO�� ��,�-EY hO�k  �� 
 �� �& jvY hOjvE�Y ��,[�\[Zk\Z�k2E�O��  	jvE�Y ��,[�\[Z�k\Zi2E�O��%W X  *a ����a + * ��l����lm��
�� .Lst:RDuLnull���     ****�� 0 thelist theList��  l 	�������������������� 0 thelist theList�� 0 
listobject 
listObject�� 0 i  �� 0 u  �� 0 
listlength 
listLength�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTom ��tn��������o������� 0 
listobject 
listObjectn ��p����qr�
�� .ascrinit****      � ****p k     ss t��  ��  ��  q �� 
0 _list_  r ���� "0 aslistparameter asListParameter
� 
cobj� 
0 _list_  � b  b   k+  �-E��� 
0 _list_  
�� 
leng
�� 
cobj�� 0 etext eTexto ��t
� 
errn� 0 enumber eNumbert ��u
� 
erob� 0 efrom eFromu ���
� 
errt� 
0 eto eTo�  �� �� 
0 _error  �� � ���K S�Olk��,�,mvE[�k/E�Z[�l/E�Z[�m/E�ZO�j  jvY hO eh�� >h��,[�\[Zk\Z�2��,�/kv�kE�O�� ��,[�\[Zk\Z�2EY h[OY��O�kE�O��,�/��,�/FO�kE�[OY��O��,[�\[Zk\Z�2EW X  *襦���+ 
+ ���vw�
� .Lst:SliLnull���     ****� 0 thelist theList� �xy
� 
FIdxx {���� 0 
startindex 
startIndex�  
� 
msngy �z�
� 
TIdxz {���� 0 endindex endIndex�  
� 
msng�  v ��������� 0 thelist theList� 0 
startindex 
startIndex� 0 endindex endIndex� 0 	thelength 	theLength� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTow ���4�H�M�����p�����{��� "0 aslistparameter asListParameter
� 
leng
� 
msng� (0 asintegerparameter asIntegerParameter
� 
long� � .0 throwinvalidparameter throwInvalidParameter
� 
cobj
� 
errn��[
� 
bool� 0 etext eText{ ��|
� 
errn� 0 enumber eNumber| ��}
� 
erob� 0 efrom eFrom} ���
� 
errt� 
0 eto eTo�  � � 
0 _error  ���b  �k+  E�O��,E�O�� ]b  ��l+ E�O�j  b  �����+ 	Y hO��  -��' 
��-EY �� jvY �[�\[Z�\Zi2EY hY ��  )��l�Y hO�� _b  ��l+ E�O�j  b  ���a �+ 	Y hO��  -��' jvY �� 
��-EY �[�\[Zk\Z�2EY hY hO�j �k�E�Y hO�j �k�E�Y hO��
 �k	 	�ka &a &
 ��	 	��a &a & jvY hO�k kE�Y �� �E�Y hO�k kE�Y �� �E�Y hO�[�\[Z�\Z�2EW X  *a ����a + , �)��~�
� .Lst:Trannull���     ****� 0 thelist theList� ���
� 
Whil� {���� 0 unevenoption unevenOption�  
� LTrhLTrR� ���
� 
PadI� {�~�}�|�~ 0 padvalue padValue�}  
�| 
msng�  ~ �{�z�y�x�w�v�u�t�s�r�q�p�o�n�{ 0 thelist theList�z 0 unevenoption unevenOption�y 0 padvalue padValue�x 0 
listobject 
listObject�w $0 resultlistlength resultListLength�v 0 aref aRef�u *0 resultsublistlength resultSubListLength�t 0 resultsublist resultSubList�s 0 i  �r 0 j  �q 0 etext eText�p 0 enumber eNumber�o 0 efrom eFrom�n 
0 eto eTo �m�l�k�j]b�i�h�gf��f�e�d�c���b�a��`�_�^�]�S�\�[
�m 
kocl
�l 
list
�k .corecnte****       ****
�j 
bool�i �h .0 throwinvalidparameter throwInvalidParameter�g 0 
listobject 
listObject� �Z��Y�X���W
�Z .ascrinit****      � ****� k     
�� h�� k�V�V  �Y  �X  � �U�T�U 
0 _list_  �T 0 _resultlist_ _resultList_� �S�R�S 
0 _list_  �R 0 _resultlist_ _resultList_�W b   �Ojv��f 
0 _list_  
�e 
cobj
�d 
leng
�c LTrhLTrR
�b LTrhLTrP
�a LTrhLTrT�` >0 throwinvalidconstantparameter throwInvalidConstantParameter�_ "0 _makelistobject _makeListObject�^ 0 _resultlist_ _resultList_�] 0 etext eText� �Q�P�
�Q 
errn�P 0 enumber eNumber� �O�N�
�O 
erob�N 0 efrom eFrom� �M�L�K
�M 
errt�L 
0 eto eTo�K  �\ �[ 
0 _error  ��ɠjv  jvY hO�kv��l j 
 ���l �j �& b  �����+ Y hO��K 
S�O��,�k/�,E�O��  7 1��,[��l kh ��,� b  ���a �+ Y h[OY��Y u�a   - '��,[��l kh ��,� 
��,E�Y h[OY��Y B�a   - '��,[��l kh ��,� 
��,E�Y h[OY��Y b  �a l+ O�j ���,�,E�O*��l+ E�O��a ,6FO l�kh ��-E�a ,6F[OY��O�a   @ :k�kh  +k��,�/�,Ekh 	��,�/�/�a ,�/�/F[OY��[OY��Y 5 2k�kh  #k�kh 	��,�/�/�a ,�/�/F[OY��[OY��Y hO�a ,EW X  *a ����a + - �Jo�I�H���G
�J .Lst:Findnull���     ****�I 0 thelist theList�H �F��
�F 
Valu� {�E�D�C�E 0 theitem theItem�D  
�C 
msng� �B��
�B 
Usin� {�A�@�?�A 0 	thescript 	theScript�@  
�? 
msng� �>��=
�> 
Retu� {�<�;�:�< (0 findingoccurrences findingOccurrences�;  
�: LFWhLFWA�=  � 
�9�8�7�6�5�4�3�2�1�0�9 0 thelist theList�8 0 theitem theItem�7 0 	thescript 	theScript�6 (0 findingoccurrences findingOccurrences�5 0 
listobject 
listObject�4 0 i  �3 0 etext eText�2 0 enumber eNumber�1 0 efrom eFrom�0 
0 eto eTo� �/���.�-�,�+�*�)��(�'�&�%]��$�#���"�!�/ 0 
listobject 
listObject� � ������
�  .ascrinit****      � ****� k     �� ��� ���  �  �  � ��� 
0 _list_  � 0 _result_  � ����� "0 aslistparameter asListParameter� 
0 _list_  � 0 _result_  � b  b   �l+ �Ojv�
�. LFWhLFWA
�- 
msng�, 
0 _list_  
�+ 
leng
�* 
cobj�) 0 _result_  �( &0 asscriptparameter asScriptParameter�' 0 
filteritem 
filterItem
�& LFWhLFWF
�% LFWhLFWL�$ >0 throwinvalidconstantparameter throwInvalidConstantParameter�# 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  �" �! 
0 _error  �G����K S�O��  q��  . (k��,�,Ekh ��,�/�  ���,6FY h[OY��Y <b  ��l+ 
E�O +k��,�,Ekh ���,�/k+  ���,6FY h[OY��Y��  u��  0 *k��,�,Ekh ��,�/�  ���,6FOY h[OY��Y >b  ��l+ 
E�O -k��,�,Ekh ���,�/k+  ���,6FOY h[OY��Y ���  u��  0 *��,�,Ekih ��,�/�  ���,6FOY h[OY��Y >b  ��l+ 
E�O -��,�,Ekih ���,�/k+  ���,6FOY h[OY��Y b  �a l+ O��,EW X  *a ����a + . �������
� .Lst:Map_null���     ****� 0 thelist theList� ��
�	
� 
Usin�
 0 	thescript 	theScript�	  � 	��������� � 0 thelist theList� 0 	thescript 	theScript� $0 resultlistobject resultListObject� 0 i  � 0 etext eText� 0 enumber eNumber� 
0 eto eTo� 0 epartial ePartial�  0 efrom eFrom� ����������������������.���������C������ $0 resultlistobject resultListObject� �����������
�� .ascrinit****      � ****� k     �� �����  ��  ��  � ���� 
0 _list_  � ��������� "0 aslistparameter asListParameter
�� 
cobj�� 
0 _list_  �� b  b   �l+ �-E��� &0 asscriptparameter asScriptParameter�� 
0 _list_  
�� 
leng
�� 
cobj�� 0 mapitem mapItem�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� ������
�� 
errt�� 
0 eto eTo��  
�� 
errn
�� 
erob�� "0 aslistparameter asListParameter
�� 
errt
�� 
ptlr�� � �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� �����
�� 
errt�� 
0 eto eTo� ������
�� 
ptlr�� 0 epartial ePartial��  �� �� 20 _errorwithpartialresult _errorWithPartialResult� � ���K S�Ob  ��l+ E�O + %k��,�,Ekh ���,�/k+ ��,�/F[OY��W NX 	 
�k ��,[�\[Zk\Z�k2E�Y jvE�O)��b  ��l+ �/�a �a a �%a %�%O��,EW X 	 *a �����a + / ��U��������
�� .Lst:Filtnull���     ****�� 0 thelist theList�� ������
�� 
Usin�� 0 	thescript 	theScript��  � ������������������������ 0 thelist theList�� 0 	thescript 	theScript�� $0 resultlistobject resultListObject�� 0 	lastindex 	lastIndex�� 0 i  �� 0 theitem theItem�� 0 etext eText�� 0 enumber eNumber�� 
0 eto eTo�� 0 epartial ePartial�� 0 efrom eFrom� ��_�u����������������������������� $0 resultlistobject resultListObject� �������
� .ascrinit****      � ****� k     �� _��  �  �  � �� 
0 _list_  � i���� "0 aslistparameter asListParameter
� 
cobj� 
0 _list_  � b  b   �l+ �-E��� &0 asscriptparameter asScriptParameter�� 
0 _list_  
�� 
leng
�� 
cobj�� 0 
filteritem 
filterItem�� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
errt� 
0 eto eTo�  
�� 
errn
� 
erob� "0 aslistparameter asListParameter
� 
errt
� 
ptlr� � ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo� ���
� 
ptlr� 0 epartial ePartial�  � � 20 _errorwithpartialresult _errorWithPartialResult�� � ���K S�Ob  ��l+ E�OjE�O = 7k��,�,Ekh ��,�/E�O��k+  �kE�O���,�/FY h[OY��W NX 	 
�k ��,[�\[Zk\Z�k2E�Y jvE�O)��b  ��l+ �/�a �a a �%a %�%O�j  jvY hO��,[�\[Zk\Z�2EW X 	 *a �����a + 0 �	�����
� .Lst:Redunull���     ****� 0 thelist theList� ���
� 
Usin� 0 	thescript 	theScript�  � 	���������� 0 thelist theList� 0 	thescript 	theScript� 0 	theresult 	theResult� 0 
listobject 
listObject� 0 i  � 0 etext eText� 0 enumber eNumber� 
0 eto eTo� 0 efrom eFrom� ��	���	:�	?��	K�������	����	|	~�	��
� 
msng� 0 
listobject 
listObject� ����~���}
� .ascrinit****      � ****� k     �� 	�|�|  �  �~  � �{�{ 
0 _list_  � 	'�z�y�z "0 aslistparameter asListParameter�y 
0 _list_  �} b  b   �l+ �� 
0 _list_  
� 
leng
� 
list� � .0 throwinvalidparameter throwInvalidParameter� &0 asscriptparameter asScriptParameter
� 
cobj� 0 
reduceitem 
reduceItem� 0 etext eText� �x�w�
�x 
errn�w 0 enumber eNumber� �v�u�t
�v 
errt�u 
0 eto eTo�t  
� 
errn
� 
erob� "0 aslistparameter asListParameter
� 
errt� � �s�r�
�s 
errn�r 0 enumber eNumber� �q�p�
�q 
erob�p 0 efrom eFrom� �o�n�m
�o 
errt�n 
0 eto eTo�m  � 20 _errorwithpartialresult _errorWithPartialResult� ��E�O ���K S�O��,�,j  b  �����+ 
Y hOb  ��l+ E�O��,�k/E�O ' !l��,�,Ekh ����,��/l+ E�[OY��W 3X  )a �a b  �a l+ ��/a �a a �%a %�%O�W X  *a �����a + �� 1 �l	��k�j���i�l 	0 _sort  �k �h��h �  �g�f�e�d�c�g $0 resultlistobject resultListObject�f 0 
startindex 
startIndex�e 0 endindex endIndex�d  0 sortcomparator sortComparator�c 0 usequicksort useQuickSort�j  � �b�a�`�_�^�]�\�[�Z�Y�X�W�V�U�T�S�b $0 resultlistobject resultListObject�a 0 
startindex 
startIndex�` 0 endindex endIndex�_  0 sortcomparator sortComparator�^ 0 usequicksort useQuickSort�] 0 	leftindex 	leftIndex�\ 0 
rightindex 
rightIndex�[ 0 
pivotvalue 
pivotValue�Z 0 etext eText�Y 0 enum eNum�X 0 efrom eFrom�W 
0 eto eTo�V 0 i  �U 0 j  �T 0 leftkey leftKey�S 0 rightkey rightKey� �R�Q�P�O�N��M�L�K�J
4
m�I�H�G�F�
�R 
cobj�Q 
0 _keys_  �P 0 comparekeys compareKeys
�O 
nmbr�N 0 etext eText� �E�D�
�E 
errn�D 0 enum eNum� �C�B�
�C 
erob�B 0 efrom eFrom� �A�@�?
�A 
errt�@ 
0 eto eTo�?  
�M 
errn
�L 
erob
�K 
errt�J �I 
0 _list_  �H �G 	0 _sort  �F  � �>�=�<
�> 
errn�=�n�<  �i�q��k hY hO��lvE[�k/E�Z[�l/E�ZO��,[�\[Z�\Z�2�.E�Oh�� % h���,�/E�l+ �&j�kE�[OY��W X  )���,�/�lv���%O $ h���,�/�l+ �&j�kE�[OY��W X  )���,�/�lv���%O�� p��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZO��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZO�k�klvE[�k/E�Z[�l/E�ZY h[OY�O -*������b  �+ O*������b  �+ OhW X  hY hO�kE�O ���kh  ���ih ��,�k/E��,�/ElvE[�k/E�Z[�l/E�ZO���l+ k Y hO��lvE[�k/��,�k/FZ[�l/��,�/FZO��,�/E��,�k/ElvE[�k/��,�k/FZ[�l/��,�/FZ[OY�y[OY�j2 �;��:�9���8
�; .Lst:Sortnull���     ****�: 0 thelist theList�9 �7��6
�7 
Comp� {�5�4�3�5  0 sortcomparator sortComparator�4  
�3 
msng�6  � �2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�2 0 thelist theList�1  0 sortcomparator sortComparator�0 $0 resultlistobject resultListObject�/  0 ascendingcount ascendingCount�. "0 descendingcount descendingCount�- 0 previouskey previousKey�, 0 etext eText�+ 0 enum eNum�* 
0 eto eTo�) 0 i  �( 0 
currentkey 
currentKey�' 0 keycomparison keyComparison�& 0 efrom eFrom�% 0 usequicksort useQuickSort�$ 0 enumber eNumber� ��#�"���!� �������������OQ��������# "0 aslistparameter asListParameter�" $0 resultlistobject resultListObject� �������
� .ascrinit****      � ****� k     �� ��� ���  �  �  � ��
� 
0 _keys_  �
 
0 _list_  � �	��
�	 
cobj� 
0 _keys_  � 
0 _list_  � b   �-E�Ob   �-E��! 
0 _list_  
�  
leng
� 
msng
� .Lst:DeSonull��� ��� null� &0 asscriptparameter asScriptParameter
� 
cobj� 
0 _keys_  � 0 makekey makeKey� 0 etext eText� ���
� 
errn� 0 enum eNum� ���
� 
errt� 
0 eto eTo�  
� 
errn
� 
erob
� 
errt� � 0 comparekeys compareKeys� �� �
� 
errn�  0 enum eNum� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  � � 	0 _sort  � �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  � 
0 _error  �8�qb  ��l+ E�O��K S�O��,�,l 
��,EY hO��  *j E�Y b  ��l+ 
E�OjjlvE[�k/E�Z[�l/E�ZO � ���,�k/Ek+ E�W $X  )a �a ��,E�k/a �a a �%O���,�k/FO �l��,�,Ekh 	 ���,�/k+ E�W *X  )a �a ��,E�/a �a a �%a %�%O���,�/FO���l+ E�O�j 
�kE�Y �j 
�kE�Y hO�E�[OY��W X  )a �a �a �a �O�j #��,�,b  E�O*�k��,�,��a + Y hO��,EW X  *a ����a + 3 �����������
�� .Lst:DeSonull��� ��� null��  ��  � ���� &0 defaultcomparator DefaultComparator� ������ &0 defaultcomparator DefaultComparator� �����������
�� .ascrinit****      � ****� k     �� ��� �� �� \����  ��  ��  � ���������� "0 _supportedtypes _supportedTypes�� 	0 _type  �� 0 makekey makeKey�� 0 comparekeys compareKeys� ��������������
�� 
nmbr
�� 
ctxt
�� 
ldt �� "0 _supportedtypes _supportedTypes
�� 
msng�� 	0 _type  � ������������ 0 makekey makeKey�� ����� �  ���� 0 anobject anObject��  � ������ 0 anobject anObject�� 0 aref aRef� ��������������������4NP��U
�� 
msng�� "0 _supportedtypes _supportedTypes
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
errn���\
�� 
erob�� 
�� 
pcls�� ~b  �  F 7)�,[��l kh �kv��,El j ��,Ec  O�Y h[OY��O)�����Y .�kv�b  l j  )�����b  %�%��,%�%Y hO�� ��^���������� 0 comparekeys compareKeys�� ����� �  ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject��  � ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject�  �� �� iY �� kY j�� ���mv�O�OL OL �� ��K S�4 ��x�������
�� .Lst:NuSonull��� ��� null��  ��  � �� &0 numericcomparator NumericComparator� �y�� &0 numericcomparator NumericComparator� �������
� .ascrinit****      � ****� k     �� {�� ���  �  �  � ��� 0 makekey makeKey� 0 comparekeys compareKeys� ��� �~������ 0 makekey makeKey� ��� �  �� 0 anobject anObject�  � �� 0 anobject anObject� �
� 
nmbr� ��&� �������� 0 comparekeys compareKeys� ��� �  ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�  � ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�  � ��� L  OL � ��K S�5 �������
� .Lst:DaSonull��� ��� null�  �  � ��  0 datecomparator DateComparator� ����  0 datecomparator DateComparator� ���� �
� .ascrinit****      � ****� k      � ���  �  �    ��� 0 makekey makeKey� 0 comparekeys compareKeys  ������ 0 makekey makeKey� ��   �� 0 anobject anObject�   �� 0 anobject anObject �
� 
ldt � ��& ����	
�� 0 comparekeys compareKeys� ��   ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�  	 ��� 0 
leftobject 
leftObject� 0 rightobject rightObject
  � ��� L  OL � ��K S�6 �����
� .Lst:TeSonull��� ��� null�  � ��
� 
Cons {���~�  0 orderingoption orderingOption�  
�~ SrtECmpI�   	�}�|�{�z�y�x�w�v�u�}  0 orderingoption orderingOption�| B0 currentconsiderationscomparator CurrentConsiderationsComparator�{ >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator�z :0 casesensitivetextcomparator CaseSensitiveTextComparator�y 40 exactmatchtextcomparator ExactMatchTextComparator�x 0 etext eText�w 0 enumber eNumber�v 0 efrom eFrom�u 
0 eto eTo �t��s�r��q�p�o�n<�mc�l�ko�j�i�t B0 currentconsiderationscomparator CurrentConsiderationsComparator �h�g�f�e
�h .ascrinit****      � **** k      � ��d�d  �g  �f   �c�b�c 0 makekey makeKey�b 0 comparekeys compareKeys  �a��`�_�^�a 0 makekey makeKey�` �]�]   �\�\ 0 anobject anObject�_   �[�[ 0 anobject anObject �Z
�Z 
ctxt�^ ��& �Y��X�W�V�Y 0 comparekeys compareKeys�X �U �U    �T�S�T 0 
leftobject 
leftObject�S 0 rightobject rightObject�W   �R�Q�R 0 
leftobject 
leftObject�Q 0 rightobject rightObject  �V �� iY �� kY j�e L  OL 
�s SrtECmpI�r >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator �P!�O�N"#�M
�P .ascrinit****      � ****! k     $$ �%% ��L�L  �O  �N  " �K�J
�K 
pare�J 0 comparekeys compareKeys# �I&
�I 
pare& �H��G�F'(�E�H 0 comparekeys compareKeys�G �D)�D )  �C�B�C 0 
leftobject 
leftObject�B 0 rightobject rightObject�F  ' �A�@�A 0 
leftobject 
leftObject�@ 0 rightobject rightObject( �?�? 0 comparekeys compareKeys�E �� )��ld*J V�M b  N  OL 
�q SrtECmpC�p :0 casesensitivetextcomparator CaseSensitiveTextComparator �>*�=�<+,�;
�> .ascrinit****      � ***** k     -- .. �:�:  �=  �<  + �9�8
�9 
pare�8 0 comparekeys compareKeys, �7/
�7 
pare/ �6�5�401�3�6 0 comparekeys compareKeys�5 �22�2 2  �1�0�1 0 
leftobject 
leftObject�0 0 rightobject rightObject�4  0 �/�.�/ 0 
leftobject 
leftObject�. 0 rightobject rightObject1 %&�-�- 0 comparekeys compareKeys�3 �� )��ld*J V�; b  N  OL 
�o SrtECmpE�n 40 exactmatchtextcomparator ExactMatchTextComparator �,3�+�*45�)
�, .ascrinit****      � ****3 k     66 >77 A�(�(  �+  �*  4 �'�&
�' 
pare�& 0 comparekeys compareKeys5 �%8
�% 
pare8 �$C�#�"9:�!�$ 0 comparekeys compareKeys�# � ;�  ;  ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�"  9 ��� 0 
leftobject 
leftObject� 0 rightobject rightObject: IJ�� 0 comparekeys compareKeys�! �� )��ld*J V�) b  N  OL 
�m SrtECmpD�l >0 throwinvalidconstantparameter throwInvalidConstantParameter�k 0 etext eText ��<
� 
errn� 0 enumber eNumber< ��=
� 
erob� 0 efrom eFrom= ���
� 
errt� 
0 eto eTo�  �j �i 
0 _error  � s ^��K S�O��  ��K S�O�Y @��  ��K 
S�O�Y -��  ��K S�O�Y ��  �Y b  �a l+ W X  *a ����a + 7 ���>?�
� .Lst:LiSonull��� ��� null�  � �@�
� 
Comp@ {���� "0 itemcomparators itemComparators�  
� 
msng�  > �
�	�������
 "0 itemcomparators itemComparators�	 $0 comparatorobject comparatorObject� .0 uniformlistcomparator UniformListComparator� *0 mixedlistcomparator MixedListComparator� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo? ��� ������������A��~��������B��CX����
� 
kocl
� 
reco
�  .corecnte****       ****
�� 
list
�� 
msng
�� .Lst:DeSonull��� ��� null�� &0 asscriptparameter asScriptParameter�� .0 uniformlistcomparator UniformListComparatorA ��D����EF��
�� .ascrinit****      � ****D k     GG �HH �����  ��  ��  E ������ 0 makekey makeKey�� 0 comparekeys compareKeysF IJI �������KL���� 0 makekey makeKey�� ��M�� M  ���� 0 sublist  ��  K ������ 0 sublist  �� 0 	keyobject 	KeyObjectL ���N�� 0 	keyobject 	KeyObjectN ��O����PQ��
�� .ascrinit****      � ****O k     RR �SS �TT �����  ��  ��  P �������� 
0 _list_  �� 
0 _keys_  �� 0 getkey getKeyQ ����U�� 
0 _list_  �� 
0 _keys_  U �������VW���� 0 getkey getKey�� ��X�� X  ���� 0 	itemindex 	itemIndex��  V ���� 0 	itemindex 	itemIndexW ������������ 
0 _keys_  
�� 
leng�� 
0 _list_  
�� 
cobj�� 0 makekey makeKey�� 1 &h�)�,�,b  )�,�/k+ b  6F[OY��O)�,�/E�� b   �Ojv�OL �� ��K S�J ������YZ���� 0 comparekeys compareKeys�� ��[�� [  ������ 0 leftkeyobject leftKeyObject��  0 rightkeyobject rightKeyObject��  Y ���������������� 0 leftkeyobject leftKeyObject��  0 rightkeyobject rightKeyObject�� 0 
leftlength 
leftLength�� 0 rightlength rightLength�� 0 commonlength commonLength�� 0 i  �� $0 comparisonresult comparisonResultZ ������ 
0 _list_  
� 
leng
� 
cobj� 0 getkey getKey� 0 comparekeys compareKeys�� {��,�,��,�,lvE[�k/E�Z[�l/E�ZO�E�O�� �E�Y hO 2k�kh b  ��k+ ��k+ l+ E�O�j �Y h[OY��O�� iY �� kY j�� L  OL 
�� 
leng�� �� .0 throwinvalidparameter throwInvalidParameter�� *0 mixedlistcomparator MixedListComparatorB �\��]^�
� .ascrinit****      � ****\ k     __ �`` ��  �  �  ] ��� 0 makekey makeKey� 0 comparekeys compareKeys^ aba ����cd�� 0 makekey makeKey� �e� e  �� 0 sublist  �  c ��� 0 sublist  � 0 	keyobject 	KeyObjectd ��f� 0 	keyobject 	KeyObjectf �g��hi�
� .ascrinit****      � ****g k     jj �kk �ll ���  �  �  h ���� 
0 _list_  � 
0 _keys_  � 0 getkey getKeyi ��m� 
0 _list_  � 
0 _keys_  m ����no�� 0 getkey getKey� �p� p  �� "0 comparatorindex comparatorIndex�  n ����� "0 comparatorindex comparatorIndex� 0 i  � 0 subitem subItem� (0 listitemcomparator listItemComparatoro ������q������������r�������� 
0 _keys_  
� 
leng
� 
cobj� 0 	itemindex 	itemIndex�  0 itemcomparator itemComparator�  q ������
�� 
errn���@��  
� 
errn���Y
�� 
erob�� �� 
0 _list_  
�� 
longr ������
�� 
errn���\��  ���@�� 0 makekey makeKey� � �h�)�,�, b   �/E[�,E�Z[�,Ec  ZW X  )���b   �/��O * )�,��&/E�W X  )���b   �/��W #X  )�a �b   �/�a ��,%a %Ob  �k+ b  6F[OY�bO)�,�/E� b   �Ojv�OL � ��K S�b ������st��� 0 comparekeys compareKeys�� �~u�~ u  �}�|�} 0 leftkeyobject leftKeyObject�|  0 rightkeyobject rightKeyObject��  s �{�z�y�x�{ 0 leftkeyobject leftKeyObject�z  0 rightkeyobject rightKeyObject�y 0 i  �x $0 comparisonresult comparisonResultt �w�v�u�t�s
�w 
leng
�v 
cobj�u  0 itemcomparator itemComparator�t 0 getkey getKey�s 0 comparekeys compareKeys� C >kb   �,Ekh b   �/�,��k+ ��k+ l+ E�O�j �Y h[OY��Oj� L  OL �� 0 etext eTextC �r�qv
�r 
errn�q 0 enumber eNumberv �p�ow
�p 
erob�o 0 efrom eFromw �n�m�l
�n 
errt�m 
0 eto eTo�l  �� �� 
0 _error  � � ~�kv��l k  
�kvE�Y hO�kv��l j  *��  *j E�Y b  ��l+ E�O��K 
S�Y -���l ��, b  �����+ Y hOa a K S�W X  *a ����a + 8 �kh�j�ixy�h
�k .Lst:ReSonull��� ��� null�j  �i �gz�f
�g 
Compz {�e�d�c�e $0 comparatorobject comparatorObject�d  
�c 
msng�f  x �b�a�`�_�^�]�b $0 comparatorobject comparatorObject�a &0 reversecomparator ReverseComparator�` 0 etext eText�_ 0 enumber eNumber�^ 0 efrom eFrom�] 
0 eto eToy �\�[��Z�Y�{�X|��W�V
�\ 
msng
�[ .Lst:DeSonull��� ��� null�Z &0 asscriptparameter asScriptParameter�Y &0 reversecomparator ReverseComparator{ �U}�T�S~�R
�U .ascrinit****      � ****} k     �� ��� ��Q�Q  �T  �S  ~ �P�O
�P 
pare�O 0 comparekeys compareKeys �N�
�N 
pare� �M��L�K���J�M 0 comparekeys compareKeys�L �I��I �  �H�G�H 0 leftkey leftKey�G 0 rightkey rightKey�K  � �F�E�F 0 leftkey leftKey�E 0 rightkey rightKey� �D�D 0 comparekeys compareKeys�J )��ld*J  '�R b   N  OL �X 0 etext eText| �C�B�
�C 
errn�B 0 enumber eNumber� �A�@�
�A 
erob�@ 0 efrom eFrom� �?�>�=
�? 
errt�> 
0 eto eTo�=  �W �V 
0 _error  �h ; *��  *j E�Y b  ��l+ E�O��K S�W X  *颣���+ 9 �<��;�:���9
�< .Lst:LiUSnull���     ****�; 0 thelist theList�:  � 	�8�7�6�5�4�3�2�1�0�8 0 thelist theList�7 $0 resultlistobject resultListObject�6 0 len  �5 0 idx1  �4 0 idx2  �3 0 etext eText�2 0 enumber eNumber�1 0 efrom eFrom�0 
0 eto eTo� �/���.�-�,�+�*�)�(�'�&��%�$�/ $0 resultlistobject resultListObject� �#��"�!��� 
�# .ascrinit****      � ****� k     �� ���  �"  �!  � �� 
0 _list_  � ����� "0 aslistparameter asListParameter
� 
cobj� 
0 _list_  �  b  b   �l+ �-E��. 
0 _list_  
�- 
leng
�, misccura
�+ 
from
�* 
to  �) 
�( .sysorandnmbr    ��� nmbr
�' 
cobj�& 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  �% �$ 
0 _error  �9 u d��K S�O��,�,E�O Hk�kh � *�k�� 	UE�O��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZ[OY��O��,EW X  *������+  ascr  ��ޭ