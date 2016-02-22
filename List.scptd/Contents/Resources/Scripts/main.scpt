FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� List -- manipulate AppleScript lists 

Notes:

- For splitting and joining lists of text, see Text library's `split text` and `join text` commands.


TO DO:


- should text comparator implement exactly the same predefined considering/ignoring options as Text's `search text`? (currently `search text` considers diacriticals for comparison while `sort list`'s text comparison ignores diacriticals for ordering, which may or may not be appropriate)

- if list is almost ordered then tell _sort() to use insertionsort, as that will be quicker than quicksorting the whole thing (will need to run some profiling tests to determine what a good cutoff point is)

- text comparator currently performs simple text coercion; should it explicitly reject lists, constants, etc?

- would it be better if `insert into list` supported virtual 0 index only for both `before item` (-ve indexes only; would insert item last) and `after item` (+ve indexes only; would insert item first) parameters? (might be less confusing to explain; one might also argue that if some out-of-range indexes are allowed at opposing end, e.g. `before item 4` in a 3-item list then all out-of-range indexes should be allowed, c.f. `slice list`)
		
     � 	 		v   L i s t   - -   m a n i p u l a t e   A p p l e S c r i p t   l i s t s   
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
 	 	 
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
�c boovfals�e  �d  �j   � k    � � �  � � � l     �b � ��b   �.( In addition to inserting before/after the list's actual indexes, this also recognizes three 'virtual' indexes: the `after item` parameter uses index 0 and index `-length - 1` to indicate the start of the list; the `before item` parameter uses index `length + 1` to indicate the end of the list.     � � � �P   I n   a d d i t i o n   t o   i n s e r t i n g   b e f o r e / a f t e r   t h e   l i s t ' s   a c t u a l   i n d e x e s ,   t h i s   a l s o   r e c o g n i z e s   t h r e e   ' v i r t u a l '   i n d e x e s :   t h e   ` a f t e r   i t e m `   p a r a m e t e r   u s e s   i n d e x   0   a n d   i n d e x   ` - l e n g t h   -   1 `   t o   i n d i c a t e   t h e   s t a r t   o f   t h e   l i s t ;   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   u s e s   i n d e x   ` l e n g t h   +   1 `   t o   i n d i c a t e   t h e   e n d   o f   t h e   l i s t .   �  � � � l     �a � ��a   �~x Note that the `before item` parameter cannot indicate the end of a list using a negative index. (Problem: the next 'virtual' index after -1 would be 0, but index 0 is already used by the `after item` parameter to represent the *start* of a list, and it's easier to disallow `before item 0` than explain to user how 'index 0' can be at both the start *and* the end of a list.)    � � � ��   N o t e   t h a t   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   c a n n o t   i n d i c a t e   t h e   e n d   o f   a   l i s t   u s i n g   a   n e g a t i v e   i n d e x .   ( P r o b l e m :   t h e   n e x t   ' v i r t u a l '   i n d e x   a f t e r   - 1   w o u l d   b e   0 ,   b u t   i n d e x   0   i s   a l r e a d y   u s e d   b y   t h e   ` a f t e r   i t e m `   p a r a m e t e r   t o   r e p r e s e n t   t h e   * s t a r t *   o f   a   l i s t ,   a n d   i t ' s   e a s i e r   t o   d i s a l l o w   ` b e f o r e   i t e m   0 `   t h a n   e x p l a i n   t o   u s e r   h o w   ' i n d e x   0 '   c a n   b e   a t   b o t h   t h e   s t a r t   * a n d *   t h e   e n d   o f   a   l i s t . ) �  ��` � Q    � � � � � k   � � �  � � � h    
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
list�O  �U  �T   m    �M�M   r     % J     # �L o     !�K�K 0 thevalue theValue�L   o      �J�J 0 thevalue theValue�X  �W  	  Z   *7  >  * -!"! o   * +�I�I 0 
afterindex 
afterIndex" m   + ,�H
�H 
msng k   0 �## $%$ Z  0 @&'�G�F& >  0 3()( o   0 1�E�E 0 beforeindex beforeIndex) m   1 2�D
�D 
msng' R   6 <�C*+
�C .ascrerr ****      � ***** m   : ;,, �-- ( T o o   m a n y   p a r a m e t e r s .+ �B.�A
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
listObject�#  �"  Z R   � ��bc
� .ascrerr ****      � ****b m   � �dd �ee , I n d e x   i s   o u t   o f   r a n g e .c �fg
� 
errnf m   � ����@g �h�
� 
erobh l  � �i��i N   � �jj n   � �klk 9   � ��
� 
insll n   � �mnm 4   � ��o
� 
cobjo o   � ��� 0 
afterindex 
afterIndexn l  � �p��p e   � �qq n  � �rsr o   � ��� 
0 _list_  s o   � ��� 0 
listobject 
listObject�  �  �  �  �  �&  �%  �'   tut >  � �vwv o   � ��� 0 beforeindex beforeIndexw m   � ��
� 
msngu x�x k   �0yy z{z r   � �|}| n  � �~~ I   � ����� (0 asintegerparameter asIntegerParameter� ��� o   � ��� 0 beforeindex beforeIndex� ��
� m   � ��� ���  b e f o r e   i t e m�
  �   o   � ��	�	 0 _support  } o      �� 0 beforeindex beforeIndex{ ��� Z   � ������ ?   � ���� o   � ��� 0 beforeindex beforeIndex� m   � ���  � r   � ���� \   � ���� o   � ��� 0 beforeindex beforeIndex� m   � ��� � o      �� 0 
afterindex 
afterIndex� ��� A   � ���� o   � ��� 0 beforeindex beforeIndex� m   � ���  � �� � r   � ���� [   � ���� l  � ������� n  � ���� 1   � ���
�� 
leng� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject��  ��  � o   � ����� 0 beforeindex beforeIndex� o      ���� 0 
afterindex 
afterIndex�   � l  � ����� R   � �����
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
listObject��  ��  ��  ��  ��  ��  ��  ��  �    l 37���� L  37�� b  36��� o  34���� 0 thelist theList� o  45���� 0 thevalue theValue� #  default is to append to list   � ��� :   d e f a u l t   i s   t o   a p p e n d   t o   l i s t ���� Z  8������ =  8;��� o  89���� 0 
afterindex 
afterIndex� m  9:����  � L  >D�� b  >C��� o  >?���� 0 thevalue theValue� n ?B��� o  @B���� 
0 _list_  � o  ?@���� 0 
listobject 
listObject� ��� =  GP��� o  GH���� 0 
afterindex 
afterIndex� n HO��� 1  KO��
�� 
leng� n HK��� o  IK���� 
0 _list_  � o  HI���� 0 
listobject 
listObject� ���� L  SY�� b  SX��� n SV��� o  TV���� 
0 _list_  � o  ST���� 0 
listobject 
listObject� o  VW���� 0 thevalue theValue��  � L  \��� b  \��� b  \m��� l \k������ n  \k��� 7 _k��� 
�� 
cobj� m  eg����   o  hj���� 0 
afterindex 
afterIndex� n \_ o  ]_���� 
0 _list_   o  \]���� 0 
listobject 
listObject��  ��  � o  kl���� 0 thevalue theValue� l m~���� n  m~ 7 p~��
�� 
cobj l vz���� [  vz	
	 o  wx���� 0 
afterindex 
afterIndex
 m  xy���� ��  ��   m  {}������ n mp o  np���� 
0 _list_   o  mn���� 0 
listobject 
listObject��  ��  ��   � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   � I  �������� 
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
TIdx5 |����6��7��  ��  6 o      ���� 0 endindex endIndex��  7 l     8����8 m      �
� 
msng��  ��  ��  ' Q    �9:;9 k   �<< =>= h    
�~?�~ 0 
listobject 
listObject? j     �}@�} 
0 _list_  @ n    ABA I    �|C�{�| "0 aslistparameter asListParameterC DED o    
�z�z 0 thelist theListE F�yF m   
 GG �HH  �y  �{  B o     �x�x 0 _support  > IJI r    KLK n   MNM 1    �w
�w 
lengN n   OPO o    �v�v 
0 _list_  P o    �u�u 0 
listobject 
listObjectL o      �t�t 0 
listlength 
listLengthJ QRQ Z   *ST�s�rS >   UVU o    �q�q 0 
startindex 
startIndexV m    �p
�p 
msngT r    &WXW n   $YZY I    $�o[�n�o (0 asintegerparameter asIntegerParameter[ \]\ o    �m�m 0 
startindex 
startIndex] ^�l^ m     __ �``  f r o m   i t e m�l  �n  Z o    �k�k 0 _support  X o      �j�j 0 
startindex 
startIndex�s  �r  R aba Z  + Bcd�i�hc >  + .efe o   + ,�g�g 0 endindex endIndexf m   , -�f
�f 
msngd r   1 >ghg n  1 <iji I   6 <�ek�d�e (0 asintegerparameter asIntegerParameterk lml o   6 7�c�c 0 endindex endIndexm n�bn m   7 8oo �pp  t o   i t e m�b  �d  j o   1 6�a�a 0 _support  h o      �`�` 0 endindex endIndex�i  �h  b qrq Z   C2st�_us F   C Nvwv =  C Fxyx o   C D�^�^ 0 
startindex 
startIndexy m   D E�]
�] 
msngw =  I Lz{z o   I J�\�\ 0 endindex endIndex{ m   J K�[
�[ 
msngt k   Q �|| }~} r   Q ^� n  Q \��� I   V \�Z��Y�Z (0 asintegerparameter asIntegerParameter� ��� o   V W�X�X 0 theindex theIndex� ��W� m   W X�� ���  i t e m�W  �Y  � o   Q V�V�V 0 _support  � o      �U�U 0 
startindex 
startIndex~ ��� Z  _ p���T�S� A   _ b��� o   _ `�R�R 0 
startindex 
startIndex� m   ` a�Q�Q  � r   e l��� [   e j��� [   e h��� o   e f�P�P 0 
listlength 
listLength� m   f g�O�O � o   h i�N�N 0 
startindex 
startIndex� o      �M�M 0 
startindex 
startIndex�T  �S  � ��� Z  q ����L�K� G   q |��� =   q t��� o   q r�J�J 0 
startindex 
startIndex� m   r s�I�I  � ?   w z��� o   w x�H�H 0 
startindex 
startIndex� o   x y�G�G 0 
listlength 
listLength� R    ��F��
�F .ascrerr ****      � ****� m   � ��� ��� b I n v a l i d   i n d e x   (  i t e m    p a r a m e t e r   i s   o u t   o f   r a n g e ) .� �E��
�E 
errn� m   � ��D�D�@� �C��B
�C 
erob� l  � ���A�@� N   � ��� n   � ���� 4   � ��?�
�? 
cobj� o   � ��>�> 0 
startindex 
startIndex� l  � ���=�<� e   � ��� n  � ���� o   � ��;�; 
0 _list_  � o   � ��:�: 0 
listobject 
listObject�=  �<  �A  �@  �B  �L  �K  � ��9� r   � ���� o   � ��8�8 0 
startindex 
startIndex� o      �7�7 0 endindex endIndex�9  �_  u k   �2�� ��� Z   � �����6� =  � ���� o   � ��5�5 0 
startindex 
startIndex� m   � ��4
�4 
msng� r   � ���� m   � ��3�3 � o      �2�2 0 
startindex 
startIndex� ��� =  � ���� o   � ��1�1 0 endindex endIndex� m   � ��0
�0 
msng� ��/� r   � ���� o   � ��.�. 0 
listlength 
listLength� o      �-�- 0 endindex endIndex�/  �6  � ��� Z  � ����,�+� A   � ���� o   � ��*�* 0 
startindex 
startIndex� m   � ��)�)  � r   � ���� [   � ���� [   � ���� o   � ��(�( 0 
listlength 
listLength� m   � ��'�' � o   � ��&�& 0 
startindex 
startIndex� o      �%�% 0 
startindex 
startIndex�,  �+  � ��� Z  � ����$�#� A   � ���� o   � ��"�" 0 endindex endIndex� m   � ��!�!  � r   � ���� [   � ���� [   � ���� o   � �� �  0 
listlength 
listLength� m   � ��� � o   � ��� 0 endindex endIndex� o      �� 0 endindex endIndex�$  �#  � ��� Z  � ������ G   � ���� =   � ���� o   � ��� 0 
startindex 
startIndex� m   � ���  � ?   � ���� o   � ��� 0 
startindex 
startIndex� o   � ��� 0 
listlength 
listLength� R   � ����
� .ascrerr ****      � ****� m   � ��� ��� l I n v a l i d   i n d e x   (  f r o m   i t e m    p a r a m e t e r   i s   o u t   o f   r a n g e ) .� ���
� 
errn� m   � ����@� ���
� 
erob� l  � ����� N   � ��� n   � ���� 4   � ���
� 
cobj� o   � ��� 0 
startindex 
startIndex� l  � ����� e   � ��� n  � ���� o   � ��� 
0 _list_  � o   � ��
�
 0 
listobject 
listObject�  �  �  �  �  �  �  � ��� Z  � ���	�� G   ���� =   � ��� o   � ��� 0 endindex endIndex� m   � ���  � ?  ��� o  �� 0 endindex endIndex� o  �� 0 
listlength 
listLength� R  �� 
� .ascrerr ****      � ****� m   � h I n v a l i d   i n d e x   (  t o   i t e m    p a r a m e t e r   i s   o u t   o f   r a n g e ) .  �
� 
errn m  ���@ � ��
�  
erob l ���� N   n  	 4  ��

�� 
cobj
 o  ���� 0 endindex endIndex	 l ���� e   n  o  ���� 
0 _list_   o  ���� 0 
listobject 
listObject��  ��  ��  ��  ��  �	  �  � �� Z !2���� ?  !$ o  !"���� 0 
startindex 
startIndex o  "#���� 0 endindex endIndex L  '. n '- 2 *,��
�� 
cobj n '* o  (*���� 
0 _list_   o  '(���� 0 
listobject 
listObject��  ��  ��  r  Z  3g�� =  36 o  34���� 0 
startindex 
startIndex m  45����  k  9S   !"! Z 9N#$����# G  9D%&% =  9<'(' o  9:���� 0 
startindex 
startIndex( o  :;���� 0 
listlength 
listLength& =  ?B)*) o  ?@���� 0 endindex endIndex* o  @A���� 0 
listlength 
listLength$ L  GJ++ J  GI����  ��  ��  " ,��, r  OS-.- J  OQ����  . o      ���� 0 	startlist 	startList��  ��   r  Vg/0/ n Ve121 7 Ye��34
�� 
cobj3 m  ]_���� 4 l `d5����5 \  `d676 o  ab���� 0 
startindex 
startIndex7 m  bc���� ��  ��  2 n VY898 o  WY���� 
0 _list_  9 o  VW���� 0 
listobject 
listObject0 o      ���� 0 	startlist 	startList :;: Z  h�<=��>< =  hk?@? o  hi���� 0 endindex endIndex@ o  ij���� 0 
listlength 
listLength= r  nrABA J  np����  B o      ���� 0 endlist endList��  > r  u�CDC n u�EFE 7 x���GH
�� 
cobjG l |�I����I [  |�JKJ o  }~���� 0 endindex endIndexK m  ~���� ��  ��  H m  ��������F n uxLML o  vx���� 
0 _list_  M o  uv���� 0 
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
listObject��  � ��� r   � ���� [   � ���� o   � ��� 0 u  � m   � ��~�~ � o      �}�} 0 u  � ��� r   � ���� n  � ���� 4   � ��|�
�| 
cobj� o   � ��{�{ 0 i  � n  � ���� o   � ��z�z 
0 _list_  � o   � ��y�y 0 
listobject 
listObject� n     ��� 4   � ��x�
�x 
cobj� o   � ��w�w 0 u  � n  � ���� o   � ��v�v 
0 _list_  � o   � ��u�u 0 
listobject 
listObject� ��t� r   � ���� [   � ���� o   � ��s�s 0 i  � m   � ��r�r � o      �q�q 0 i  �t  � ?   = @��� o   = >�p�p 0 i  � o   > ?�o�o 0 
listlength 
listLength� ��n� L   � ��� n  � ���� 7  � ��m��
�m 
cobj� m   � ��l�l � o   � ��k�k 0 u  � n  � ���� o   � ��j�j 
0 _list_  � o   � ��i�i 0 
listobject 
listObject�n  o R      �h��
�h .ascrerr ****      � ****� o      �g�g 0 etext eText� �f��
�f 
errn� o      �e�e 0 enumber eNumber� �d��
�d 
erob� o      �c�c 0 efrom eFrom� �b��a
�b 
errt� o      �`�` 
0 eto eTo�a  p I   � ��_��^�_ 
0 _error  � ��� m   � ��� ��� 6 r e m o v e   d u p l i c a t e s   f r o m   l i s t� ��� o   � ��]�] 0 etext eText� ��� o   � ��\�\ 0 enumber eNumber� ��� o   � ��[�[ 0 efrom eFrom� ��Z� o   � ��Y�Y 
0 eto eTo�Z  �^  j ��� l     �X�W�V�X  �W  �V  � � � l     �U�T�S�U  �T  �S     i  ) , I     �R
�R .Lst:SliLnull���     **** o      �Q�Q 0 thelist theList �P
�P 
FIdx |�O�N	�M
�O  �N  	 o      �L�L 0 
startindex 
startIndex�M  
 l     �K�J m      �I
�I 
msng�K  �J   �H�G
�H 
TIdx |�F�E�D�F  �E   o      �C�C 0 endindex endIndex�D   l     �B�A m      �@
�@ 
msng�B  �A  �G   Q    � k   t  r     n    I    �?�>�? "0 aslistparameter asListParameter �= o    	�<�< 0 thelist theList�=  �>   o    �;�; 0 _support   o      �:�: 0 thelist theList  r     n    !  1    �9
�9 
leng! o    �8�8 0 thelist theList o      �7�7 0 	thelength 	theLength "#" Z    �$%&�6$ >   '(' o    �5�5 0 
startindex 
startIndex( m    �4
�4 
msng% k    o)) *+* r    ),-, n   './. I   ! '�30�2�3 (0 asintegerparameter asIntegerParameter0 121 o   ! "�1�1 0 
startindex 
startIndex2 3�03 m   " #44 �55  f r o m   i t e m�0  �2  / o    !�/�/ 0 _support  - o      �.�. 0 
startindex 
startIndex+ 676 l  * *�-89�-  8 J D note: index 0 is disallowed as it makes behavior confusing to users   9 �:: �   n o t e :   i n d e x   0   i s   d i s a l l o w e d   a s   i t   m a k e s   b e h a v i o r   c o n f u s i n g   t o   u s e r s7 ;<; Z  * <=>�,�+= =   * -?@? o   * +�*�* 0 
startindex 
startIndex@ m   + ,�)�)  > R   0 8�(AB
�( .ascrerr ****      � ****A m   6 7CC �DD d I n v a l i d   i n d e x   (  f r o m   i t e m    p a r a m e t e r   c a n n o t   b e   0 ) .B �'EF
�' 
errnE m   2 3�&�&�YF �%G�$
�% 
erobG o   4 5�#�# 0 
startindex 
startIndex�$  �,  �+  < H�"H Z   = oIJ�!� I =  = @KLK o   = >�� 0 endindex endIndexL m   > ?�
� 
msngJ Z   C kMNOPM A   C GQRQ o   C D�� 0 
startindex 
startIndexR d   D FSS o   D E�� 0 	thelength 	theLengthN L   J OTT n  J NUVU 2  K M�
� 
cobjV o   J K�� 0 thelist theListO WXW ?   R UYZY o   R S�� 0 
startindex 
startIndexZ o   S T�� 0 	thelength 	theLengthX [�[ L   X [\\ J   X Z��  �  P L   ^ k]] n  ^ j^_^ 7  _ i�`a
� 
cobj` o   c e�� 0 
startindex 
startIndexa m   f h����_ o   ^ _�� 0 thelist theList�!  �   �"  & bcb =  r uded o   r s�� 0 endindex endIndexe m   s t�
� 
msngc f�f R   x ~�gh
� .ascrerr ****      � ****g m   | }ii �jj ^ M i s s i n g    f r o m   i t e m    a n d / o r    t o   i t e m    p a r a m e t e r .h �k�
� 
errnk m   z {���[�  �  �6  # lml Z   � �no�
�	n >  � �pqp o   � ��� 0 endindex endIndexq m   � ��
� 
msngo k   � �rr sts r   � �uvu n  � �wxw I   � ��y�� (0 asintegerparameter asIntegerParametery z{z o   � ��� 0 endindex endIndex{ |�| m   � �}} �~~  t o   i t e m�  �  x o   � ��� 0 _support  v o      �� 0 endindex endIndext � Z  � ���� ��� =   � ���� o   � ����� 0 endindex endIndex� m   � �����  � R   � �����
�� .ascrerr ****      � ****� m   � ��� ��� ` I n v a l i d   i n d e x   (  t o   i t e m    p a r a m e t e r   c a n n o t   b e   0 ) .� ����
�� 
errn� m   � ������Y� �����
�� 
erob� o   � ����� 0 endindex endIndex��  �   ��  � ���� Z   � �������� =  � ���� o   � ����� 0 
startindex 
startIndex� m   � ���
�� 
msng� Z   � ������ A   � ���� o   � ����� 0 endindex endIndex� d   � ��� o   � ����� 0 	thelength 	theLength� L   � ��� J   � �����  � ��� ?   � ���� o   � ����� 0 endindex endIndex� o   � ����� 0 	thelength 	theLength� ���� L   � ��� n  � ���� 2  � ���
�� 
cobj� o   � ����� 0 thelist theList��  � L   � ��� n  � ���� 7  � �����
�� 
cobj� m   � ����� � o   � ����� 0 endindex endIndex� o   � ����� 0 thelist theList��  ��  ��  �
  �	  m ��� l  � �������  � + % both start and end indexes are given   � ��� J   b o t h   s t a r t   a n d   e n d   i n d e x e s   a r e   g i v e n� ��� Z  � �������� A   � ���� o   � ����� 0 
startindex 
startIndex� m   � �����  � r   � ���� [   � ���� [   � ���� o   � ����� 0 	thelength 	theLength� m   � ����� � o   � ����� 0 
startindex 
startIndex� o      ���� 0 
startindex 
startIndex��  ��  � ��� Z  �������� A   � ���� o   � ����� 0 endindex endIndex� m   � �����  � r   � ��� [   � ���� [   � ���� o   � ����� 0 	thelength 	theLength� m   � ����� � o   � ����� 0 endindex endIndex� o      ���� 0 endindex endIndex��  ��  � ��� Z 2������� G  (��� G  ��� ?  ��� o  ���� 0 
startindex 
startIndex� o  ���� 0 endindex endIndex� F  ��� A  ��� o  ���� 0 
startindex 
startIndex� m  ���� � A  ��� o  ���� 0 endindex endIndex� l 
������ m  ���� ��  ��  � F  &��� ?  ��� o  ���� 0 
startindex 
startIndex� o  ���� 0 	thelength 	theLength� ?  !$��� o  !"���� 0 endindex endIndex� o  "#���� 0 	thelength 	theLength� L  +.�� J  +-����  ��  ��  � ��� Z  3L������ A  36��� o  34���� 0 
startindex 
startIndex� m  45���� � r  9<��� m  9:���� � o      ���� 0 
startindex 
startIndex� ��� ?  ?B��� o  ?@���� 0 
startindex 
startIndex� o  @A���� 0 	thelength 	theLength� ���� r  EH��� o  EF���� 0 	thelength 	theLength� o      ���� 0 
startindex 
startIndex��  ��  � ��� Z  Mf������ A  MP��� o  MN���� 0 endindex endIndex� m  NO���� � r  SV��� m  ST���� � o      ���� 0 endindex endIndex� ��� ?  Y\��� o  YZ���� 0 endindex endIndex� o  Z[���� 0 	thelength 	theLength� ���� r  _b��� o  _`���� 0 	thelength 	theLength� o      ���� 0 endindex endIndex��  ��  � ���� L  gt�� n  gs��� 7 hr��� 
�� 
cobj� o  ln���� 0 
startindex 
startIndex  o  oq���� 0 endindex endIndex� o  gh���� 0 thelist theList��   R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   I  |������� 
0 _error   	
	 m  }� �  s l i c e   l i s t
  o  ������ 0 etext eText  o  ������ 0 enumber eNumber  o  ������ 0 efrom eFrom �� o  ������ 
0 eto eTo��  ��    l     ��������  ��  ��    l     ��������  ��  ��    i  - 0 I     ��
�� .Lst:Trannull���     **** o      ���� 0 thelist theList ��
�� 
Whil |���� ��!��  ��    o      ���� 0 unevenoption unevenOption��  ! l     "����" m      ��
�� LTrhLTrR��  ��   ��#��
�� 
PadI# |����$��%��  ��  $ o      ���� 0 padvalue padValue��  % l     &����& m      ��
�� 
msng��  ��  ��   Q    �'()' k   �** +,+ Z   -.����- =   /0/ o    ���� 0 thelist theList0 J    ����  . L   
 11 J   
 ��  ��  ��  , 232 Z   >45�~�}4 G    /676 =    898 l   :�|�{: I   �z;<
�z .corecnte****       ****; J    == >�y> o    �x�x 0 thelist theList�y  < �w?�v
�w 
kocl? m    �u
�u 
list�v  �|  �{  9 m    �t�t  7 >     -@A@ l    'B�s�rB I    '�qCD
�q .corecnte****       ****C o     !�p�p 0 thelist theListD �oE�n
�o 
koclE m   " #�m
�m 
list�n  �s  �r  A l  ' ,F�l�kF I  ' ,�jG�i
�j .corecnte****       ****G o   ' (�h�h 0 thelist theList�i  �l  �k  5 R   2 :�gHI
�g .ascrerr ****      � ****H m   8 9JJ �KK ( N o t   a   l i s t   o f   l i s t s .I �fLM
�f 
errnL m   4 5�e�e�YM �dN�c
�d 
erobN o   6 7�b�b 0 thelist theList�c  �~  �}  3 OPO h   ? F�aQ�a 0 
listobject 
listObjectQ k      RR STS j     �`U�` 
0 _list_  U o     �_�_ 0 thelist theListT V�^V j    
�]W�] 0 _resultlist_ _resultList_W J    	�\�\  �^  P XYX r   G QZ[Z n   G O\]\ 1   M O�[
�[ 
leng] n  G M^_^ 4   J M�Z`
�Z 
cobj` m   K L�Y�Y _ n  G Jaba o   H J�X�X 
0 _list_  b o   G H�W�W 0 
listobject 
listObject[ o      �V�V $0 resultlistlength resultListLengthY cdc l  R R�Uef�U  e K E find the longest/shortest sublist; this will be length of resultList   f �gg �   f i n d   t h e   l o n g e s t / s h o r t e s t   s u b l i s t ;   t h i s   w i l l   b e   l e n g t h   o f   r e s u l t L i s td hih Z   R jklmj =  R Unon o   R S�T�T 0 unevenoption unevenOptiono m   S T�S
�S LTrhLTrRk X   X �p�Rqp Z  j �rs�Q�Pr >   j otut n  j mvwv 1   k m�O
�O 
lengw o   j k�N�N 0 aref aRefu o   m n�M�M $0 resultlistlength resultListLengths R   r |�Lxy
�L .ascrerr ****      � ****x m   x {zz �{{ x I n v a l i d   d i r e c t   p a r a m e t e r   ( s u b l i s t s   a r e   n o t   a l l   s a m e   l e n g t h ) .y �K|}
�K 
errn| m   t u�J�J�Y} �I~�H
�I 
erob~ o   v w�G�G 0 thelist theList�H  �Q  �P  �R 0 aref aRefq n  [ ^� o   \ ^�F�F 
0 _list_  � o   [ \�E�E 0 
listobject 
listObjectl ��� =  � ���� o   � ��D�D 0 unevenoption unevenOption� m   � ��C
�C LTrhLTrP� ��� X   � ���B�� Z  � ����A�@� ?   � ���� n  � ���� 1   � ��?
�? 
leng� o   � ��>�> 0 aref aRef� o   � ��=�= $0 resultlistlength resultListLength� r   � ���� n  � ���� 1   � ��<
�< 
leng� o   � ��;�; 0 aref aRef� o      �:�: $0 resultlistlength resultListLength�A  �@  �B 0 aref aRef� n  � ���� o   � ��9�9 
0 _list_  � o   � ��8�8 0 
listobject 
listObject� ��� =  � ���� o   � ��7�7 0 unevenoption unevenOption� m   � ��6
�6 LTrhLTrT� ��5� X   � ���4�� Z  � ����3�2� A   � ���� n  � ���� 1   � ��1
�1 
leng� o   � ��0�0 0 aref aRef� o   � ��/�/ $0 resultlistlength resultListLength� r   � ���� n  � ���� 1   � ��.
�. 
leng� o   � ��-�- 0 aref aRef� o      �,�, $0 resultlistlength resultListLength�3  �2  �4 0 aref aRef� n  � ���� o   � ��+�+ 
0 _list_  � o   � ��*�* 0 
listobject 
listObject�5  m R   � �)��
�) .ascrerr ****      � ****� m   � ��� ��� h I n v a l i d    w h i l e    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .� �(��
�( 
errn� m   � ��'�'�Y� �&��
�& 
erob� o   � ��%�% 0 unevenoption unevenOption� �$��#
�$ 
errt� m   � ��"
�" 
enum�#  i ��� Z  ����!� � ?  ��� o  �� $0 resultlistlength resultListLength� m  ��  � k  ��� ��� l ����  � � � build empty matrix (due to inefficiencies of AS's list implementation, when populating large lists, it's probably quicker to create a padded list then set its items rather than start with an empty list and append items)   � ����   b u i l d   e m p t y   m a t r i x   ( d u e   t o   i n e f f i c i e n c i e s   o f   A S ' s   l i s t   i m p l e m e n t a t i o n ,   w h e n   p o p u l a t i n g   l a r g e   l i s t s ,   i t ' s   p r o b a b l y   q u i c k e r   t o   c r e a t e   a   p a d d e d   l i s t   t h e n   s e t   i t s   i t e m s   r a t h e r   t h a n   s t a r t   w i t h   a n   e m p t y   l i s t   a n d   a p p e n d   i t e m s )� ��� r  ��� n  ��� 1  
�
� 
leng� n 
��� o  
�� 
0 _list_  � o  �� 0 
listobject 
listObject� o      �� *0 resultsublistlength resultSubListLength� ��� r  ��� I  ���� "0 _makelistobject _makeListObject� ��� o  �� *0 resultsublistlength resultSubListLength� ��� o  �� 0 padvalue padValue�  �  � o      �� 0 resultsublist resultSubList� ��� r  !��� o  �� 0 resultsublist resultSubList� n      ���  ;   � n ��� o  �� 0 _resultlist_ _resultList_� o  �� 0 
listobject 
listObject� ��� Y  "<������ l ,7���� r  ,7��� l ,0���� e  ,0�� n ,0��� 2 -/�
� 
cobj� o  ,-�
�
 0 resultsublist resultSubList�  �  � n      ���  ;  56� n 05��� o  15�	�	 0 _resultlist_ _resultList_� o  01�� 0 
listobject 
listObject�   shallow copy   � ���    s h a l l o w   c o p y� 0 i  � m  %&�� � o  &'�� $0 resultlistlength resultListLength�  � ��� l ==����  �   populate matrix   � ���     p o p u l a t e   m a t r i x� ��� Z  =������ = =B��� o  =>�� 0 unevenoption unevenOption� m  >A�
� LTrhLTrP� Y  E��� ����� Y  O{�������� r  av��� n  aj��� 4  gj���
�� 
cobj� o  hi���� 0 j  � n  ag��� 4  dg�� 
�� 
cobj  o  ef���� 0 i  � n ad o  bd���� 
0 _list_   o  ab���� 0 
listobject 
listObject� n       4  ru��
�� 
cobj o  st���� 0 i   n  jr 4  or��
�� 
cobj o  pq���� 0 j   n jo	
	 o  ko���� 0 _resultlist_ _resultList_
 o  jk���� 0 
listobject 
listObject�� 0 j  � m  RS���� � n  S\ 1  Y[��
�� 
leng n SY 4  VY��
�� 
cobj o  WX���� 0 i   n SV o  TV���� 
0 _list_   o  ST���� 0 
listobject 
listObject��  �  0 i  � m  HI���� � o  IJ���� *0 resultsublistlength resultSubListLength��  �  � Y  ������ Y  ������ r  �� n  �� 4  ����
�� 
cobj o  ������ 0 j   n  �� 4  ����
�� 
cobj o  ������ 0 i   n �� !  o  ������ 
0 _list_  ! o  ������ 0 
listobject 
listObject n      "#" 4  ����$
�� 
cobj$ o  ������ 0 i  # n  ��%&% 4  ����'
�� 
cobj' o  ������ 0 j  & n ��()( o  ������ 0 _resultlist_ _resultList_) o  ������ 0 
listobject 
listObject�� 0 j   m  ������  o  ������ $0 resultlistlength resultListLength��  �� 0 i   m  ������  o  ������ *0 resultsublistlength resultSubListLength��  �  �!  �   � *��* L  ��++ n ��,-, o  ������ 0 _resultlist_ _resultList_- o  ������ 0 
listobject 
listObject��  ( R      ��./
�� .ascrerr ****      � ****. o      ���� 0 etext eText/ ��01
�� 
errn0 o      ���� 0 enumber eNumber1 ��23
�� 
erob2 o      ���� 0 efrom eFrom3 ��4��
�� 
errt4 o      ���� 
0 eto eTo��  ) I  ����5���� 
0 _error  5 676 m  ��88 �99  t r a n s p o s e   l i s t7 :;: o  ������ 0 etext eText; <=< o  ������ 0 enumber eNumber= >?> o  ������ 0 efrom eFrom? @��@ o  ������ 
0 eto eTo��  ��   ABA l     ��������  ��  ��  B CDC l     ��������  ��  ��  D EFE l     ��GH��  G J D--------------------------------------------------------------------   H �II � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -F JKJ l     ��LM��  L   search   M �NN    s e a r c hK OPO l     ��������  ��  ��  P QRQ i  1 4STS I     ��UV
�� .Lst:Findnull���     ****U o      ���� 0 thelist theListV ��WX
�� 
ValuW |����Y��Z��  ��  Y o      ���� 0 theitem theItem��  Z l     [����[ m      ��
�� 
msng��  ��  X ��\]
�� 
Usin\ |����^��_��  ��  ^ o      ���� 0 	thescript 	theScript��  _ l     `����` m      ��
�� 
msng��  ��  ] ��a��
�� 
Retua |����b��c��  ��  b o      ���� (0 findingoccurrences findingOccurrences��  c l     d����d m      ��
�� LFWhLFWA��  ��  ��  T Q    �efge k   �hh iji h    
��k�� 0 
listobject 
listObjectk k      ll mnm j     ��o�� 
0 _list_  o n    pqp I    ��r���� "0 aslistparameter asListParameterr sts o    
���� 0 thelist theListt u��u m   
 vv �ww  ��  ��  q o     ���� 0 _support  n x��x j    ��y�� 0 _result_  y J    ����  ��  j z{z Z   �|}~| =   ��� o    ���� (0 findingoccurrences findingOccurrences� m    ��
�� LFWhLFWA} Z    }������ =   ��� o    ���� 0 	thescript 	theScript� m    ��
�� 
msng� Y    @�������� Z   & ;������� =  & .��� n   & ,��� 4   ) ,���
�� 
cobj� o   * +���� 0 i  � n  & )��� o   ' )���� 
0 _list_  � o   & '���� 0 
listobject 
listObject� o   , -���� 0 theitem theItem� r   1 7��� o   1 2���� 0 i  � n      ���  ;   5 6� n  2 5��� o   3 5���� 0 _result_  � o   2 3���� 0 
listobject 
listObject��  ��  �� 0 i  � m    ���� � n    !��� 1     �
� 
leng� n   ��� o    �~�~ 
0 _list_  � o    �}�} 0 
listobject 
listObject��  ��  � k   C }�� ��� r   C P��� n  C N��� I   H N�|��{�| &0 asscriptparameter asScriptParameter� ��� o   H I�z�z 0 	thescript 	theScript� ��y� m   I J�� ��� 
 u s i n g�y  �{  � o   C H�x�x 0 _support  � o      �w�w 0 	thescript 	theScript� ��v� Y   Q }��u���t� Z   ` x���s�r� n  ` k��� I   a k�q��p�q 0 	checkitem 	checkItem� ��o� n   a g��� 4   d g�n�
�n 
cobj� o   e f�m�m 0 i  � n  a d��� o   b d�l�l 
0 _list_  � o   a b�k�k 0 
listobject 
listObject�o  �p  � o   ` a�j�j 0 	thescript 	theScript� r   n t��� o   n o�i�i 0 i  � n      ���  ;   r s� n  o r��� o   p r�h�h 0 _result_  � o   o p�g�g 0 
listobject 
listObject�s  �r  �u 0 i  � m   T U�f�f � n   U [��� 1   X Z�e
�e 
leng� n  U X��� o   V X�d�d 
0 _list_  � o   U V�c�c 0 
listobject 
listObject�t  �v  ~ ��� =  � ���� o   � ��b�b (0 findingoccurrences findingOccurrences� m   � ��a
�a LFWhLFWF� ��� Z   � ����`�� =  � ���� o   � ��_�_ 0 	thescript 	theScript� m   � ��^
�^ 
msng� Y   � ���]���\� Z   � ����[�Z� =  � ���� n   � ���� 4   � ��Y�
�Y 
cobj� o   � ��X�X 0 i  � n  � ���� o   � ��W�W 
0 _list_  � o   � ��V�V 0 
listobject 
listObject� o   � ��U�U 0 theitem theItem� k   � ��� ��� r   � ���� o   � ��T�T 0 i  � n      ���  ;   � �� n  � ���� o   � ��S�S 0 _result_  � o   � ��R�R 0 
listobject 
listObject� ��Q�  S   � ��Q  �[  �Z  �] 0 i  � m   � ��P�P � n   � ���� 1   � ��O
�O 
leng� n  � ���� o   � ��N�N 
0 _list_  � o   � ��M�M 0 
listobject 
listObject�\  �`  � k   � ��� ��� r   � ���� n  � ���� I   � ��L��K�L &0 asscriptparameter asScriptParameter� ��� o   � ��J�J 0 	thescript 	theScript� ��I� m   � ��� ��� 
 u s i n g�I  �K  � o   � ��H�H 0 _support  � o      �G�G 0 	thescript 	theScript� ��F� Y   � ���E���D� Z   � ����C�B� n  � ���� I   � ��A��@�A 0 	checkitem 	checkItem� ��?� n   � �� � 4   � ��>
�> 
cobj o   � ��=�= 0 i    n  � � o   � ��<�< 
0 _list_   o   � ��;�; 0 
listobject 
listObject�?  �@  � o   � ��:�: 0 	thescript 	theScript� k   � �  r   � � o   � ��9�9 0 i   n      	
	  ;   � �
 n  � � o   � ��8�8 0 _result_   o   � ��7�7 0 
listobject 
listObject �6  S   � ��6  �C  �B  �E 0 i  � m   � ��5�5 � n   � � 1   � ��4
�4 
leng n  � � o   � ��3�3 
0 _list_   o   � ��2�2 0 
listobject 
listObject�D  �F  �  =  � � o   � ��1�1 (0 findingoccurrences findingOccurrences m   � ��0
�0 LFWhLFWL �/ Z   �o�. =  � o   � �-�- 0 	thescript 	theScript m   �,
�, 
msng Y  0�+ Z  + !�*�)  = "#" n  $%$ 4  �(&
�( 
cobj& o  �'�' 0 i  % n '(' o  �&�& 
0 _list_  ( o  �%�% 0 
listobject 
listObject# o  �$�$ 0 theitem theItem! k  ')) *+* r  %,-, o   �#�# 0 i  - n      ./.  ;  #$/ n  #010 o  !#�"�" 0 _result_  1 o   !�!�! 0 
listobject 
listObject+ 2� 2  S  &'�   �*  �)  �+ 0 i   n  343 1  �
� 
leng4 n 565 o  	�� 
0 _list_  6 o  	�� 0 
listobject 
listObject m  ��  m  �����.   k  3o77 898 r  3@:;: n 3><=< I  8>�>�� &0 asscriptparameter asScriptParameter> ?@? o  89�� 0 	thescript 	theScript@ A�A m  9:BB �CC 
 u s i n g�  �  = o  38�� 0 _support  ; o      �� 0 	thescript 	theScript9 D�D Y  AoE�FGHE Z  PjIJ��I n P[KLK I  Q[�M�� 0 	checkitem 	checkItemM N�N n  QWOPO 4  TW�Q
� 
cobjQ o  UV�� 0 i  P n QTRSR o  RT�� 
0 _list_  S o  QR�
�
 0 
listobject 
listObject�  �  L o  PQ�	�	 0 	thescript 	theScriptJ k  ^fTT UVU r  ^dWXW o  ^_�� 0 i  X n      YZY  ;  bcZ n _b[\[ o  `b�� 0 _result_  \ o  _`�� 0 
listobject 
listObjectV ]�]  S  ef�  �  �  � 0 i  F n  DJ^_^ 1  GI�
� 
leng_ n DG`a` o  EG�� 
0 _list_  a o  DE�� 0 
listobject 
listObjectG m  JK�� H m  KL� � ���  �/   R  r���bc
�� .ascrerr ****      � ****b m  ��dd �ee p I n v a l i d    r e t u r n i n g    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .c ��fg
�� 
errnf m  vy�����Yg ��hi
�� 
erobh o  |}���� (0 findingoccurrences findingOccurrencesi ��j��
�� 
errtj m  ����
�� 
enum��  { k��k L  ��ll n ��mnm o  ������ 0 _result_  n o  ������ 0 
listobject 
listObject��  f R      ��op
�� .ascrerr ****      � ****o o      ���� 0 etext eTextp ��qr
�� 
errnq o      ���� 0 enumber eNumberr ��st
�� 
erobs o      ���� 0 efrom eFromt ��u��
�� 
errtu o      ���� 
0 eto eTo��  g I  ����v���� 
0 _error  v wxw m  ��yy �zz  f i n d   i n   l i s tx {|{ o  ������ 0 etext eText| }~} o  ������ 0 enumber eNumber~ � o  ������ 0 efrom eFrom� ���� o  ������ 
0 eto eTo��  ��  R ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �ZT map, filter, reduce (these operations are relatively trivial to perform in AS without the need for callbacks; however, these handlers are more flexible when the convert/check/combine operations are parameterized and also provide more advanced users with idiomatic examples of how to parameterize a general-purpose handler's exact behavior)   � ����   m a p ,   f i l t e r ,   r e d u c e   ( t h e s e   o p e r a t i o n s   a r e   r e l a t i v e l y   t r i v i a l   t o   p e r f o r m   i n   A S   w i t h o u t   t h e   n e e d   f o r   c a l l b a c k s ;   h o w e v e r ,   t h e s e   h a n d l e r s   a r e   m o r e   f l e x i b l e   w h e n   t h e   c o n v e r t / c h e c k / c o m b i n e   o p e r a t i o n s   a r e   p a r a m e t e r i z e d   a n d   a l s o   p r o v i d e   m o r e   a d v a n c e d   u s e r s   w i t h   i d i o m a t i c   e x a m p l e s   o f   h o w   t o   p a r a m e t e r i z e   a   g e n e r a l - p u r p o s e   h a n d l e r ' s   e x a c t   b e h a v i o r )� ��� l     ��������  ��  ��  � ��� l     ������  � � � note: while these handlers prevent the script object from modifying the input list directly, it cannot stop them modifying mutable (date/list/record/script/reference) items within the input list (doing so would be very bad practice, however)   � ����   n o t e :   w h i l e   t h e s e   h a n d l e r s   p r e v e n t   t h e   s c r i p t   o b j e c t   f r o m   m o d i f y i n g   t h e   i n p u t   l i s t   d i r e c t l y ,   i t   c a n n o t   s t o p   t h e m   m o d i f y i n g   m u t a b l e   ( d a t e / l i s t / r e c o r d / s c r i p t / r e f e r e n c e )   i t e m s   w i t h i n   t h e   i n p u t   l i s t   ( d o i n g   s o   w o u l d   b e   v e r y   b a d   p r a c t i c e ,   h o w e v e r )� ��� l     ��������  ��  ��  � ��� i  5 8��� I     ����
�� .Lst:Map_null���     ****� o      ���� 0 thelist theList� �����
�� 
Usin� o      ���� 0 	thescript 	theScript��  � Q     ����� k    ��� ��� h    
����� $0 resultlistobject resultListObject� j     ����� 
0 _list_  � n     ��� 2   ��
�� 
cobj� n    ��� I    ������� "0 aslistparameter asListParameter� ��� o    
���� 0 thelist theList� ���� m   
 �� ���  ��  ��  � o     ���� 0 _support  � ��� r    ��� n   ��� I    ������� &0 asscriptparameter asScriptParameter� ��� o    ���� 0 	thescript 	theScript� ���� m    �� ��� 
 u s i n g��  ��  � o    ���� 0 _support  � o      ���� 0 	thescript 	theScript� ��� Q    ����� Y    B�������� l  + =���� r   + =��� n  + 6��� I   , 6������� 0 convertitem convertItem� ���� n   , 2��� 4   / 2���
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
0 eto eTo��  � k   J ��� ��� Z   J h������ ?   J M��� o   J K���� 0 i  � m   K L���� � r   P a��� n   P _��� 7  S _����
�� 
cobj� m   W Y���� � l  Z ^������ \   Z ^��� o   [ \���� 0 i  � m   \ ]���� ��  ��  � n  P S��� o   Q S���� 
0 _list_  � o   P Q���� $0 resultlistobject resultListObject� o      ���� 0 epartial ePartial��  � r   d h��� J   d f����  � o      ���� 0 epartial ePartial� ���� R   i �����
�� .ascrerr ****      � ****� b   � ���� b   � ���� b   � �� � m   � � � , C o u l d n  t   c o n v e r t   i t e m    o   � ����� 0 i  � m   � � �  :  � o   � ����� 0 etext eText� ��
�� 
errn o   k l���� 0 enumber eNumber ��
�� 
erob l  m |	����	 N   m |

 n   m { 4   x {��
�� 
cobj o   y z���� 0 i   n  m x I   r x������ "0 aslistparameter asListParameter  o   r s���� 0 thelist theList �� m   s t �  ��  ��   o   m r���� 0 _support  ��  ��   ��
�� 
errt o   } ~���� 
0 eto eTo ����
�� 
ptlr o   � ����� 0 epartial ePartial��  ��  � �� L   � � n  � � o   � ����� 
0 _list_   o   � ����� $0 resultlistobject resultListObject��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText �� 
�� 
errn o      ���� 0 enumber eNumber  �!"
� 
erob! o      �~�~ 0 efrom eFrom" �}#$
�} 
errt# o      �|�| 
0 eto eTo$ �{%�z
�{ 
ptlr% o      �y�y 0 epartial ePartial�z  � I   � ��x&�w�x 20 _errorwithpartialresult _errorWithPartialResult& '(' m   � �)) �**  m a p   l i s t( +,+ o   � ��v�v 0 etext eText, -.- o   � ��u�u 0 enumber eNumber. /0/ o   � ��t�t 0 efrom eFrom0 121 o   � ��s�s 
0 eto eTo2 3�r3 o   � ��q�q 0 epartial ePartial�r  �w  � 454 l     �p�o�n�p  �o  �n  5 676 l     �m�l�k�m  �l  �k  7 898 i  9 <:;: I     �j<=
�j .Lst:Filtnull���     ****< o      �i�i 0 thelist theList= �h>�g
�h 
Usin> o      �f�f 0 	thescript 	theScript�g  ; Q     �?@A? k    �BB CDC h    
�eE�e $0 resultlistobject resultListObjectE j     �dF�d 
0 _list_  F n     GHG 2   �c
�c 
cobjH n    IJI I    �bK�a�b "0 aslistparameter asListParameterK LML o    
�`�` 0 thelist theListM N�_N m   
 OO �PP  �_  �a  J o     �^�^ 0 _support  D QRQ r    STS n   UVU I    �]W�\�] &0 asscriptparameter asScriptParameterW XYX o    �[�[ 0 	thescript 	theScriptY Z�ZZ m    [[ �\\ 
 u s i n g�Z  �\  V o    �Y�Y 0 _support  T o      �X�X 0 	thescript 	theScriptR ]^] r    _`_ m    �W�W  ` o      �V�V 0 	lastindex 	lastIndex^ aba Q    �cdec Y     Xf�Ugh�Tf k   / Sii jkj r   / 7lml n   / 5non 4   2 5�Sp
�S 
cobjp o   3 4�R�R 0 i  o n  / 2qrq o   0 2�Q�Q 
0 _list_  r o   / 0�P�P $0 resultlistobject resultListObjectm o      �O�O 0 theitem theItemk s�Ns Z   8 Stu�M�Lt n  8 >vwv I   9 >�Kx�J�K 0 	checkitem 	checkItemx y�Iy o   9 :�H�H 0 theitem theItem�I  �J  w o   8 9�G�G 0 	thescript 	theScriptu k   A Ozz {|{ r   A F}~} [   A D� o   A B�F�F 0 	lastindex 	lastIndex� m   B C�E�E ~ o      �D�D 0 	lastindex 	lastIndex| ��C� r   G O��� o   G H�B�B 0 theitem theItem� n      ��� 4   K N�A�
�A 
cobj� o   L M�@�@ 0 	lastindex 	lastIndex� n  H K��� o   I K�?�? 
0 _list_  � o   H I�>�> $0 resultlistobject resultListObject�C  �M  �L  �N  �U 0 i  g m   # $�=�= h n   $ *��� 1   ' )�<
�< 
leng� n  $ '��� o   % '�;�; 
0 _list_  � o   $ %�:�: $0 resultlistobject resultListObject�T  d R      �9��
�9 .ascrerr ****      � ****� o      �8�8 0 etext eText� �7��
�7 
errn� o      �6�6 0 enumber eNumber� �5��4
�5 
errt� o      �3�3 
0 eto eTo�4  e k   ` ��� ��� Z   ` ~���2�� ?   ` c��� o   ` a�1�1 0 	lastindex 	lastIndex� m   a b�0�0 � r   f w��� n   f u��� 7  i u�/��
�/ 
cobj� m   m o�.�. � l  p t��-�,� \   p t��� o   q r�+�+ 0 	lastindex 	lastIndex� m   r s�*�* �-  �,  � n  f i��� o   g i�)�) 
0 _list_  � o   f g�(�( $0 resultlistobject resultListObject� o      �'�' 0 epartial ePartial�2  � r   z ~��� J   z |�&�&  � o      �%�% 0 epartial ePartial� ��$� R    ��#��
�# .ascrerr ****      � ****� b   � ���� b   � ���� b   � ���� m   � ��� ��� * C o u l d n  t   f i l t e r   i t e m  � o   � ��"�" 0 i  � m   � ��� ���  :  � o   � ��!�! 0 etext eText� � ��
�  
errn� o   � ��� 0 enumber eNumber� ���
� 
erob� l  � ����� N   � ��� n   � ���� 4   � ���
� 
cobj� o   � ��� 0 i  � n  � ���� I   � ����� "0 aslistparameter asListParameter� ��� o   � ��� 0 thelist theList� ��� m   � ��� ���  �  �  � o   � ��� 0 _support  �  �  � ���
� 
errt� o   � ��� 
0 eto eTo� ���
� 
ptlr� o   � ��� 0 epartial ePartial�  �$  b ��� Z  � ������ =   � ���� o   � ��� 0 	lastindex 	lastIndex� m   � ���  � L   � ��� J   � ���  �  �  � ��
� L   � ��� n  � ���� 7  � ��	��
�	 
cobj� m   � ��� � o   � ��� 0 	lastindex 	lastIndex� n  � ���� o   � ��� 
0 _list_  � o   � ��� $0 resultlistobject resultListObject�
  @ R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� � ��
�  
erob� o      ���� 0 efrom eFrom� ����
�� 
errt� o      ���� 
0 eto eTo� �����
�� 
ptlr� o      ���� 0 epartial ePartial��  A I   � �������� 20 _errorwithpartialresult _errorWithPartialResult� ��� m   � ��� ���  f i l t e r   l i s t� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ��� o   � ����� 
0 eto eTo� ���� o   � ����� 0 epartial ePartial��  ��  9 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  = @��� I     ����
�� .Lst:Redunull���     ****� o      ���� 0 thelist theList� �����
�� 
Usin� o      ���� 0 	thescript 	theScript��  � k     ��� ��� r     ��� m     ��
�� 
msng� o      ���� 0 	theresult 	theResult� ���� Q    ��	 	� k    �		 			 h    ��	�� 0 
listobject 
listObject	 j     ��	�� 
0 _list_  	 n    			 I    ��		���� "0 aslistparameter asListParameter		 	
		
 o    
���� 0 thelist theList	 	��	 m   
 		 �		  ��  ��  	 o     ���� 0 _support  	 			 Z   &		����	 =    			 n    			 1    ��
�� 
leng	 n   			 o    ���� 
0 _list_  	 o    ���� 0 
listobject 
listObject	 m    ����  	 R    "��		
�� .ascrerr ****      � ****	 m     !		 �		  L i s t   i s   e m p t y .	 ��		
�� 
errn	 m    �����Y	 ��	��
�� 
erob	 J    ����  ��  ��  ��  	 	 	!	  r   ' 4	"	#	" n  ' 2	$	%	$ I   , 2��	&���� &0 asscriptparameter asScriptParameter	& 	'	(	' o   , -���� 0 	thescript 	theScript	( 	)��	) m   - .	*	* �	+	+ 
 u s i n g��  ��  	% o   ' ,���� 0 _support  	# o      ���� 0 	thescript 	theScript	! 	,	-	, r   5 =	.	/	. n   5 ;	0	1	0 4   8 ;��	2
�� 
cobj	2 m   9 :���� 	1 n  5 8	3	4	3 o   6 8���� 
0 _list_  	4 o   5 6���� 0 
listobject 
listObject	/ o      ���� 0 	theresult 	theResult	- 	5	6	5 Q   > �	7	8	9	7 Y   A c	:��	;	<��	: r   P ^	=	>	= n  P \	?	@	? I   Q \��	A���� 0 combineitem combineItem	A 	B	C	B o   Q R���� 0 	theresult 	theResult	C 	D��	D n   R X	E	F	E 4   U X��	G
�� 
cobj	G o   V W���� 0 i  	F n  R U	H	I	H o   S U���� 
0 _list_  	I o   R S���� 0 
listobject 
listObject��  ��  	@ o   P Q���� 0 	thescript 	theScript	> o      ���� 0 	theresult 	theResult�� 0 i  	; m   D E���� 	< n   E K	J	K	J 1   H J��
�� 
leng	K n  E H	L	M	L o   F H���� 
0 _list_  	M o   E F���� 0 
listobject 
listObject��  	8 R      ��	N	O
�� .ascrerr ****      � ****	N o      ���� 0 etext eText	O ��	P	Q
�� 
errn	P o      ���� 0 enumber eNumber	Q ��	R��
�� 
errt	R o      ���� 
0 eto eTo��  	9 R   k ���	S	T
�� .ascrerr ****      � ****	S b   � �	U	V	U b   � �	W	X	W b   � �	Y	Z	Y m   � �	[	[ �	\	\ * C o u l d n  t   r e d u c e   i t e m  	Z o   � ����� 0 i  	X m   � �	]	] �	^	^  :  	V o   � ����� 0 etext eText	T ��	_	`
�� 
errn	_ o   m n���� 0 enumber eNumber	` ��	a	b
�� 
erob	a l  o �	c����	c N   o �	d	d n   o 	e	f	e 4   | ��	g
�� 
cobj	g o   } ~���� 0 i  	f n  o |	h	i	h I   t |��	j���� "0 aslistparameter asListParameter	j 	k	l	k o   t u���� 0 thelist theList	l 	m��	m m   u x	n	n �	o	o  ��  ��  	i o   o t���� 0 _support  ��  ��  	b ��	p��
�� 
errt	p o   � ����� 
0 eto eTo��  	6 	q��	q L   � �	r	r o   � ����� 0 	theresult 	theResult��  	  R      ��	s	t
�� .ascrerr ****      � ****	s o      ���� 0 etext eText	t ��	u	v
�� 
errn	u o      ���� 0 enumber eNumber	v ��	w	x
�� 
erob	w o      ���� 0 efrom eFrom	x ��	y��
�� 
errt	y o      ���� 
0 eto eTo��  	 I   � ���	z���� 20 _errorwithpartialresult _errorWithPartialResult	z 	{	|	{ m   � �	}	} �	~	~  r e d u c e   l i s t	| 		�	 o   � ����� 0 etext eText	� 	�	�	� o   � ����� 0 enumber eNumber	� 	�	�	� o   � ����� 0 efrom eFrom	� 	�	�	� o   � ����� 
0 eto eTo	� 	���	� o   � ����� 0 	theresult 	theResult��  ��  ��  � 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��	�	���  	� J D--------------------------------------------------------------------   	� �	�	� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -	� 	�	�	� l     ��	�	���  	�   sort   	� �	�	� 
   s o r t	� 	�	�	� l     �������  ��  �  	� 	�	�	� l      �~	�	��~  	��� Notes: 

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
	� 	�	�	� l     �}�|�{�}  �|  �{  	� 	�	�	� l     �z�y�x�z  �y  �x  	� 	�	�	� l     	�	�	�	� j   A E�w	��w *0 _quicksortthreshold _quicksortThreshold	� m   A D�v�v 	� T N shorter ranges are sorted using insertion sort; longer ranges using quicksort   	� �	�	� �   s h o r t e r   r a n g e s   a r e   s o r t e d   u s i n g   i n s e r t i o n   s o r t ;   l o n g e r   r a n g e s   u s i n g   q u i c k s o r t	� 	�	�	� l     �u�t�s�u  �t  �s  	� 	�	�	� i  F I	�	�	� I      �r	��q�r 	0 _sort  	� 	�	�	� o      �p�p $0 resultlistobject resultListObject	� 	�	�	� o      �o�o 0 
startindex 
startIndex	� 	�	�	� o      �n�n 0 endindex endIndex	� 	�	�	� o      �m�m  0 sortcomparator sortComparator	� 	��l	� o      �k�k 0 usequicksort useQuickSort�l  �q  	� l   	�	�	�	� k    	�	� 	�	�	� Z    t	�	��j�i	� o     �h�h 0 usequicksort useQuickSort	� l  p	�	�	�	� k   p	�	� 	�	�	� Z   	�	��g�f	� A    		�	�	� \    	�	�	� o    �e�e 0 endindex endIndex	� o    �d�d 0 
startindex 
startIndex	� m    �c�c 	� L    �b�b  �g  �f  	� 	�	�	� r    &	�	�	� J    	�	� 	�	�	� o    �a�a 0 
startindex 
startIndex	� 	��`	� o    �_�_ 0 endindex endIndex�`  	� J      	�	� 	�	�	� o      �^�^ 0 	leftindex 	leftIndex	� 	��]	� o      �\�\ 0 
rightindex 
rightIndex�]  	� 	�	�	� r   ' 8	�	�	� n   ' 6	�	�	� 3   4 6�[
�[ 
cobj	� n   ' 4	�	�	� 7  * 4�Z	�	�
�Z 
cobj	� o   . 0�Y�Y 0 
startindex 
startIndex	� o   1 3�X�X 0 endindex endIndex	� n  ' *	�	�	� o   ( *�W�W 
0 _keys_  	� o   ' (�V�V $0 resultlistobject resultListObject	� o      �U�U 0 
pivotvalue 
pivotValue	� 	�	�	� V   9;	�	�	� k   A6	�	� 	�	�	� Q   A �	�	�	�	� V   D d	�	�	� l  Z _	�	�	�	� r   Z _	�	�	� [   Z ]	�	�	� o   Z [�T�T 0 	leftindex 	leftIndex	� m   [ \�S�S 	� o      �R�R 0 	leftindex 	leftIndex	� � z while cmp returns -1; note that if compareKeys() returns a non-numeric value/no result, this will throw -1700/-2763 error   	� �	�	� �   w h i l e   c m p   r e t u r n s   - 1 ;   n o t e   t h a t   i f   c o m p a r e K e y s ( )   r e t u r n s   a   n o n - n u m e r i c   v a l u e / n o   r e s u l t ,   t h i s   w i l l   t h r o w   - 1 7 0 0 / - 2 7 6 3   e r r o r	� A   H Y	�	�	� c   H W	�	�	� n  H U	�	�	� I   I U�Q	��P�Q 0 comparekeys compareKeys	� 	�
 	� e   I P

 n   I P


 4   L O�O

�O 
cobj
 o   M N�N�N 0 	leftindex 	leftIndex
 n  I L


 o   J L�M�M 
0 _keys_  
 o   I J�L�L $0 resultlistobject resultListObject
  
�K
 o   P Q�J�J 0 
pivotvalue 
pivotValue�K  �P  	� o   H I�I�I  0 sortcomparator sortComparator	� m   U V�H
�H 
nmbr	� m   W X�G�G  	� R      �F

	
�F .ascrerr ****      � ****
 o      �E�E 0 etext eText
	 �D



�D 
errn

 o      �C�C 0 enum eNum
 �B


�B 
erob
 o      �A�A 0 efrom eFrom
 �@
�?
�@ 
errt
 o      �>�> 
0 eto eTo�?  	� R   l ��=


�= .ascrerr ****      � ****
 b   | 


 m   | }

 �

 < C o u l d n  t   c o m p a r e   o b j e c t   k e y s :  
 o   } ~�<�< 0 etext eText
 �;


�; 
errn
 o   n o�:�: 0 enum eNum
 �9


�9 
erob
 J   p y

 


 n   p v


 4   s v�8

�8 
cobj
 o   t u�7�7 0 	leftindex 	leftIndex
 n  p s

 
 o   q s�6�6 
0 _keys_  
  o   p q�5�5 $0 resultlistobject resultListObject
 
!�4
! o   v w�3�3 0 
pivotvalue 
pivotValue�4  
 �2
"�1
�2 
errt
" o   z {�0�0 
0 eto eTo�1  	� 
#
$
# Q   � �
%
&
'
% V   � �
(
)
( l  � �
*
+
,
* r   � �
-
.
- \   � �
/
0
/ o   � ��/�/ 0 
rightindex 
rightIndex
0 m   � ��.�. 
. o      �-�- 0 
rightindex 
rightIndex
+   while cmp returns 1;    
, �
1
1 ,   w h i l e   c m p   r e t u r n s   1 ;  
) ?   � �
2
3
2 c   � �
4
5
4 n  � �
6
7
6 I   � ��,
8�+�, 0 comparekeys compareKeys
8 
9
:
9 n   � �
;
<
; 4   � ��*
=
�* 
cobj
= o   � ��)�) 0 
rightindex 
rightIndex
< n  � �
>
?
> o   � ��(�( 
0 _keys_  
? o   � ��'�' $0 resultlistobject resultListObject
: 
@�&
@ o   � ��%�% 0 
pivotvalue 
pivotValue�&  �+  
7 o   � ��$�$  0 sortcomparator sortComparator
5 m   � ��#
�# 
nmbr
3 m   � ��"�"  
& R      �!
A
B
�! .ascrerr ****      � ****
A o      � �  0 etext eText
B �
C
D
� 
errn
C o      �� 0 enum eNum
D �
E
F
� 
erob
E o      �� 0 efrom eFrom
F �
G�
� 
errt
G o      �� 
0 eto eTo�  
' R   � ��
H
I
� .ascrerr ****      � ****
H b   � �
J
K
J m   � �
L
L �
M
M < C o u l d n  t   c o m p a r e   o b j e c t   k e y s :  
K o   � ��� 0 etext eText
I �
N
O
� 
errn
N o   � ��� 0 enum eNum
O �
P
Q
� 
erob
P J   � �
R
R 
S
T
S n   � �
U
V
U 4   � ��
W
� 
cobj
W o   � ��� 0 
rightindex 
rightIndex
V n  � �
X
Y
X o   � ��� 
0 _keys_  
Y o   � ��� $0 resultlistobject resultListObject
T 
Z�
Z o   � ��� 0 
pivotvalue 
pivotValue�  
Q �
[�
� 
errt
[ o   � ��� 
0 eto eTo�  
$ 
\�

\ Z   �6
]
^�	�
] l  � �
_��
_ H   � �
`
` ?   � �
a
b
a o   � ��� 0 	leftindex 	leftIndex
b o   � ��� 0 
rightindex 
rightIndex�  �  
^ k   �2
c
c 
d
e
d r   � �
f
g
f J   � �
h
h 
i
j
i e   � �
k
k n   � �
l
m
l 4   � ��
n
� 
cobj
n o   � ��� 0 
rightindex 
rightIndex
m n  � �
o
p
o o   � ��� 
0 _keys_  
p o   � �� �  $0 resultlistobject resultListObject
j 
q��
q e   � �
r
r n   � �
s
t
s 4   � ���
u
�� 
cobj
u o   � ����� 0 	leftindex 	leftIndex
t n  � �
v
w
v o   � ����� 
0 _keys_  
w o   � ����� $0 resultlistobject resultListObject��  
g J      
x
x 
y
z
y n      
{
|
{ 4   � ���
}
�� 
cobj
} o   � ����� 0 	leftindex 	leftIndex
| n  � �
~

~ o   � ����� 
0 _keys_  
 o   � ����� $0 resultlistobject resultListObject
z 
���
� n      
�
�
� 4   � ���
�
�� 
cobj
� o   � ����� 0 
rightindex 
rightIndex
� n  � �
�
�
� o   � ����� 
0 _keys_  
� o   � ����� $0 resultlistobject resultListObject��  
e 
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
� 4   � ���
�
�� 
cobj
� o   � ����� 0 
rightindex 
rightIndex
� n  � �
�
�
� o   � ����� 
0 _list_  
� o   � ����� $0 resultlistobject resultListObject
� 
���
� e   � �
�
� n   � �
�
�
� 4   � ���
�
�� 
cobj
� o   � ����� 0 	leftindex 	leftIndex
� n  � �
�
�
� o   � ����� 
0 _list_  
� o   � ����� $0 resultlistobject resultListObject��  
� J      
�
� 
�
�
� n      
�
�
� 4  	��
�
�� 
cobj
� o  
���� 0 	leftindex 	leftIndex
� n 	
�
�
� o  	���� 
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
rightIndex��  ��  �	  �  �
  	� B   = @
�
�
� o   = >���� 0 	leftindex 	leftIndex
� o   > ?���� 0 
rightindex 
rightIndex	� 
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
� R      ����
�
�� .ascrerr ****      � ****��  
� ��
���
�� 
errn
� d      
�
� m      ����
���  
� l oo��
�
���  
� r l stack overflow, so fall-through to use non-recursive insertion sort (this should rarely happen in practice)   
� �
�
� �   s t a c k   o v e r f l o w ,   s o   f a l l - t h r o u g h   t o   u s e   n o n - r e c u r s i v e   i n s e r t i o n   s o r t   ( t h i s   s h o u l d   r a r e l y   h a p p e n   i n   p r a c t i c e )��  	� � � sort mostly uses quicksort, but falls through to insertionsort when sorting small number of items (<8), or when sorting a mostly-sorted list, or when quicksort recursion exceeds AS's stack depth   	� �
�
��   s o r t   m o s t l y   u s e s   q u i c k s o r t ,   b u t   f a l l s   t h r o u g h   t o   i n s e r t i o n s o r t   w h e n   s o r t i n g   s m a l l   n u m b e r   o f   i t e m s   ( < 8 ) ,   o r   w h e n   s o r t i n g   a   m o s t l y - s o r t e d   l i s t ,   o r   w h e n   q u i c k s o r t   r e c u r s i o n   e x c e e d s   A S ' s   s t a c k   d e p t h�j  �i  	� 
�
�
� l uu��
�
���  
� � � fall-through to use loop-based insertion sort when sorting a small number of items (for which it is faster than quicksort), or when quicksort recursion overflows AppleScript's call stack   
� �
�
�v   f a l l - t h r o u g h   t o   u s e   l o o p - b a s e d   i n s e r t i o n   s o r t   w h e n   s o r t i n g   a   s m a l l   n u m b e r   o f   i t e m s   ( f o r   w h i c h   i t   i s   f a s t e r   t h a n   q u i c k s o r t ) ,   o r   w h e n   q u i c k s o r t   r e c u r s i o n   o v e r f l o w s   A p p l e S c r i p t ' s   c a l l   s t a c k
� 
�
�
� r  uz
�
�
� [  ux
�
�
� o  uv���� 0 
startindex 
startIndex
� m  vw���� 
� o      ���� 0 
startindex 
startIndex
� 
���
� Y  {
���
�
���
� Y  �
���
�
�
�
� k  �
�
� 
�
�
� r  ��
�
�
� J  ��
�
� 
� 
� e  �� n  �� 4  ����
�� 
cobj l ������ \  �� o  ������ 0 j   m  ������ ��  ��   n ��	 o  ������ 
0 _keys_  	 o  ������ $0 resultlistobject resultListObject  
��
 e  �� n  �� 4  ����
�� 
cobj o  ������ 0 j   n �� o  ������ 
0 _keys_   o  ������ $0 resultlistobject resultListObject��  
� J        o      ���� 0 leftkey leftKey �� o      ���� 0 rightkey rightKey��  
�  l �� Z ������ A  �� n �� I  ���� ���� 0 comparekeys compareKeys  !"! o  ������ 0 leftkey leftKey" #��# o  ������ 0 rightkey rightKey��  ��   o  ������  0 sortcomparator sortComparator m  ������   S  ����  ��   !  stop when leftKey�rightKey    �$$ 6   s t o p   w h e n   l e f t K e y"d r i g h t K e y %&% r  ��'(' J  ��)) *+* o  ������ 0 rightkey rightKey+ ,��, o  ������ 0 leftkey leftKey��  ( J      -- ./. n      010 4  ����2
�� 
cobj2 l ��3����3 \  ��454 o  ������ 0 j  5 m  ������ ��  ��  1 n ��676 o  ������ 
0 _keys_  7 o  ������ $0 resultlistobject resultListObject/ 8��8 n      9:9 4  ����;
�� 
cobj; o  ������ 0 j  : n ��<=< o  ������ 
0 _keys_  = o  ������ $0 resultlistobject resultListObject��  & >��> r  �?@? J  ��AA BCB e  ��DD n  ��EFE 4  ����G
�� 
cobjG o  ������ 0 j  F n ��HIH o  ������ 
0 _list_  I o  ������ $0 resultlistobject resultListObjectC J��J e  ��KK n  ��LML 4  ����N
�� 
cobjN l ��O����O \  ��PQP o  ���� 0 j  Q m  ���~�~ ��  ��  M n ��RSR o  ���}�} 
0 _list_  S o  ���|�| $0 resultlistobject resultListObject��  @ J      TT UVU n      WXW 4  ��{Y
�{ 
cobjY l �Z�z�yZ \  �[\[ o  ���x�x 0 j  \ m  � �w�w �z  �y  X n ��]^] o  ���v�v 
0 _list_  ^ o  ���u�u $0 resultlistobject resultListObjectV _�t_ n      `a` 4  �sb
�s 
cobjb o  �r�r 0 j  a n cdc o  	�q�q 
0 _list_  d o  	�p�p $0 resultlistobject resultListObject�t  ��  �� 0 j  
� o  ���o�o 0 i  
� o  ���n�n 0 
startindex 
startIndex
� m  ���m�m���� 0 i  
� o  ~�l�l 0 
startindex 
startIndex
� o  ��k�k 0 endindex endIndex��  ��  	� 1 + performs in-place quicksort/insertionsort	   	� �ee V   p e r f o r m s   i n - p l a c e   q u i c k s o r t / i n s e r t i o n s o r t 		� fgf l     �j�i�h�j  �i  �h  g hih l     �g�f�e�g  �f  �e  i jkj l     �d�c�b�d  �c  �b  k lml i  J Mnon I     �apq
�a .Lst:Sortnull���     ****p o      �`�` 0 thelist theListq �_r�^
�_ 
Compr |�]�\s�[t�]  �\  s o      �Z�Z  0 sortcomparator sortComparator�[  t l     u�Y�Xu m      �W
�W 
msng�Y  �X  �^  o k    �vv wxw l     �Vyz�V  y.( note that `sort list` currently doesn't implement a `reversed order` parameter as its quicksort algorithm isn't stable (i.e. items that compare as equal will appear in any order, not the order in which they were supplied), so such an option would be useless in practice and rather misleading too. (To get a list in descending order, just get the returned list's `reverse` property or else pass a comparator containing a suitable compareKeys handler.) This parameter can always be added in future if/when a stable sorting algorithm is ever implemented.   z �{{P   n o t e   t h a t   ` s o r t   l i s t `   c u r r e n t l y   d o e s n ' t   i m p l e m e n t   a   ` r e v e r s e d   o r d e r `   p a r a m e t e r   a s   i t s   q u i c k s o r t   a l g o r i t h m   i s n ' t   s t a b l e   ( i . e .   i t e m s   t h a t   c o m p a r e   a s   e q u a l   w i l l   a p p e a r   i n   a n y   o r d e r ,   n o t   t h e   o r d e r   i n   w h i c h   t h e y   w e r e   s u p p l i e d ) ,   s o   s u c h   a n   o p t i o n   w o u l d   b e   u s e l e s s   i n   p r a c t i c e   a n d   r a t h e r   m i s l e a d i n g   t o o .   ( T o   g e t   a   l i s t   i n   d e s c e n d i n g   o r d e r ,   j u s t   g e t   t h e   r e t u r n e d   l i s t ' s   ` r e v e r s e `   p r o p e r t y   o r   e l s e   p a s s   a   c o m p a r a t o r   c o n t a i n i n g   a   s u i t a b l e   c o m p a r e K e y s   h a n d l e r . )   T h i s   p a r a m e t e r   c a n   a l w a y s   b e   a d d e d   i n   f u t u r e   i f / w h e n   a   s t a b l e   s o r t i n g   a l g o r i t h m   i s   e v e r   i m p l e m e n t e d .x |�U| Q    �}~} k   o�� ��� r    ��� n   ��� I    �T��S�T "0 aslistparameter asListParameter� ��� o    	�R�R 0 thelist theList� ��Q� m   	 
�� ���  �Q  �S  � o    �P�P 0 _support  � o      �O�O 0 thelist theList� ��� h    �N��N $0 resultlistobject resultListObject� k      �� ��� l     ���� j     	�M��M 
0 _keys_  � n     ��� 2   �L
�L 
cobj� o     �K�K 0 thelist theList� ~ x (replacing items in an existing list of the correct length is a little faster than appending items to a new empty list)   � ��� �   ( r e p l a c i n g   i t e m s   i n   a n   e x i s t i n g   l i s t   o f   t h e   c o r r e c t   l e n g t h   i s   a   l i t t l e   f a s t e r   t h a n   a p p e n d i n g   i t e m s   t o   a   n e w   e m p t y   l i s t )� ��J� j   
 �I��I 
0 _list_  � n   
 ��� 2   �H
�H 
cobj� o   
 �G�G 0 thelist theList�J  � ��� Z   ,���F�E� A     ��� n   ��� 1    �D
�D 
leng� n   ��� o    �C�C 
0 _list_  � o    �B�B $0 resultlistobject resultListObject� m    �A�A � L   # (�� n  # '��� o   $ &�@�@ 
0 _list_  � o   # $�?�? $0 resultlistobject resultListObject�F  �E  � ��� Z   - J���>�� =  - 0��� o   - .�=�=  0 sortcomparator sortComparator� m   . /�<
�< 
msng� r   3 :��� I  3 8�;�:�9
�; .Lst:DeSonull��� ��� null�:  �9  � o      �8�8  0 sortcomparator sortComparator�>  � r   = J��� n  = H��� I   B H�7��6�7 &0 asscriptparameter asScriptParameter� ��� o   B C�5�5  0 sortcomparator sortComparator� ��4� m   C D�� ��� 
 u s i n g�4  �6  � o   = B�3�3 0 _support  � o      �2�2  0 sortcomparator sortComparator� ��� l  K K�1���1  � M G call comparator's makeKey method to generate each sortable key in turn   � ��� �   c a l l   c o m p a r a t o r ' s   m a k e K e y   m e t h o d   t o   g e n e r a t e   e a c h   s o r t a b l e   k e y   i n   t u r n� ��� l  K ^���� r   K ^��� J   K O�� ��� m   K L�0�0  � ��/� m   L M�.�.  �/  � J      �� ��� o      �-�-  0 ascendingcount ascendingCount� ��,� o      �+�+ "0 descendingcount descendingCount�,  � � � while generating keys also check if list is already almost/fully sorted (either ascending or descending) and if it is use insertionsort/return as-is   � ���*   w h i l e   g e n e r a t i n g   k e y s   a l s o   c h e c k   i f   l i s t   i s   a l r e a d y   a l m o s t / f u l l y   s o r t e d   ( e i t h e r   a s c e n d i n g   o r   d e s c e n d i n g )   a n d   i f   i t   i s   u s e   i n s e r t i o n s o r t / r e t u r n   a s - i s� ��� Q   _@���� k   b&�� ��� Q   b ����� r   e s��� n  e q��� I   f q�*��)�* 0 makekey makeKey� ��(� e   f m�� n   f m��� 4   i l�'�
�' 
cobj� m   j k�&�& � n  f i��� o   g i�%�% 
0 _keys_  � o   f g�$�$ $0 resultlistobject resultListObject�(  �)  � o   e f�#�#  0 sortcomparator sortComparator� o      �"�" 0 previouskey previousKey� R      �!��
�! .ascrerr ****      � ****� o      � �  0 etext eText� ���
� 
errn� o      �� 0 enum eNum� ���
� 
errt� o      �� 
0 eto eTo�  � R   { ����
� .ascrerr ****      � ****� b   � ���� m   � ��� ��� : C o u l d n  t   m a k e K e y   f o r   i t e m   1 :  � o   � ��� 0 etext eText� ���
� 
errn� o    ��� 0 enum eNum� ���
� 
erob� l  � ����� N   � ��� n   � ���� 4   � ���
� 
cobj� m   � ��� � l  � ����� e   � ��� n  � �   o   � ��� 
0 _list_   o   � ��� $0 resultlistobject resultListObject�  �  �  �  � ��
� 
errt o   � ��� 
0 eto eTo�  �  r   � � o   � ��
�
 0 previouskey previousKey n       4   � ��		
�	 
cobj	 m   � ���  n  � �

 o   � ��� 
0 _keys_   o   � ��� $0 resultlistobject resultListObject � Y   �&�� k   �!  Q   � � r   � � n  � � I   � ���� 0 makekey makeKey �  n   � � 4   � ���
�� 
cobj o   � ����� 0 i   n  � �  o   � ����� 
0 _keys_    o   � ����� $0 resultlistobject resultListObject�   �   o   � �����  0 sortcomparator sortComparator o      ���� 0 
currentkey 
currentKey R      ��!"
�� .ascrerr ****      � ****! o      ���� 0 etext eText" ��#$
�� 
errn# o      ���� 0 enum eNum$ ��%��
�� 
errt% o      ���� 
0 eto eTo��   R   � ���&'
�� .ascrerr ****      � ****& b   � �()( b   � �*+* b   � �,-, m   � �.. �// 4 C o u l d n  t   m a k e K e y   f o r   i t e m  - o   � ����� 0 i  + m   � �00 �11  :  ) o   � ����� 0 etext eText' ��23
�� 
errn2 o   � ����� 0 enum eNum3 ��45
�� 
erob4 l  � �6����6 N   � �77 n   � �898 4   � ���:
�� 
cobj: o   � ����� 0 i  9 l  � �;����; e   � �<< n  � �=>= o   � ����� 
0 _list_  > o   � ����� $0 resultlistobject resultListObject��  ��  ��  ��  5 ��?��
�� 
errt? o   � ����� 
0 eto eTo��   @A@ r   � �BCB o   � ����� 0 
currentkey 
currentKeyC n      DED 4   � ���F
�� 
cobjF o   � ����� 0 i  E n  � �GHG o   � ����� 
0 _keys_  H o   � ����� $0 resultlistobject resultListObjectA IJI r   � �KLK n  � �MNM I   � ���O���� 0 comparekeys compareKeysO PQP o   � ����� 0 previouskey previousKeyQ R��R o   � ����� 0 
currentkey 
currentKey��  ��  N o   � �����  0 sortcomparator sortComparatorL o      ���� 0 keycomparison keyComparisonJ STS Z   UVW��U A   XYX o   ���� 0 keycomparison keyComparisonY m  ����  V l Z[\Z r  ]^] [  	_`_ o  ����  0 ascendingcount ascendingCount` m  ���� ^ o      ����  0 ascendingcount ascendingCount[   current key is larger   \ �aa ,   c u r r e n t   k e y   i s   l a r g e rW bcb ?  ded o  ���� 0 keycomparison keyComparisone m  ����  c f��f l ghig r  jkj [  lml o  ���� "0 descendingcount descendingCountm m  ���� k o      ���� "0 descendingcount descendingCounth   previous key is larger   i �nn .   p r e v i o u s   k e y   i s   l a r g e r��  ��  T o��o r  !pqp o  ���� 0 
currentkey 
currentKeyq o      ���� 0 previouskey previousKey��  � 0 i   m   � �����  n  � �rsr 1   � ���
�� 
lengs n  � �tut o   � ����� 
0 _keys_  u o   � ����� $0 resultlistobject resultListObject�  �  � R      ��vw
�� .ascrerr ****      � ****v o      ���� 0 etext eTextw ��xy
�� 
errnx o      ���� 0 enum eNumy ��z{
�� 
erobz o      ���� 0 efrom eFrom{ ��|��
�� 
errt| o      ���� 
0 eto eTo��  � R  .@��}~
�� .ascrerr ****      � ****} o  >?���� 0 etext eText~ ���
�� 
errn o  23���� 0 enum eNum� ����
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
0 _list_  � o  jk���� $0 resultlistobject resultListObject��  ~ R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��   I  w�������� 
0 _error  � ��� m  x{�� ���  s o r t   l i s t� ��� o  {|���� 0 etext eText� ��� o  |}���� 0 enumber eNumber� ��� o  }~���� 0 efrom eFrom� ���� o  ~���� 
0 eto eTo��  ��  �U  m ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  N Q��� I     ��~�}
� .Lst:DeSonull��� ��� null�~  �}  � h     �|��| &0 defaultcomparator DefaultComparator� k      �� ��� j     �{��{ "0 _supportedtypes _supportedTypes� J     �� ��� m     �z
�z 
nmbr� ��� m    �y
�y 
ctxt� ��x� m    �w
�w 
ldt �x  � ��� j    	�v��v 	0 _type  � m    �u
�u 
msng� ��� i   
 ��� I      �t��s�t 0 makekey makeKey� ��r� o      �q�q 0 anobject anObject�r  �s  � k     }�� ��� Z     z����p� =    ��� o     �o�o 	0 _type  � m    �n
�n 
msng� k   
 K�� ��� X   
 B��m�� Z    =���l�k� ?    *��� l   (��j�i� I   (�h��
�h .corecnte****       ****� J    �� ��g� o    �f�f 0 anobject anObject�g  � �e �d
�e 
kocl  l    $�c�b e     $ n    $ 1   ! #�a
�a 
pcnt o     !�`�` 0 aref aRef�c  �b  �d  �j  �i  � m   ( )�_�_  � k   - 9  r   - 6	 n  - 0

 1   . 0�^
�^ 
pcnt o   - .�]�] 0 aref aRef	 o      �\�\ 	0 _type   �[ L   7 9 o   7 8�Z�Z 0 anobject anObject�[  �l  �k  �m 0 aref aRef� n    o    �Y�Y "0 _supportedtypes _supportedTypes  f    � �X R   C K�W
�W .ascrerr ****      � **** m   I J � � I n v a l i d   i t e m   t y p e   ( d e f a u l t   c o m p a r a t o r   c a n   o n l y   c o m p a r e   i n t e g e r / r e a l ,   t e x t ,   o r   d a t e   t y p e s ) . �V
�V 
errn m   E F�U�U�\ �T�S
�T 
erob o   G H�R�R 0 anobject anObject�S  �X  �  =   N ] l  N [�Q�P I  N [�O
�O .corecnte****       **** J   N Q  �N  o   N O�M�M 0 anobject anObject�N   �L!�K
�L 
kocl! o   R W�J�J 	0 _type  �K  �Q  �P   m   [ \�I�I   "�H" R   ` v�G#$
�G .ascrerr ****      � ****# b   f u%&% b   f s'(' b   f o)*) b   f m+,+ m   f g-- �.. ^ I n v a l i d   i t e m   t y p e   ( d e f a u l t   c o m p a r a t o r   e x p e c t e d  , o   g l�F�F 	0 _type  * m   m n// �00    b u t   r e c e i v e d  ( l  o r1�E�D1 n   o r232 m   p r�C
�C 
pcls3 o   o p�B�B 0 anobject anObject�E  �D  & m   s t44 �55  ) .$ �A67
�A 
errn6 m   b c�@�@�\7 �?8�>
�? 
erob8 o   d e�=�= 0 anobject anObject�>  �H  �p  � 9�<9 L   { }:: o   { |�;�; 0 anobject anObject�<  � ;�:; i   <=< I      �9>�8�9 0 comparekeys compareKeys> ?@? o      �7�7 0 
leftobject 
leftObject@ A�6A o      �5�5 0 rightobject rightObject�6  �8  = Z     BCDEB A     FGF o     �4�4 0 
leftobject 
leftObjectG o    �3�3 0 rightobject rightObjectC L    HH m    �2�2��D IJI ?    KLK o    �1�1 0 
leftobject 
leftObjectL o    �0�0 0 rightobject rightObjectJ M�/M L    NN m    �.�. �/  E L    OO m    �-�-  �:  � PQP l     �,�+�*�,  �+  �*  Q RSR l     �)�(�'�)  �(  �'  S TUT i  R UVWV I     �&�%�$
�& .Lst:NuSonull��� ��� null�%  �$  W h     �#X�# &0 numericcomparator NumericComparatorX k      YY Z[Z i    \]\ I      �"^�!�" 0 makekey makeKey^ _� _ o      �� 0 anobject anObject�   �!  ] L     `` c     aba o     �� 0 anobject anObjectb m    �
� 
nmbr[ c�c i   ded I      �f�� 0 comparekeys compareKeysf ghg o      �� 0 
leftobject 
leftObjecth i�i o      �� 0 rightobject rightObject�  �  e l    jklj L     mm \     non o     �� 0 
leftobject 
leftObjecto o    �� 0 rightobject rightObjectk�� note: since compareKeys' return value can be any -ve/0/+ve number, a single subtraction operation is sufficient for numbers and dates. (Caveat: this doesn't take into account minor differences due to real imprecision. Currently this doesn't matter as quicksort isn't stable anyway so makes no guarantees about the order of [imprecisely] equal items; however, if quicksort ever gets replaced with a stable sorting algorithm then this method will need revised to use Number library's `cmp` instead.)   l �pp�   n o t e :   s i n c e   c o m p a r e K e y s '   r e t u r n   v a l u e   c a n   b e   a n y   - v e / 0 / + v e   n u m b e r ,   a   s i n g l e   s u b t r a c t i o n   o p e r a t i o n   i s   s u f f i c i e n t   f o r   n u m b e r s   a n d   d a t e s .   ( C a v e a t :   t h i s   d o e s n ' t   t a k e   i n t o   a c c o u n t   m i n o r   d i f f e r e n c e s   d u e   t o   r e a l   i m p r e c i s i o n .   C u r r e n t l y   t h i s   d o e s n ' t   m a t t e r   a s   q u i c k s o r t   i s n ' t   s t a b l e   a n y w a y   s o   m a k e s   n o   g u a r a n t e e s   a b o u t   t h e   o r d e r   o f   [ i m p r e c i s e l y ]   e q u a l   i t e m s ;   h o w e v e r ,   i f   q u i c k s o r t   e v e r   g e t s   r e p l a c e d   w i t h   a   s t a b l e   s o r t i n g   a l g o r i t h m   t h e n   t h i s   m e t h o d   w i l l   n e e d   r e v i s e d   t o   u s e   N u m b e r   l i b r a r y ' s   ` c m p `   i n s t e a d . )�  U qrq l     ����  �  �  r sts l     ����  �  �  t uvu i  V Ywxw I     ���
� .Lst:DaSonull��� ��� null�  �  x h     �y�  0 datecomparator DateComparatory k      zz {|{ i    }~} I      �
�	�
 0 makekey makeKey ��� o      �� 0 anobject anObject�  �	  ~ L     �� c     ��� o     �� 0 anobject anObject� m    �
� 
ldt | ��� i   ��� I      ���� 0 comparekeys compareKeys� ��� o      �� 0 
leftobject 
leftObject� �� � o      ���� 0 rightobject rightObject�   �  � l    ���� L     �� \     ��� o     ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject� Y S as in NumericComparator, a simple subtraction operation produces a suitable result   � ��� �   a s   i n   N u m e r i c C o m p a r a t o r ,   a   s i m p l e   s u b t r a c t i o n   o p e r a t i o n   p r o d u c e s   a   s u i t a b l e   r e s u l t�  v ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  Z ]��� I     �����
�� .Lst:TeSonull��� ��� null��  � �����
�� 
Cons� |����������  ��  � o      ����  0 orderingoption orderingOption��  � l     ������ m      ��
�� SrtECmpI��  ��  ��  � Q     }���� k    g�� ��� h    
����� B0 currentconsiderationscomparator CurrentConsiderationsComparator� k      �� ��� i    ��� I      ������� 0 makekey makeKey� ���� o      ���� 0 anobject anObject��  ��  � l    ���� L     �� c     ��� o     ���� 0 anobject anObject� m    ��
�� 
ctxt� _ Y TO DO: what if item is a list [of text]? currently it coerces to text using current TIDs   � ��� �   T O   D O :   w h a t   i f   i t e m   i s   a   l i s t   [ o f   t e x t ] ?   c u r r e n t l y   i t   c o e r c e s   t o   t e x t   u s i n g   c u r r e n t   T I D s� ���� i   ��� I      ������� 0 comparekeys compareKeys� ��� o      ���� 0 
leftobject 
leftObject� ���� o      ���� 0 rightobject rightObject��  ��  � Z     ����� A     ��� o     ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject� L    �� m    ������� ��� ?    ��� o    ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject� ���� L    �� m    ���� ��  � L    �� m    ����  ��  � ���� Z    g����� =   ��� o    ����  0 orderingoption orderingOption� m    ��
�� SrtECmpI� k    �� ��� h    ����� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator� k      �� ��� j     ���
�� 
pare� o     ���� B0 currentconsiderationscomparator CurrentConsiderationsComparator� ���� i  	 ��� I      ������� 0 comparekeys compareKeys� ��� o      ���� 0 
leftobject 
leftObject� ���� o      ���� 0 rightobject rightObject��  ��  � P     ���� L    �� M    �� I      ������� 0 comparekeys compareKeys� ��� o    ���� 0 
leftobject 
leftObject� ���� o    ���� 0 rightobject rightObject��  ��  � ���
�� conshyph� ���
�� conspunc� ���
�� conswhit� ����
�� consnume��  � ���
�� conscase� ����
�� consdiac��  ��  � ���� L    �� o    ���� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator��  � ��� =   !��� o    ����  0 orderingoption orderingOption� m     ��
�� SrtECmpC� ��� k   $ .�� ��� h   $ +����� :0 casesensitivetextcomparator CaseSensitiveTextComparator� k      �� ��� j     ���
�� 
pare� o     ���� B0 currentconsiderationscomparator CurrentConsiderationsComparator� ���� i  	 ��� I      ������� 0 comparekeys compareKeys�    o      ���� 0 
leftobject 
leftObject �� o      ���� 0 rightobject rightObject��  ��  � P      L     M     I      ������ 0 comparekeys compareKeys 	
	 o    ���� 0 
leftobject 
leftObject
 �� o    ���� 0 rightobject rightObject��  ��   ��
�� conscase ��
�� conshyph ��
�� conspunc ��
�� conswhit ����
�� consnume��   ����
�� consdiac��  ��  � �� L   , . o   , -���� :0 casesensitivetextcomparator CaseSensitiveTextComparator��  �  =  1 4 o   1 2����  0 orderingoption orderingOption m   2 3��
�� SrtECmpE  k   7 A  h   7 >���� 40 exactmatchtextcomparator ExactMatchTextComparator k        j     ��
�� 
pare o     ���� B0 currentconsiderationscomparator CurrentConsiderationsComparator  ��  i  	 !"! I      ��#���� 0 comparekeys compareKeys# $%$ o      ���� 0 
leftobject 
leftObject% &��& o      ���� 0 rightobject rightObject��  ��  " P     '()' L    ** M    ++ I      ��,���� 0 comparekeys compareKeys, -.- o    ���� 0 
leftobject 
leftObject. /��/ o    ���� 0 rightobject rightObject��  ��  ( ��0
�� conscase0 ��1
�� consdiac1 ��2
�� conshyph2 ��3
�� conspunc3 ����
�� conswhit��  ) ����
�� consnume��  ��   4��4 L   ? A55 o   ? @���� 40 exactmatchtextcomparator ExactMatchTextComparator��   676 =  D G898 o   D E����  0 orderingoption orderingOption9 m   E F��
�� SrtECmpD7 :��: L   J L;; o   J K���� B0 currentconsiderationscomparator CurrentConsiderationsComparator��  � R   O g��<=
�� .ascrerr ****      � ****< m   c f>> �?? d I n v a l i d    f o r    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .= ��@A
�� 
errn@ m   S V�����YA ��BC
�� 
erobB o   Y Z��  0 orderingoption orderingOptionC �~D�}
�~ 
errtD m   ] `�|
�| 
enum�}  ��  � R      �{EF
�{ .ascrerr ****      � ****E o      �z�z 0 etext eTextF �yGH
�y 
errnG o      �x�x 0 enumber eNumberH �wIJ
�w 
erobI o      �v�v 0 efrom eFromJ �uK�t
�u 
errtK o      �s�s 
0 eto eTo�t  � I   o }�rL�q�r 
0 _error  L MNM m   p sOO �PP  t e x t   c o m p a r a t o rN QRQ o   s t�p�p 0 etext eTextR STS o   t u�o�o 0 enumber eNumberT UVU o   u v�n�n 0 efrom eFromV W�mW o   v w�l�l 
0 eto eTo�m  �q  � XYX l     �k�j�i�k  �j  �i  Y Z[Z l     �h�g�f�h  �g  �f  [ \]\ i  ^ a^_^ I     �e�d`
�e .Lst:LiSonull��� ��� null�d  ` �ca�b
�c 
Compa |�a�`b�_c�a  �`  b o      �^�^ "0 itemcomparators itemComparators�_  c l     d�]�\d m      �[
�[ 
msng�]  �\  �b  _ Q     �efge k    |hh iji l   klmk Z   no�Z�Yn =    pqp l   r�X�Wr I   �Vst
�V .corecnte****       ****s J    uu v�Uv o    �T�T "0 itemcomparators itemComparators�U  t �Sw�R
�S 
koclw m    �Q
�Q 
reco�R  �X  �W  q m    �P�P o r    xyx J    zz {�O{ o    �N�N "0 itemcomparators itemComparators�O  y o      �M�M "0 itemcomparators itemComparators�Z  �Y  l S M if a single `item comparator` record is given, wrap it as a single-item list   m �|| �   i f   a   s i n g l e   ` i t e m   c o m p a r a t o r `   r e c o r d   i s   g i v e n ,   w r a p   i t   a s   a   s i n g l e - i t e m   l i s tj }�L} Z    |~�K�~ =    &��� l   $��J�I� I   $�H��
�H .corecnte****       ****� J    �� ��G� o    �F�F "0 itemcomparators itemComparators�G  � �E��D
�E 
kocl� m     �C
�C 
list�D  �J  �I  � m   $ %�B�B   k   ) N�� ��� Z   ) F���A�� =  ) ,��� o   ) *�@�@ "0 itemcomparators itemComparators� m   * +�?
�? 
msng� r   / 6��� I  / 4�>�=�<
�> .Lst:DeSonull��� ��� null�=  �<  � o      �;�; $0 comparatorobject comparatorObject�A  � r   9 F��� n  9 D��� I   > D�:��9�: &0 asscriptparameter asScriptParameter� ��� o   > ?�8�8 "0 itemcomparators itemComparators� ��7� m   ? @�� ���  f o r�7  �9  � o   9 >�6�6 0 _support  � o      �5�5 $0 comparatorobject comparatorObject� ��4� h   G N�3��3 .0 uniformlistcomparator UniformListComparator� l     ���� k      �� ��� l     �2�1�0�2  �1  �0  � ��� i    ��� I      �/��.�/ 0 makekey makeKey� ��-� o      �,�, 0 sublist subList�-  �.  � h     �+��+ 0 	keyobject 	KeyObject� k      �� ��� j     �*��* 
0 _list_  � o     �)�) 0 sublist subList� ��� l     ���� j    
�(��( 
0 _keys_  � J    	�'�'  �   cached keys   � ���    c a c h e d   k e y s� ��� l     �&�%�$�&  �%  �$  � ��#� i   ��� I      �"��!�" 0 getkey getKey� �� � o      �� 0 	itemindex 	itemIndex�   �!  � k     0�� ��� V     '��� r    "��� n   ��� I    ���� 0 makekey makeKey� ��� n    ��� 4    ��
� 
cobj� o    �� 0 	itemindex 	itemIndex� n   ��� o    �� 
0 _list_  �  f    �  �  � o    �� $0 comparatorobject comparatorObject� n      ���  ;     !� o     �� 
0 _keys_  � ?    ��� o    �� 0 	itemindex 	itemIndex� n    
��� 1    
�
� 
leng� n   ��� o    �� 
0 _keys_  �  f    � ��� L   ( 0�� n   ( /��� 4   + .��
� 
cobj� o   , -�� 0 	itemindex 	itemIndex� n  ( +��� o   ) +�� 
0 _keys_  �  f   ( )�  �#  � ��� l     ����  �  �  � ��� i   ��� I      ���� 0 comparekeys compareKeys� ��� o      �
�
 0 leftkeyobject leftKeyObject� ��	� o      ��  0 rightkeyobject rightKeyObject�	  �  � k     z�� ��� r     ��� J     �� ��� n    ��� 1    �
� 
leng� n    ��� o    �� 
0 _list_  � o     �� 0 leftkeyobject leftKeyObject� ��� n   
��� 1    
�
� 
leng� n   ��� o    �� 
0 _list_  � o    ��  0 rightkeyobject rightKeyObject�  � J      �� ��� o      � �  0 
leftlength 
leftLength� ���� o      ���� 0 rightlength rightLength��  � ��� r    ��� o    ���� 0 
leftlength 
leftLength� o      ���� 0 commonlength commonLength�    Z    -���� A     # o     !���� 0 rightlength rightLength o   ! "���� 0 commonlength commonLength r   & ) o   & '���� 0 rightlength rightLength o      ���� 0 commonlength commonLength��  ��   	 Y   . a
����
 l  8 \ k   8 \  r   8 O n  8 M I   = M������ 0 comparekeys compareKeys  n  = C I   > C������ 0 getkey getKey �� o   > ?���� 0 i  ��  ��   o   = >���� 0 leftkeyobject leftKeyObject �� n  C I  I   D I��!���� 0 getkey getKey! "��" o   D E���� 0 i  ��  ��    o   C D����  0 rightkeyobject rightKeyObject��  ��   o   8 =���� $0 comparatorobject comparatorObject o      ���� $0 comparisonresult comparisonResult #��# Z  P \$%����$ >   P S&'& o   P Q���� $0 comparisonresult comparisonResult' m   Q R����  % L   V X(( o   V W���� $0 comparisonresult comparisonResult��  ��  ��   E ? iterate over item indexes common to both lists, comparing keys    �)) ~   i t e r a t e   o v e r   i t e m   i n d e x e s   c o m m o n   t o   b o t h   l i s t s ,   c o m p a r i n g   k e y s�� 0 i   m   1 2����  o   2 3���� 0 commonlength commonLength��  	 *��* Z   b z+,-.+ A   b e/0/ o   b c���� 0 
leftlength 
leftLength0 o   c d���� 0 rightlength rightLength, l  h j1231 L   h j44 m   h i������2 A ; left sublist is shorter than right sublist, so comes first   3 �55 v   l e f t   s u b l i s t   i s   s h o r t e r   t h a n   r i g h t   s u b l i s t ,   s o   c o m e s   f i r s t- 676 ?   m p898 o   m n���� 0 
leftlength 
leftLength9 o   n o���� 0 rightlength rightLength7 :��: l  s u;<=; L   s u>> m   s t���� < A ; right sublist is shorter than left sublist, so comes first   = �?? v   r i g h t   s u b l i s t   i s   s h o r t e r   t h a n   l e f t   s u b l i s t ,   s o   c o m e s   f i r s t��  . l  x z@AB@ L   x zCC m   x y����  A   both lists are identical   B �DD 2   b o t h   l i s t s   a r e   i d e n t i c a l��  � E��E l     ��������  ��  ��  ��  � 9 3 compares sublists of same type and variable length   � �FF f   c o m p a r e s   s u b l i s t s   o f   s a m e   t y p e   a n d   v a r i a b l e   l e n g t h�4  �K  � k   Q |GG HIH Z   Q pJK����J >   Q \LML l  Q XN����N I  Q X��OP
�� .corecnte****       ****O o   Q R���� "0 itemcomparators itemComparatorsP ��Q��
�� 
koclQ m   S T��
�� 
reco��  ��  ��  M n  X [RSR 1   Y [��
�� 
lengS o   X Y���� "0 itemcomparators itemComparatorsK l  _ lTUVT n  _ lWXW I   d l��Y���� .0 throwinvalidparameter throwInvalidParameterY Z[Z o   d e���� "0 itemcomparators itemComparators[ \]\ m   e f^^ �__  f o r] `a` m   f g��
�� 
lista b��b m   g hcc �dd N n o t   a   l i s t   o f    i t e m   c o m p a r a t o r    r e c o r d s��  ��  X o   _ d���� 0 _support  U x r basic validation; TO DO: would it be worth checking each record here rather than catching errors in getKey below?   V �ee �   b a s i c   v a l i d a t i o n ;   T O   D O :   w o u l d   i t   b e   w o r t h   c h e c k i n g   e a c h   r e c o r d   h e r e   r a t h e r   t h a n   c a t c h i n g   e r r o r s   i n   g e t K e y   b e l o w ?��  ��  I f��f h   q |��g�� *0 mixedlistcomparator MixedListComparatorg l     hijh k      kk lml l     ��������  ��  ��  m non i    pqp I      ��r���� 0 makekey makeKeyr s��s o      ���� 0 sublist subList��  ��  q h     ��t�� 0 	keyobject 	KeyObjectt k      uu vwv j     ��x�� 
0 _list_  x o     ���� 0 sublist subListw yzy j    
��{�� 
0 _keys_  { J    	����  z |}| l     ��������  ��  ��  } ~��~ i   � I      ������� 0 getkey getKey� ���� o      ���� "0 comparatorindex comparatorIndex��  ��  � k     ��� ��� V     ���� k    ��� ��� Q    @���� r    (��� n    ��� 4    ���
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
erob� l  ] f����� N   ] f�� n   ] e��� 4   b e�~�
�~ 
cobj� o   c d�}�} "0 comparatorindex comparatorIndex� o   ] b�|�| "0 itemcomparators itemComparators��  �  ��  � R      �{�z�
�{ .ascrerr ****      � ****�z  � �y��x
�y 
errn� d      �� m      �w�w��x  � R   q ��v��
�v .ascrerr ****      � ****� b   � ���� b   � ���� m   � ��� ��� & C a n  t   c o m p a r e   i t e m  � l  � ���u�t� n  � ���� o   � ��s�s 0 	itemindex 	itemIndex� o   � ��r�r (0 listitemcomparator listItemComparator�u  �t  � m   � ��� ��� F   o f   s u b l i s t   ( s u b l i s t   i s   t o o   s h o r t ) .� �q��
�q 
errn� m   s v�p�p�@� �o��n
�o 
erob� l  w ���m�l� N   w ��� n   w ��� 4   | �k�
�k 
cobj� o   } ~�j�j 0 i  � o   w |�i�i 0 sublist subList�m  �l  �n  � ��h� r   � ���� n  � ���� I   � ��g��f�g 0 makekey makeKey� ��e� o   � ��d�d 0 subitem subItem�e  �f  � o   � ��c�c $0 comparatorobject comparatorObject� n      ���  ;   � �� o   � ��b�b 
0 _keys_  �h  � ?    ��� o    �a�a "0 comparatorindex comparatorIndex� n    
��� 1    
�`
�` 
leng� n   ��� o    �_�_ 
0 _keys_  �  f    � ��^� L   � ��� n   � ���� 4   � ��]�
�] 
cobj� o   � ��\�\ "0 comparatorindex comparatorIndex� n  � ���� o   � ��[�[ 
0 _keys_  �  f   � ��^  ��  o ��� l     �Z�Y�X�Z  �Y  �X  � ��� i   ��� I      �W��V�W 0 comparekeys compareKeys� ��� o      �U�U 0 leftkeyobject leftKeyObject� ��T� o      �S�S  0 rightkeyobject rightKeyObject�T  �V  � k     B��    Y     ?�R�Q k    :  r    -	 n   +

 I    +�P�O�P 0 comparekeys compareKeys  n   ! I    !�N�M�N 0 getkey getKey �L o    �K�K 0 i  �L  �M   o    �J�J 0 leftkeyobject leftKeyObject �I n  ! ' I   " '�H�G�H 0 getkey getKey �F o   " #�E�E 0 i  �F  �G   o   ! "�D�D  0 rightkeyobject rightKeyObject�I  �O   l   �C�B n    o    �A�A  0 itemcomparator itemComparator n    4    �@
�@ 
cobj o    �?�? 0 i   o    �>�> "0 itemcomparators itemComparators�C  �B  	 o      �=�= $0 comparisonresult comparisonResult �< Z  . : �;�: >   . 1!"! o   . /�9�9 $0 comparisonresult comparisonResult" m   / 0�8�8    L   4 6## o   4 5�7�7 $0 comparisonresult comparisonResult�;  �:  �<  �R 0 i   m    �6�6  n   $%$ 1   	 �5
�5 
leng% o    	�4�4 "0 itemcomparators itemComparators�Q   &�3& l  @ B'()' L   @ B** m   @ A�2�2  (   both lists are identical   ) �++ 2   b o t h   l i s t s   a r e   i d e n t i c a l�3  � ,�1, l     �0�/�.�0  �/  �.  �1  i 9 3 compares sublists of same length and variable type   j �-- f   c o m p a r e s   s u b l i s t s   o f   s a m e   l e n g t h   a n d   v a r i a b l e   t y p e��  �L  f R      �-./
�- .ascrerr ****      � ****. o      �,�, 0 etext eText/ �+01
�+ 
errn0 o      �*�* 0 enumber eNumber1 �)23
�) 
erob2 o      �(�( 0 efrom eFrom3 �'4�&
�' 
errt4 o      �%�% 
0 eto eTo�&  g I   � ��$5�#�$ 
0 _error  5 676 m   � �88 �99  l i s t   c o m p a r a t o r7 :;: o   � ��"�" 0 etext eText; <=< o   � ��!�! 0 enumber eNumber= >?> o   � �� �  0 efrom eFrom? @�@ o   � ��� 
0 eto eTo�  �#  ] ABA l     ����  �  �  B CDC l     ����  �  �  D EFE i  b eGHG I     ��I
� .Lst:ReSonull��� ��� null�  I �J�
� 
CompJ |��K�L�  �  K o      �� $0 comparatorobject comparatorObject�  L l     M��M m      �
� 
msng�  �  �  H Q     :NOPN k    (QQ RSR Z     TU�VT =   WXW o    �� $0 comparatorobject comparatorObjectX m    �

�
 
msngU r   	 YZY I  	 �	��
�	 .Lst:DeSonull��� ��� null�  �  Z o      �� $0 comparatorobject comparatorObject�  V r     [\[ n   ]^] I    �_�� &0 asscriptparameter asScriptParameter_ `a` o    �� $0 comparatorobject comparatorObjecta b�b m    cc �dd  f o r�  �  ^ o    �� 0 _support  \ o      � �  $0 comparatorobject comparatorObjectS e��e h   ! (��f�� &0 reversecomparator ReverseComparatorf k      gg hih j     ��j
�� 
parej o     ���� $0 comparatorobject comparatorObjecti k��k i  	 lml I      ��n���� 0 comparekeys compareKeysn opo o      ���� 0 leftkey leftKeyp q��q o      ���� 0 rightkey rightKey��  ��  m l    rstr L     uu d     
vv l    	w����w M     	xx I      ��y���� 0 comparekeys compareKeysy z{z o    ���� 0 leftkey leftKey{ |��| o    ���� 0 rightkey rightKey��  ��  ��  ��  s 4 . flip negative flag to positive and vice-versa   t �}} \   f l i p   n e g a t i v e   f l a g   t o   p o s i t i v e   a n d   v i c e - v e r s a��  ��  O R      ��~
�� .ascrerr ****      � ****~ o      ���� 0 etext eText ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  P I   0 :������� 
0 _error  � ��� m   1 2�� ��� $ r e v e r s e   c o m p a r a t o r� ��� o   2 3���� 0 etext eText� ��� o   3 4���� 0 enumber eNumber� ��� o   4 5���� 0 efrom eFrom� ���� o   5 6���� 
0 eto eTo��  ��  F ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  f i��� I     �����
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
cobj� o   G H���� 0 idx1  � n  C F��� o   D F���� 
0 _list_  � o   C D���� $0 resultlistobject resultListObject� ���� n     ��� 4   R U���
�� 
cobj� o   S T���� 0 idx2  � n  O R��� o   P R���� 
0 _list_  � o   O P���� $0 resultlistobject resultListObject��  ��  �� 0 idx1  � m    ���� � o    ���� 0 len  ��  � ���� L   ] b�� n  ] a��� o   ^ `���� 
0 _list_  � o   ] ^���� $0 resultlistobject resultListObject��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I   j t������� 
0 _error  � ��� m   k l�� ���  u n s o r t   l i s t� ��� o   l m���� 0 etext eText� ��� o   m n���� 0 enumber eNumber� ��� o   n o���� 0 efrom eFrom� ���� o   o p���� 
0 eto eTo��  ��  � � � l     ������  �  �    � l     ����  �  �  �       �	
��   ����������~�}�|�{�z�y�x�w�v�u�t�s�r�q�p
� 
pimr� 0 _support  � 
0 _error  � 20 _errorwithpartialresult _errorWithPartialResult� "0 _makelistobject _makeListObject
� .Lst:Instnull���     ****
� .Lst:Delenull���     ****
� .Lst:RDuLnull���     ****
� .Lst:SliLnull���     ****
�~ .Lst:Trannull���     ****
�} .Lst:Findnull���     ****
�| .Lst:Map_null���     ****
�{ .Lst:Filtnull���     ****
�z .Lst:Redunull���     ****�y *0 _quicksortthreshold _quicksortThreshold�x 	0 _sort  
�w .Lst:Sortnull���     ****
�v .Lst:DeSonull��� ��� null
�u .Lst:NuSonull��� ��� null
�t .Lst:DaSonull��� ��� null
�s .Lst:TeSonull��� ��� null
�r .Lst:LiSonull��� ��� null
�q .Lst:ReSonull��� ��� null
�p .Lst:LiUSnull���     **** �o�o    �n�m
�n 
cobj    �l
�l 
osax�m      �k %
�k 
scpt �j -�i�h �g�j 
0 _error  �i �f!�f !  �e�d�c�b�a�e 0 handlername handlerName�d 0 etext eText�c 0 enumber eNumber�b 0 efrom eFrom�a 
0 eto eTo�h   �`�_�^�]�\�` 0 handlername handlerName�_ 0 etext eText�^ 0 enumber eNumber�] 0 efrom eFrom�\ 
0 eto eTo  �[�Z�Y
�[ 
msng�Z �Y 20 _errorwithpartialresult _errorWithPartialResult�g *�������+  �X I�W�V"#�U�X 20 _errorwithpartialresult _errorWithPartialResult�W �T$�T $  �S�R�Q�P�O�N�S 0 handlername handlerName�R 0 etext eText�Q 0 enumber eNumber�P 0 efrom eFrom�O 
0 eto eTo�N 0 epartial ePartial�V  " �M�L�K�J�I�H�M 0 handlername handlerName�L 0 etext eText�K 0 enumber eNumber�J 0 efrom eFrom�I 
0 eto eTo�H 0 epartial ePartial#  [�G�F�E
�G 
msng�F �E 0 rethrowerror rethrowError�U b  ࠡ�����+  �D x�C�B%&�A�D "0 _makelistobject _makeListObject�C �@'�@ '  �?�>�? 0 len  �> 0 padvalue padValue�B  % �=�<�;�= 0 len  �< 0 padvalue padValue�; 0 
listobject 
listObject& �: �(�9�8�7�6�: 0 
listobject 
listObject( �5)�4�3*+�2
�5 .ascrinit****      � ****) k     ,,  ��1�1  �4  �3  * �0�0 
0 _list_  + �/�/ 
0 _list_  �2 jv��9 �8 
0 _list_  
�7 
leng
�6 
cobj�A `��K S�O�j L�����v��,FO h��,�,���,��,%��,F[OY��O��,�,� ��,[�\[Zk\Z�2��,FY hY hO��,E �. ��-�,-.�+
�. .Lst:Instnull���     ****�- 0 thelist theList�, �*�)/
�* 
Valu�) 0 thevalue theValue/ �(01
�( 
Befo0 {�'�&�%�' 0 beforeindex beforeIndex�&  
�% 
msng1 �$23
�$ 
Afte2 {�#�"�!�# 0 
afterindex 
afterIndex�"  
�! 
msng3 � 4�
�  
Conc4 {���� 0 isjoin isJoin�  
� boovfals�  - 
����������� 0 thelist theList� 0 thevalue theValue� 0 beforeindex beforeIndex� 0 
afterindex 
afterIndex� 0 isjoin isJoin� 0 
listobject 
listObject� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo. � �5�������
,9�	E��������d���� 6����� 0 
listobject 
listObject5 ��7����89��
�� .ascrinit****      � ****7 k     ::  �����  ��  ��  8 ���� 
0 _list_  9 ������ "0 aslistparameter asListParameter�� 
0 _list_  �� b  b   �l+ �
� 
kocl
� 
list
� .corecnte****       ****
� 
bool
� 
msng
� 
errn�
�Y�	 (0 asintegerparameter asIntegerParameter� (0 asbooleanparameter asBooleanParameter� 
0 _list_  
� 
leng��@
� 
erob
� 
cobj
� 
insl� �  0 etext eText6 ����;
�� 
errn�� 0 enumber eNumber; ����<
�� 
erob�� 0 efrom eFrom< ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �+����K S�O�
 �kv��l j �& 
�kvE�Y hO�� w�� )��l�Y hOb  ��l+ E�Ob  ��l+ E�O�j ��,a ,�kE�Y hO���,a , ")�a a ��,Ea �/a 4a a Y hY ��� �b  �a l+ E�O�j 
�kE�Y 3�j ��,a ,�E�Y )�a a ��,Ea �/a 3a a O���,a ,
 �j�& ")�a a ��,Ea �/a 3a a Y hY ��%O�j  ���,%Y ;���,a ,  ��,�%Y &��,[a \[Zk\Z�2�%��,[a \[Z�k\Zi2%W X  *a ����a + 	 ��'����=>��
�� .Lst:Delenull���     ****�� 0 thelist theList�� ��?@
�� 
Indx? {�������� 0 theindex theIndex��  ����@ ��AB
�� 
FIdxA {�������� 0 
startindex 
startIndex��  
�� 
msngB ��C��
�� 
TIdxC {�������� 0 endindex endIndex��  
�� 
msng��  = �������������������������� 0 thelist theList�� 0 theindex theIndex�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 
listobject 
listObject�� 0 
listlength 
listLength�� 0 	startlist 	startList�� 0 endlist endList�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo> ��?D������_��o�����������������E\������ 0 
listobject 
listObjectD ��F����GH��
�� .ascrinit****      � ****F k     II ?��  ��  ��  G �� 
0 _list_  H G��� "0 aslistparameter asListParameter� 
0 _list_  �� b  b   �l+ ��� 
0 _list_  
�� 
leng
�� 
msng�� (0 asintegerparameter asIntegerParameter
�� 
bool
�� 
errn���@
�� 
erob
�� 
cobj�� �� 0 etext eTextE ��J
� 
errn� 0 enumber eNumberJ ��K
� 
erob� 0 efrom eFromK ���
� 
errt� 
0 eto eTo�  �� �� 
0 _error  ������K S�O��,�,E�O�� b  ��l+ E�Y hO�� b  ��l+ E�Y hO�� 	 �� �& Lb  ��l+ E�O�j �k�E�Y hO�j 
 ���& )�����,E�/�a Y hO�E�Y ���  kE�Y ��  �E�Y hO�j �k�E�Y hO�j �k�E�Y hO�j 
 ���& )�����,E�/�a Y hO�j 
 ���& )�����,E�/�a Y hO�� ��,�-EY hO�k  �� 
 �� �& jvY hOjvE�Y ��,[�\[Zk\Z�k2E�O��  	jvE�Y ��,[�\[Z�k\Zi2E�O��%W X  *a ����a + 
 �l��LM�
� .Lst:RDuLnull���     ****� 0 thelist theList�  L 	���������� 0 thelist theList� 0 
listobject 
listObject� 0 i  � 0 u  � 0 
listlength 
listLength� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToM �tN����O���� 0 
listobject 
listObjectN �P��QR�
� .ascrinit****      � ****P k     SS t��  �  �  Q �� 
0 _list_  R ���� "0 aslistparameter asListParameter
� 
cobj� 
0 _list_  � b  b   k+  �-E�� 
0 _list_  
� 
leng
� 
cobj� 0 etext eTextO ��T
� 
errn� 0 enumber eNumberT ��U
� 
erob� 0 efrom eFromU ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � � ���K S�Olk��,�,mvE[�k/E�Z[�l/E�Z[�m/E�ZO�j  jvY hO eh�� >h��,[�\[Zk\Z�2��,�/kv�kE�O�� ��,[�\[Zk\Z�2EY h[OY��O�kE�O��,�/��,�/FO�kE�[OY��O��,[�\[Zk\Z�2EW X  *襦���+ 
 ���VW�
� .Lst:SliLnull���     ****� 0 thelist theList� �XY
� 
FIdxX {���� 0 
startindex 
startIndex�  
� 
msngY �Z�
� 
TIdxZ {���� 0 endindex endIndex�  
� 
msng�  V ������~�}�|� 0 thelist theList� 0 
startindex 
startIndex� 0 endindex endIndex� 0 	thelength 	theLength� 0 etext eText�~ 0 enumber eNumber�} 0 efrom eFrom�| 
0 eto eToW �{�z�y4�x�w�v�u�tC�s�ri}��q�p[�o�n�{ "0 aslistparameter asListParameter
�z 
leng
�y 
msng�x (0 asintegerparameter asIntegerParameter
�w 
errn�v�Y
�u 
erob�t 
�s 
cobj�r�[
�q 
bool�p 0 etext eText[ �m�l\
�m 
errn�l 0 enumber eNumber\ �k�j]
�k 
erob�j 0 efrom eFrom] �i�h�g
�i 
errt�h 
0 eto eTo�g  �o �n 
0 _error  ��vb  �k+  E�O��,E�O�� Xb  ��l+ E�O�j  )�����Y hO��  -��' 
��-EY �� jvY �[�\[Z�\Zi2EY hY ��  )��l�Y hO�� Xb  ��l+ E�O�j  )�����Y hO��  -��' jvY �� 
��-EY �[�\[Zk\Z�2EY hY hO�j �k�E�Y hO�j �k�E�Y hO��
 �k	 �k�&�&
 ��	 ���&�& jvY hO�k kE�Y �� �E�Y hO�k kE�Y �� �E�Y hO�[�\[Z�\Z�2EW X  *a ����a +  �f�e�d^_�c
�f .Lst:Trannull���     ****�e 0 thelist theList�d �b`a
�b 
Whil` {�a�`�_�a 0 unevenoption unevenOption�`  
�_ LTrhLTrRa �^b�]
�^ 
PadIb {�\�[�Z�\ 0 padvalue padValue�[  
�Z 
msng�]  ^ �Y�X�W�V�U�T�S�R�Q�P�O�N�M�L�Y 0 thelist theList�X 0 unevenoption unevenOption�W 0 padvalue padValue�V 0 
listobject 
listObject�U $0 resultlistlength resultListLength�T 0 aref aRef�S *0 resultsublistlength resultSubListLength�R 0 resultsublist resultSubList�Q 0 i  �P 0 j  �O 0 etext eText�N 0 enumber eNumber�M 0 efrom eFrom�L 
0 eto eTo_ �K�J�I�H�G�F�E�DJ�CQc�B�A�@�?z�>�=�<�;�:��9�8�7d8�6�5
�K 
kocl
�J 
list
�I .corecnte****       ****
�H 
bool
�G 
errn�F�Y
�E 
erob�D �C 0 
listobject 
listObjectc �4e�3�2fg�1
�4 .ascrinit****      � ****e k     
hh Sii V�0�0  �3  �2  f �/�.�/ 
0 _list_  �. 0 _resultlist_ _resultList_g �-�,�- 
0 _list_  �, 0 _resultlist_ _resultList_�1 b   �Ojv��B 
0 _list_  
�A 
cobj
�@ 
leng
�? LTrhLTrR
�> LTrhLTrP
�= LTrhLTrT
�< 
errt
�; 
enum�: �9 "0 _makelistobject _makeListObject�8 0 _resultlist_ _resultList_�7 0 etext eTextd �+�*j
�+ 
errn�* 0 enumber eNumberj �)�(k
�) 
erob�( 0 efrom eFromk �'�&�%
�' 
errt�& 
0 eto eTo�%  �6 �5 
0 _error  �c�Ġjv  jvY hO�kv��l j 
 ���l �j �& )�����Y hO��K S�O��,�k/�,E�O��  2 ,��,[��l kh ��,� )����a Y h[OY��Y z�a   - '��,[��l kh ��,� 
��,E�Y h[OY��Y G�a   - '��,[��l kh ��,� 
��,E�Y h[OY��Y )���a a a a O�j ���,�,E�O*��l+ E�O��a ,6FO l�kh ��-E�a ,6F[OY��O�a   @ :k�kh  +k��,��/�,Ekh 	��,��/��/�a ,��/��/F[OY��[OY��Y 5 2k�kh  #k�kh 	��,��/��/�a ,��/��/F[OY��[OY��Y hO�a ,EW X  *a ����a +  �$T�#�"lm�!
�$ .Lst:Findnull���     ****�# 0 thelist theList�" � no
�  
Valun {���� 0 theitem theItem�  
� 
msngo �pq
� 
Usinp {���� 0 	thescript 	theScript�  
� 
msngq �r�
� 
Retur {���� (0 findingoccurrences findingOccurrences�  
� LFWhLFWA�  l 
����������
� 0 thelist theList� 0 theitem theItem� 0 	thescript 	theScript� (0 findingoccurrences findingOccurrences� 0 
listobject 
listObject� 0 i  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom�
 
0 eto eTom �	ks���������� ���B������������d��ty�����	 0 
listobject 
listObjects ��u����vw��
�� .ascrinit****      � ****u k     xx myy x����  ��  ��  v ������ 
0 _list_  �� 0 _result_  w v�������� "0 aslistparameter asListParameter�� 
0 _list_  �� 0 _result_  �� b  b   �l+ �Ojv�
� LFWhLFWA
� 
msng� 
0 _list_  
� 
leng
� 
cobj� 0 _result_  � &0 asscriptparameter asScriptParameter� 0 	checkitem 	checkItem
�  LFWhLFWF
�� LFWhLFWL
�� 
errn���Y
�� 
erob
�� 
errt
�� 
enum�� �� 0 etext eTextt ����z
�� 
errn�� 0 enumber eNumberz ����{
�� 
erob�� 0 efrom eFrom{ ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �!����K S�O��  q��  . (k��,�,Ekh ��,�/�  ���,6FY h[OY��Y <b  ��l+ 
E�O +k��,�,Ekh ���,�/k+  ���,6FY h[OY��Y��  u��  0 *k��,�,Ekh ��,�/�  ���,6FOY h[OY��Y >b  ��l+ 
E�O -k��,�,Ekh ���,�/k+  ���,6FOY h[OY��Y ���  u��  0 *��,�,Ekih ��,�/�  ���,6FOY h[OY��Y >b  ��l+ 
E�O -��,�,Ekih ���,�/k+  ���,6FOY h[OY��Y )a a a �a a a a O��,EW X  *a ����a +  �������|}��
�� .Lst:Map_null���     ****�� 0 thelist theList�� ������
�� 
Usin�� 0 	thescript 	theScript��  | 	�������������������� 0 thelist theList�� 0 	thescript 	theScript�� $0 resultlistobject resultListObject�� 0 i  �� 0 etext eText�� 0 enumber eNumber�� 
0 eto eTo�� 0 epartial ePartial�� 0 efrom eFrom} ���~��������������������������)������ $0 resultlistobject resultListObject~ �����������
�� .ascrinit****      � ****� k     �� �����  ��  ��  � ���� 
0 _list_  � ����� "0 aslistparameter asListParameter
� 
cobj� 
0 _list_  �� b  b   �l+ �-E��� &0 asscriptparameter asScriptParameter�� 
0 _list_  
�� 
leng
�� 
cobj�� 0 convertitem convertItem�� 0 etext eText ���
� 
errn� 0 enumber eNumber� ���
� 
errt� 
0 eto eTo�  
�� 
errn
�� 
erob�� "0 aslistparameter asListParameter
�� 
errt
�� 
ptlr�� � ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo� ���
� 
ptlr� 0 epartial ePartial�  �� �� 20 _errorwithpartialresult _errorWithPartialResult�� � ���K S�Ob  ��l+ E�O + %k��,�,Ekh ���,�/k+ ��,�/F[OY��W NX 	 
�k ��,[�\[Zk\Z�k2E�Y jvE�O)��b  ��l+ �/�a �a a �%a %�%O��,EW X 	 *a �����a +  �;�����
� .Lst:Filtnull���     ****� 0 thelist theList� ���
� 
Usin� 0 	thescript 	theScript�  � ������������ 0 thelist theList� 0 	thescript 	theScript� $0 resultlistobject resultListObject� 0 	lastindex 	lastIndex� 0 i  � 0 theitem theItem� 0 etext eText� 0 enumber eNumber� 
0 eto eTo� 0 epartial ePartial� 0 efrom eFrom� �E�[��������������������� $0 resultlistobject resultListObject� �������
� .ascrinit****      � ****� k     �� E��  �  �  � �� 
0 _list_  � O���� "0 aslistparameter asListParameter
� 
cobj� 
0 _list_  � b  b   �l+ �-E�� &0 asscriptparameter asScriptParameter� 
0 _list_  
� 
leng
� 
cobj� 0 	checkitem 	checkItem� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
errt� 
0 eto eTo�  
� 
errn
� 
erob� "0 aslistparameter asListParameter
� 
errt
� 
ptlr� � ��~�
� 
errn�~ 0 enumber eNumber� �}�|�
�} 
erob�| 0 efrom eFrom� �{�z�
�{ 
errt�z 
0 eto eTo� �y�x�w
�y 
ptlr�x 0 epartial ePartial�w  � � 20 _errorwithpartialresult _errorWithPartialResult� � ���K S�Ob  ��l+ E�OjE�O = 7k��,�,Ekh ��,�/E�O��k+  �kE�O���,�/FY h[OY��W NX 	 
�k ��,[�\[Zk\Z�k2E�Y jvE�O)��b  ��l+ �/�a �a a �%a %�%O�j  jvY hO��,[�\[Zk\Z�2EW X 	 *a �����a +  �v��u�t���s
�v .Lst:Redunull���     ****�u 0 thelist theList�t �r�q�p
�r 
Usin�q 0 	thescript 	theScript�p  � 	�o�n�m�l�k�j�i�h�g�o 0 thelist theList�n 0 	thescript 	theScript�m 0 	theresult 	theResult�l 0 
listobject 
listObject�k 0 i  �j 0 etext eText�i 0 enumber eNumber�h 
0 eto eTo�g 0 efrom eFrom� �f�e	��d�c�b�a�`�_		*�^�]�\�[�	n�Z�Y�X	[	]�	}�W
�f 
msng�e 0 
listobject 
listObject� �V��U�T���S
�V .ascrinit****      � ****� k     �� 	�R�R  �U  �T  � �Q�Q 
0 _list_  � 	�P�O�P "0 aslistparameter asListParameter�O 
0 _list_  �S b  b   �l+ ��d 
0 _list_  
�c 
leng
�b 
errn�a�Y
�` 
erob�_ �^ &0 asscriptparameter asScriptParameter
�] 
cobj�\ 0 combineitem combineItem�[ 0 etext eText� �N�M�
�N 
errn�M 0 enumber eNumber� �L�K�J
�L 
errt�K 
0 eto eTo�J  �Z "0 aslistparameter asListParameter
�Y 
errt�X � �I�H�
�I 
errn�H 0 enumber eNumber� �G�F�
�G 
erob�F 0 efrom eFrom� �E�D�C
�E 
errt�D 
0 eto eTo�C  �W 20 _errorwithpartialresult _errorWithPartialResult�s ��E�O ���K S�O��,�,j  )���jv��Y hOb  ��l+ E�O��,�k/E�O ' !l��,�,Ekh ����,��/l+ E�[OY��W /X  )��b  �a l+ ��/a �a a �%a %�%O�W X  *a �����a + �  �B	��A�@���?�B 	0 _sort  �A �>��> �  �=�<�;�:�9�= $0 resultlistobject resultListObject�< 0 
startindex 
startIndex�; 0 endindex endIndex�:  0 sortcomparator sortComparator�9 0 usequicksort useQuickSort�@  � �8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�)�8 $0 resultlistobject resultListObject�7 0 
startindex 
startIndex�6 0 endindex endIndex�5  0 sortcomparator sortComparator�4 0 usequicksort useQuickSort�3 0 	leftindex 	leftIndex�2 0 
rightindex 
rightIndex�1 0 
pivotvalue 
pivotValue�0 0 etext eText�/ 0 enum eNum�. 0 efrom eFrom�- 
0 eto eTo�, 0 i  �+ 0 j  �* 0 leftkey leftKey�) 0 rightkey rightKey� �(�'�&�%�$��#�"�!� 

L�����
�( 
cobj�' 
0 _keys_  �& 0 comparekeys compareKeys
�% 
nmbr�$ 0 etext eText� ���
� 
errn� 0 enum eNum� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  
�# 
errn
�" 
erob
�! 
errt�  � 
0 _list_  � � 	0 _sort  �  � ���
� 
errn��n�  �?�q��k hY hO��lvE[�k/E�Z[�l/E�ZO��,[�\[Z�\Z�2�.E�Oh�� % h���,�/E�l+ �&j�kE�[OY��W X  )���,�/�lv���%O $ h���,�/�l+ �&j�kE�[OY��W X  )���,�/�lv���%O�� p��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZO��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZO�k�klvE[�k/E�Z[�l/E�ZY h[OY�O -*������b  �+ O*������b  �+ OhW X  hY hO�kE�O ���kh  ���ih ��,�k/E��,�/ElvE[�k/E�Z[�l/E�ZO���l+ k Y hO��lvE[�k/��,�k/FZ[�l/��,�/FZO��,�/E��,�k/ElvE[�k/��,�k/FZ[�l/��,�/FZ[OY�y[OY�j �o�����
� .Lst:Sortnull���     ****� 0 thelist theList� ���
� 
Comp� {��
�	�  0 sortcomparator sortComparator�
  
�	 
msng�  � ��������� ������������� 0 thelist theList�  0 sortcomparator sortComparator� $0 resultlistobject resultListObject�  0 ascendingcount ascendingCount� "0 descendingcount descendingCount� 0 previouskey previousKey� 0 etext eText� 0 enum eNum�  
0 eto eTo�� 0 i  �� 0 
currentkey 
currentKey�� 0 keycomparison keyComparison�� 0 efrom eFrom�� 0 usequicksort useQuickSort�� 0 enumber eNumber� ������������������������������������.0������������� "0 aslistparameter asListParameter�� $0 resultlistobject resultListObject� �����������
�� .ascrinit****      � ****� k     �� ��� �����  ��  ��  � ������ 
0 _keys_  �� 
0 _list_  � ������
�� 
cobj�� 
0 _keys_  �� 
0 _list_  �� b   �-E�Ob   �-E��� 
0 _list_  
�� 
leng
�� 
msng
�� .Lst:DeSonull��� ��� null�� &0 asscriptparameter asScriptParameter
�� 
cobj�� 
0 _keys_  �� 0 makekey makeKey�� 0 etext eText� �����
�� 
errn�� 0 enum eNum� ������
�� 
errt�� 
0 eto eTo��  
�� 
errn
�� 
erob
�� 
errt�� �� 0 comparekeys compareKeys� �����
�� 
errn�� 0 enum eNum� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 	0 _sort  � �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� 
0 _error  ��qb  ��l+ E�O��K S�O��,�,l 
��,EY hO��  *j E�Y b  ��l+ 
E�OjjlvE[�k/E�Z[�l/E�ZO � ���,�k/Ek+ E�W $X  )a �a ��,E�k/a �a a �%O���,�k/FO �l��,�,Ekh 	 ���,�/k+ E�W *X  )a �a ��,E�/a �a a �%a %�%O���,�/FO���l+ E�O�j 
�kE�Y �j 
�kE�Y hO�E�[OY��W X  )a �a �a �a �O�j #��,�,b  E�O*�k��,�,��a + Y hO��,EW X  *a ����a +  �����������
�� .Lst:DeSonull��� ��� null��  ��  � ���� &0 defaultcomparator DefaultComparator� ������ &0 defaultcomparator DefaultComparator� �����������
�� .ascrinit****      � ****� k     �� ��� ��� ��� ;��  ��  ��  � ����� "0 _supportedtypes _supportedTypes� 	0 _type  � 0 makekey makeKey� 0 comparekeys compareKeys� ��������
� 
nmbr
� 
ctxt
� 
ldt � "0 _supportedtypes _supportedTypes
� 
msng� 	0 _type  � �������� 0 makekey makeKey� ��� �  �� 0 anobject anObject�  � ��� 0 anobject anObject� 0 aref aRef� ����������-/�4
� 
msng� "0 _supportedtypes _supportedTypes
� 
kocl
� 
cobj
� .corecnte****       ****
� 
pcnt
� 
errn��\
� 
erob� 
� 
pcls� ~b  �  F 7)�,[��l kh �kv��,El j ��,Ec  O�Y h[OY��O)�����Y .�kv�b  l j  )�����b  %�%��,%�%Y hO�� �=������ 0 comparekeys compareKeys� ��� �  ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�  � ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�  � �� iY �� kY j�� ���mv�O�OL OL �� ��K S� �W�����
� .Lst:NuSonull��� ��� null�  �  � �� &0 numericcomparator NumericComparator� �X�� &0 numericcomparator NumericComparator� �������
� .ascrinit****      � ****� k     �� Z�� c��  �  �  � ��� 0 makekey makeKey� 0 comparekeys compareKeys� ��� �]������ 0 makekey makeKey� ��� �  �� 0 anobject anObject�  � �� 0 anobject anObject� �
� 
nmbr� ��&� �e������ 0 comparekeys compareKeys� ��� �  �~�}�~ 0 
leftobject 
leftObject�} 0 rightobject rightObject�  � �|�{�| 0 
leftobject 
leftObject�{ 0 rightobject rightObject�  � ��� L  OL � ��K S� �zx�y�x���w
�z .Lst:DaSonull��� ��� null�y  �x  � �v�v  0 datecomparator DateComparator� �uy��u  0 datecomparator DateComparator� �t��s�r���q
�t .ascrinit****      � ****� k     �� {�� ��p�p  �s  �r  � �o�n�o 0 makekey makeKey�n 0 comparekeys compareKeys� ��� �m~�l�k���j�m 0 makekey makeKey�l �i��i �  �h�h 0 anobject anObject�k  � �g�g 0 anobject anObject� �f
�f 
ldt �j ��&� �e��d�c���b�e 0 comparekeys compareKeys�d �a��a �  �`�_�` 0 
leftobject 
leftObject�_ 0 rightobject rightObject�c  � �^�]�^ 0 
leftobject 
leftObject�] 0 rightobject rightObject�  �b ���q L  OL �w ��K S� �\��[�Z���Y
�\ .Lst:TeSonull��� ��� null�[  �Z �X��W
�X 
Cons� {�V�U�T�V  0 orderingoption orderingOption�U  
�T SrtECmpI�W  � 	�S�R�Q�P�O�N�M�L�K�S  0 orderingoption orderingOption�R B0 currentconsiderationscomparator CurrentConsiderationsComparator�Q >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator�P :0 casesensitivetextcomparator CaseSensitiveTextComparator�O 40 exactmatchtextcomparator ExactMatchTextComparator�N 0 etext eText�M 0 enumber eNumber�L 0 efrom eFrom�K 
0 eto eTo� �J���I�H���G�F���E�D��C�B�A�@�?�>�=>�<�O�;�:�J B0 currentconsiderationscomparator CurrentConsiderationsComparator� �9��8�7���6
�9 .ascrinit****      � ****� k     �� ��� ��5�5  �8  �7  � �4�3�4 0 makekey makeKey�3 0 comparekeys compareKeys� ��� �2��1�0���/�2 0 makekey makeKey�1 �.��. �  �-�- 0 anobject anObject�0  � �,�, 0 anobject anObject� �+
�+ 
ctxt�/ ��&� �*��)�(���'�* 0 comparekeys compareKeys�) �& �&    �%�$�% 0 
leftobject 
leftObject�$ 0 rightobject rightObject�(  � �#�"�# 0 
leftobject 
leftObject�" 0 rightobject rightObject�  �' �� iY �� kY j�6 L  OL 
�I SrtECmpI�H >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator� �!� ��
�! .ascrinit****      � **** k      � ���  �   �   ��
� 
pare� 0 comparekeys compareKeys �
� 
pare ������ 0 comparekeys compareKeys� �	� 	  ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�   ��� 0 
leftobject 
leftObject� 0 rightobject rightObject ���� 0 comparekeys compareKeys� �� )��ld*J V� b  N  OL 
�G SrtECmpC�F :0 casesensitivetextcomparator CaseSensitiveTextComparator� �
���
� .ascrinit****      � ****
 k      � ���  �  �   �
�	
�
 
pare�	 0 comparekeys compareKeys �
� 
pare ������ 0 comparekeys compareKeys� ��   ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�   � ���  0 
leftobject 
leftObject�� 0 rightobject rightObject ���� 0 comparekeys compareKeys� �� )��ld*J V� b  N  OL 
�E SrtECmpE�D 40 exactmatchtextcomparator ExactMatchTextComparator� ��������
�� .ascrinit****      � **** k        ����  ��  ��   ����
�� 
pare�� 0 comparekeys compareKeys ��
�� 
pare ��"�������� 0 comparekeys compareKeys�� ����   ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject��   ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject ()���� 0 comparekeys compareKeys�� �� )��ld*J V�� b  N  OL 
�C SrtECmpD
�B 
errn�A�Y
�@ 
erob
�? 
errt
�> 
enum�= �< 0 etext eText� ����
�� 
errn�� 0 enumber eNumber ����
�� 
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  �; �: 
0 _error  �Y ~ i��K S�O��  ��K S�O�Y K��  ��K 
S�O�Y 8��  ��K S�O�Y %��  �Y )a a a �a a a a W X  *a ����a +  ��_������
�� .Lst:LiSonull��� ��� null��  �� �� ��
�� 
Comp  {�������� "0 itemcomparators itemComparators��  
�� 
msng��   ������������������ "0 itemcomparators itemComparators�� $0 comparatorobject comparatorObject�� .0 uniformlistcomparator UniformListComparator�� *0 mixedlistcomparator MixedListComparator�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo ������������������!��^c������g"��#8����
�� 
kocl
�� 
reco
�� .corecnte****       ****
�� 
list
�� 
msng
�� .Lst:DeSonull��� ��� null�� &0 asscriptparameter asScriptParameter�� .0 uniformlistcomparator UniformListComparator! ��$����%&��
�� .ascrinit****      � ****$ k     '' �(( �����  ��  ��  % ��� 0 makekey makeKey� 0 comparekeys compareKeys& )*) ����+,�� 0 makekey makeKey� �-� -  �� 0 sublist subList�  + ��� 0 sublist subList� 0 	keyobject 	KeyObject, ��.� 0 	keyobject 	KeyObject. �/��01�
� .ascrinit****      � ****/ k     22 �33 �44 ���  �  �  0 ���� 
0 _list_  � 
0 _keys_  � 0 getkey getKey1 ��5� 
0 _list_  � 
0 _keys_  5 ����67�� 0 getkey getKey� �8� 8  �� 0 	itemindex 	itemIndex�  6 �� 0 	itemindex 	itemIndex7 ������ 
0 _keys_  
� 
leng� 
0 _list_  
� 
cobj� 0 makekey makeKey� 1 &h�)�,�,b  )�,�/k+ b  6F[OY��O)�,�/E� b   �Ojv�OL � ��K S�* ����9:�� 0 comparekeys compareKeys� �;� ;  ��� 0 leftkeyobject leftKeyObject�  0 rightkeyobject rightKeyObject�  9 �������� 0 leftkeyobject leftKeyObject�  0 rightkeyobject rightKeyObject� 0 
leftlength 
leftLength� 0 rightlength rightLength� 0 commonlength commonLength� 0 i  � $0 comparisonresult comparisonResult: ���������� 
0 _list_  
�� 
leng
�� 
cobj�� 0 getkey getKey�� 0 comparekeys compareKeys� {��,�,��,�,lvE[�k/E�Z[�l/E�ZO�E�O�� �E�Y hO 2k�kh b  ��k+ ��k+ l+ E�O�j �Y h[OY��O�� iY �� kY j�� L  OL 
�� 
leng�� �� .0 throwinvalidparameter throwInvalidParameter�� *0 mixedlistcomparator MixedListComparator" ��<����=>��
�� .ascrinit****      � ****< k     ?? n@@ �����  ��  ��  = ������ 0 makekey makeKey�� 0 comparekeys compareKeys> ABA ��q����CD���� 0 makekey makeKey�� ��E�� E  �� 0 sublist subList��  C �~�}�~ 0 sublist subList�} 0 	keyobject 	KeyObjectD �|tF�| 0 	keyobject 	KeyObjectF �{G�z�yHI�x
�{ .ascrinit****      � ****G k     JJ vKK yLL ~�w�w  �z  �y  H �v�u�t�v 
0 _list_  �u 
0 _keys_  �t 0 getkey getKeyI �s�rM�s 
0 _list_  �r 
0 _keys_  M �q��p�oNO�n�q 0 getkey getKey�p �mP�m P  �l�l "0 comparatorindex comparatorIndex�o  N �k�j�i�h�k "0 comparatorindex comparatorIndex�j 0 i  �i 0 subitem subItem�h (0 listitemcomparator listItemComparatorO �g�f�e�d�c�bQ�a�`�_�^��]�\R��[���Z�g 
0 _keys_  
�f 
leng
�e 
cobj�d 0 	itemindex 	itemIndex�c  0 itemcomparator itemComparator�b  Q �Y�X�W
�Y 
errn�X�@�W  
�a 
errn�`�Y
�_ 
erob�^ �] 
0 _list_  
�\ 
longR �V�U�T
�V 
errn�U�\�T  �[�@�Z 0 makekey makeKey�n � �h�)�,�, b   �/E[�,E�Z[�,Ec  ZW X  )���b   �/��O * )�,��&/E�W X  )���b   �/��W #X  )�a �b   �/�a ��,%a %Ob  �k+ b  6F[OY�bO)�,�/E�x b   �Ojv�OL �� ��K S�B �S��R�QST�P�S 0 comparekeys compareKeys�R �OU�O U  �N�M�N 0 leftkeyobject leftKeyObject�M  0 rightkeyobject rightKeyObject�Q  S �L�K�J�I�L 0 leftkeyobject leftKeyObject�K  0 rightkeyobject rightKeyObject�J 0 i  �I $0 comparisonresult comparisonResultT �H�G�F�E�D
�H 
leng
�G 
cobj�F  0 itemcomparator itemComparator�E 0 getkey getKey�D 0 comparekeys compareKeys�P C >kb   �,Ekh b   �/�,��k+ ��k+ l+ E�O�j �Y h[OY��Oj�� L  OL �� 0 etext eText# �C�BV
�C 
errn�B 0 enumber eNumberV �A�@W
�A 
erob�@ 0 efrom eFromW �?�>�=
�? 
errt�> 
0 eto eTo�=  �� �� 
0 _error  �� � ~�kv��l k  
�kvE�Y hO�kv��l j  *��  *j E�Y b  ��l+ E�O��K 
S�Y -���l ��, b  �����+ Y hOa a K S�W X  *a ����a +  �<H�;�:XY�9
�< .Lst:ReSonull��� ��� null�;  �: �8Z�7
�8 
CompZ {�6�5�4�6 $0 comparatorobject comparatorObject�5  
�4 
msng�7  X �3�2�1�0�/�.�3 $0 comparatorobject comparatorObject�2 &0 reversecomparator ReverseComparator�1 0 etext eText�0 0 enumber eNumber�/ 0 efrom eFrom�. 
0 eto eToY �-�,c�+�*f[�)\��(�'
�- 
msng
�, .Lst:DeSonull��� ��� null�+ &0 asscriptparameter asScriptParameter�* &0 reversecomparator ReverseComparator[ �&]�%�$^_�#
�& .ascrinit****      � ****] k     `` haa k�"�"  �%  �$  ^ �!� 
�! 
pare�  0 comparekeys compareKeys_ �b
� 
pareb �m��cd�� 0 comparekeys compareKeys� �e� e  ��� 0 leftkey leftKey� 0 rightkey rightKey�  c ��� 0 leftkey leftKey� 0 rightkey rightKeyd �� 0 comparekeys compareKeys� )��ld*J  '�# b   N  OL �) 0 etext eText\ ��f
� 
errn� 0 enumber eNumberf ��g
� 
erob� 0 efrom eFromg ���
� 
errt� 
0 eto eTo�  �( �' 
0 _error  �9 ; *��  *j E�Y b  ��l+ E�O��K S�W X  *颣���+  ����hi�

� .Lst:LiUSnull���     ****� 0 thelist theList�  h 	�	���������	 0 thelist theList� $0 resultlistobject resultListObject� 0 len  � 0 idx1  � 0 idx2  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToi � �j������������������k������  $0 resultlistobject resultListObjectj ��l����mn��
�� .ascrinit****      � ****l k     oo �����  ��  ��  m ���� 
0 _list_  n ��������� "0 aslistparameter asListParameter
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
cobj�� 0 etext eTextk ����p
�� 
errn�� 0 enumber eNumberp ����q
�� 
erob�� 0 efrom eFromq ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �
 u d��K S�O��,�,E�O Hk�kh � *�k�� 	UE�O��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZ[OY��O��,EW X  *������+ ascr  ��ޭ