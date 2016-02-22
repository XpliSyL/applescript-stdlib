FasdUAS 1.101.10   ��   ��    k             l      ��  ��   " Number -- manipulate numeric values and perform common math functions

Notes:

- Some handlers originally based on ESG MathLib <http://www.esglabs.com/>, which in turn are conversions of the ones in the Cephes Mathematical Library by Stephen L. Moshier <http://netlib.org/cephes/>.


TO DO: 

- debug, finalize `parse/format number` behaviors

- should `tan` return `infinity` symbol instead of erroring?

- use identifiers rather than properties in number format record? (other libraries already do this to mimimize namespace pollution)

     � 	 	8   N u m b e r   - -   m a n i p u l a t e   n u m e r i c   v a l u e s   a n d   p e r f o r m   c o m m o n   m a t h   f u n c t i o n s 
 
 N o t e s : 
 
 -   S o m e   h a n d l e r s   o r i g i n a l l y   b a s e d   o n   E S G   M a t h L i b   < h t t p : / / w w w . e s g l a b s . c o m / > ,   w h i c h   i n   t u r n   a r e   c o n v e r s i o n s   o f   t h e   o n e s   i n   t h e   C e p h e s   M a t h e m a t i c a l   L i b r a r y   b y   S t e p h e n   L .   M o s h i e r   < h t t p : / / n e t l i b . o r g / c e p h e s / > . 
 
 
 T O   D O :   
 
 -   d e b u g ,   f i n a l i z e   ` p a r s e / f o r m a t   n u m b e r `   b e h a v i o r s 
 
 -   s h o u l d   ` t a n `   r e t u r n   ` i n f i n i t y `   s y m b o l   i n s t e a d   o f   e r r o r i n g ? 
 
 -   u s e   i d e n t i f i e r s   r a t h e r   t h a n   p r o p e r t i e s   i n   n u m b e r   f o r m a t   r e c o r d ?   ( o t h e r   l i b r a r i e s   a l r e a d y   d o   t h i s   t o   m i m i m i z e   n a m e s p a c e   p o l l u t i o n ) 
 
   
  
 l     ��������  ��  ��        l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -     !   l     �� " #��   "   support    # � $ $    s u p p o r t !  % & % l     ��������  ��  ��   &  ' ( ' l      ) * + ) j    �� ,�� 0 _support   , N     - - 4    �� .
�� 
scpt . m     / / � 0 0  T y p e S u p p o r t * "  used for parameter checking    + � 1 1 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g (  2 3 2 l     ��������  ��  ��   3  4 5 4 i   ! 6 7 6 I      �� 8���� 
0 _error   8  9 : 9 o      ���� 0 handlername handlerName :  ; < ; o      ���� 0 etext eText <  = > = o      ���� 0 enumber eNumber >  ? @ ? o      ���� 0 efrom eFrom @  A�� A o      ���� 
0 eto eTo��  ��   7 n     B C B I    �� D���� &0 throwcommanderror throwCommandError D  E F E m     G G � H H  N u m b e r F  I J I o    ���� 0 handlername handlerName J  K L K o    ���� 0 etext eText L  M N M o    	���� 0 enumber eNumber N  O P O o   	 
���� 0 efrom eFrom P  Q�� Q o   
 ���� 
0 eto eTo��  ��   C o     ���� 0 _support   5  R S R l     ��������  ��  ��   S  T U T l     ��������  ��  ��   U  V W V l     �� X Y��   X J D--------------------------------------------------------------------    Y � Z Z � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - W  [ \ [ l     �� ] ^��   ]  
 constants    ^ � _ _    c o n s t a n t s \  ` a ` l     ��������  ��  ��   a  b c b l      d e f d j   " $�� g�� 	0 __e__   g m   " # h h @�
�_� e ; 5 the mathematical constant e (natural logarithm base)    f � i i j   t h e   m a t h e m a t i c a l   c o n s t a n t   e   ( n a t u r a l   l o g a r i t h m   b a s e ) c  j k j l     ��������  ��  ��   k  l m l l      n o p n j   % '�� q�� 0 _isequaldelta _isEqualDelta q m   % & r r =q���-� o i c multiplier used by `cmp` to allow for slight differences due to floating point's limited precision    p � s s �   m u l t i p l i e r   u s e d   b y   ` c m p `   t o   a l l o w   f o r   s l i g h t   d i f f e r e n c e s   d u e   t o   f l o a t i n g   p o i n t ' s   l i m i t e d   p r e c i s i o n m  t u t l     ��������  ��  ��   u  v w v l     ��������  ��  ��   w  x y x l     �� z {��   z J D--------------------------------------------------------------------    { � | | � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - y  } ~ } l     ��  ���      parse and format    � � � � "   p a r s e   a n d   f o r m a t ~  � � � l     ��������  ��  ��   �  � � � i  ( + � � � I      �� ����� (0 _asintegerproperty _asIntegerProperty �  � � � o      ���� 0 thevalue theValue �  � � � o      ���� 0 propertyname propertyName �  ��� � o      ���� 0 minvalue minValue��  ��   � l    8 � � � � Q     8 � � � � k    & � �  � � � r     � � � c     � � � o    ���� 0 thevalue theValue � m    ��
�� 
long � o      ���� 0 n   �  � � � Z  	 # � ����� � G   	  � � � >   	  � � � o   	 
���� 0 n   � c   
  � � � o   
 ���� 0 thevalue theValue � m    ��
�� 
doub � A     � � � o    ���� 0 n   � o    ���� 0 minvalue minValue � R    ���� �
�� .ascrerr ****      � ****��   � �� ���
�� 
errn � m    �����Y��  ��  ��   �  ��� � L   $ & � � o   $ %���� 0 n  ��   � R      ���� �
�� .ascrerr ****      � ****��   � �� ���
�� 
errn � d       � � m      �������   � R   . 8�� � �
�� .ascrerr ****      � **** � b   2 7 � � � b   2 5 � � � m   2 3 � � � � � J  n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    � o   3 4���� 0 propertyname propertyName � m   5 6 � � � � � P    p r o p e r t y   i s   n o t   a   n o n - n e g a t i v e   i n t e g e r � �� ���
�� 
errn � m   0 1�����Y��   � . ( TO DO: what about sensible upper bound?    � � � � P   T O   D O :   w h a t   a b o u t   s e n s i b l e   u p p e r   b o u n d ? �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  , / � � � I      �� ����� ,0 _makenumberformatter _makeNumberFormatter �  � � � o      ���� 0 formatstyle formatStyle �  � � � o      ���� 0 
localecode 
localeCode �  ��� � o      ���� 0 defaultstyle defaultStyle��  ��   � l   � � � � � k    � � �  � � � l     � � � � r      � � � n     � � � I    �������� 0 init  ��  ��   � n     � � � I    �������� 	0 alloc  ��  ��   � n     � � � o    ���� &0 nsnumberformatter NSNumberFormatter � m     ��
�� misccura � o      ���� 0 asocformatter asocFormatter �	 (note that while NSFormatter provides a global +setDefaultFormatterBehavior: option to change all NSNumberFormatters to use pre-10.4 behavior, we don't bother to call setFormatterBehavior: as it's very unlikely nowadays that a host process would change this)    � � � �   ( n o t e   t h a t   w h i l e   N S F o r m a t t e r   p r o v i d e s   a   g l o b a l   + s e t D e f a u l t F o r m a t t e r B e h a v i o r :   o p t i o n   t o   c h a n g e   a l l   N S N u m b e r F o r m a t t e r s   t o   u s e   p r e - 1 0 . 4   b e h a v i o r ,   w e   d o n ' t   b o t h e r   t o   c a l l   s e t F o r m a t t e r B e h a v i o r :   a s   i t ' s   v e r y   u n l i k e l y   n o w a d a y s   t h a t   a   h o s t   p r o c e s s   w o u l d   c h a n g e   t h i s ) �  � � � Q   q � � � � Z   S � �� � � =     � � � l    ��~�} � I   �| � �
�| .corecnte****       **** � J     � �  ��{ � o    �z�z 0 formatstyle formatStyle�{   � �y ��x
�y 
kocl � m    �w
�w 
reco�x  �~  �}   � m    �v�v  � k   7 � �  � � � r    P � � � n   N � � � I   $ N�u ��t�u 60 asoptionalrecordparameter asOptionalRecordParameter �  � � � o   $ %�s�s 0 formatstyle formatStyle �  � � � K   % G � � �r � �
�r 
pcls � l  & ' ��q�p � m   & '�o
�o 
MthR�q  �p   � �n � �
�n 
MthA � n  ( / � � � o   - /�m�m 0 requiredvalue RequiredValue � o   ( -�l�l 0 _support   � �k � �
�k 
MthB � m   0 1�j
�j 
msng � �i 
�i 
MthC  m   2 3�h
�h 
msng �g
�g 
MthD m   4 5�f
�f 
msng �e
�e 
MthE m   6 7�d
�d 
msng �c
�c 
MthF m   : ;�b
�b 
msng �a	
�a 
MthG m   > ?�`
�` 
msng	 �_
�^
�_ 
MthH
 m   B C�]
�] 
msng�^   � �\ m   G J � 
 u s i n g�\  �t   � o    $�[�[ 0 _support   � o      �Z�Z 0 formatrecord formatRecord �  I   Q [�Y�X�Y "0 _setbasicformat _setBasicFormat  o   R S�W�W 0 asocformatter asocFormatter  n  S V 1   T V�V
�V 
MthA o   S T�U�U 0 formatrecord formatRecord �T o   V W�S�S 0 defaultstyle defaultStyle�T  �X    Z   \ y�R�Q >  \ a n  \ _ 1   ] _�P
�P 
MthB o   \ ]�O�O 0 formatrecord formatRecord m   _ `�N
�N 
msng n  d u !  I   e u�M"�L�M 60 setminimumfractiondigits_ setMinimumFractionDigits_" #�K# I   e q�J$�I�J (0 _asintegerproperty _asIntegerProperty$ %&% n  f i'(' 1   g i�H
�H 
MthB( o   f g�G�G 0 formatrecord formatRecord& )*) m   i l++ �,, , m i n i m u m   d e c i m a l   p l a c e s* -�F- m   l m�E�E  �F  �I  �K  �L  ! o   d e�D�D 0 asocformatter asocFormatter�R  �Q   ./. Z   z �01�C�B0 >  z 232 n  z }454 1   { }�A
�A 
MthC5 o   z {�@�@ 0 formatrecord formatRecord3 m   } ~�?
�? 
msng1 n  � �676 I   � ��>8�=�> 60 setmaximumfractiondigits_ setMaximumFractionDigits_8 9�<9 I   � ��;:�:�; (0 _asintegerproperty _asIntegerProperty: ;<; n  � �=>= 1   � ��9
�9 
MthC> o   � ��8�8 0 formatrecord formatRecord< ?@? m   � �AA �BB , m a x i m u m   d e c i m a l   p l a c e s@ C�7C m   � ��6�6  �7  �:  �<  �=  7 o   � ��5�5 0 asocformatter asocFormatter�C  �B  / DED Z   � �FG�4�3F >  � �HIH n  � �JKJ 1   � ��2
�2 
MthDK o   � ��1�1 0 formatrecord formatRecordI m   � ��0
�0 
msngG k   � �LL MNM n  � �OPO I   � ��/Q�.�/ <0 setminimumsignificantdigits_ setMinimumSignificantDigits_Q R�-R I   � ��,S�+�, (0 _asintegerproperty _asIntegerPropertyS TUT n  � �VWV 1   � ��*
�* 
MthDW o   � ��)�) 0 formatrecord formatRecordU XYX m   � �ZZ �[[ 4 m i n i m u m   s i g n i f i c a n t   d i g i t sY \�(\ m   � ��'�'  �(  �+  �-  �.  P o   � ��&�& 0 asocformatter asocFormatterN ]�%] n  � �^_^ I   � ��$`�#�$ 60 setusessignificantdigits_ setUsesSignificantDigits_` a�"a m   � ��!
�! boovtrue�"  �#  _ o   � �� �  0 asocformatter asocFormatter�%  �4  �3  E bcb Z   � �de��d >  � �fgf n  � �hih 1   � ��
� 
MthEi o   � ��� 0 formatrecord formatRecordg m   � ��
� 
msnge k   � �jj klk n  � �mnm I   � ��o�� <0 setmaximumsignificantdigits_ setMaximumSignificantDigits_o p�p I   � ��q�� (0 _asintegerproperty _asIntegerPropertyq rsr n  � �tut 1   � ��
� 
MthEu o   � ��� 0 formatrecord formatRecords vwv m   � �xx �yy 4 m a x i m u m   s i g n i f i c a n t   d i g i t sw z�z m   � ���  �  �  �  �  n o   � ��� 0 asocformatter asocFormatterl {�{ n  � �|}| I   � ��~�� 60 setusessignificantdigits_ setUsesSignificantDigits_~ � m   � ��
� boovtrue�  �  } o   � ��� 0 asocformatter asocFormatter�  �  �  c ��� Z   �2���
�	� >  � ���� n  � ���� 1   � ��
� 
MthF� o   � ��� 0 formatrecord formatRecord� m   � ��
� 
msng� Q   �.���� k   ��� ��� r   � ���� c   � ���� n  � ���� 1   � ��
� 
MthF� o   � ��� 0 formatrecord formatRecord� m   � ��
� 
ctxt� o      �� 0 s  � ��� Z  ����� � =   ���� n  � ��� 1   � ��
�� 
leng� o   � ����� 0 s  � m   ����  � R  �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� m  	�����Y��  �  �   � ���� n ��� I  ������� ,0 setdecimalseparator_ setDecimalSeparator_� ���� o  ���� 0 s  ��  ��  � o  ���� 0 asocformatter asocFormatter��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � R  ".����
�� .ascrerr ****      � ****� m  *-�� ��� �  n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    d e c i m a l   s e p a r a t o r    p r o p e r t y   i s   n o t   n o n - e m p t y   t e x t� �����
�� 
errn� m  &)�����Y��  �
  �	  � ��� Z  3m������� > 3:��� n 38��� 1  48��
�� 
MthG� o  34���� 0 formatrecord formatRecord� m  89��
�� 
msng� Q  =i���� k  @U�� ��� n @N��� I  AN������� .0 setgroupingseparator_ setGroupingSeparator_� ���� l AJ������ c  AJ��� n AF��� 1  BF��
�� 
MthG� o  AB���� 0 formatrecord formatRecord� m  FI��
�� 
ctxt��  ��  ��  ��  � o  @A���� 0 asocformatter asocFormatter� ���� n OU��� I  PU������� 60 setusesgroupingseparator_ setUsesGroupingSeparator_� ���� m  PQ��
�� boovtrue��  ��  � o  OP���� 0 asocformatter asocFormatter��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � R  ]i����
�� .ascrerr ****      � ****� m  eh�� ��� �  n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    g r o u p i n g   s e p a r a t o r    p r o p e r t y   i s   n o t   t e x t� �����
�� 
errn� m  ad�����Y��  ��  ��  � ���� Z  n7������� > nu��� n ns��� 1  os��
�� 
MthH� o  no���� 0 formatrecord formatRecord� m  st��
�� 
msng� Z  x3����� = x���� n x}��� 1  y}��
�� 
MthH� o  xy���� 0 formatrecord formatRecord� l }������� m  }���
�� MRndRNhE��  ��  � n ����� I  ��������� $0 setroundingmode_ setRoundingMode_� ���� l �������� n ����� o  ������ @0 nsnumberformatterroundhalfeven NSNumberFormatterRoundHalfEven� m  ����
�� misccura��  ��  ��  ��  � o  ������ 0 asocformatter asocFormatter� ��� = ����� n ����� 1  ����
�� 
MthH� o  ������ 0 formatrecord formatRecord� l �������� m  ����
�� MRndRNhT��  ��  � ��� n ����� I  ��������� $0 setroundingmode_ setRoundingMode_� ���� l �������� n ����� o  ������ @0 nsnumberformatterroundhalfdown NSNumberFormatterRoundHalfDown� m  ����
�� misccura��  ��  ��  ��  � o  ������ 0 asocformatter asocFormatter� ��� = ����� n ����� 1  ����
�� 
MthH� o  ������ 0 formatrecord formatRecord� l �������� m  ����
�� MRndRNhF��  ��  � ��� n ��� � I  �������� $0 setroundingmode_ setRoundingMode_ �� l ������ n �� o  ������ <0 nsnumberformatterroundhalfup NSNumberFormatterRoundHalfUp m  ����
�� misccura��  ��  ��  ��    o  ������ 0 asocformatter asocFormatter�  = ��	 n ��

 1  ����
�� 
MthH o  ������ 0 formatrecord formatRecord	 l ������ m  ����
�� MRndRN_T��  ��    n �� I  �������� $0 setroundingmode_ setRoundingMode_ �� l ������ n �� o  ������ 80 nsnumberformatterrounddown NSNumberFormatterRoundDown m  ����
�� misccura��  ��  ��  ��   o  ������ 0 asocformatter asocFormatter  = �� n �� 1  ����
�� 
MthH o  ������ 0 formatrecord formatRecord l ������ m  ����
�� MRndRN_F��  ��    n ��  I  ����!���� $0 setroundingmode_ setRoundingMode_! "��" l ��#����# n ��$%$ o  ������ 40 nsnumberformatterroundup NSNumberFormatterRoundUp% m  ����
�� misccura��  ��  ��  ��    o  ������ 0 asocformatter asocFormatter &'& = ��()( n ��*+* 1  ����
�� 
MthH+ o  ������ 0 formatrecord formatRecord) l ��,����, m  ����
�� MRndRN_U��  ��  ' -.- n /0/ I  �1�~� $0 setroundingmode_ setRoundingMode_1 2�}2 l 3�|�{3 n 454 o  �z�z >0 nsnumberformatterroundceiling NSNumberFormatterRoundCeiling5 m  �y
�y misccura�|  �{  �}  �~  0 o  �x�x 0 asocformatter asocFormatter. 676 = 898 n :;: 1  �w
�w 
MthH; o  �v�v 0 formatrecord formatRecord9 l <�u�t< m  �s
�s MRndRN_D�u  �t  7 =�r= n $>?> I  $�q@�p�q $0 setroundingmode_ setRoundingMode_@ A�oA l  B�n�mB n  CDC o   �l�l :0 nsnumberformatterroundfloor NSNumberFormatterRoundFloorD m  �k
�k misccura�n  �m  �o  �p  ? o  �j�j 0 asocformatter asocFormatter�r  � R  '3�iEF
�i .ascrerr ****      � ****E m  /2GG �HH �  n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    r o u n d i n g   b e h a v i o r    i s   n o t   a n   a l l o w e d   c o n s t a n tF �hI�g
�h 
errnI m  +.�f�f�Y�g  ��  ��  ��  �   � Q  :SJKLJ I  =E�eM�d�e "0 _setbasicformat _setBasicFormatM NON o  >?�c�c 0 asocformatter asocFormatterO PQP o  ?@�b�b 0 formatstyle formatStyleQ R�aR o  @A�`�` 0 defaultstyle defaultStyle�a  �d  K R      �_�^S
�_ .ascrerr ****      � ****�^  S �]T�\
�] 
errnT d      UU m      �[�[��\  L R  MS�ZV�Y
�Z .ascrerr ****      � ****V m  ORWW �XX | n o t   a    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d   o r   a n   a l l o w e d   c o n s t a n t�Y   � R      �XYZ
�X .ascrerr ****      � ****Y o      �W�W 0 etext eTextZ �V[�U
�V 
errn[ d      \\ m      �T�T��U   � n [q]^] I  `q�S_�R�S .0 throwinvalidparameter throwInvalidParameter_ `a` o  `a�Q�Q 0 formatstyle formatStylea bcb m  addd �ee 
 u s i n gc fgf J  djhh iji m  de�P
�P 
recoj k�Ok m  eh�N
�N 
enum�O  g l�Ml o  jk�L�L 0 etext eText�M  �R  ^ o  [`�K�K 0 _support   � mnm n r�opo I  s��Jq�I�J 0 
setlocale_ 
setLocale_q r�Hr l s�s�G�Fs n s�tut I  x��Ev�D�E *0 asnslocaleparameter asNSLocaleParameterv wxw o  xy�C�C 0 
localecode 
localeCodex y�By m  y|zz �{{  f o r   l o c a l e�B  �D  u o  sx�A�A 0 _support  �G  �F  �H  �I  p o  rs�@�@ 0 asocformatter asocFormattern |�?| L  ��}} o  ���>�> 0 asocformatter asocFormatter�?   � o i note: this doesn't handle `default format` option as the appropriate default may vary according to usage    � �~~ �   n o t e :   t h i s   d o e s n ' t   h a n d l e   ` d e f a u l t   f o r m a t `   o p t i o n   a s   t h e   a p p r o p r i a t e   d e f a u l t   m a y   v a r y   a c c o r d i n g   t o   u s a g e � � l     �=�<�;�=  �<  �;  � ��� l     �:�9�8�:  �9  �8  � ��� i  0 3��� I      �7��6�7 "0 _setbasicformat _setBasicFormat� ��� o      �5�5 0 asocformatter asocFormatter� ��� o      �4�4 0 
formatname 
formatName� ��3� o      �2�2 0 defaultstyle defaultStyle�3  �6  � Z     ������ =    ��� o     �1�1 0 
formatname 
formatName� m    �0
�0 MthZMth0� n   ��� I    �/��.�/ "0 setnumberstyle_ setNumberStyle_� ��-� o    �,�, 0 defaultstyle defaultStyle�-  �.  � o    �+�+ 0 asocformatter asocFormatter� ��� =   ��� o    �*�* 0 
formatname 
formatName� m    �)
�) MthZMth3� ��� l   ���� n   ��� I    �(��'�( "0 setnumberstyle_ setNumberStyle_� ��&� l   ��%�$� n   ��� o    �#�# D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� m    �"
�" misccura�%  �$  �&  �'  � o    �!�! 0 asocformatter asocFormatter�   uses exponent notation   � ��� .   u s e s   e x p o n e n t   n o t a t i o n� ��� =    #��� o     !� �  0 
formatname 
formatName� m   ! "�
� MthZMth1� ��� l  & .���� n  & .��� I   ' .���� "0 setnumberstyle_ setNumberStyle_� ��� l  ' *���� n  ' *��� o   ( *�� 40 nsnumberformatternostyle NSNumberFormatterNoStyle� m   ' (�
� misccura�  �  �  �  � o   & '�� 0 asocformatter asocFormatter� "  uses plain integer notation   � ��� 8   u s e s   p l a i n   i n t e g e r   n o t a t i o n� ��� =  1 4��� o   1 2�� 0 
formatname 
formatName� m   2 3�
� MthZMth2� ��� l  7 ?���� n  7 ?��� I   8 ?���� "0 setnumberstyle_ setNumberStyle_� ��� l  8 ;���� n  8 ;��� o   9 ;�� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle� m   8 9�
� misccura�  �  �  �  � o   7 8�� 0 asocformatter asocFormatter� - ' uses thousands separators, no exponent   � ��� N   u s e s   t h o u s a n d s   s e p a r a t o r s ,   n o   e x p o n e n t� ��� =  B E��� o   B C�� 0 
formatname 
formatName� m   C D�
� MthZMth5� ��� l  H P���� n  H P��� I   I P�
��	�
 "0 setnumberstyle_ setNumberStyle_� ��� l  I L���� n  I L��� o   J L�� @0 nsnumberformattercurrencystyle NSNumberFormatterCurrencyStyle� m   I J�
� misccura�  �  �  �	  � o   H I�� 0 asocformatter asocFormatter�   adds currency symbol   � ��� *   a d d s   c u r r e n c y   s y m b o l� ��� =  S V��� o   S T�� 0 
formatname 
formatName� m   T U�
� MthZMth4� ��� l  Y a���� n  Y a��� I   Z a� ����  "0 setnumberstyle_ setNumberStyle_� ���� l  Z ]������ n  Z ]��� o   [ ]���� >0 nsnumberformatterpercentstyle NSNumberFormatterPercentStyle� m   Z [��
�� misccura��  ��  ��  ��  � o   Y Z���� 0 asocformatter asocFormatter� ( " multiplies by 100 and appends '%'   � ��� D   m u l t i p l i e s   b y   1 0 0   a n d   a p p e n d s   ' % '� ��� =  d g��� o   d e���� 0 
formatname 
formatName� m   e f��
�� MthZMth6� ��� l  j r���� n  j r��� I   k r������� "0 setnumberstyle_ setNumberStyle_� ���� l  k n������ n  k n��� o   l n���� @0 nsnumberformatterspelloutstyle NSNumberFormatterSpellOutStyle� m   k l��
�� misccura��  ��  ��  ��  � o   j k���� 0 asocformatter asocFormatter�   uses words   � ���    u s e s   w o r d s� ��� >   u �� � l  u ����� I  u ���
�� .corecnte****       **** J   u x �� o   u v���� 0 
formatname 
formatName��   ����
�� 
kocl m   y |��
�� 
ctxt��  ��  ��    m   � �����  � �� n  � �	 I   � ���
���� 0 
setformat_ 
setFormat_
 �� o   � ����� 0 
formatname 
formatName��  ��  	 o   � ����� 0 asocformatter asocFormatter��  � R   � ���
�� .ascrerr ****      � **** m   � � � p i n v a l i d    b a s i c   f o r m a t    p r o p e r t y :   n o t   a n   a l l o w e d   c o n s t a n t ��
�� 
errn m   � ������Y ��
�� 
erob o   � ����� 0 
formatname 
formatName ����
�� 
errt m   � ���
�� 
enum��  �  l     ��������  ��  ��    l     ��������  ��  ��    i  4 7 I      ������  0 _nameforformat _nameForFormat �� o      ���� 0 formatstyle formatStyle��  ��   l    H ! Z     H"#$%" =    &'& o     ���� 0 formatstyle formatStyle' m    ��
�� MthZMth1# L    (( m    )) �**  i n t e g e r$ +,+ =   -.- o    ���� 0 formatstyle formatStyle. m    ��
�� MthZMth2, /0/ L    11 m    22 �33  d e c i m a l0 454 =   676 o    ���� 0 formatstyle formatStyle7 m    ��
�� MthZMth55 898 L    :: m    ;; �<<  c u r r e n c y9 =>= =  ! $?@? o   ! "���� 0 formatstyle formatStyle@ m   " #��
�� MthZMth4> ABA L   ' )CC m   ' (DD �EE  p e r c e n tB FGF =  , /HIH o   , -���� 0 formatstyle formatStyleI m   - .��
�� MthZMth3G JKJ L   2 4LL m   2 3MM �NN  s c i e n t i f i cK OPO =  7 :QRQ o   7 8���� 0 formatstyle formatStyleR m   8 9��
�� MthZMth6P S��S L   = ?TT m   = >UU �VV  w o r d��  % L   B HWW b   B GXYX b   B EZ[Z m   B C\\ �]]  [ o   C D���� 0 formatstyle formatStyleY m   E F^^ �__    G A used for error reporting; formatStyle is either constant or text   ! �`` �   u s e d   f o r   e r r o r   r e p o r t i n g ;   f o r m a t S t y l e   i s   e i t h e r   c o n s t a n t   o r   t e x t aba l     ��������  ��  ��  b cdc l     ��������  ��  ��  d efe l     ��gh��  g  -----   h �ii 
 - - - - -f jkj l     ��������  ��  ��  k lml i  8 ;non I     ��pq
�� .Mth:FNumnull���     nmbrp o      ���� 0 	thenumber 	theNumberq ��rs
�� 
Usinr |����t��u��  ��  t o      ���� 0 formatstyle formatStyle��  u l     v����v m      ��
�� MthZMth0��  ��  s ��w��
�� 
Locaw |����x��y��  ��  x o      ���� 0 
localecode 
localeCode��  y l     z����z m      ��
�� 
msng��  ��  ��  o Q     �{|}{ k    �~~ � l   "���� Z   "������� =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ���� 0 	thenumber 	theNumber��  � �����
�� 
kocl� m    ��
�� 
nmbr��  ��  ��  � m    ����  � n   ��� I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 	thenumber 	theNumber� ��� m    �� ���  � ��� m    �� ���  n u m b e r� ���� m    ��
�� 
nmbr��  ��  � o    ���� 0 _support  ��  ��  � � � only accept integer or real types (i.e. allowing a text parameter to be coerced to number would defeat the purpose of these handlers, which is to avoid unintended localization behavior)   � ���t   o n l y   a c c e p t   i n t e g e r   o r   r e a l   t y p e s   ( i . e .   a l l o w i n g   a   t e x t   p a r a m e t e r   t o   b e   c o e r c e d   t o   n u m b e r   w o u l d   d e f e a t   t h e   p u r p o s e   o f   t h e s e   h a n d l e r s ,   w h i c h   i s   t o   a v o i d   u n i n t e n d e d   l o c a l i z a t i o n   b e h a v i o r )� ��� l  # #������  � � � TO DO: fix this: needs to mimic AS behavior, so use No/Decimal(?) by default and switch to Sci only when number is beyond certain ranges (currently reals always display as sci)   � ���b   T O   D O :   f i x   t h i s :   n e e d s   t o   m i m i c   A S   b e h a v i o r ,   s o   u s e   N o / D e c i m a l ( ? )   b y   d e f a u l t   a n d   s w i t c h   t o   S c i   o n l y   w h e n   n u m b e r   i s   b e y o n d   c e r t a i n   r a n g e s   ( c u r r e n t l y   r e a l s   a l w a y s   d i s p l a y   a s   s c i )� ��� Z   # ������� F   # .��� =  # &��� o   # $���� 0 formatstyle formatStyle� m   $ %��
�� MthZMth0� =  ) ,��� o   ) *���� 0 
localecode 
localeCode� m   * +��
�� 
msng� k   1 o�� ��� r   1 >��� n  1 <��� I   8 <�������� 0 init  ��  ��  � n  1 8��� I   4 8�������� 	0 alloc  ��  ��  � n  1 4��� o   2 4���� &0 nsnumberformatter NSNumberFormatter� m   1 2��
�� misccura� o      ���� 0 asocformatter asocFormatter� ��� n  ? K��� I   @ K������� 0 
setlocale_ 
setLocale_� ���� l  @ G���~� n  @ G��� I   C G�}�|�{�} 0 systemlocale systemLocale�|  �{  � n  @ C��� o   A C�z�z 0 nslocale NSLocale� m   @ A�y
�y misccura�  �~  ��  ��  � o   ? @�x�x 0 asocformatter asocFormatter� ��w� Z   L o���v�� =  L U��� n  L Q��� m   M Q�u
�u 
pcls� o   L M�t�t 0 	thenumber 	theNumber� m   Q T�s
�s 
long� n  X b��� I   Y b�r��q�r "0 setnumberstyle_ setNumberStyle_� ��p� l  Y ^��o�n� n  Y ^��� o   Z ^�m�m 40 nsnumberformatternostyle NSNumberFormatterNoStyle� m   Y Z�l
�l misccura�o  �n  �p  �q  � o   X Y�k�k 0 asocformatter asocFormatter�v  � n  e o��� I   f o�j��i�j "0 setnumberstyle_ setNumberStyle_� ��h� l  f k��g�f� n  f k��� o   g k�e�e D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� m   f g�d
�d misccura�g  �f  �h  �i  � o   e f�c�c 0 asocformatter asocFormatter�w  ��  � k   r ��� ��� r   r y��� n  r w��� o   s w�b�b D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� m   r s�a
�a misccura� o      �`�` 0 defaultstyle defaultStyle� ��_� r   z ���� I   z ��^��]�^ ,0 _makenumberformatter _makeNumberFormatter� ��� o   { |�\�\ 0 formatstyle formatStyle� ��� o   | }�[�[ 0 
localecode 
localeCode� ��Z� o   } ~�Y�Y 0 defaultformat defaultFormat�Z  �]  � o      �X�X 0 asocformatter asocFormatter�_  � ��� r   � ���� n  � ���� I   � ��W��V�W &0 stringfromnumber_ stringFromNumber_� ��U� o   � ��T�T 0 	thenumber 	theNumber�U  �V  � o   � ��S�S 0 asocformatter asocFormatter� o      �R�R 0 
asocstring 
asocString� ��� l  � ����� Z  � ����Q�P� =  � ���� o   � ��O�O 0 
asocstring 
asocString� m   � ��N
�N 
msng� R   � ��M��
�M .ascrerr ****      � ****� m   � ��� ��� F I n v a l i d   n u m b e r   ( c o n v e r s i o n   f a i l e d ) .� �L��
�L 
errn� m   � ��K�K�Y� �J �I
�J 
erob  o   � ��H�H 0 	thenumber 	theNumber�I  �Q  �P  � n h shouldn't fail, but -stringFromNumber:'s return type isn't declared as non-nullable so check to be sure   � � �   s h o u l d n ' t   f a i l ,   b u t   - s t r i n g F r o m N u m b e r : ' s   r e t u r n   t y p e   i s n ' t   d e c l a r e d   a s   n o n - n u l l a b l e   s o   c h e c k   t o   b e   s u r e� �G L   � � c   � � o   � ��F�F 0 
asocstring 
asocString m   � ��E
�E 
ctxt�G  | R      �D
�D .ascrerr ****      � **** o      �C�C 0 etext eText �B	
�B 
errn o      �A�A 0 enumber eNumber	 �@

�@ 
erob
 o      �?�? 0 efrom eFrom �>�=
�> 
errt o      �<�< 
0 eto eTo�=  } I   � ��;�:�; 
0 _error    m   � � �  f o r m a t   n u m b e r  o   � ��9�9 0 etext eText  o   � ��8�8 0 enumber eNumber  o   � ��7�7 0 efrom eFrom �6 o   � ��5�5 
0 eto eTo�6  �:  m  l     �4�3�2�4  �3  �2    l     �1�0�/�1  �0  �/    i  < ?  I     �.!"
�. .Mth:PNumnull���     ctxt! o      �-�- 0 thetext theText" �,#$
�, 
Usin# |�+�*%�)&�+  �*  % o      �(�( 0 formatstyle formatStyle�)  & l     '�'�&' m      �%
�% MthZMth0�'  �&  $ �$(�#
�$ 
Loca( |�"�!)� *�"  �!  ) o      �� 0 
localecode 
localeCode�   * l     +��+ m      �
� 
msng�  �  �#    Q     �,-., k    �// 010 l   "2342 Z   "56��5 =    787 l   9��9 I   �:;
� .corecnte****       ****: J    << =�= o    �� 0 thetext theText�  ; �>�
� 
kocl> m    �
� 
ctxt�  �  �  8 m    ��  6 n   ?@? I    �A�� 60 throwinvalidparametertype throwInvalidParameterTypeA BCB o    �� 0 thetext theTextC DED m    FF �GG  E HIH m    JJ �KK  t e x tI L�L m    �
� 
ctxt�  �  @ o    �� 0 _support  �  �  3 1 + only accept text, for same reason as above   4 �MM V   o n l y   a c c e p t   t e x t ,   f o r   s a m e   r e a s o n   a s   a b o v e1 NON Z   # cPQ�
RP F   # .STS =  # &UVU o   # $�	�	 0 formatstyle formatStyleV m   $ %�
� MthZMth0T =  ) ,WXW o   ) *�� 0 
localecode 
localeCodeX m   * +�
� 
msngQ k   1 VYY Z[Z r   1 >\]\ n  1 <^_^ I   8 <���� 0 init  �  �  _ n  1 8`a` I   4 8��� � 	0 alloc  �  �   a n  1 4bcb o   2 4���� &0 nsnumberformatter NSNumberFormatterc m   1 2��
�� misccura] o      ���� 0 asocformatter asocFormatter[ ded n  ? Kfgf I   @ K��h���� 0 
setlocale_ 
setLocale_h i��i l  @ Gj����j n  @ Gklk I   C G�������� 0 systemlocale systemLocale��  ��  l n  @ Cmnm o   A C���� 0 nslocale NSLocalen m   @ A��
�� misccura��  ��  ��  ��  g o   ? @���� 0 asocformatter asocFormattere o��o n  L Vpqp I   M V��r���� "0 setnumberstyle_ setNumberStyle_r s��s l  M Rt����t n  M Ruvu o   N R���� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStylev m   M N��
�� misccura��  ��  ��  ��  q o   L M���� 0 asocformatter asocFormatter��  �
  R r   Y cwxw I   Y a��y���� ,0 _makenumberformatter _makeNumberFormattery z{z o   Z [���� 0 formatstyle formatStyle{ |}| o   [ \���� 0 
localecode 
localeCode} ~��~ m   \ ]��
�� boovfals��  ��  x o      ���� 0 asocformatter asocFormatterO � r   d l��� n  d j��� I   e j������� &0 numberfromstring_ numberFromString_� ���� o   e f���� 0 thetext theText��  ��  � o   d e���� 0 asocformatter asocFormatter� o      ���� 0 
asocnumber 
asocNumber� ��� Z   m �������� =  m p��� o   m n���� 0 
asocnumber 
asocNumber� m   n o��
�� 
msng� k   s ��� ��� r   s ���� c   s ~��� n  s |��� I   x |�������� $0 localeidentifier localeIdentifier��  ��  � n  s x��� I   t x�������� 
0 locale  ��  ��  � o   s t���� 0 asocformatter asocFormatter� m   | }��
�� 
ctxt� o      ���� $0 localeidentifier localeIdentifier� ��� Z   � ������� =   � ���� n  � ���� 1   � ���
�� 
leng� o   � ����� $0 localeidentifier localeIdentifier� m   � �����  � l  � ����� r   � ���� m   � ��� ���  n o� o      ���� $0 localeidentifier localeIdentifier� #  empty string = system locale   � ��� :   e m p t y   s t r i n g   =   s y s t e m   l o c a l e��  � r   � ���� b   � ���� b   � ���� m   � ��� ��� 
 t h e   � o   � ����� $0 localeidentifier localeIdentifier� m   � ��� ���  � o      ���� $0 localeidentifier localeIdentifier� ���� R   � �����
�� .ascrerr ****      � ****� l  � ������� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ��� R I n v a l i d   t e x t   ( e x p e c t e d   n u m e r i c a l   t e x t   i n  � I   � ��������  0 _nameforformat _nameForFormat� ���� o   � ����� 0 formatstyle formatStyle��  ��  � m   � ��� ���    f o r m a t   f o r  � o   � ����� $0 localeidentifier localeIdentifier� m   � ��� ���    l o c a l e ) .��  ��  � ����
�� 
errn� m   � ������Y� �����
�� 
erob� o   � ����� 0 thetext theText��  ��  ��  ��  � ���� L   � ��� c   � ���� o   � ����� 0 
asocnumber 
asocNumber� m   � ���
�� 
****��  - R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  . I   � �������� 
0 _error  � ��� m   � ��� ���  p a r s e   n u m b e r� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��   ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � $  Hexadecimal number conversion   � ��� <   H e x a d e c i m a l   n u m b e r   c o n v e r s i o n� ��� l     ��������  ��  ��  � ��� i  @ C��� I     ����
�� .Mth:NuHenull���     ****� o      ���� 0 	thenumber 	theNumber� ����
�� 
Plac� |����������  ��  � o      ���� 0 	chunksize 	chunkSize��  � l     ������ m      ����  ��  ��  � �����
�� 
Pref� |����������  ��  � o      ���� 0 	hasprefix 	hasPrefix��  � l     ������ m      ��
�� boovfals��  ��  ��  � Q    �   k   �  r     n   	 I    ��
���� (0 asintegerparameter asIntegerParameter
  o    	���� 0 	chunksize 	chunkSize �� m   	 
 � 
 w i d t h��  ��  	 o    ���� 0 _support   o      ���� 0 	chunksize 	chunkSize  l    r     n    I    ������ (0 asbooleanparameter asBooleanParameter  o    ���� 0 	hasprefix 	hasPrefix � m     �  p r e f i x�  ��   o    �~�~ 0 _support   o      �}�} 0 	hasprefix 	hasPrefix � � (users shouldn't concatenate their own prefix as that would result in negative numbers appearing as "0x-N�" instead of "-0xN�")    �    ( u s e r s   s h o u l d n ' t   c o n c a t e n a t e   t h e i r   o w n   p r e f i x   a s   t h a t   w o u l d   r e s u l t   i n   n e g a t i v e   n u m b e r s   a p p e a r i n g   a s   " 0 x - N & "   i n s t e a d   o f   " - 0 x N & " )  �|  Z   �!"�{#! =    *$%$ l   (&�z�y& I   (�x'(
�x .corecnte****       ****' J    ")) *�w* o     �v�v 0 	thenumber 	theNumber�w  ( �u+�t
�u 
kocl+ m   # $�s
�s 
list�t  �z  �y  % m   ( )�r�r  " l  -E,-., k   -E// 010 l  - :2342 r   - :565 n  - 8787 I   2 8�q9�p�q 00 aswholenumberparameter asWholeNumberParameter9 :;: o   2 3�o�o 0 	thenumber 	theNumber; <�n< m   3 4== �>>  �n  �p  8 o   - 2�m�m 0 _support  6 o      �l�l 0 	thenumber 	theNumber3 ^ X numbers greater than 2^30 (max integer size) are okay as long as they're non-fractional   4 �?? �   n u m b e r s   g r e a t e r   t h a n   2 ^ 3 0   ( m a x   i n t e g e r   s i z e )   a r e   o k a y   a s   l o n g   a s   t h e y ' r e   n o n - f r a c t i o n a l1 @A@ l  ; ;�kBC�k  B � � note that the 1024 max chunk size is somewhat arbitrary (the largest representable number requires ~309 chars; anything more will always be left-hand padding), but prevents completely silly values   C �DD�   n o t e   t h a t   t h e   1 0 2 4   m a x   c h u n k   s i z e   i s   s o m e w h a t   a r b i t r a r y   ( t h e   l a r g e s t   r e p r e s e n t a b l e   n u m b e r   r e q u i r e s   ~ 3 0 9   c h a r s ;   a n y t h i n g   m o r e   w i l l   a l w a y s   b e   l e f t - h a n d   p a d d i n g ) ,   b u t   p r e v e n t s   c o m p l e t e l y   s i l l y   v a l u e sA EFE Z  ; ZGH�j�iG G   ; FIJI A   ; >KLK o   ; <�h�h 0 	chunksize 	chunkSizeL m   < =�g�g  J ?   A DMNM o   A B�f�f 0 	chunksize 	chunkSizeN m   B C�e�e H n  I VOPO I   N V�dQ�c�d .0 throwinvalidparameter throwInvalidParameterQ RSR o   N O�b�b 0 	chunksize 	chunkSizeS TUT m   O PVV �WW 
 w i d t hU XYX m   P Q�a
�a 
longY Z�`Z m   Q R[[ �\\  m u s t   b e   0  1 0 2 4�`  �c  P o   I N�_�_ 0 _support  �j  �i  F ]^] r   [ `_`_ m   [ ^aa �bb  ` o      �^�^ 0 hextext hexText^ cdc Z   a �ef�]ge A   a dhih o   a b�\�\ 0 	thenumber 	theNumberi m   b c�[�[  f k   g �jj klk Z  g �mn�Z�Ym F   g vopo ?   g jqrq o   g h�X�X 0 	chunksize 	chunkSizer m   h i�W�W  p l  m ts�V�Us A   m ttut o   m n�T�T 0 	thenumber 	theNumberu a   n svwv m   n q�S�S��w o   q r�R�R 0 	chunksize 	chunkSize�V  �U  n n  y �xyx I   ~ ��Qz�P�Q .0 throwinvalidparameter throwInvalidParameterz {|{ o   ~ �O�O 0 	thenumber 	theNumber| }~} m    � ���  ~ ��� m   � ��N
�N 
long� ��M� b   � ���� b   � ���� b   � ���� m   � ��� ��� X s p e c i f i e d   w i d t h   o n l y   a l l o w s   n u m b e r s   b e t w e e n  � l  � ���L�K� a   � ���� m   � ��J�J��� o   � ��I�I 0 	chunksize 	chunkSize�L  �K  � m   � ��� ��� 
   a n d  � l  � ���H�G� \   � ���� a   � ���� m   � ��F�F � o   � ��E�E 0 	chunksize 	chunkSize� m   � ��D�D �H  �G  �M  �P  y o   y ~�C�C 0 _support  �Z  �Y  l ��� r   � ���� m   � ��� ���  -� o      �B�B 0 	hexprefix 	hexPrefix� ��A� r   � ���� d   � ��� o   � ��@�@ 0 	thenumber 	theNumber� o      �?�? 0 	thenumber 	theNumber�A  �]  g k   � ��� ��� r   � ���� m   � ��� ���  � o      �>�> 0 	hexprefix 	hexPrefix� ��=� Z  � ����<�;� F   � ���� ?   � ���� o   � ��:�: 0 	chunksize 	chunkSize� m   � ��9�9  � l  � ���8�7� ?   � ���� o   � ��6�6 0 	thenumber 	theNumber� \   � ���� a   � ���� m   � ��5�5 � o   � ��4�4 0 	chunksize 	chunkSize� m   � ��3�3 �8  �7  � n  � ���� I   � ��2��1�2 .0 throwinvalidparameter throwInvalidParameter� ��� o   � ��0�0 0 	thenumber 	theNumber� ��� m   � ��� ���  � ��� m   � ��/
�/ 
long� ��.� b   � ���� b   � ���� b   � ���� m   � ��� ��� X s p e c i f i e d   w i d t h   o n l y   a l l o w s   n u m b e r s   b e t w e e n  � l  � ���-�,� a   � ���� m   � ��+�+��� o   � ��*�* 0 	chunksize 	chunkSize�-  �,  � m   � ��� ��� 
   a n d  � l  � ���)�(� \   � ���� a   � ���� m   � ��'�' � o   � ��&�& 0 	chunksize 	chunkSize� m   � ��%�% �)  �(  �.  �1  � o   � ��$�$ 0 _support  �<  �;  �=  d ��� Z  � ����#�"� o   � ��!�! 0 	hasprefix 	hasPrefix� r   � ���� b   � ���� o   � �� �  0 	hexprefix 	hexPrefix� m   � ��� ���  0 x� o      �� 0 	hexprefix 	hexPrefix�#  �"  � ��� V   '��� k  "�� ��� r  ��� b  ��� l ���� n  ��� 4  ��
� 
cobj� l ���� [  ��� `  ��� o  �� 0 	thenumber 	theNumber� m  �� � m  �� �  �  � m  �� ���   0 1 2 3 4 5 6 7 8 9 A B C D E F�  �  � o  �� 0 hextext hexText� o      �� 0 hextext hexText� ��� r  "��� _   ��� o  �� 0 	thenumber 	theNumber� m  �� � o      �� 0 	thenumber 	theNumber�  � ?  ��� o  �� 0 	thenumber 	theNumber� m  ��  � ��� V  (@��� r  4;��� b  49   m  47 �  0 o  78�� 0 hextext hexText� o      �� 0 hextext hexText� A  ,3 n  ,1 1  -1�
� 
leng o  ,-�� 0 hextext hexText o  12�
�
 0 	chunksize 	chunkSize� �	 L  AE		 b  AD

 o  AB�� 0 	hexprefix 	hexPrefix o  BC�� 0 hextext hexText�	  -   format single number   . � *   f o r m a t   s i n g l e   n u m b e r�{  # l H� k  H�  l Hk Z Hk�� G  HS A  HK o  HI�� 0 	chunksize 	chunkSize m  IJ��  ?  NQ o  NO�� 0 	chunksize 	chunkSize m  OP��  n Vg I  [g�  ���  .0 throwinvalidparameter throwInvalidParameter  !"! o  [\���� 0 	chunksize 	chunkSize" #$# m  \_%% �&& 
 w i d t h$ '(' m  _`��
�� 
long( )��) m  `c** �++  m u s t   b e   1  1 0 2 4��  ��   o  V[���� 0 _support  �  �     chunksize must be given    �,, 0   c h u n k s i z e   m u s t   b e   g i v e n -.- r  l�/0/ J  lx11 232 m  lo44 �55  3 6��6 \  ov787 a  ot9:9 m  or���� : o  rs���� 0 	chunksize 	chunkSize8 m  tu���� ��  0 J      ;; <=< o      ���� 0 padtext padText= >��> o      ���� 0 maxsize maxSize��  . ?@? U  ��ABA r  ��CDC b  ��EFE o  ������ 0 padtext padTextF m  ��GG �HH  0D o      ���� 0 padtext padTextB o  ������ 0 	chunksize 	chunkSize@ IJI h  ����K�� 0 
resultlist 
resultListK j     	��L�� 
0 _list_  L n    MNM 2   ��
�� 
cobjN o     ���� 0 	thenumber 	theNumberJ OPO X  ��Q��RQ k  �{SS TUT Q  �6VWXV k  ��YY Z[Z r  ��\]\ c  ��^_^ n ��`a` 1  ����
�� 
pcnta o  ������ 0 aref aRef_ m  ����
�� 
long] o      ���� 0 	thenumber 	theNumber[ b��b Z ��cd����c G  ��efe G  ��ghg >  ��iji o  ������ 0 	thenumber 	theNumberj c  ��klk n ��mnm 1  ����
�� 
pcntn o  ������ 0 aref aRefl m  ����
�� 
doubh A  ��opo o  ������ 0 	thenumber 	theNumberp m  ������  f ?  ��qrq o  ������ 0 	thenumber 	theNumberr o  ������ 0 maxsize maxSized R  ������s
�� .ascrerr ****      � ****��  s ��t��
�� 
errnt m  �������\��  ��  ��  ��  W R      ����u
�� .ascrerr ****      � ****��  u ��v��
�� 
errnv d      ww m      �������  X Z  6xy��zx ?  {|{ o  ���� 0 	thenumber 	theNumber| o  ���� 0 maxsize maxSizey n 	"}~} I  "������ .0 throwinvalidparameter throwInvalidParameter ��� o  ���� 0 	thenumber 	theNumber� ��� m  �� ���  � ��� m  ��
�� 
long� ���� b  ��� m  �� ��� h s p e c i f i e d   w i d t h   o n l y   a l l o w s   n u m b e r s   b e t w e e n   0 . 0   a n d  � l ������ \  ��� a  ��� m  ���� � o  ���� 0 	chunksize 	chunkSize� m  ���� ��  ��  ��  ��  ~ o  	���� 0 _support  ��  z n %6��� I  *6������� .0 throwinvalidparameter throwInvalidParameter� ��� o  *+���� 0 aref aRef� ��� m  +.�� ���  � ��� m  ./��
�� 
long� ���� m  /2�� ��� V e x p e c t e d   n o n - n e g a t i v e   n o n - f r a c t i o n a l   n u m b e r��  ��  � o  %*���� 0 _support  U ��� r  7<��� m  7:�� ���  � o      ���� 0 hextext hexText� ��� V  =d��� k  E_�� ��� r  EW��� b  EU��� l ES������ n  ES��� 4  HS���
�� 
cobj� l KR������ [  KR��� `  KP��� o  KL���� 0 	thenumber 	theNumber� m  LO���� � m  PQ���� ��  ��  � m  EH�� ���   0 1 2 3 4 5 6 7 8 9 A B C D E F��  ��  � o  ST���� 0 hextext hexText� o      ���� 0 hextext hexText� ���� r  X_��� _  X]��� o  XY���� 0 	thenumber 	theNumber� m  Y\���� � o      ���� 0 	thenumber 	theNumber��  � ?  AD��� o  AB���� 0 	thenumber 	theNumber� m  BC����  � ���� r  e{��� n eu��� 7 hu����
�� 
ctxt� d  nq�� o  op���� 0 	chunksize 	chunkSize� m  rt������� l eh������ b  eh��� o  ef���� 0 padtext padText� o  fg���� 0 hextext hexText��  ��  � n     ��� 1  vz��
�� 
pcnt� o  uv���� 0 aref aRef��  �� 0 aref aRefR n ����� o  ������ 
0 _list_  � o  ������ 0 
resultlist 
resultListP ��� r  ����� n ����� 1  ����
�� 
txdl� 1  ����
�� 
ascr� o      ���� 0 oldtids oldTIDs� ��� r  ����� m  ���� ���  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ��� Z  �������� o  ������ 0 	hasprefix 	hasPrefix� r  ����� b  ����� m  ���� ���  0 x� n ����� o  ������ 
0 _list_  � o  ������ 0 
resultlist 
resultList� o      ���� 0 hextext hexText��  � r  ����� c  ����� n ����� o  ������ 
0 _list_  � o  ������ 0 
resultlist 
resultList� m  ����
�� 
ctxt� o      ���� 0 hextext hexText� ��� r  ����� o  ������ 0 oldtids oldTIDs� n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ���� L  ���� o  ������ 0 hextext hexText��     format list of number    ��� ,   f o r m a t   l i s t   o f   n u m b e r�|   R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� �� 
�� 
erob  o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   I  �������� 
0 _error    m  �� �  f o r m a t   h e x 	 o  ������ 0 etext eText	 

 o  ������ 0 enumber eNumber  o  ������ 0 efrom eFrom �� o  ���� 
0 eto eTo��  ��  �  l     �~�}�|�~  �}  �|    l     �{�z�y�{  �z  �y    i  D G I     �x
�x .Mth:HeNunull���     ctxt o      �w�w 0 hextext hexText �v
�v 
Plac |�u�t�s�u  �t   o      �r�r 0 	chunksize 	chunkSize�s   l     �q�p m      �o�o  �q  �p   �n�m
�n 
Prec |�l�k�j �l  �k   o      �i�i 0 	isprecise 	isPrecise�j    l     !�h�g! m      �f
�f boovtrue�h  �g  �m   Q    b"#$" P   L%&'% k   K(( )*) r    +,+ n   -.- I    �e/�d�e "0 astextparameter asTextParameter/ 010 o    �c�c 0 hextext hexText1 2�b2 m    33 �44  �b  �d  . o    �a�a 0 _support  , o      �`�` 0 hextext hexText* 565 r    #787 n   !9:9 I    !�_;�^�_ (0 asintegerparameter asIntegerParameter; <=< o    �]�] 0 	chunksize 	chunkSize= >�\> m    ?? �@@ 
 w i d t h�\  �^  : o    �[�[ 0 _support  8 o      �Z�Z 0 	chunksize 	chunkSize6 ABA Z  $ CCD�Y�XC G   $ /EFE A   $ 'GHG o   $ %�W�W 0 	chunksize 	chunkSizeH m   % &�V�V  F ?   * -IJI o   * +�U�U 0 	chunksize 	chunkSizeJ m   + ,�T�T D n  2 ?KLK I   7 ?�SM�R�S .0 throwinvalidparameter throwInvalidParameterM NON o   7 8�Q�Q 0 	chunksize 	chunkSizeO PQP m   8 9RR �SS 
 w i d t hQ TUT m   9 :�P
�P 
longU V�OV m   : ;WW �XX  m u s t   b e   0  1 0 2 4�O  �R  L o   2 7�N�N 0 _support  �Y  �X  B YZY r   D R[\[ H   D P]] n  D O^_^ I   I O�M`�L�M (0 asbooleanparameter asBooleanParameter` aba o   I J�K�K 0 	isprecise 	isPreciseb c�Jc m   J Kdd �ee  p r e c i s i o n   l o s s�J  �L  _ o   D I�I�I 0 _support  \ o      �H�H 0 	isprecise 	isPreciseZ f�Gf Z   SKgh�Fig =   S Vjkj o   S T�E�E 0 	chunksize 	chunkSizek m   T U�D�D  h l  Y;lmnl k   Y;oo pqp Q   Yrstr k   \ �uu vwv r   \ _xyx m   \ ]�C�C  y o      �B�B 0 	thenumber 	theNumberw z{z r   ` e|}| C   ` c~~ o   ` a�A�A 0 hextext hexText m   a b�� ���  -} o      �@�@ 0 
isnegative 
isNegative{ ��� Z  f }���?�>� o   f g�=�= 0 
isnegative 
isNegative� r   j y��� n   j w��� 7  k w�<��
�< 
ctxt� m   q s�;�; � m   t v�:�:��� o   j k�9�9 0 hextext hexText� o      �8�8 0 hextext hexText�?  �>  � ��� Z  ~ ����7�6� C   ~ ���� o   ~ �5�5 0 hextext hexText� m    ��� ���  0 x� r   � ���� n   � ���� 7  � ��4��
�4 
ctxt� m   � ��3�3 � m   � ��2�2��� o   � ��1�1 0 hextext hexText� o      �0�0 0 hextext hexText�7  �6  � ��/� X   � ���.�� k   � ��� ��� r   � ���� ]   � ���� o   � ��-�- 0 	thenumber 	theNumber� m   � ��,�, � o      �+�+ 0 	thenumber 	theNumber� ��� r   � ���� I  � ���*�� z�)�(
�) .sysooffslong    ��� null
�( misccura�*  � �'��
�' 
psof� o   � ��&�& 0 charref charRef� �%��$
�% 
psin� m   � ��� ���   0 1 2 3 4 5 6 7 8 9 A B C D E F�$  � o      �#�# 0 i  � ��� Z  � ����"�!� =   � ���� o   � �� �  0 i  � m   � ���  � R   � ����
� .ascrerr ****      � ****�  � ���
� 
errn� m   � ����@�  �"  �!  � ��� r   � ���� \   � ���� [   � ���� o   � ��� 0 	thenumber 	theNumber� o   � ��� 0 i  � m   � ��� � o      �� 0 	thenumber 	theNumber�  �. 0 charref charRef� o   � ��� 0 hextext hexText�/  s R      ���
� .ascrerr ****      � ****�  � ���
� 
errn� d      �� m      ����  t l  ����� R   ����
� .ascrerr ****      � ****� m  �� ��� > N o t   a   v a l i d   h e x a d e c i m a l   n u m b e r .� ���
� 
errn� m   � ����Y� ���

� 
erob� o  �	�	 0 hextext hexText�
  � E ? catch errors if hexText is too short or contains non-hex chars   � ��� ~   c a t c h   e r r o r s   i f   h e x T e x t   i s   t o o   s h o r t   o r   c o n t a i n s   n o n - h e x   c h a r sq ��� Z 	+����� F  	��� o  	
�� 0 	isprecise 	isPrecise� l ���� =  ��� o  �� 0 	thenumber 	theNumber� [  ��� o  �� 0 	thenumber 	theNumber� m  �� �  �  � R  '� ��
�  .ascrerr ****      � ****� m  #&�� ��� � H e x a d e c i m a l   t e x t   i s   t o o   l a r g e   t o   c o n v e r t   t o   n u m b e r   w i t h o u t   l o s i n g   p r e c i s i o n .� ����
�� 
errn� m  �����Y� �����
�� 
erob� o  !"���� 0 hextext hexText��  �  �  � ��� Z ,8������� o  ,-���� 0 
isnegative 
isNegative� r  04��� d  02�� o  01���� 0 	thenumber 	theNumber� o      ���� 0 	thenumber 	theNumber��  ��  � ���� L  9;�� o  9:���� 0 	thenumber 	theNumber��  m   read as single number   n ��� ,   r e a d   a s   s i n g l e   n u m b e r�F  i l >K���� k  >K�� ��� Z >d������� >  >G��� `  >E��� l >C������ n >C��� 1  ?C��
�� 
leng� o  >?���� 0 hextext hexText��  ��  � o  CD���� 0 	chunksize 	chunkSize� m  EF����  � R  J`����
�� .ascrerr ****      � ****� b  V_��� b  V[��� m  VY�� ��� T C a n ' t   s p l i t   h e x a d e c i m a l   t e x t   e x a c t l y   i n t o  � o  YZ���� 0 	chunksize 	chunkSize� m  [^�� �    - d i g i t   c h u n k s .� ��
�� 
errn m  NQ�����Y ����
�� 
erob o  TU���� 0 hextext hexText��  ��  ��  �  h  ep���� 0 
resultlist 
resultList j     ���� 
0 _list_   J     ����   	 Y  qC
��
 k  �>  r  �� m  ������   o      ���� 0 	thenumber 	theNumber  X  ��� k  ��  r  �� ]  �� o  ������ 0 	thenumber 	theNumber m  ������  o      ���� 0 	thenumber 	theNumber  r  �� !  I ��"��#" z����
�� .sysooffslong    ��� null
�� misccura��  # ��$%
�� 
psof$ o  ������ 0 charref charRef% ��&��
�� 
psin& m  ��'' �((   0 1 2 3 4 5 6 7 8 9 A B C D E F��  ! o      ���� 0 i   )*) Z ��+,����+ =  ��-.- o  ������ 0 i  . m  ������  , R  ����/0
�� .ascrerr ****      � ****/ m  ��11 �22 > N o t   a   v a l i d   h e x a d e c i m a l   n u m b e r .0 ��34
�� 
errn3 m  �������Y4 ��5��
�� 
erob5 l ��6����6 N  ��77 n  ��898 7 ����:;
�� 
ctxt: o  ������ 0 i  ; l ��<����< \  ��=>= [  ��?@? o  ������ 0 i  @ o  ������ 0 	chunksize 	chunkSize> m  ������ ��  ��  9 o  ������ 0 hextext hexText��  ��  ��  ��  ��  * A��A r  ��BCB \  ��DED [  ��FGF o  ������ 0 	thenumber 	theNumberG o  ������ 0 i  E m  ������ C o      ���� 0 	thenumber 	theNumber��  �� 0 charref charRef n ��HIH 7 ����JK
�� 
ctxtJ o  ������ 0 i  K l ��L����L \  ��MNM [  ��OPO o  ������ 0 i  P o  ������ 0 	chunksize 	chunkSizeN m  ������ ��  ��  I o  ������ 0 hextext hexText QRQ Z 5ST����S F  UVU o  ���� 0 	isprecise 	isPreciseV l W����W =  XYX o  ���� 0 	thenumber 	theNumberY [  
Z[Z o  ���� 0 	thenumber 	theNumber[ m  	���� ��  ��  T R  1��\]
�� .ascrerr ****      � ****\ m  -0^^ �__ � H e x a d e c i m a l   t e x t   i s   t o o   l a r g e   t o   c o n v e r t   t o   n u m b e r   w i t h o u t   l o s i n g   p r e c i s i o n .] ��`a
�� 
errn` m  �����Ya ��b��
�� 
erobb l ,c����c N  ,dd n  +efe 7 +��gh
�� 
ctxtg o  !#���� 0 i  h l $*i����i \  $*jkj [  %(lml o  %&���� 0 i  m o  &'���� 0 	chunksize 	chunkSizek m  ()���� ��  ��  f o  ���� 0 hextext hexText��  ��  ��  ��  ��  R n��n r  6>opo o  67���� 0 	thenumber 	theNumberp n      qrq  ;  <=r n 7<sts o  8<���� 
0 _list_  t o  78���� 0 
resultlist 
resultList��  �� 0 i   m  tu����  n u{uvu 1  vz��
�� 
lengv o  uv���� 0 hextext hexText o  {|���� 0 	chunksize 	chunkSize	 w��w L  DKxx n DJyzy o  EI���� 
0 _list_  z o  DE���� 0 
resultlist 
resultList��  �   read as list of numbers   � �{{ 0   r e a d   a s   l i s t   o f   n u m b e r s�G  & ��|
�� consdiac| ��}
�� conshyph} ��~
�� conspunc~ ����
�� conswhit��  ' ��
�� conscase ����
�� consnume��  # R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  $ I  Tb���~� 
0 _error  � ��� m  UX�� ���  p a r s e   h e x� ��� o  XY�}�} 0 etext eText� ��� o  YZ�|�| 0 enumber eNumber� ��� o  Z[�{�{ 0 efrom eFrom� ��z� o  [\�y�y 
0 eto eTo�z  �~   ��� l     �x�w�v�x  �w  �v  � ��� l     �u�t�s�u  �t  �s  � ��� l     �r���r  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �q���q  � !  General numeric operations   � ��� 6   G e n e r a l   n u m e r i c   o p e r a t i o n s� ��� l     �p�o�n�p  �o  �n  � ��� i  H K��� I     �m��l
�m .Mth:DeRanull���     doub� o      �k�k 0 x  �l  � Q     ���� L    �� ]    
��� l   ��j�i� c    ��� o    �h�h 0 x  � m    �g
�g 
doub�j  �i  � l   	��f�e� ^    	��� 1    �d
�d 
pi  � m    �c�c ��f  �e  � R      �b��
�b .ascrerr ****      � ****� o      �a�a 0 etext eText� �`��
�` 
errn� o      �_�_ 0 enumber eNumber� �^��
�^ 
erob� o      �]�] 0 efrom eFrom� �\��[
�\ 
errt� o      �Z�Z 
0 eto eTo�[  � I    �Y��X�Y 
0 _error  � ��� m    �� ���  r a d i a n s� ��� o    �W�W 0 etext eText� ��� o    �V�V 0 enumber eNumber� ��� o    �U�U 0 efrom eFrom� ��T� o    �S�S 
0 eto eTo�T  �X  � ��� l     �R�Q�P�R  �Q  �P  � ��� l     �O�N�M�O  �N  �M  � ��� i  L O��� I     �L��K
�L .Mth:RaDenull���     doub� o      �J�J 0 x  �K  � Q     ���� L    �� ^    
��� l   ��I�H� c    ��� o    �G�G 0 x  � m    �F
�F 
doub�I  �H  � l   	��E�D� ^    	��� 1    �C
�C 
pi  � m    �B�B ��E  �D  � R      �A��
�A .ascrerr ****      � ****� o      �@�@ 0 etext eText� �?��
�? 
errn� o      �>�> 0 enumber eNumber� �=��
�= 
erob� o      �<�< 0 efrom eFrom� �;��:
�; 
errt� o      �9�9 
0 eto eTo�:  � I    �8��7�8 
0 _error  � ��� m    �� ���  d e g r e e s� ��� o    �6�6 0 etext eText� ��� o    �5�5 0 enumber eNumber� ��� o    �4�4 0 efrom eFrom� ��3� o    �2�2 
0 eto eTo�3  �7  � ��� l     �1�0�/�1  �0  �/  � ��� l     �.�-�,�.  �-  �,  � ��� l     �+�*�)�+  �*  �)  � ��� i  P S��� I     �(��'
�( .Mth:Abs_null���     nmbr� o      �&�& 0 x  �'  � Q     )���� k    �� ��� r    	 		  c    			 o    �%�% 0 x  	 m    �$
�$ 
nmbr	 o      �#�# 0 x  � 	�"	 Z   	 		�!		 A   	 				 o   	 
� �  0 x  		 m   
 ��  	 L    	
	
 d    		 o    �� 0 x  �!  	 L    		 o    �� 0 x  �"  � R      �		
� .ascrerr ****      � ****	 o      �� 0 etext eText	 �		
� 
errn	 o      �� 0 enumber eNumber	 �		
� 
erob	 o      �� 0 efrom eFrom	 �	�
� 
errt	 o      �� 
0 eto eTo�  � I    )�	�� 
0 _error  	 			 m     !		 �		  a b s	 			 o   ! "�� 0 etext eText	 			 o   " #�� 0 enumber eNumber	 			 o   # $�� 0 efrom eFrom	 	�	 o   $ %�� 
0 eto eTo�  �  � 	 	!	  l     ���
�  �  �
  	! 	"	#	" l     �	���	  �  �  	# 	$	%	$ i  T W	&	'	& I     �	(�
� .Mth:CmpNnull���     ****	( J      	)	) 	*	+	* o      �� 0 n1  	+ 	,�	, o      �� 0 n2  �  �  	' Q     �	-	.	/	- k    �	0	0 	1	2	1 Z    �	3	4�	5	3 =    	6	7	6 l   	8� ��	8 I   ��	9	:
�� .corecnte****       ****	9 J    	;	; 	<	=	< o    ���� 0 n1  	= 	>��	> o    ���� 0 n2  ��  	: ��	?��
�� 
kocl	? m    	��
�� 
long��  �   ��  	7 m    ���� 	4 Z   	@	A����	@ =    	B	C	B o    ���� 0 n1  	C o    ���� 0 n2  	A L    	D	D m    ����  ��  ��  �  	5 k   ! �	E	E 	F	G	F r   ! 8	H	I	H J   ! )	J	J 	K	L	K c   ! $	M	N	M o   ! "���� 0 n1  	N m   " #��
�� 
doub	L 	O��	O c   $ '	P	Q	P o   $ %���� 0 n2  	Q m   % &��
�� 
doub��  	I J      	R	R 	S	T	S o      ���� 0 n1  	T 	U��	U o      ���� 0 n2  ��  	G 	V	W	V Z   9 T	X	Y��	Z	X =   9 <	[	\	[ o   9 :���� 0 n1  	\ m   : ;����  	Y r   ? H	]	^	] ]   ? F	_	`	_ o   ? D���� 0 _isequaldelta _isEqualDelta	` o   D E���� 0 n2  	^ o      ���� 0 dn  ��  	Z r   K T	a	b	a ]   K R	c	d	c o   K P���� 0 _isequaldelta _isEqualDelta	d o   P Q���� 0 n1  	b o      ���� 0 dn  	W 	e	f	e r   U Y	g	h	g d   U W	i	i o   U V���� 0 dn  	h o      ���� 0 dm  	f 	j	k	j Z  Z w	l	m����	l ?   Z ]	n	o	n o   Z [���� 0 dm  	o o   [ \���� 0 dn  	m r   ` s	p	q	p J   ` d	r	r 	s	t	s o   ` a���� 0 dm  	t 	u��	u o   a b���� 0 dn  ��  	q J      	v	v 	w	x	w o      ���� 0 dn  	x 	y��	y o      ���� 0 dm  ��  ��  ��  	k 	z	{	z r   x }	|	}	| \   x {	~		~ o   x y���� 0 n2  	 o   y z���� 0 n1  	} o      ���� 0 d  	{ 	���	� Z  ~ �	�	�����	� F   ~ �	�	�	� ?   ~ �	�	�	� o   ~ ���� 0 d  	� o    ����� 0 dm  	� A   � �	�	�	� o   � ����� 0 d  	� o   � ����� 0 dn  	� L   � �	�	� m   � �����  ��  ��  ��  	2 	���	� Z   � �	�	���	�	� A   � �	�	�	� o   � ����� 0 n1  	� o   � ����� 0 n2  	� L   � �	�	� m   � ���������  	� L   � �	�	� m   � ����� ��  	. R      ��	�	�
�� .ascrerr ****      � ****	� o      ���� 0 etext eText	� ��	�	�
�� 
errn	� o      ���� 0 enumber eNumber	� ��	�	�
�� 
erob	� o      ���� 0 efrom eFrom	� ��	���
�� 
errt	� o      ���� 
0 eto eTo��  	/ I   � ���	����� 
0 _error  	� 	�	�	� m   � �	�	� �	�	�  c m p	� 	�	�	� o   � ����� 0 etext eText	� 	�	�	� o   � ����� 0 enumber eNumber	� 	�	�	� o   � ����� 0 efrom eFrom	� 	���	� o   � ����� 
0 eto eTo��  ��  	% 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  X [	�	�	� I     ��	���
�� .Mth:MinNnull���     ****	� o      ���� 0 thelist theList��  	� Q     W	�	�	�	� k    E	�	� 	�	�	� h    
��	��� 0 
listobject 
listObject	� j     ��	��� 
0 _list_  	� n    	�	�	� I    ��	����� "0 aslistparameter asListParameter	� 	���	� o    
���� 0 thelist theList��  ��  	� o     ���� 0 _support  	� 	�	�	� r    	�	�	� c    	�	�	� l   	�����	� n    	�	�	� 4   ��	�
�� 
cobj	� m    ���� 	� n   	�	�	� o    ���� 
0 _list_  	� o    ���� 0 
listobject 
listObject��  ��  	� m    ��
�� 
nmbr	� o      ���� 0 	theresult 	theResult	� 	�	�	� X    B	���	�	� k   ( =	�	� 	�	�	� r   ( /	�	�	� c   ( -	�	�	� n  ( +	�	�	� 1   ) +��
�� 
pcnt	� o   ( )���� 0 aref aRef	� m   + ,��
�� 
nmbr	� o      ���� 0 x  	� 	���	� Z  0 =	�	�����	� A   0 3	�	�	� o   0 1���� 0 x  	� o   1 2���� 0 	theresult 	theResult	� r   6 9	�	�	� o   6 7���� 0 x  	� o      ���� 0 	theresult 	theResult��  ��  ��  �� 0 aref aRef	� n   	�	�	� o    ���� 
0 _list_  	� o    ���� 0 
listobject 
listObject	� 	���	� L   C E	�	� o   C D���� 0 	theresult 	theResult��  	� R      ��	�	�
�� .ascrerr ****      � ****	� o      ���� 0 etext eText	� ��	�	�
�� 
errn	� o      ���� 0 enumber eNumber	� ��	�	�
�� 
erob	� o      ���� 0 efrom eFrom	� ��	���
�� 
errt	� o      ���� 
0 eto eTo��  	� I   M W��	����� 
0 _error  	� 	�	�	� m   N O	�	� �	�	�  m i n	� 	�	�	� o   O P���� 0 etext eText	� 	�	�	� o   P Q�� 0 enumber eNumber	� 	�	�	� o   Q R�~�~ 0 efrom eFrom	� 	��}	� o   R S�|�| 
0 eto eTo�}  ��  	� 	�	�	� l     �{�z�y�{  �z  �y  	� 	�	�	� l     �x�w�v�x  �w  �v  	� 	�	�	� i  \ _	�	�	� I     �u	��t
�u .Mth:MaxNnull���     ****	� o      �s�s 0 thelist theList�t  	� Q     W	�	�	�	� k    E	�	� 	�	�	� h    
�r
 �r 0 
listobject 
listObject
  j     �q
�q 
0 _list_  
 n    


 I    �p
�o�p "0 aslistparameter asListParameter
 
�n
 o    
�m�m 0 thelist theList�n  �o  
 o     �l�l 0 _support  	� 


 r    

	
 c    




 l   
�k�j
 n    


 4   �i

�i 
cobj
 m    �h�h 
 n   


 o    �g�g 
0 _list_  
 o    �f�f 0 
listobject 
listObject�k  �j  
 m    �e
�e 
nmbr
	 o      �d�d 0 	theresult 	theResult
 


 X    B
�c

 k   ( =

 


 r   ( /


 c   ( -


 n  ( +


 1   ) +�b
�b 
pcnt
 o   ( )�a�a 0 aref aRef
 m   + ,�`
�` 
nmbr
 o      �_�_ 0 x  
 
�^
 Z  0 =
 
!�]�\
  ?   0 3
"
#
" o   0 1�[�[ 0 x  
# o   1 2�Z�Z 0 	theresult 	theResult
! r   6 9
$
%
$ o   6 7�Y�Y 0 x  
% o      �X�X 0 	theresult 	theResult�]  �\  �^  �c 0 aref aRef
 n   
&
'
& o    �W�W 
0 _list_  
' o    �V�V 0 
listobject 
listObject
 
(�U
( L   C E
)
) o   C D�T�T 0 	theresult 	theResult�U  	� R      �S
*
+
�S .ascrerr ****      � ****
* o      �R�R 0 etext eText
+ �Q
,
-
�Q 
errn
, o      �P�P 0 enumber eNumber
- �O
.
/
�O 
erob
. o      �N�N 0 efrom eFrom
/ �M
0�L
�M 
errt
0 o      �K�K 
0 eto eTo�L  	� I   M W�J
1�I�J 
0 _error  
1 
2
3
2 m   N O
4
4 �
5
5  m a x
3 
6
7
6 o   O P�H�H 0 etext eText
7 
8
9
8 o   P Q�G�G 0 enumber eNumber
9 
:
;
: o   Q R�F�F 0 efrom eFrom
; 
<�E
< o   R S�D�D 
0 eto eTo�E  �I  	� 
=
>
= l     �C�B�A�C  �B  �A  
> 
?
@
? l     �@�?�>�@  �?  �>  
@ 
A
B
A i  ` c
C
D
C I     �=
E
F
�= .Mth:RouNnull���     nmbr
E o      �<�< 0 num  
F �;
G
H
�; 
Plac
G |�:�9
I�8
J�:  �9  
I o      �7�7 0 decimalplaces decimalPlaces�8  
J l     
K�6�5
K m      �4�4  �6  �5  
H �3
L�2
�3 
Dire
L |�1�0
M�/
N�1  �0  
M o      �.�. &0 roundingdirection roundingDirection�/  
N l     
O�-�,
O m      �+
�+ MRndRNhE�-  �,  �2  
D Q    �
P
Q
R
P k   �
S
S 
T
U
T r    
V
W
V n   
X
Y
X I    �*
Z�)�* "0 asrealparameter asRealParameter
Z 
[
\
[ o    	�(�( 0 num  
\ 
]�'
] m   	 

^
^ �
_
_  �'  �)  
Y o    �&�& 0 _support  
W o      �%�% 0 num  
U 
`
a
` r    
b
c
b n   
d
e
d I    �$
f�#�$ (0 asintegerparameter asIntegerParameter
f 
g
h
g o    �"�" 0 decimalplaces decimalPlaces
h 
i�!
i m    
j
j �
k
k  t o   p l a c e s�!  �#  
e o    � �  0 _support  
c o      �� 0 decimalplaces decimalPlaces
a 
l
m
l Z    8
n
o��
n >    "
p
q
p o     �� 0 decimalplaces decimalPlaces
q m     !��  
o k   % 4
r
r 
s
t
s r   % *
u
v
u a   % (
w
x
w m   % &�� 

x o   & '�� 0 decimalplaces decimalPlaces
v o      �� 0 themultiplier theMultiplier
t 
y�
y l  + 4
z
{
|
z r   + 4
}
~
} ^   + 2

�
 ]   + 0
�
�
� ]   + .
�
�
� o   + ,�� 0 num  
� m   , -�� 

� o   . /�� 0 themultiplier theMultiplier
� m   0 1�� 

~ o      �� 0 num  
{�� multiplying and dividing by 10 before and after applying the multiplier helps avoid poor rounding results for some numbers due to inevitable loss of precision in floating-point math (e.g. `324.21 * 100 div 1 / 100` returns 324.2 but needs to be 324.21), though this hasn't been tested on all possible values for obvious reasons -- TO DO: shouldn't /10 be done after rounding is applied (in which case following calculations should use mod 10, etc)?   
| �
�
��   m u l t i p l y i n g   a n d   d i v i d i n g   b y   1 0   b e f o r e   a n d   a f t e r   a p p l y i n g   t h e   m u l t i p l i e r   h e l p s   a v o i d   p o o r   r o u n d i n g   r e s u l t s   f o r   s o m e   n u m b e r s   d u e   t o   i n e v i t a b l e   l o s s   o f   p r e c i s i o n   i n   f l o a t i n g - p o i n t   m a t h   ( e . g .   ` 3 2 4 . 2 1   *   1 0 0   d i v   1   /   1 0 0 `   r e t u r n s   3 2 4 . 2   b u t   n e e d s   t o   b e   3 2 4 . 2 1 ) ,   t h o u g h   t h i s   h a s n ' t   b e e n   t e s t e d   o n   a l l   p o s s i b l e   v a l u e s   f o r   o b v i o u s   r e a s o n s   - -   T O   D O :   s h o u l d n ' t   / 1 0   b e   d o n e   a f t e r   r o u n d i n g   i s   a p p l i e d   ( i n   w h i c h   c a s e   f o l l o w i n g   c a l c u l a t i o n s   s h o u l d   u s e   m o d   1 0 ,   e t c ) ?�  �  �  
m 
�
�
� Z   9�
�
�
�
�
� =  9 <
�
�
� o   9 :�� &0 roundingdirection roundingDirection
� l  : ;
���
� m   : ;�
� MRndRNhE�  �  
� Z   ? m
�
�
�
�
� E  ? K
�
�
� J   ? C
�
� 
�
�
� m   ? @
�
� ��      
� 
��
� m   @ A
�
� ?�      �  
� J   C J
�
� 
��
� `   C H
�
�
� l  C F
���

� ^   C F
�
�
� o   C D�	�	 0 num  
� m   D E�� �  �
  
� m   F G�� �  
� l  N S
�
�
�
� r   N S
�
�
� _   N Q
�
�
� o   N O�� 0 num  
� m   O P�� 
� o      �� 0 num  
� T N if num ends in .5 and its div is even then round toward zero so it stays even   
� �
�
� �   i f   n u m   e n d s   i n   . 5   a n d   i t s   d i v   i s   e v e n   t h e n   r o u n d   t o w a r d   z e r o   s o   i t   s t a y s   e v e n
� 
�
�
� ?   V Y
�
�
� o   V W�� 0 num  
� m   W X��  
� 
��
� l  \ c
�
�
�
� r   \ c
�
�
� _   \ a
�
�
� l  \ _
�� ��
� [   \ _
�
�
� o   \ ]���� 0 num  
� m   ] ^
�
� ?�      �   ��  
� m   _ `���� 
� o      ���� 0 num  
� H B else round to nearest whole digit (.5 will round up if positive�)   
� �
�
� �   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t   ( . 5   w i l l   r o u n d   u p   i f   p o s i t i v e & )�  
� l  f m
�
�
�
� r   f m
�
�
� _   f k
�
�
� l  f i
�����
� \   f i
�
�
� o   f g���� 0 num  
� m   g h
�
� ?�      ��  ��  
� m   i j���� 
� o      ���� 0 num  
� 4 . (�or down if negative to give an even result)   
� �
�
� \   ( & o r   d o w n   i f   n e g a t i v e   t o   g i v e   a n   e v e n   r e s u l t )
� 
�
�
� =  p s
�
�
� o   p q���� &0 roundingdirection roundingDirection
� l  q r
�����
� m   q r��
�� MRndRNhT��  ��  
� 
�
�
� Z   v �
�
�
�
�
� E  v �
�
�
� J   v z
�
� 
�
�
� m   v w
�
� ��      
� 
���
� m   w x
�
� ?�      ��  
� J   z 
�
� 
���
� `   z }
�
�
� o   z {���� 0 num  
� m   { |���� ��  
� l  � �
�
�
�
� r   � �
�
�
� _   � �
�
�
� o   � ����� 0 num  
� m   � ����� 
� o      ���� 0 num  
� 0 * if num ends in .5 then round towards zero   
� �
�
� T   i f   n u m   e n d s   i n   . 5   t h e n   r o u n d   t o w a r d s   z e r o
� 
�
�
� ?   � �
�
�
� o   � ����� 0 num  
� m   � �����  
� 
���
� l  � �
�
�
�
� r   � �
�
�
� _   � �
�
�
� l  � �
�����
� [   � �
�
�
� o   � ����� 0 num  
� m   � �
�
� ?�      ��  ��  
� m   � ����� 
� o      ���� 0 num  
� ( " else round to nearest whole digit   
� �
�
� D   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t��  
� r   � �
�
�
� _   � �
�
�
� l  � �
�����
� \   � �
�
�
� o   � ����� 0 num  
� m   � �
�
� ?�      ��  ��  
� m   � ����� 
� o      ���� 0 num  
� 
� 
� =  � � o   � ����� &0 roundingdirection roundingDirection l  � ����� m   � ���
�� MRndRNhF��  ��     Z   � �	 E  � �

 J   � �  m   � � ��       �� m   � � ?�      ��   J   � � �� `   � � o   � ����� 0 num   m   � ����� ��   l  � � Z   � ��� ?   � � o   � ����� 0 num   m   � �����   r   � � [   � � !  _   � �"#" o   � ����� 0 num  # m   � ����� ! m   � �����  o      ���� 0 num  ��   r   � �$%$ \   � �&'& _   � �()( o   � ����� 0 num  ) m   � ����� ' m   � ����� % o      ���� 0 num   0 * if num ends in .5 then round towards zero    �** T   i f   n u m   e n d s   i n   . 5   t h e n   r o u n d   t o w a r d s   z e r o +,+ ?   � �-.- o   � ����� 0 num  . m   � �����  , /��/ l  � �0120 r   � �343 _   � �565 l  � �7����7 [   � �898 o   � ����� 0 num  9 m   � �:: ?�      ��  ��  6 m   � ����� 4 o      ���� 0 num  1 ( " else round to nearest whole digit   2 �;; D   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t��  	 r   � �<=< _   � �>?> l  � �@����@ \   � �ABA o   � ����� 0 num  B m   � �CC ?�      ��  ��  ? m   � ����� = o      ���� 0 num   DED =  � �FGF o   � ����� &0 roundingdirection roundingDirectionG l  � �H����H m   � ���
�� MRndRN_T��  ��  E IJI r   � �KLK _   � �MNM o   � ����� 0 num  N m   � ����� L o      ���� 0 num  J OPO =  � �QRQ o   � ����� &0 roundingdirection roundingDirectionR l  � �S����S m   � ���
�� MRndRN_F��  ��  P TUT Z   'VWXYV =   Z[Z `   \]\ o   ���� 0 num  ] m  ���� [ m  ����  W r  ^_^ _  `a` o  	���� 0 num  a m  	
���� _ o      ���� 0 num  X bcb ?  ded o  ���� 0 num  e m  ����  c f��f r  ghg [  iji _  klk o  ���� 0 num  l m  ���� j m  ���� h o      ���� 0 num  ��  Y r   'mnm \   %opo _   #qrq o   !���� 0 num  r m  !"���� p m  #$���� n o      ���� 0 num  U sts = *-uvu o  *+���� &0 roundingdirection roundingDirectionv l +,w����w m  +,��
�� MRndRN_U��  ��  t xyx l 0Oz{|z Z  0O}~��} G  0=��� A  03��� o  01���� 0 num  � m  12����  � =  6;��� `  69��� o  67���� 0 num  � m  78���� � m  9:����  ~ r  @E��� _  @C��� o  @A���� 0 num  � m  AB���� � o      ���� 0 num  ��   r  HO��� [  HM��� _  HK��� o  HI���� 0 num  � m  IJ���� � m  KL���� � o      ���� 0 num  {   ceil()   | ���    c e i l ( )y ��� = RW��� o  RS���� &0 roundingdirection roundingDirection� l SV������ m  SV��
�� MRndRN_D��  ��  � ���� l Zy���� Z  Zy������ G  Zg��� ?  Z]��� o  Z[���� 0 num  � m  [\����  � =  `e��� `  `c��� o  `a���� 0 num  � m  ab���� � m  cd����  � r  jo��� _  jm��� o  jk���� 0 num  � m  kl���� � o      ���� 0 num  ��  � r  ry��� \  rw��� _  ru��� o  rs���� 0 num  � m  st���� � m  uv���� � o      ���� 0 num  �   floor()   � ���    f l o o r ( )��  
� n |���� I  �����~� >0 throwinvalidparameterconstant throwInvalidParameterConstant� ��� o  ���}�} &0 roundingdirection roundingDirection� ��|� m  ���� ���  b y�|  �~  � o  |��{�{ 0 _support  
� ��z� Z  ������� =  ����� o  ���y�y 0 decimalplaces decimalPlaces� m  ���x�x  � L  ���� _  ����� o  ���w�w 0 num  � m  ���v�v � ��� A  ����� o  ���u�u 0 decimalplaces decimalPlaces� m  ���t�t  � ��s� L  ���� _  ����� o  ���r�r 0 num  � o  ���q�q 0 themultiplier theMultiplier�s  � L  ���� ^  ����� o  ���p�p 0 num  � o  ���o�o 0 themultiplier theMultiplier�z  
Q R      �n��
�n .ascrerr ****      � ****� o      �m�m 0 etext eText� �l��
�l 
errn� o      �k�k 0 enumber eNumber� �j��
�j 
erob� o      �i�i 0 efrom eFrom� �h��g
�h 
errt� o      �f�f 
0 eto eTo�g  
R I  ���e��d�e 
0 _error  � ��� m  ���� ���  r o u n d   n u m b e r� ��� o  ���c�c 0 etext eText� ��� o  ���b�b 0 enumber eNumber� ��� o  ���a�a 0 efrom eFrom� ��`� o  ���_�_ 
0 eto eTo�`  �d  
B ��� l     �^�]�\�^  �]  �\  � ��� l     �[�Z�Y�[  �Z  �Y  � ��� l     �X���X  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �W���W  �   Trigonometry   � ���    T r i g o n o m e t r y� ��� l     �V�U�T�V  �U  �T  � ��� i  d g��� I      �S��R�S 0 _sin  � ��Q� o      �P�P 0 x  �Q  �R  � k     ��� ��� l    	���� r     	��� ]        l    �O�N `      o     �M�M 0 x   m    �L�Lh�O  �N   l   �K�J ^     1    �I
�I 
pi   m    �H�H ��K  �J  � o      �G�G 0 x  � &   convert from degrees to radians   � � @   c o n v e r t   f r o m   d e g r e e s   t o   r a d i a n s� 	
	 r   
  A   
  o   
 �F�F 0 x   m    �E�E   o      �D�D 0 isneg isNeg
  Z   �C�B o    �A�A 0 isneg isNeg r     d     o    �@�@ 0 x   o      �?�? 0 x  �C  �B    r    & _    $ l   "�>�= ]    " o    �<�< 0 x   l   !�;�: ^    ! !  m    �9�9 ! 1     �8
�8 
pi  �;  �:  �>  �=   m   " #�7�7  o      �6�6 0 y   "#" r   ' 2$%$ \   ' 0&'& o   ' (�5�5 0 y  ' ]   ( /()( l  ( -*�4�3* _   ( -+,+ ]   ( +-.- o   ( )�2�2 0 y  . m   ) *// ?�      , m   + ,�1�1 �4  �3  ) m   - .�0�0 % o      �/�/ 0 z  # 010 Z   3 J23�.�-2 =  3 8454 `   3 6676 o   3 4�,�, 0 z  7 m   4 5�+�+ 5 m   6 7�*�* 3 k   ; F88 9:9 r   ; @;<; [   ; >=>= o   ; <�)�) 0 z  > m   < =�(�( < o      �'�' 0 z  : ?�&? r   A F@A@ [   A DBCB o   A B�%�% 0 y  C m   B C�$�$ A o      �#�# 0 y  �&  �.  �-  1 DED r   K PFGF `   K NHIH o   K L�"�" 0 z  I m   L M�!�! G o      � �  0 z  E JKJ Z   Q eLM��L ?   Q TNON o   Q R�� 0 z  O m   R S�� M k   W aPP QRQ r   W [STS H   W YUU o   W X�� 0 isneg isNegT o      �� 0 isneg isNegR V�V r   \ aWXW \   \ _YZY o   \ ]�� 0 z  Z m   ] ^�� X o      �� 0 z  �  �  �  K [\[ r   f u]^] \   f s_`_ l  f oa��a \   f obcb l  f kd��d \   f kefe o   f g�� 0 x  f ]   g jghg o   g h�� 0 y  h m   h iii ?�!�?��v�  �  c ]   k njkj o   k l�� 0 y  k m   l mll >dD,���J�  �  ` ]   o rmnm o   o p�� 0 y  n m   p qoo <�F���P�^ o      �� 0 z2  \ pqp r   v {rsr ]   v ytut o   v w�� 0 z2  u o   w x�� 0 z2  s o      �
�
 0 zz  q vwv Z   | �xy�	zx G   | �{|{ =  | }~} o   | }�� 0 z  ~ m   } ~�� | =  � �� o   � ��� 0 z  � m   � ��� y r   � ���� [   � ���� \   � ���� m   � ��� ?�      � ^   � ���� o   � ��� 0 zz  � m   � ��� � ]   � ���� ]   � ���� o   � ��� 0 zz  � o   � ��� 0 zz  � l  � ��� ��� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� m   � ��� ���I���� o   � ����� 0 zz  � m   � ��� >!�{N>���  ��  � o   � ����� 0 zz  � m   � ��� >�~O~�K���  ��  � o   � ����� 0 zz  � m   � ��� >���D���  ��  � o   � ����� 0 zz  � m   � ��� ?V�l�=���  ��  � o   � ����� 0 zz  � m   � ��� ?�UUUV��   ��  � o      ���� 0 y  �	  z r   � ���� [   � ���� o   � ����� 0 z2  � ]   � ���� ]   � ���� o   � ����� 0 z2  � o   � ����� 0 zz  � l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� m   � ��� =���ќ�� o   � ����� 0 zz  � m   � ��� >Z��)[��  ��  � o   � ����� 0 zz  � m   � ��� >��V}H���  ��  � o   � ����� 0 zz  � m   � ��� ?*������  ��  � o   � ����� 0 zz  � m   � ��� ?�"w��  ��  � o   � ����� 0 zz  � m   � ��� ?�UUUU�?��  ��  � o      ���� 0 y  w ��� Z  � �������� o   � ����� 0 isneg isNeg� r   � ���� d   � ��� o   � ����� 0 y  � o      ���� 0 y  ��  ��  � ���� L   � ��� o   � ����� 0 y  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  h k��� I     �����
�� .Mth:Sin_null���     doub� o      ���� 0 x  ��  � Q     ���� L    �� I    ������� 0 _sin  � ���� c    ��� o    ���� 0 x  � m    ��
�� 
nmbr��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I    ������� 
0 _error  � ��� m    �� ���  s i n� ��� o    ���� 0 etext eText� ��� o    ���� 0 enumber eNumber�    o    ���� 0 efrom eFrom �� o    ���� 
0 eto eTo��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��    i  l o	
	 I     ����
�� .Mth:Cos_null���     doub o      ���� 0 x  ��  
 Q       L     I    ������ 0 _sin   �� [    	 l   ���� c     o    ���� 0 x   m    ��
�� 
nmbr��  ��   m    ���� Z��  ��   R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   I     ������ 
0 _error     m    !! �""  c o s  #$# o    ���� 0 etext eText$ %&% o    ���� 0 enumber eNumber& '(' o    ���� 0 efrom eFrom( )��) o    ���� 
0 eto eTo��  ��   *+* l     ��������  ��  ��  + ,-, l     ��������  ��  ��  - ./. i  p s010 I     ��2��
�� .Mth:Tan_null���     doub2 o      ���� 0 x  ��  1 k    33 454 l     ��67��  6 a [ note: this starts to lose accuracy between 89.9999999 and 90�, but should be 'good enough'   7 �88 �   n o t e :   t h i s   s t a r t s   t o   l o s e   a c c u r a c y   b e t w e e n   8 9 . 9 9 9 9 9 9 9   a n d   9 0 � ,   b u t   s h o u l d   b e   ' g o o d   e n o u g h '5 9��9 Q    :;<: k    �== >?> r    @A@ c    BCB o    ���� 0 x  C m    ��
�� 
nmbrA o      ���� 0 x  ? DED l  	 #FGHF Z  	 #IJ����I G   	 KLK =  	 MNM o   	 
���� 0 x  N m   
 ���� ZL =   OPO o    ���� 0 x  P m    ����J R    ��QR
�� .ascrerr ****      � ****Q m    SS �TT F I n v a l i d   n u m b e r   ( r e s u l t   w o u l d   b e  " ) .R �UV
� 
errnU m    �~�~�sV �}W�|
�} 
erobW o    �{�{ 0 x  �|  ��  ��  G 4 . -2701 normally indicates divide-by-zero error   H �XX \   - 2 7 0 1   n o r m a l l y   i n d i c a t e s   d i v i d e - b y - z e r o   e r r o rE YZY l  $ -[\][ r   $ -^_^ ]   $ +`a` l  $ 'b�z�yb `   $ 'cdc o   $ %�x�x 0 x  d m   % &�w�wh�z  �y  a l  ' *e�v�ue ^   ' *fgf 1   ' (�t
�t 
pi  g m   ( )�s�s ��v  �u  _ o      �r�r 0 x  \ &   convert from degrees to radians   ] �hh @   c o n v e r t   f r o m   d e g r e e s   t o   r a d i a n sZ iji r   . 3klk A   . 1mnm o   . /�q�q 0 x  n m   / 0�p�p  l o      �o�o 0 isneg isNegj opo Z  4 @qr�n�mq o   4 5�l�l 0 isneg isNegr r   8 <sts d   8 :uu o   8 9�k�k 0 x  t o      �j�j 0 x  �n  �m  p vwv r   A Jxyx _   A Hz{z l  A F|�i�h| ^   A F}~} o   A B�g�g 0 x  ~ l  B E�f�e ^   B E��� 1   B C�d
�d 
pi  � m   C D�c�c �f  �e  �i  �h  { m   F G�b�b y o      �a�a 0 y  w ��� r   K V��� \   K T��� o   K L�`�` 0 y  � ]   L S��� l  L Q��_�^� _   L Q��� ]   L O��� o   L M�]�] 0 y  � m   M N�� ?�      � m   O P�\�\ �_  �^  � m   Q R�[�[ � o      �Z�Z 0 z  � ��� Z   W n���Y�X� =  W \��� `   W Z��� o   W X�W�W 0 z  � m   X Y�V�V � m   Z [�U�U � k   _ j�� ��� r   _ d��� [   _ b��� o   _ `�T�T 0 z  � m   ` a�S�S � o      �R�R 0 z  � ��Q� r   e j��� [   e h��� o   e f�P�P 0 y  � m   f g�O�O � o      �N�N 0 y  �Q  �Y  �X  � ��� r   o ���� \   o ~��� l  o x��M�L� \   o x��� l  o t��K�J� \   o t��� o   o p�I�I 0 x  � ]   p s��� o   p q�H�H 0 y  � m   q r�� ?�!�P M�K  �J  � ]   t w��� o   t u�G�G 0 y  � m   u v�� >A�`  �M  �L  � ]   x }��� o   x y�F�F 0 y  � m   y |�� <��&3\� o      �E�E 0 z2  � ��� r   � ���� ]   � ���� o   � ��D�D 0 z2  � o   � ��C�C 0 z2  � o      �B�B 0 zz  � ��� Z   � ����A�� ?   � ���� o   � ��@�@ 0 zz  � m   � ��� =����+�� r   � ���� [   � ���� o   � ��?�? 0 z2  � ^   � ���� ]   � ���� ]   � ���� o   � ��>�> 0 z2  � o   � ��=�= 0 zz  � l  � ���<�;� \   � ���� ]   � ���� l  � ���:�9� [   � ���� ]   � ���� m   � ��� �ɒ��O?D� o   � ��8�8 0 zz  � m   � ��� A1������:  �9  � o   � ��7�7 0 zz  � m   � ��� Aq��)�y�<  �;  � l  � ���6�5� \   � ���� ]   � ���� l  � ���4�3� [   � ���� ]   � ���� l  � ���2�1� \   � ���� ]   � ���� l  � ���0�/� [   � ���� o   � ��.�. 0 zz  � m   � ��� @ʸ��et�0  �/  � o   � ��-�- 0 zz  � m   � ��� A4'�X*���2  �1  � o   � ��,�, 0 zz  � m   � ��� Awُ�����4  �3  � o   � ��+�+ 0 zz  � m   � ��� A���<�Z6�6  �5  � o      �*�* 0 y  �A  � r   � ���� o   � ��)�) 0 z2  � o      �(�( 0 y  � ��� Z  � ����'�&� G   � ���� =  � ���� o   � ��%�% 0 z  � m   � ��$�$ � =  � ���� o   � ��#�# 0 z  � m   � ��"�" � r   � �   ^   � � m   � ��!�!�� o   � �� �  0 y   o      �� 0 y  �'  �&  �  Z  � ��� o   � ��� 0 isneg isNeg r   � �	 d   � �

 o   � ��� 0 y  	 o      �� 0 y  �  �   � L   � � o   � ��� 0 y  �  ; R      �
� .ascrerr ****      � **** o      �� 0 etext eText �
� 
errn o      �� 0 enumber eNumber �
� 
erob o      �� 0 efrom eFrom ��
� 
errt o      �� 
0 eto eTo�  < I   ���� 
0 _error    m   � � �  t a n  o   � ��� 0 etext eText  o   � ��� 0 enumber eNumber  o   � ��
�
 0 efrom eFrom �	 o   � ��� 
0 eto eTo�	  �  ��  /  !  l     ����  �  �  ! "#" l     ����  �  �  # $%$ l     �&'�  &  -----   ' �(( 
 - - - - -% )*) l     � +,�   +   inverse   , �--    i n v e r s e* ./. l     ��������  ��  ��  / 010 i  t w232 I      ��4���� 	0 _asin  4 5��5 o      ���� 0 x  ��  ��  3 k     �66 787 r     9:9 A     ;<; o     ���� 0 x  < m    ����  : o      ���� 0 isneg isNeg8 =>= Z   ?@����? o    ���� 0 isneg isNeg@ r   
 ABA d   
 CC o   
 ���� 0 x  B o      ���� 0 x  ��  ��  > DED Z   %FG����F ?    HIH o    ���� 0 x  I m    ���� G R    !��JK
�� .ascrerr ****      � ****J m     LL �MM T I n v a l i d   n u m b e r   ( n o t   b e t w e e n   - 1 . 0   a n d   1 . 0 ) .K ��NO
�� 
errnN m    �����YO ��P��
�� 
erobP o    ���� 0 x  ��  ��  ��  E QRQ Z   & �STUVS ?   & )WXW o   & '���� 0 x  X m   ' (YY ?�      T k   , ZZ [\[ r   , 1]^] \   , /_`_ m   , -���� ` o   - .���� 0 x  ^ o      ���� 0 zz  \ aba r   2 Wcdc ^   2 Uefe ]   2 Eghg o   2 3���� 0 zz  h l  3 Di����i [   3 Djkj ]   3 Blml l  3 @n����n \   3 @opo ]   3 >qrq l  3 <s����s [   3 <tut ]   3 :vwv l  3 8x����x \   3 8yzy ]   3 6{|{ m   3 4}} ?hOØ��| o   4 5���� 0 zz  z m   6 7~~ ?��Y�,���  ��  w o   8 9���� 0 zz  u m   : ; @����?���  ��  r o   < =���� 0 zz  p m   > ?�� @9����"��  ��  m o   @ A���� 0 zz  k m   B C�� @<�b@����  ��  f l  E T������ [   E T��� ]   E R��� l  E P������ \   E P��� ]   E N��� l  E L������ [   E L��� ]   E J��� l  E H������ \   E H��� o   E F���� 0 zz  � m   F G�� @5򢶿]R��  ��  � o   H I���� 0 zz  � m   J K�� @bb�j1��  ��  � o   L M���� 0 zz  � m   N O�� @w���c���  ��  � o   P Q���� 0 zz  � m   R S�� @ug	��D���  ��  d o      ���� 0 p  b ��� r   X _��� a   X ]��� l  X [������ [   X [��� o   X Y���� 0 zz  � o   Y Z���� 0 zz  ��  ��  � m   [ \�� ?�      � o      ���� 0 zz  � ��� r   ` i��� \   ` g��� l  ` e������ ^   ` e��� 1   ` c��
�� 
pi  � m   c d���� ��  ��  � o   e f���� 0 zz  � o      ���� 0 z  � ��� r   j s��� \   j q��� ]   j m��� o   j k���� 0 zz  � o   k l���� 0 p  � m   m p�� <��&3\
� o      ���� 0 zz  � ���� r   t ��� [   t }��� \   t w��� o   t u���� 0 z  � o   u v���� 0 zz  � l  w |������ ^   w |��� 1   w z��
�� 
pi  � m   z {���� ��  ��  � o      ���� 0 z  ��  U ��� A   � ���� o   � ����� 0 x  � m   � ��� >Ey��0�:� ���� r   � ���� o   � ����� 0 x  � o      ���� 0 z  ��  V k   � ��� ��� r   � ���� ]   � ���� o   � ����� 0 x  � o   � ����� 0 x  � o      ���� 0 zz  � ���� r   � ���� [   � ���� ]   � ���� ^   � ���� ]   � ���� o   � ����� 0 zz  � l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� m   � ��� ?qk��v�� o   � ����� 0 zz  � m   � ��� ?�CA3>M���  ��  � o   � ����� 0 zz  � m   � ��� @�K�/��  ��  � o   � ����� 0 zz  � m   � ��� @0C1�'����  ��  � o   � ����� 0 zz  � m   � ��� @3��w����  ��  � o   � ����� 0 zz  � m   � ��� @ elΰ8��  ��  � l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � �� � l  � ����� \   � � ]   � � l  � ����� [   � � ]   � �	
	 l  � ����� \   � � o   � ����� 0 zz   m   � � @-{Y^���  ��  
 o   � ����� 0 zz   m   � � @Q��%��6��  ��   o   � ����� 0 zz   m   � � @be�m5v���  ��    o   � ����� 0 zz  � m   � � @apV������  ��  � o   � ����� 0 zz  � m   � � @H�"
6���  ��  � o   � ����� 0 x  � o   � ����� 0 x  � o      ���� 0 z  ��  R  Z  � ����� o   � ����� 0 isneg isNeg r   � � d   � � o   � ����� 0 z   o      ���� 0 z  ��  ��   �� L   � � ^   � � o   � ����� 0 z   l  � ����� ^   � �  1   � ��
� 
pi    m   � ��~�~ ���  ��  ��  1 !"! l     �}�|�{�}  �|  �{  " #$# l     �z�y�x�z  �y  �x  $ %&% l     �w�v�u�w  �v  �u  & '(' i  x {)*) I     �t+�s
�t .Mth:Sinanull���     doub+ o      �r�r 0 x  �s  * Q     ,-., L    // I    �q0�p�q 	0 _asin  0 1�o1 c    232 o    �n�n 0 x  3 m    �m
�m 
nmbr�o  �p  - R      �l45
�l .ascrerr ****      � ****4 o      �k�k 0 etext eText5 �j67
�j 
errn6 o      �i�i 0 enumber eNumber7 �h89
�h 
erob8 o      �g�g 0 efrom eFrom9 �f:�e
�f 
errt: o      �d�d 
0 eto eTo�e  . I    �c;�b�c 
0 _error  ; <=< m    >> �??  a s i n= @A@ o    �a�a 0 etext eTextA BCB o    �`�` 0 enumber eNumberC DED o    �_�_ 0 efrom eFromE F�^F o    �]�] 
0 eto eTo�^  �b  ( GHG l     �\�[�Z�\  �[  �Z  H IJI l     �Y�X�W�Y  �X  �W  J KLK i  | MNM I     �VO�U
�V .Mth:Cosanull���     doubO o      �T�T 0 x  �U  N Q      PQRP L    SS \    TUT m    �S�S ZU l   V�R�QV I    �PW�O�P 	0 _asin  W X�NX c    YZY o    �M�M 0 x  Z m    �L
�L 
nmbr�N  �O  �R  �Q  Q R      �K[\
�K .ascrerr ****      � ****[ o      �J�J 0 etext eText\ �I]^
�I 
errn] o      �H�H 0 enumber eNumber^ �G_`
�G 
erob_ o      �F�F 0 efrom eFrom` �Ea�D
�E 
errta o      �C�C 
0 eto eTo�D  R I     �Bb�A�B 
0 _error  b cdc m    ee �ff  a c o sd ghg o    �@�@ 0 etext eTexth iji o    �?�? 0 enumber eNumberj klk o    �>�> 0 efrom eFroml m�=m o    �<�< 
0 eto eTo�=  �A  L non l     �;�:�9�;  �:  �9  o pqp l     �8�7�6�8  �7  �6  q rsr i  � �tut I     �5v�4
�5 .Mth:Tananull���     doubv o      �3�3 0 x  �4  u Q     *wxyw k    zz {|{ r    }~} c    � o    �2�2 0 x  � m    �1
�1 
nmbr~ o      �0�0 0 x  | ��/� L   	 �� I   	 �.��-�. 	0 _asin  � ��,� ^   
 ��� o   
 �+�+ 0 x  � l   ��*�)� a    ��� l   ��(�'� [    ��� ]    ��� o    �&�& 0 x  � o    �%�% 0 x  � m    �$�$ �(  �'  � m    �� ?�      �*  �)  �,  �-  �/  x R      �#��
�# .ascrerr ****      � ****� o      �"�" 0 etext eText� �!��
�! 
errn� o      � �  0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  y I     *���� 
0 _error  � ��� m   ! "�� ���  a t a n� ��� o   " #�� 0 etext eText� ��� o   # $�� 0 enumber eNumber� ��� o   $ %�� 0 efrom eFrom� ��� o   % &�� 
0 eto eTo�  �  s ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ����  �  -----   � ��� 
 - - - - -� ��� l     ����  �   hyperbolic   � ���    h y p e r b o l i c� ��� l     ��
�	�  �
  �	  � ��� i  � ���� I     ���
� .Mth:Sinhnull���     doub� o      �� 0 x  �  � Q     .���� k    �� ��� r    ��� c    ��� o    �� 0 x  � m    �
� 
nmbr� o      �� 0 x  � ��� L   	 �� ]   	 ��� m   	 
�� ?�      � l  
 ��� � \   
 ��� a   
 ��� o   
 ���� 	0 __e__  � o    ���� 0 x  � a    ��� o    ���� 	0 __e__  � d    �� o    ���� 0 x  �  �   �  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I   $ .������� 
0 _error  � ��� m   % &�� ��� 
 a s i n h� ��� o   & '���� 0 etext eText� ��� o   ' (���� 0 enumber eNumber� ��� o   ( )���� 0 efrom eFrom� ���� o   ) *���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Mth:Coshnull���     doub� o      ���� 0 x  ��  � Q     .���� k    �� ��� r    ��� c    ��� o    ���� 0 x  � m    ��
�� 
nmbr� o      ���� 0 x  � ���� L   	 �� ]   	 ��� m   	 
�� ?�      � l  
 ������ [   
 ��� a   
 ��� o   
 ���� 	0 __e__  � o    ���� 0 x  � a    � � o    ���� 	0 __e__    d     o    ���� 0 x  ��  ��  ��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  � I   $ .��	���� 
0 _error  	 

 m   % & � 
 a c o s h  o   & '���� 0 etext eText  o   ' (���� 0 enumber eNumber  o   ( )���� 0 efrom eFrom �� o   ) *���� 
0 eto eTo��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��    i  � � I     ����
�� .Mth:Tanhnull���     doub o      ���� 0 x  ��   Q     =  k    +!! "#" r    $%$ c    &'& o    ���� 0 x  ' m    ��
�� 
nmbr% o      ���� 0 x  # (��( L   	 +)) ^   	 **+* l  	 ,����, \   	 -.- a   	 /0/ o   	 ���� 	0 __e__  0 o    ���� 0 x  . a    121 o    ���� 	0 __e__  2 d    33 o    ���� 0 x  ��  ��  + l   )4����4 [    )565 a     787 o    ���� 	0 __e__  8 o    ���� 0 x  6 a     (9:9 o     %���� 	0 __e__  : d   % ';; o   % &���� 0 x  ��  ��  ��   R      ��<=
�� .ascrerr ****      � ****< o      ���� 0 etext eText= ��>?
�� 
errn> o      ���� 0 enumber eNumber? ��@A
�� 
erob@ o      ���� 0 efrom eFromA ��B��
�� 
errtB o      ���� 
0 eto eTo��    I   3 =��C���� 
0 _error  C DED m   4 5FF �GG 
 a t a n hE HIH o   5 6���� 0 etext eTextI JKJ o   6 7���� 0 enumber eNumberK LML o   7 8���� 0 efrom eFromM N��N o   8 9���� 
0 eto eTo��  ��   OPO l     ��������  ��  ��  P QRQ l     ��������  ��  ��  R STS l     ��UV��  U J D--------------------------------------------------------------------   V �WW � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -T XYX l     ��Z[��  Z   Logarithms   [ �\\    L o g a r i t h m sY ]^] l     ��������  ��  ��  ^ _`_ i  � �aba I      ��c���� 
0 _frexp  c d��d o      ���� 0 m  ��  ��  b k     nee fgf Z    hi����h =    jkj o     ���� 0 m  k m    ����  i L    ll J    
mm non m    pp         o q��q m    ����  ��  ��  ��  g rsr r    tut A    vwv o    ���� 0 m  w m    ����  u o      ���� 0 isneg isNegs xyx Z   "z{����z o    ���� 0 isneg isNeg{ r    |}| d    ~~ o    ���� 0 m  } o      ���� 0 m  ��  ��  y � r   # &��� m   # $����  � o      ���� 0 e  � ��� W   ' [��� Z   7 V������ @   7 :��� o   7 8�� 0 m  � m   8 9�~�~ � k   = H�� ��� r   = B��� ^   = @��� o   = >�}�} 0 m  � m   > ?�|�| � o      �{�{ 0 m  � ��z� r   C H��� [   C F��� o   C D�y�y 0 e  � m   D E�x�x � o      �w�w 0 e  �z  ��  � k   K V�� ��� r   K P��� ]   K N��� o   K L�v�v 0 m  � m   L M�u�u � o      �t�t 0 m  � ��s� r   Q V��� \   Q T��� o   Q R�r�r 0 e  � m   R S�q�q � o      �p�p 0 e  �s  � F   + 6��� @   + .��� o   + ,�o�o 0 m  � m   , -�� ?�      � A   1 4��� o   1 2�n�n 0 m  � m   2 3�m�m � ��� Z  \ h���l�k� o   \ ]�j�j 0 isneg isNeg� r   ` d��� d   ` b�� o   ` a�i�i 0 m  � o      �h�h 0 m  �l  �k  � ��g� L   i n�� J   i m�� ��� o   i j�f�f 0 m  � ��e� o   j k�d�d 0 e  �e  �g  ` ��� l     �c�b�a�c  �b  �a  � ��� l     �`�_�^�`  �_  �^  � ��� i  � ���� I      �]��\�] 	0 _logn  � ��[� o      �Z�Z 0 x  �[  �\  � k    ;�� ��� Z    ���Y�X� B     ��� o     �W�W 0 x  � m    �V�V  � R    �U��
�U .ascrerr ****      � ****� m   
 �� ��� 8 I n v a l i d   n u m b e r   ( m u s t   b e   > 0 ) .� �T��S
�T 
errn� m    	�R�R�Y�S  �Y  �X  � ��� r    &��� I      �Q��P�Q 
0 _frexp  � ��O� o    �N�N 0 x  �O  �P  � J      �� ��� o      �M�M 0 x  � ��L� o      �K�K 0 e  �L  � ��� Z   '8���J�� G   ' 2��� A   ' *��� o   ' (�I�I 0 e  � m   ( )�H�H��� ?   - 0��� o   - .�G�G 0 e  � m   . /�F�F � k   5 ��� ��� Z   5 ^���E�� A   5 8��� o   5 6�D�D 0 x  � m   6 7�� ?栞fK�� l  ; N���� k   ; N�� ��� r   ; @��� \   ; >��� o   ; <�C�C 0 e  � m   < =�B�B � o      �A�A 0 e  � ��� r   A F��� \   A D��� o   A B�@�@ 0 x  � m   B C�� ?�      � o      �?�? 0 z  � ��>� r   G N��� [   G L   ]   G J m   G H ?�       o   H I�=�= 0 z   m   J K ?�      � o      �<�< 0 y  �>  �   (2 ^ 0.5) / 2   � �    ( 2   ^   0 . 5 )   /   2�E  � k   Q ^ 	 r   Q V

 \   Q T o   Q R�;�; 0 x   m   R S�:�:  o      �9�9 0 z  	 �8 r   W ^ [   W \ ]   W Z m   W X ?�       o   X Y�7�7 0 x   m   Z [ ?�       o      �6�6 0 y  �8  �  r   _ d ^   _ b o   _ `�5�5 0 z   o   ` a�4�4 0 y   o      �3�3 0 x    r   e j  ]   e h!"! o   e f�2�2 0 x  " o   f g�1�1 0 x    o      �0�0 0 z   #$# r   k �%&% ^   k �'(' ]   k x)*) ]   k n+,+ o   k l�/�/ 0 x  , o   l m�.�. 0 z  * l  n w-�-�,- \   n w./. ]   n u010 l  n s2�+�*2 [   n s343 ]   n q565 m   n o77 ��D=�l�6 o   o p�)�) 0 z  4 m   q r88 @0b�s{��+  �*  1 o   s t�(�( 0 z  / m   u v99 @P	"*?�-  �,  ( l  x �:�'�&: \   x �;<; ]   x �=>= l  x ?�%�$? [   x @A@ ]   x }BCB l  x {D�#�"D \   x {EFE o   x y�!�! 0 z  F m   y zGG @A�C�l��#  �"  C o   { |� �  0 z  A m   } ~HH @s��*�
�%  �$  > o    ��� 0 z  < m   � �II @���?;�'  �&  & o      �� 0 z  $ JKJ r   � �LML o   � ��� 0 e  M o      �� 0 y  K N�N r   � �OPO [   � �QRQ [   � �STS \   � �UVU o   � ��� 0 z  V ]   � �WXW o   � ��� 0 y  X m   � �YY ?+�\a�T o   � ��� 0 x  R ]   � �Z[Z o   � ��� 0 e  [ m   � �\\ ?�0     P o      �� 0 z  �  �J  � k   �8]] ^_^ Z   � �`a�b` A   � �cdc o   � ��� 0 x  d m   � �ee ?栞fK�a l  � �fghf k   � �ii jkj r   � �lml \   � �non o   � ��� 0 e  o m   � ��� m o      �� 0 e  k p�p r   � �qrq \   � �sts ]   � �uvu m   � ��� v o   � ��� 0 x  t m   � ��� r o      �� 0 x  �  g   (2 ^ 0.5) / 2   h �ww    ( 2   ^   0 . 5 )   /   2�  b r   � �xyx \   � �z{z o   � ��� 0 x  { m   � ��
�
 y o      �	�	 0 x  _ |}| r   � �~~ ]   � ���� o   � ��� 0 x  � o   � ��� 0 x   o      �� 0 z  } ��� r   ���� ^   ���� ]   � ���� ]   � ���� o   � ��� 0 x  � o   � ��� 0 z  � l  � ����� [   � ���� ]   � ���� l  � ���� � [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� m   � ��� ?���� o   � ����� 0 x  � m   � ��� ?���?Vd���  ��  � o   � ����� 0 x  � m   � ��� @Һ�i���  ��  � o   � ����� 0 x  � m   � ��� @,�r�>����  ��  � o   � ����� 0 x  � m   � ��� @1�֒K�R�  �   � o   � ����� 0 x  � m   � ��� @�c}~ݝ�  �  � l  ������� [   ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� o   � ����� 0 x  � m   � ��� @&� �����  ��  � o   � ����� 0 x  � m   � ��� @F�,N���  ��  � o   � ����� 0 x  � m   � ��� @T�3�&����  ��  � o   � ����� 0 x  � m   � ��� @Q���^���  ��  � o   � ����� 0 x  � m   � �� @7 
�&5��  ��  � o      ���� 0 y  � ��� Z  ������� >  ��� o  ���� 0 e  � m  ����  � r  ��� \  ��� o  ���� 0 y  � ]  ��� o  ���� 0 e  � m  �� ?+�\a�� o      ���� 0 y  ��  ��  � ��� r  ��� \  ��� o  ���� 0 y  � l ������ ^  ��� o  ���� 0 z  � m  ���� ��  ��  � o      ���� 0 y  � ��� r  $��� [  "��� o   ���� 0 x  � o   !���� 0 y  � o      ���� 0 z  � ���� Z %8������� >  %(��� o  %&���� 0 e  � m  &'����  � r  +4��� [  +2��� o  +,���� 0 z  � ]  ,1��� o  ,-���� 0 e  � m  -0�� ?�0     � o      ���� 0 z  ��  ��  ��  � ���� L  9;�� o  9:���� 0 z  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Mth:Lognnull���     doub� o      ���� 0 x  ��  � Q     ���� L    �� I    �� ���� 	0 _logn    �� c     o    ���� 0 x   m    ��
�� 
nmbr��  ��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��	
�� 
erob o      ���� 0 efrom eFrom	 ��
��
�� 
errt
 o      ���� 
0 eto eTo��  � I    ������ 
0 _error    m     �  l o g n  o    ���� 0 etext eText  o    ���� 0 enumber eNumber  o    ���� 0 efrom eFrom �� o    ���� 
0 eto eTo��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��    i  � � I     ����
�� .Mth:Lo10null���     doub o      ���� 0 x  ��   Q     $ !"  l   #$%# L    && ^    '(' ]    )*) l   +����+ ^    ,-, I    ��.���� 	0 _logn  . /��/ c    010 o    ���� 0 x  1 m    ��
�� 
nmbr��  ��  - m    22 @k���T���  ��  * m    33 @r�     ( m    44 @r�    j$   correct for minor drift   % �55 0   c o r r e c t   f o r   m i n o r   d r i f t! R      ��67
�� .ascrerr ****      � ****6 o      ���� 0 etext eText7 ��89
�� 
errn8 o      ���� 0 enumber eNumber9 ��:;
�� 
erob: o      ���� 0 efrom eFrom; ��<��
�� 
errt< o      ���� 
0 eto eTo��  " I    $��=��� 
0 _error  = >?> m    @@ �AA 
 l o g 1 0? BCB o    �� 0 etext eTextC DED o    �� 0 enumber eNumberE FGF o    �� 0 efrom eFromG H�H o     �� 
0 eto eTo�  �   IJI l     ����  �  �  J KLK l     ����  �  �  L MNM i  � �OPO I     �QR
� .Mth:Logbnull���     doubQ o      �� 0 x  R �S�
� 
BaseS o      �� 0 b  �  P Q     'TUVT L    WW ^    XYX I    �~Z�}�~ 	0 _logn  Z [�|[ c    \]\ o    �{�{ 0 x  ] m    �z
�z 
nmbr�|  �}  Y l   ^�y�x^ I    �w_�v�w 	0 _logn  _ `�u` c    aba o    �t�t 0 b  b m    �s
�s 
nmbr�u  �v  �y  �x  U R      �rcd
�r .ascrerr ****      � ****c o      �q�q 0 etext eTextd �pef
�p 
errne o      �o�o 0 enumber eNumberf �ngh
�n 
erobg o      �m�m 0 efrom eFromh �li�k
�l 
errti o      �j�j 
0 eto eTo�k  V I    '�ij�h�i 
0 _error  j klk m    mm �nn  l o g bl opo o     �g�g 0 etext eTextp qrq o     !�f�f 0 enumber eNumberr sts o   ! "�e�e 0 efrom eFromt u�du o   " #�c�c 
0 eto eTo�d  �h  N vwv l     �b�a�`�b  �a  �`  w x�_x l     �^�]�\�^  �]  �\  �_       &�[yz{| h r}~�����������������������������[  y $�Z�Y�X�W�V�U�T�S�R�Q�P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;�:�9�8�7
�Z 
pimr�Y 0 _support  �X 
0 _error  �W 	0 __e__  �V 0 _isequaldelta _isEqualDelta�U (0 _asintegerproperty _asIntegerProperty�T ,0 _makenumberformatter _makeNumberFormatter�S "0 _setbasicformat _setBasicFormat�R  0 _nameforformat _nameForFormat
�Q .Mth:FNumnull���     nmbr
�P .Mth:PNumnull���     ctxt
�O .Mth:NuHenull���     ****
�N .Mth:HeNunull���     ctxt
�M .Mth:DeRanull���     doub
�L .Mth:RaDenull���     doub
�K .Mth:Abs_null���     nmbr
�J .Mth:CmpNnull���     ****
�I .Mth:MinNnull���     ****
�H .Mth:MaxNnull���     ****
�G .Mth:RouNnull���     nmbr�F 0 _sin  
�E .Mth:Sin_null���     doub
�D .Mth:Cos_null���     doub
�C .Mth:Tan_null���     doub�B 	0 _asin  
�A .Mth:Sinanull���     doub
�@ .Mth:Cosanull���     doub
�? .Mth:Tananull���     doub
�> .Mth:Sinhnull���     doub
�= .Mth:Coshnull���     doub
�< .Mth:Tanhnull���     doub�; 
0 _frexp  �: 	0 _logn  
�9 .Mth:Lognnull���     doub
�8 .Mth:Lo10null���     doub
�7 .Mth:Logbnull���     doubz �6��6 �  ��� �5��4
�5 
cobj� ��   �3 
�3 
frmk�4  � �2��1
�2 
cobj� ��   �0
�0 
osax�1  { ��   �/ /
�/ 
scpt| �. 7�-�,���+�. 
0 _error  �- �*��* �  �)�(�'�&�%�) 0 handlername handlerName�( 0 etext eText�' 0 enumber eNumber�& 0 efrom eFrom�% 
0 eto eTo�,  � �$�#�"�!� �$ 0 handlername handlerName�# 0 etext eText�" 0 enumber eNumber�! 0 efrom eFrom�  
0 eto eTo�  G��� � &0 throwcommanderror throwCommandError�+ b  ࠡ����+ } � ������� (0 _asintegerproperty _asIntegerProperty� ��� �  ���� 0 thevalue theValue� 0 propertyname propertyName� 0 minvalue minValue�  � ����� 0 thevalue theValue� 0 propertyname propertyName� 0 minvalue minValue� 0 n  � 	������� � �
� 
long
� 
doub
� 
bool
� 
errn��Y�  � ��
�	
� 
errn�
�Y�	  � 9 (��&E�O���&
 ���& )��lhY hO�W X  )��l�%�%~ � ������� ,0 _makenumberformatter _makeNumberFormatter� ��� �  ���� 0 formatstyle formatStyle� 0 
localecode 
localeCode� 0 defaultstyle defaultStyle�  � � �������������  0 formatstyle formatStyle�� 0 
localecode 
localeCode�� 0 defaultstyle defaultStyle�� 0 asocformatter asocFormatter�� 0 formatrecord formatRecord�� 0 s  �� 0 etext eText� F��������������������������������������������+����A��Z����x���������������������������������������������������G�W��d������z����
�� misccura�� &0 nsnumberformatter NSNumberFormatter�� 	0 alloc  �� 0 init  
�� 
kocl
�� 
reco
�� .corecnte****       ****
�� 
pcls
�� 
MthR
�� 
MthA�� 0 requiredvalue RequiredValue
�� 
MthB
�� 
msng
�� 
MthC
�� 
MthD
�� 
MthE
�� 
MthF
�� 
MthG
�� 
MthH�� �� 60 asoptionalrecordparameter asOptionalRecordParameter�� "0 _setbasicformat _setBasicFormat�� (0 _asintegerproperty _asIntegerProperty�� 60 setminimumfractiondigits_ setMinimumFractionDigits_�� 60 setmaximumfractiondigits_ setMaximumFractionDigits_�� <0 setminimumsignificantdigits_ setMinimumSignificantDigits_�� 60 setusessignificantdigits_ setUsesSignificantDigits_�� <0 setmaximumsignificantdigits_ setMaximumSignificantDigits_
�� 
ctxt
�� 
leng
�� 
errn���Y�� ,0 setdecimalseparator_ setDecimalSeparator_��  � ����
�� 
errn��\�  �� .0 setgroupingseparator_ setGroupingSeparator_�� 60 setusesgroupingseparator_ setUsesGroupingSeparator_
�� MRndRNhE�� @0 nsnumberformatterroundhalfeven NSNumberFormatterRoundHalfEven�� $0 setroundingmode_ setRoundingMode_
�� MRndRNhT�� @0 nsnumberformatterroundhalfdown NSNumberFormatterRoundHalfDown
�� MRndRNhF�� <0 nsnumberformatterroundhalfup NSNumberFormatterRoundHalfUp
�� MRndRN_T�� 80 nsnumberformatterrounddown NSNumberFormatterRoundDown
�� MRndRN_F�� 40 nsnumberformatterroundup NSNumberFormatterRoundUp
�� MRndRN_U�� >0 nsnumberformatterroundceiling NSNumberFormatterRoundCeiling
�� MRndRN_D�� :0 nsnumberformatterroundfloor NSNumberFormatterRoundFloor� ���
� 
errn��Y�  �� 0 etext eText
�� 
enum�� �� .0 throwinvalidparameter throwInvalidParameter�� *0 asnslocaleparameter asNSLocaleParameter�� 0 
setlocale_ 
setLocale_����,j+ j+ E�OG�kv��l k b  ����b  �,��������a �a �a �a a m+ E�O*���,�m+ O��,� �*��,a jm+ k+ Y hO��,� �*��,a jm+ k+ Y hO��,� �*��,a jm+ k+ O�ek+ Y hO��,� �*��,a jm+ k+  O�ek+ Y hO�a ,� G 0�a ,a !&E�O�a ",j  )a #a $lhY hO��k+ %W X & ')a #a $la (Y hO�a ,� 1 ��a ,a !&k+ )O�ek+ *W X & ')a #a $la +Y hO�a ,� ��a ,a ,  ��a -,k+ .Y ��a ,a /  ��a 0,k+ .Y ��a ,a 1  ��a 2,k+ .Y r�a ,a 3  ��a 4,k+ .Y Y�a ,a 5  ��a 6,k+ .Y @�a ,a 7  ��a 8,k+ .Y '�a ,a 9  ��a :,k+ .Y )a #a $la ;Y hY  *���m+ W X & <)ja =W X > <b  �a ?�a @lv�a A+ BO�b  �a Cl+ Dk+ EO� �������� "0 _setbasicformat _setBasicFormat� ��� �  ���� 0 asocformatter asocFormatter� 0 
formatname 
formatName� 0 defaultstyle defaultStyle�  � ���� 0 asocformatter asocFormatter� 0 
formatname 
formatName� 0 defaultstyle defaultStyle� �������������������������
� MthZMth0� "0 setnumberstyle_ setNumberStyle_
� MthZMth3
� misccura� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle
� MthZMth1� 40 nsnumberformatternostyle NSNumberFormatterNoStyle
� MthZMth2� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle
� MthZMth5� @0 nsnumberformattercurrencystyle NSNumberFormatterCurrencyStyle
� MthZMth4� >0 nsnumberformatterpercentstyle NSNumberFormatterPercentStyle
� MthZMth6� @0 nsnumberformatterspelloutstyle NSNumberFormatterSpellOutStyle
� 
kocl
� 
ctxt
� .corecnte****       ****� 0 
setformat_ 
setFormat_
� 
errn��Y
� 
erob
� 
errt
� 
enum� � ���  ��k+ Y ���  ���,k+ Y ���  ���,k+ Y w��  ���,k+ Y f��  ���,k+ Y U��  ���,k+ Y D��  ���,k+ Y 3�kv�a l j ��k+ Y )a a a �a a a a � �������  0 _nameforformat _nameForFormat� ��� �  �� 0 formatstyle formatStyle�  � �� 0 formatstyle formatStyle� �)�2�;�D�M�U\^
� MthZMth1
� MthZMth2
� MthZMth5
� MthZMth4
� MthZMth3
� MthZMth6� I��  �Y ?��  �Y 4��  �Y )��  �Y ��  �Y ��  �Y �%�%� �o�����
� .Mth:FNumnull���     nmbr� 0 	thenumber 	theNumber� ���
� 
Usin� {���� 0 formatstyle formatStyle�  
� MthZMth0� ���
� 
Loca� {��~�}� 0 
localecode 
localeCode�~  
�} 
msng�  � �|�{�z�y�x�w�v�u�t�s�r�| 0 	thenumber 	theNumber�{ 0 formatstyle formatStyle�z 0 
localecode 
localeCode�y 0 asocformatter asocFormatter�x 0 defaultstyle defaultStyle�w 0 defaultformat defaultFormat�v 0 
asocstring 
asocString�u 0 etext eText�t 0 enumber eNumber�s 0 efrom eFrom�r 
0 eto eTo� "�q�p�o���n�m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y��X�W��V�U
�q 
kocl
�p 
nmbr
�o .corecnte****       ****�n �m 60 throwinvalidparametertype throwInvalidParameterType
�l MthZMth0
�k 
msng
�j 
bool
�i misccura�h &0 nsnumberformatter NSNumberFormatter�g 	0 alloc  �f 0 init  �e 0 nslocale NSLocale�d 0 systemlocale systemLocale�c 0 
setlocale_ 
setLocale_
�b 
pcls
�a 
long�` 40 nsnumberformatternostyle NSNumberFormatterNoStyle�_ "0 setnumberstyle_ setNumberStyle_�^ D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle�] ,0 _makenumberformatter _makeNumberFormatter�\ &0 stringfromnumber_ stringFromNumber_
�[ 
errn�Z�Y
�Y 
erob
�X 
ctxt�W 0 etext eText� �T�S�
�T 
errn�S 0 enumber eNumber� �R�Q�
�R 
erob�Q 0 efrom eFrom� �P�O�N
�P 
errt�O 
0 eto eTo�N  �V �U 
0 _error  � � ��kv��l j  b  �����+ Y hO�� 	 �� �& C��,j+ j+ E�O���,j+ k+ O�a ,a   ��a ,k+ Y ��a ,k+ Y �a ,E�O*���m+ E�O��k+ E�O��  )a a a ��a Y hO�a &W X  *a ����a  + !� �M �L�K���J
�M .Mth:PNumnull���     ctxt�L 0 thetext theText�K �I��
�I 
Usin� {�H�G�F�H 0 formatstyle formatStyle�G  
�F MthZMth0� �E��D
�E 
Loca� {�C�B�A�C 0 
localecode 
localeCode�B  
�A 
msng�D  � 
�@�?�>�=�<�;�:�9�8�7�@ 0 thetext theText�? 0 formatstyle formatStyle�> 0 
localecode 
localeCode�= 0 asocformatter asocFormatter�< 0 
asocnumber 
asocNumber�; $0 localeidentifier localeIdentifier�: 0 etext eText�9 0 enumber eNumber�8 0 efrom eFrom�7 
0 eto eTo� (�6�5�4FJ�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!���� ������������
�6 
kocl
�5 
ctxt
�4 .corecnte****       ****�3 �2 60 throwinvalidparametertype throwInvalidParameterType
�1 MthZMth0
�0 
msng
�/ 
bool
�. misccura�- &0 nsnumberformatter NSNumberFormatter�, 	0 alloc  �+ 0 init  �* 0 nslocale NSLocale�) 0 systemlocale systemLocale�( 0 
setlocale_ 
setLocale_�' D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle�& "0 setnumberstyle_ setNumberStyle_�% ,0 _makenumberformatter _makeNumberFormatter�$ &0 numberfromstring_ numberFromString_�# 
0 locale  �" $0 localeidentifier localeIdentifier
�! 
leng
�  
errn��Y
� 
erob�  0 _nameforformat _nameForFormat
� 
****� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �J � ͠kv��l j  b  �����+ Y hO�� 	 �� �& *��,j+ j+ E�O���,j+ k+ O��a ,k+ Y *��fm+ E�O��k+ E�O��  R�j+ j+ �&E�O�a ,j  
a E�Y a �%a %E�O)a a a ��a *�k+ %a  %�%a !%Y hO�a "&W X # $*a %����a &+ '� �������
� .Mth:NuHenull���     ****� 0 	thenumber 	theNumber� ���
� 
Plac� {���
� 0 	chunksize 	chunkSize�  �
  � �	��
�	 
Pref� {���� 0 	hasprefix 	hasPrefix�  
� boovfals�  � ����� ������������������� 0 	thenumber 	theNumber� 0 	chunksize 	chunkSize� 0 	hasprefix 	hasPrefix� 0 hextext hexText�  0 	hexprefix 	hexPrefix�� 0 padtext padText�� 0 maxsize maxSize�� 0 
resultlist 
resultList�� 0 aref aRef�� 0 oldtids oldTIDs�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� >����������=������V��[����a�����������������%*4G��K������������������������������������� (0 asintegerparameter asIntegerParameter�� (0 asbooleanparameter asBooleanParameter
�� 
kocl
�� 
list
�� .corecnte****       ****�� 00 aswholenumberparameter asWholeNumberParameter�� 
�� 
bool
�� 
long�� �� .0 throwinvalidparameter throwInvalidParameter������ 
�� 
cobj
�� 
leng�� 0 
resultlist 
resultList� �����������
�� .ascrinit****      � ****� k     	�� K����  ��  ��  � ���� 
0 _list_  � ����
�� 
cobj�� 
0 _list_  �� 
b   �-E��� 
0 _list_  
�� 
pcnt
�� 
doub
�� 
errn���\��  � ������
�� 
errn���\��  
�� 
ctxt
�� 
ascr
�� 
txdl�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ���b  ��l+ E�Ob  ��l+ E�O�kv��l j b  ��l+ E�O�j
 ���& b  �����+ Y hOa E�O�j I�j	 �a �$�& (b  �a �a a �$%a %a �$k%�+ Y hOa E�O�'E�Y Ca E�O�j	 �a �$k�& (b  �a �a a �$%a %a �$k%�+ Y hO� �a %E�Y hO &h�ja a �a #k/�%E�O�a "E�[OY��O h�a ,�a �%E�[OY��O��%Y{�k
 ���& b  �a  �a !�+ Y hOa "a �$klvE[a k/E�Z[a l/E�ZO �kh�a #%E�[OY��Oa $a %K &S�O ӧa ',[�a l kh  ;�a (,�&E�O��a (,a )&
 �j�&
 ���& )a *a +lhY hW :X , -�� b  �a .�a /a �$k%�+ Y b  �a 0�a 1�+ Oa 2E�O &h�ja 3a �a #k/�%E�O�a "E�[OY��O��%[a 4\[Z�'\Zi2�a (,F[OY�AO_ 5a 6,E�Oa 7_ 5a 6,FO� a 8�a ',%E�Y �a ',a 4&E�O�_ 5a 6,FO�W X 9 :*a ;����a <+ =� ����������
�� .Mth:HeNunull���     ctxt�� 0 hextext hexText�� ����
�� 
Plac� {�������� 0 	chunksize 	chunkSize��  ��  � ����
�� 
Prec� {���� 0 	isprecise 	isPrecise�  
� boovtrue�  � ������������� 0 hextext hexText� 0 	chunksize 	chunkSize� 0 	isprecise 	isPrecise� 0 	thenumber 	theNumber� 0 
isnegative 
isNegative� 0 charref charRef� 0 i  � 0 
resultlist 
resultList� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� 2&'3�?���R�W��d��������������������������'1^������� "0 astextparameter asTextParameter� (0 asintegerparameter asIntegerParameter� 
� 
bool
� 
long� � .0 throwinvalidparameter throwInvalidParameter� (0 asbooleanparameter asBooleanParameter
� 
ctxt
� 
kocl
� 
cobj
� .corecnte****       ****� 
� misccura
� 
psof
� 
psin
� .sysooffslong    ��� null
� 
errn��@�  � ���
� 
errn��@�  ��Y
� 
erob
� 
leng� 0 
resultlist 
resultList� �������
� .ascrinit****      � ****� k     �� ��  �  �  � �� 
0 _list_  � �� 
0 _list_  � jv�� 
0 _list_  � 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  ��cN��Fb  ��l+ E�Ob  ��l+ E�O�j
 ���& b  �����+ Y hOb  ��l+ E�O�j  � �jE�O��E�O� �[a \[Zl\Zi2E�Y hO�a  �[a \[Zm\Zi2E�Y hO U�[a a l kh �a  E�Oa  *a �a a � UE�O�j  )a a lhY hO��kE�[OY��W X  )a a a  ��a !O�	 	��k �& )a a a  ��a "Y hO� 	�'E�Y hO�Y�a #,�#j )a a a  ��a $�%a %%Y hOa &a 'K (S�O �k�a #,E�h jE�O |�[a \[Z�\Z��k2[a a l kh �a  E�Oa  *a �a a )� UE�O�j  &)a a a  �[a \[Z�\Z��k2�a *Y hO��kE�[OY��O�	 	��k �& &)a a a  �[a \[Z�\Z��k2�a +Y hO��a ,,6F[OY�<O�a ,,EVW X - .*a /����a 0+ 1� �������
� .Mth:DeRanull���     doub� 0 x  �  � �~�}�|�{�z�~ 0 x  �} 0 etext eText�| 0 enumber eNumber�{ 0 efrom eFrom�z 
0 eto eTo� �y�x�w�v���u�t
�y 
doub
�x 
pi  �w ��v 0 etext eText� �s�r�
�s 
errn�r 0 enumber eNumber� �q�p�
�q 
erob�p 0 efrom eFrom� �o�n�m
�o 
errt�n 
0 eto eTo�m  �u �t 
0 _error  �  ��&��! W X  *塢���+ � �l��k�j���i
�l .Mth:RaDenull���     doub�k 0 x  �j  � �h�g�f�e�d�h 0 x  �g 0 etext eText�f 0 enumber eNumber�e 0 efrom eFrom�d 
0 eto eTo� �c�b�a�`���_�^
�c 
doub
�b 
pi  �a ��` 0 etext eText� �]�\�
�] 
errn�\ 0 enumber eNumber� �[�Z�
�[ 
erob�Z 0 efrom eFrom� �Y�X�W
�Y 
errt�X 
0 eto eTo�W  �_ �^ 
0 _error  �i  ��&��!!W X  *塢���+ � �V��U�T���S
�V .Mth:Abs_null���     nmbr�U 0 x  �T  � �R�Q�P�O�N�R 0 x  �Q 0 etext eText�P 0 enumber eNumber�O 0 efrom eFrom�N 
0 eto eTo� �M�L�	�K�J
�M 
nmbr�L 0 etext eText� �I�H�
�I 
errn�H 0 enumber eNumber� �G�F�
�G 
erob�F 0 efrom eFrom� �E�D�C
�E 
errt�D 
0 eto eTo�C  �K �J 
0 _error  �S * ��&E�O�j �'Y �W X  *㡢���+ � �B	'�A�@���?
�B .Mth:CmpNnull���     ****�A �>��> �  �=�<�= 0 n1  �< 0 n2  �@  � 	�;�:�9�8�7�6�5�4�3�; 0 n1  �: 0 n2  �9 0 dn  �8 0 dm  �7 0 d  �6 0 etext eText�5 0 enumber eNumber�4 0 efrom eFrom�3 
0 eto eTo� �2�1�0�/�.�-�,�	��+�*
�2 
kocl
�1 
long
�0 .corecnte****       ****
�/ 
doub
�. 
cobj
�- 
bool�, 0 etext eText� �)�(�
�) 
errn�( 0 enumber eNumber� �'�&�
�' 
erob�& 0 efrom eFrom� �%�$�#
�% 
errt�$ 
0 eto eTo�#  �+ �* 
0 _error  �? � ���lv��l l  ��  jY hY s��&��&lvE[�k/E�Z[�l/E�ZO�j  b  � E�Y b  � E�O�'E�O�� ��lvE[�k/E�Z[�l/E�ZY hO��E�O��	 ���& jY hO�� iY kW X  *襦���+ 
� �"	��!� ���
�" .Mth:MinNnull���     ****�! 0 thelist theList�   � 	���������� 0 thelist theList� 0 
listobject 
listObject� 0 	theresult 	theResult� 0 aref aRef� 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� �	����������	���� 0 
listobject 
listObject� ���
�	���
� .ascrinit****      � ****� k     �� 	���  �
  �	  � �� 
0 _list_  � ��� "0 aslistparameter asListParameter� 
0 _list_  � b  b   k+  �� 
0 _list_  
� 
cobj
� 
nmbr
� 
kocl
� .corecnte****       ****
� 
pcnt� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ��  
� 
erob�  0 efrom eFrom  ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  � X G��K S�O��,�k/�&E�O +��,[��l kh ��,�&E�O�� �E�Y h[OY��O�W X 	 
*륦���+ � ��	�������
�� .Mth:MaxNnull���     ****�� 0 thelist theList��   	�������������������� 0 thelist theList�� 0 
listobject 
listObject�� 0 	theresult 	theResult�� 0 aref aRef�� 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo ��
 ��������������
4������ 0 
listobject 
listObject ��������
�� .ascrinit****      � **** k      
 ����  ��  ��   ���� 
0 _list_   ������ "0 aslistparameter asListParameter�� 
0 _list_  �� b  b   k+  ��� 
0 _list_  
�� 
cobj
�� 
nmbr
�� 
kocl
�� .corecnte****       ****
�� 
pcnt�� 0 etext eText ����	
�� 
errn�� 0 enumber eNumber	 ����

�� 
erob�� 0 efrom eFrom
 ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� X G��K S�O��,�k/�&E�O +��,[��l kh ��,�&E�O�� �E�Y h[OY��O�W X 	 
*륦���+ � ��
D������
�� .Mth:RouNnull���     nmbr�� 0 num  �� ��
�� 
Plac {�������� 0 decimalplaces decimalPlaces��  ��   ����
�� 
Dire {�������� &0 roundingdirection roundingDirection��  
�� MRndRNhE��   ������������������ 0 num  �� 0 decimalplaces decimalPlaces�� &0 roundingdirection roundingDirection�� 0 themultiplier theMultiplier�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo 
^��
j����
�
�
��
��������������� "0 asrealparameter asRealParameter�� (0 asintegerparameter asIntegerParameter� 

� MRndRNhE
� MRndRNhT
� MRndRNhF
� MRndRN_T
� MRndRN_F
� MRndRN_U
� 
bool
� MRndRN_D� >0 throwinvalidparameterconstant throwInvalidParameterConstant� 0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  � � 
0 _error  ����b  ��l+ E�Ob  ��l+ E�O�j �$E�O�� � �!E�Y hO��  3��lv�l!k#kv 
�k"E�Y �j ��k"E�Y 	��k"E�Y��  1��lv�k#kv 
�k"E�Y �j ��k"E�Y 	��k"E�Y ��  C��lv�k#kv �j �k"kE�Y 	�k"kE�Y �j ��k"E�Y 	��k"E�Y ���  
�k"E�Y ���  ,�k#j  
�k"E�Y �j �k"kE�Y 	�k"kE�Y a��  $�j
 	�k#j �& 
�k"E�Y 	�k"kE�Y 9�a   $�j
 	�k#j �& 
�k"E�Y 	�k"kE�Y b  �a l+ O�j  	�k"Y �j 	��"Y ��!W X  *a ����a + � ������ 0 _sin  � ��   �� 0 x  �   ������� 0 x  � 0 isneg isNeg� 0 y  � 0 z  � 0 z2  � 0 zz   ����/��ilo���������������h
� 
pi  � �� � � 
� 
bool� ��#��! E�O�jE�O� 	�'E�Y hO���! k"E�O��� k"� E�O�l#k  �kE�O�kE�Y hO��#E�O�m �E�O��E�Y hO��� �� �� E�O�� E�O�k 
 �l �& *�l!�� � �� �� �� a � a  E�Y +��� a � a � a � a � a � a  E�O� 	�'E�Y hO�� �����
� .Mth:Sin_null���     doub� 0 x  �   ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo ������
� 
nmbr� 0 _sin  � 0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �  *��&k+ W X  *䡢���+ � �
���
� .Mth:Cos_null���     doub� 0 x  �   ��~�}�|�{� 0 x  �~ 0 etext eText�} 0 enumber eNumber�| 0 efrom eFrom�{ 
0 eto eTo �z�y�x�w!�v�u
�z 
nmbr�y Z�x 0 _sin  �w 0 etext eText �t�s
�t 
errn�s 0 enumber eNumber �r�q
�r 
erob�q 0 efrom eFrom �p�o�n
�p 
errt�o 
0 eto eTo�n  �v �u 
0 _error  � ! *��&�k+ W X  *塢���+ � �m1�l�k !�j
�m .Mth:Tan_null���     doub�l 0 x  �k    
�i�h�g�f�e�d�c�b�a�`�i 0 x  �h 0 isneg isNeg�g 0 y  �f 0 z  �e 0 z2  �d 0 zz  �c 0 etext eText�b 0 enumber eNumber�a 0 efrom eFrom�` 
0 eto eTo! �_�^�]�\�[�Z�Y�XS�W�V�U��T������������S�R"�Q�P
�_ 
nmbr�^ Z�]
�\ 
bool
�[ 
errn�Z�s
�Y 
erob�X �Wh
�V 
pi  �U ��T �S �R 0 etext eText" �O�N#
�O 
errn�N 0 enumber eNumber# �M�L$
�M 
erob�L 0 efrom eFrom$ �K�J�I
�K 
errt�J 
0 eto eTo�I  �Q �P 
0 _error  �j ��&E�O�� 
 �� �& )�����Y hO��#��! E�O�jE�O� 	�'E�Y hO���!!k"E�O��� k"� E�O�l#k  �kE�O�kE�Y hO��� �� �a  E�O�� E�O�a  4��� a � a � a  �a � a � a � a !E�Y �E�O�l 
 	�a  �& 
i�!E�Y hO� 	�'E�Y hO�W X  *a ����a + � �H3�G�F%&�E�H 	0 _asin  �G �D'�D '  �C�C 0 x  �F  % �B�A�@�?�>�B 0 x  �A 0 isneg isNeg�@ 0 zz  �? 0 p  �> 0 z  & �=�<�;�:LY}~��������9���������8
�= 
errn�<�Y
�; 
erob�: 
�9 
pi  �8 ��E ��jE�O� 	�'E�Y hO�k )�����Y hO�� Xk�E�O�� �� �� �� � ��� �� �� �!E�O���$E�O_ �!�E�O�� a E�O��_ �!E�Y ]�a  �E�Y O�� E�O�a � a � a � a � a � a  �a � a � a � a � a !� �E�O� 	�'E�Y hO�_ a !!� �7*�6�5()�4
�7 .Mth:Sinanull���     doub�6 0 x  �5  ( �3�2�1�0�/�3 0 x  �2 0 etext eText�1 0 enumber eNumber�0 0 efrom eFrom�/ 
0 eto eTo) �.�-�,*>�+�*
�. 
nmbr�- 	0 _asin  �, 0 etext eText* �)�(+
�) 
errn�( 0 enumber eNumber+ �'�&,
�' 
erob�& 0 efrom eFrom, �%�$�#
�% 
errt�$ 
0 eto eTo�#  �+ �* 
0 _error  �4  *��&k+ W X  *䡢���+ � �"N�!� -.�
�" .Mth:Cosanull���     doub�! 0 x  �   - ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo. ����/e��� Z
� 
nmbr� 	0 _asin  � 0 etext eText/ ��0
� 
errn� 0 enumber eNumber0 ��1
� 
erob� 0 efrom eFrom1 ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � ! �*��&k+ W X  *塢���+ � �u��
23�	
� .Mth:Tananull���     doub� 0 x  �
  2 ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo3 ����4�� ��
� 
nmbr� 	0 _asin  � 0 etext eText4 ����5
�� 
errn�� 0 enumber eNumber5 ����6
�� 
erob�� 0 efrom eFrom6 ������
�� 
errt�� 
0 eto eTo��  �  �� 
0 _error  �	 + ��&E�O*��� k�$!k+ W X  *塢���+ � �������78��
�� .Mth:Sinhnull���     doub�� 0 x  ��  7 ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo8 �����9�����
�� 
nmbr�� 0 etext eText9 ����:
�� 
errn�� 0 enumber eNumber: ����;
�� 
erob�� 0 efrom eFrom; ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� / ��&E�O�b  �$b  �'$ W X  *䡢���+ � �������<=��
�� .Mth:Coshnull���     doub�� 0 x  ��  < ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo= �����>����
�� 
nmbr�� 0 etext eText> ����?
�� 
errn�� 0 enumber eNumber? ����@
�� 
erob�� 0 efrom eFrom@ ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� / ��&E�O�b  �$b  �'$ W X  *䡢���+ � ������AB��
�� .Mth:Tanhnull���     doub�� 0 x  ��  A ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToB ����CF����
�� 
nmbr�� 0 etext eTextC ����D
�� 
errn�� 0 enumber eNumberD ���E
�� 
erob� 0 efrom eFromE ���
� 
errt� 
0 eto eTo�  �� �� 
0 _error  �� > -��&E�Ob  �$b  �'$b  �$b  �'$!W X  *㡢���+ � �b��FG�� 
0 _frexp  � �H� H  �� 0 m  �  F ���� 0 m  � 0 isneg isNeg� 0 e  G p��
� 
bool� o�j  
�jlvY hO�jE�O� 	�'E�Y hOjE�O 3h��	 �k�&�k �l!E�O�kE�Y �l E�O�kE�[OY��O� 	�'E�Y hO��lv� ����IJ�� 	0 _logn  � �K� K  �� 0 x  �  I ����� 0 x  � 0 e  � 0 z  � 0 y  J ���������789GHIY\�����������
� 
errn��Y� 
0 _frexp  
� 
cobj���
� 
bool�<�j )��l�Y hO*�k+ E[�k/E�Z[�l/E�ZO��
 �l�& j�� �kE�O��E�O� �E�Y �kE�O� �E�O��!E�O�� E�O�� � �� � ��� �� �!E�O�E�O��� ��a  E�Y ��� �kE�Ol� kE�Y �kE�O�� E�O�� a � a � a � a � a � a  �a � a � a � a � a !E�O�j ��� E�Y hO��l!E�O��E�O�j ��a  E�Y hO�� ����LM�
� .Mth:Lognnull���     doub� 0 x  �  L ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToM ���N��
� 
nmbr� 	0 _logn  � 0 etext eTextN ��O
� 
errn� 0 enumber eNumberO ��P
� 
erob� 0 efrom eFromP ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  �  *��&k+ W X  *䡢���+ � ������QR��
�� .Mth:Lo10null���     doub�� 0 x  ��  Q ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToR 
����234��S@���
�� 
nmbr�� 	0 _logn  �� 0 etext eTextS �~�}T
�~ 
errn�} 0 enumber eNumberT �|�{U
�| 
erob�{ 0 efrom eFromU �z�y�x
�z 
errt�y 
0 eto eTo�x  �� � 
0 _error  �� % *��&k+ �!� �!W X  *硢���+ 	� �wP�v�uVW�t
�w .Mth:Logbnull���     doub�v 0 x  �u �s�r�q
�s 
Base�r 0 b  �q  V �p�o�n�m�l�k�p 0 x  �o 0 b  �n 0 etext eText�m 0 enumber eNumber�l 0 efrom eFrom�k 
0 eto eToW �j�i�hXm�g�f
�j 
nmbr�i 	0 _logn  �h 0 etext eTextX �e�dY
�e 
errn�d 0 enumber eNumberY �c�bZ
�c 
erob�b 0 efrom eFromZ �a�`�_
�a 
errt�` 
0 eto eTo�_  �g �f 
0 _error  �t ( *��&k+ *��&k+ !W X  *䢣���+ ascr  ��ޭ