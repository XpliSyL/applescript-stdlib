FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� Number -- manipulate numeric values and perform common math functions

Notes:

- The Trigonometry and Logarithm handlers are slightly modified versions of handlers found in ESG MathLib <http://www.esglabs.com/>, which in turn are conversions of functions in the Cephes Mathematical Library by Stephen L. Moshier <http://netlib.org/cephes/>.

- see <http://www.unicode.org/reports/tr35/tr35-31/tr35-numbers.html#Number_Format_Patterns> for recognized format patterns when passing text values as `parse/format number`'s `using` parameter

- caution: -[NSNumberFormatter setMinimumFractionDigits:] may be buggy; see workarounds and notes in _setBasicFormat()


TO DO: 

- debug, finalize `parse/format number` behaviors

- should `tan` return `infinity` symbol instead of erroring?

- use identifiers rather than properties in number format record? (other libraries already do this to mimimize namespace pollution)

     � 	 	$   N u m b e r   - -   m a n i p u l a t e   n u m e r i c   v a l u e s   a n d   p e r f o r m   c o m m o n   m a t h   f u n c t i o n s 
 
 N o t e s : 
 
 -   T h e   T r i g o n o m e t r y   a n d   L o g a r i t h m   h a n d l e r s   a r e   s l i g h t l y   m o d i f i e d   v e r s i o n s   o f   h a n d l e r s   f o u n d   i n   E S G   M a t h L i b   < h t t p : / / w w w . e s g l a b s . c o m / > ,   w h i c h   i n   t u r n   a r e   c o n v e r s i o n s   o f   f u n c t i o n s   i n   t h e   C e p h e s   M a t h e m a t i c a l   L i b r a r y   b y   S t e p h e n   L .   M o s h i e r   < h t t p : / / n e t l i b . o r g / c e p h e s / > . 
 
 -   s e e   < h t t p : / / w w w . u n i c o d e . o r g / r e p o r t s / t r 3 5 / t r 3 5 - 3 1 / t r 3 5 - n u m b e r s . h t m l # N u m b e r _ F o r m a t _ P a t t e r n s >   f o r   r e c o g n i z e d   f o r m a t   p a t t e r n s   w h e n   p a s s i n g   t e x t   v a l u e s   a s   ` p a r s e / f o r m a t   n u m b e r ` ' s   ` u s i n g `   p a r a m e t e r 
 
 -   c a u t i o n :   - [ N S N u m b e r F o r m a t t e r   s e t M i n i m u m F r a c t i o n D i g i t s : ]   m a y   b e   b u g g y ;   s e e   w o r k a r o u n d s   a n d   n o t e s   i n   _ s e t B a s i c F o r m a t ( ) 
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
�_� e ; 5 the mathematical constant e (natural logarithm base)    f � i i j   t h e   m a t h e m a t i c a l   c o n s t a n t   e   ( n a t u r a l   l o g a r i t h m   b a s e ) c  j k j l     ��������  ��  ��   k  l m l l      n o p n j   % '�� q�� 0 _isequaldelta _isEqualDelta q m   % & r r =q���-� o i c multiplier used by `cmp` to allow for slight differences due to floating point's limited precision    p � s s �   m u l t i p l i e r   u s e d   b y   ` c m p `   t o   a l l o w   f o r   s l i g h t   d i f f e r e n c e s   d u e   t o   f l o a t i n g   p o i n t ' s   l i m i t e d   p r e c i s i o n m  t u t l     ��������  ��  ��   u  v w v l     �� x y��   x � � [positive] numeric range within which `basic format` uses decimal rather than scientific notation when formatting reals (this mimics AS's own behavior); the corresponding negative range is calcuated automatically    y � z z�   [ p o s i t i v e ]   n u m e r i c   r a n g e   w i t h i n   w h i c h   ` b a s i c   f o r m a t `   u s e s   d e c i m a l   r a t h e r   t h a n   s c i e n t i f i c   n o t a t i o n   w h e n   f o r m a t t i n g   r e a l s   ( t h i s   m i m i c s   A S ' s   o w n   b e h a v i o r ) ;   t h e   c o r r e s p o n d i n g   n e g a t i v e   r a n g e   i s   c a l c u a t e d   a u t o m a t i c a l l y w  { | { j   ( *�� }�� $0 _mindecimalrange _minDecimalRange } m   ( ) ~ ~ ?PbM��� |   �  j   + -�� ��� $0 _maxdecimalrange _maxDecimalRange � m   + , � � @È      �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �� � ���   �   parse and format    � � � � "   p a r s e   a n d   f o r m a t �  � � � l     ��������  ��  ��   �  � � � i  . 1 � � � I      �� ����� (0 _asintegerproperty _asIntegerProperty �  � � � o      ���� 0 thevalue theValue �  � � � o      ���� 0 propertyname propertyName �  ��� � o      ���� 0 minvalue minValue��  ��   � l    8 � � � � Q     8 � � � � k    & � �  � � � r     � � � c     � � � o    ���� 0 thevalue theValue � m    ��
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
�� .ascrerr ****      � **** � b   2 7 � � � b   2 5 � � � m   2 3 � � � � � R T h e    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    � o   3 4���� 0 propertyname propertyName � m   5 6 � � � � � R    p r o p e r t y   i s   n o t   a   n o n - n e g a t i v e   i n t e g e r . � �� ���
�� 
errn � m   0 1�����Y��   � . ( TO DO: what about sensible upper bound?    � � � � P   T O   D O :   w h a t   a b o u t   s e n s i b l e   u p p e r   b o u n d ? �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  2 5 � � � I      �� ����� ,0 _makenumberformatter _makeNumberFormatter �  � � � o      ���� 0 formatstyle formatStyle �  � � � o      ���� 0 
localecode 
localeCode �  ��� � o      ���� 0 	thenumber 	theNumber��  ��   � l   � � � � � k    � � �  � � � l     � � � � r      � � � n     � � � I    �������� 0 init  ��  ��   � n     � � � I    ��~�}� 	0 alloc  �~  �}   � n     � � � o    �|�| &0 nsnumberformatter NSNumberFormatter � m     �{
�{ misccura � o      �z�z 0 asocformatter asocFormatter �	 (note that while NSFormatter provides a global +setDefaultFormatterBehavior: option to change all NSNumberFormatters to use pre-10.4 behavior, we don't bother to call setFormatterBehavior: as it's very unlikely nowadays that a host process would change this)    � � � �   ( n o t e   t h a t   w h i l e   N S F o r m a t t e r   p r o v i d e s   a   g l o b a l   + s e t D e f a u l t F o r m a t t e r B e h a v i o r :   o p t i o n   t o   c h a n g e   a l l   N S N u m b e r F o r m a t t e r s   t o   u s e   p r e - 1 0 . 4   b e h a v i o r ,   w e   d o n ' t   b o t h e r   t o   c a l l   s e t F o r m a t t e r B e h a v i o r :   a s   i t ' s   v e r y   u n l i k e l y   n o w a d a y s   t h a t   a   h o s t   p r o c e s s   w o u l d   c h a n g e   t h i s ) �  � � � Q   � � � � � Z   w � ��y � � =     � � � l    ��x�w � I   �v � �
�v .corecnte****       **** � J     � �  ��u � o    �t�t 0 formatstyle formatStyle�u   � �s ��r
�s 
kocl � m    �q
�q 
reco�r  �x  �w   � m    �p�p  � k   [ � �  � � � r    P � � � n   N � � � I   $ N�o �n�o 60 asoptionalrecordparameter asOptionalRecordParameter   o   $ %�m�m 0 formatstyle formatStyle  K   % G �l
�l 
pcls l  & '�k�j m   & '�i
�i 
MthR�k  �j   �h	

�h 
MthA	 n  ( / o   - /�g�g 0 requiredvalue RequiredValue o   ( -�f�f 0 _support  
 �e
�e 
MthB m   0 1�d
�d 
msng �c
�c 
MthC m   2 3�b
�b 
msng �a
�a 
MthD m   4 5�`
�` 
msng �_
�_ 
MthE m   6 7�^
�^ 
msng �]
�] 
MthF m   : ;�\
�\ 
msng �[
�[ 
MthG m   > ?�Z
�Z 
msng �Y�X
�Y 
MthH m   B C�W
�W 
msng�X   �V m   G J � 
 u s i n g�V  �n   � o    $�U�U 0 _support   � o      �T�T 0 formatrecord formatRecord �  I   Q [�S�R�S "0 _setbasicformat _setBasicFormat  !  o   R S�Q�Q 0 asocformatter asocFormatter! "#" n  S V$%$ 1   T V�P
�P 
MthA% o   S T�O�O 0 formatrecord formatRecord# &�N& o   V W�M�M 0 	thenumber 	theNumber�N  �R   '(' Z   \ �)*�L�K) >  \ a+,+ n  \ _-.- 1   ] _�J
�J 
MthB. o   \ ]�I�I 0 formatrecord formatRecord, m   _ `�H
�H 
msng* k   d �// 010 n  d u232 I   e u�G4�F�G 60 setminimumfractiondigits_ setMinimumFractionDigits_4 5�E5 I   e q�D6�C�D (0 _asintegerproperty _asIntegerProperty6 787 n  f i9:9 1   g i�B
�B 
MthB: o   f g�A�A 0 formatrecord formatRecord8 ;<; m   i l== �>> , m i n i m u m   d e c i m a l   p l a c e s< ?�@? m   l m�?�?  �@  �C  �E  �F  3 o   d e�>�> 0 asocformatter asocFormatter1 @A@ l  v ~BCDB n  v ~EFE I   w ~�=G�<�= 60 setmaximumfractiondigits_ setMaximumFractionDigits_G H�;H m   w z�:�:��;  �<  F o   v w�9�9 0 asocformatter asocFormatterC L F kludge for NSNumberFormatterBug; see notes in _setBasicFormat() below   D �II �   k l u d g e   f o r   N S N u m b e r F o r m a t t e r B u g ;   s e e   n o t e s   i n   _ s e t B a s i c F o r m a t ( )   b e l o wA J�8J l   �7KL�7  KasocFormatter's setAlwaysShowsDecimalSeparator:true -- note: doesn't work well when significant digits are specified (may leave hanging separator char with no "0" after it), but doesn't seem to be essential when fraction digits are already specified, so just disable/omit it   L �MM$ a s o c F o r m a t t e r ' s   s e t A l w a y s S h o w s D e c i m a l S e p a r a t o r : t r u e   - -   n o t e :   d o e s n ' t   w o r k   w e l l   w h e n   s i g n i f i c a n t   d i g i t s   a r e   s p e c i f i e d   ( m a y   l e a v e   h a n g i n g   s e p a r a t o r   c h a r   w i t h   n o   " 0 "   a f t e r   i t ) ,   b u t   d o e s n ' t   s e e m   t o   b e   e s s e n t i a l   w h e n   f r a c t i o n   d i g i t s   a r e   a l r e a d y   s p e c i f i e d ,   s o   j u s t   d i s a b l e / o m i t   i t�8  �L  �K  ( NON Z   � �PQ�6�5P >  � �RSR n  � �TUT 1   � ��4
�4 
MthCU o   � ��3�3 0 formatrecord formatRecordS m   � ��2
�2 
msngQ k   � �VV WXW n  � �YZY I   � ��1[�0�1 60 setmaximumfractiondigits_ setMaximumFractionDigits_[ \�/\ I   � ��.]�-�. (0 _asintegerproperty _asIntegerProperty] ^_^ n  � �`a` 1   � ��,
�, 
MthCa o   � ��+�+ 0 formatrecord formatRecord_ bcb m   � �dd �ee , m a x i m u m   d e c i m a l   p l a c e sc f�*f m   � ��)�)  �*  �-  �/  �0  Z o   � ��(�( 0 asocformatter asocFormatterX g�'g l  � ��&hi�&  h B <asocFormatter's setAlwaysShowsDecimalSeparator:true -- ditto   i �jj x a s o c F o r m a t t e r ' s   s e t A l w a y s S h o w s D e c i m a l S e p a r a t o r : t r u e   - -   d i t t o�'  �6  �5  O klk Z   � �mn�%�$m >  � �opo n  � �qrq 1   � ��#
�# 
MthDr o   � ��"�" 0 formatrecord formatRecordp m   � ��!
�! 
msngn k   � �ss tut n  � �vwv I   � �� x��  <0 setminimumsignificantdigits_ setMinimumSignificantDigits_x y�y I   � ��z�� (0 _asintegerproperty _asIntegerPropertyz {|{ n  � �}~} 1   � ��
� 
MthD~ o   � ��� 0 formatrecord formatRecord| � m   � ��� ��� 4 m i n i m u m   s i g n i f i c a n t   d i g i t s� ��� m   � ���  �  �  �  �  w o   � ��� 0 asocformatter asocFormatteru ��� n  � ���� I   � ����� 60 setusessignificantdigits_ setUsesSignificantDigits_� ��� m   � ��
� boovtrue�  �  � o   � ��� 0 asocformatter asocFormatter�  �%  �$  l ��� Z   � ������ >  � ���� n  � ���� 1   � ��
� 
MthE� o   � ��� 0 formatrecord formatRecord� m   � ��
� 
msng� k   � ��� ��� n  � ���� I   � ����
� <0 setmaximumsignificantdigits_ setMaximumSignificantDigits_� ��	� I   � ����� (0 _asintegerproperty _asIntegerProperty� ��� n  � ���� 1   � ��
� 
MthE� o   � ��� 0 formatrecord formatRecord� ��� m   � ��� ��� 4 m a x i m u m   s i g n i f i c a n t   d i g i t s� ��� m   � ���  �  �  �	  �
  � o   � ��� 0 asocformatter asocFormatter� ��� n  � ���� I   � �� ����  60 setusessignificantdigits_ setUsesSignificantDigits_� ���� m   � ���
�� boovtrue��  ��  � o   � ����� 0 asocformatter asocFormatter�  �  �  � ��� Z   �?������� >  � ���� n  � ���� 1   � ���
�� 
MthF� o   � ����� 0 formatrecord formatRecord� m   � ���
�� 
msng� Q   �;���� k   �'�� ��� r   ���� c   ���� n  ���� 1   ���
�� 
MthF� o   � ����� 0 formatrecord formatRecord� m  ��
�� 
ctxt� o      ���� 0 s  � ��� Z  ������� =  ��� n ��� 1  	��
�� 
leng� o  	���� 0 s  � m  ����  � R  �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� m  �����Y��  ��  ��  � ���� n !'��� I  "'������� ,0 setdecimalseparator_ setDecimalSeparator_� ���� o  "#���� 0 s  ��  ��  � o  !"���� 0 asocformatter asocFormatter��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � R  /;����
�� .ascrerr ****      � ****� m  7:�� ��� � T h e    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    d e c i m a l   s e p a r a t o r    p r o p e r t y   i s   n o t   n o n - e m p t y   t e x t .� �����
�� 
errn� m  36�����Y��  ��  ��  � ��� Z  @�������� > @G��� n @E��� 1  AE��
�� 
MthG� o  @A���� 0 formatrecord formatRecord� m  EF��
�� 
msng� Q  J����� k  My�� ��� r  MX��� c  MV��� n MR��� 1  NR��
�� 
MthG� o  MN���� 0 formatrecord formatRecord� m  RU��
�� 
ctxt� o      ���� 0 s  � ���� Z  Yy������ =  Y`��� n Y^��� 1  Z^��
�� 
leng� o  YZ���� 0 s  � m  ^_����  � n ci��� I  di������� 60 setusesgroupingseparator_ setUsesGroupingSeparator_� ���� m  de��
�� boovfals��  ��  � o  cd���� 0 asocformatter asocFormatter��  � k  ly�� ��� n lr��� I  mr������� 60 setusesgroupingseparator_ setUsesGroupingSeparator_� ���� m  mn��
�� boovtrue��  ��  � o  lm���� 0 asocformatter asocFormatter� ���� n sy��� I  ty������� .0 setgroupingseparator_ setGroupingSeparator_� ���� o  tu���� 0 s  ��  ��  � o  st���� 0 asocformatter asocFormatter��  ��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d         m      �������  � R  ����
�� .ascrerr ****      � **** m  �� � � T h e    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    g r o u p i n g   s e p a r a t o r    p r o p e r t y   i s   n o t   t e x t . ����
�� 
errn m  �������Y��  ��  ��  � �� Z  �[���� > ��	
	 n �� 1  ����
�� 
MthH o  ������ 0 formatrecord formatRecord
 m  ����
�� 
msng Z  �W = �� n �� 1  ����
�� 
MthH o  ������ 0 formatrecord formatRecord l ������ m  ����
�� MRndRNhE��  ��   n �� I  �������� $0 setroundingmode_ setRoundingMode_ �� l ������ n �� o  ������ @0 nsnumberformatterroundhalfeven NSNumberFormatterRoundHalfEven m  ����
�� misccura��  ��  ��  ��   o  ������ 0 asocformatter asocFormatter  = ��  n ��!"! 1  ����
�� 
MthH" o  ������ 0 formatrecord formatRecord  l ��#����# m  ����
�� MRndRNhT��  ��   $%$ n ��&'& I  ����(���� $0 setroundingmode_ setRoundingMode_( )��) l ��*����* n ��+,+ o  ������ @0 nsnumberformatterroundhalfdown NSNumberFormatterRoundHalfDown, m  ����
�� misccura��  ��  ��  ��  ' o  ������ 0 asocformatter asocFormatter% -.- = ��/0/ n ��121 1  ����
�� 
MthH2 o  ������ 0 formatrecord formatRecord0 l ��3����3 m  ����
�� MRndRNhF��  ��  . 454 n ��676 I  ����8���� $0 setroundingmode_ setRoundingMode_8 9��9 l ��:����: n ��;<; o  ������ <0 nsnumberformatterroundhalfup NSNumberFormatterRoundHalfUp< m  ����
�� misccura��  ��  ��  ��  7 o  ������ 0 asocformatter asocFormatter5 =>= = ��?@? n ��ABA 1  ����
�� 
MthHB o  ������ 0 formatrecord formatRecord@ l ��C����C m  ����
�� MRndRN_T��  ��  > DED n ��FGF I  ����H��� $0 setroundingmode_ setRoundingMode_H I�~I l ��J�}�|J n ��KLK o  ���{�{ 80 nsnumberformatterrounddown NSNumberFormatterRoundDownL m  ���z
�z misccura�}  �|  �~  �  G o  ���y�y 0 asocformatter asocFormatterE MNM =  	OPO n  QRQ 1  �x
�x 
MthHR o   �w�w 0 formatrecord formatRecordP l S�v�uS m  �t
�t MRndRN_F�v  �u  N TUT n VWV I  �sX�r�s $0 setroundingmode_ setRoundingMode_X Y�qY l Z�p�oZ n [\[ o  �n�n 40 nsnumberformatterroundup NSNumberFormatterRoundUp\ m  �m
�m misccura�p  �o  �q  �r  W o  �l�l 0 asocformatter asocFormatterU ]^] = "_`_ n aba 1  �k
�k 
MthHb o  �j�j 0 formatrecord formatRecord` l !c�i�hc m  !�g
�g MRndRN_U�i  �h  ^ ded n %/fgf I  &/�fh�e�f $0 setroundingmode_ setRoundingMode_h i�di l &+j�c�bj n &+klk o  '+�a�a >0 nsnumberformatterroundceiling NSNumberFormatterRoundCeilingl m  &'�`
�` misccura�c  �b  �d  �e  g o  %&�_�_ 0 asocformatter asocFormattere mnm = 2;opo n 27qrq 1  37�^
�^ 
MthHr o  23�]�] 0 formatrecord formatRecordp l 7:s�\�[s m  7:�Z
�Z MRndRN_D�\  �[  n t�Yt n >Huvu I  ?H�Xw�W�X $0 setroundingmode_ setRoundingMode_w x�Vx l ?Dy�U�Ty n ?Dz{z o  @D�S�S :0 nsnumberformatterroundfloor NSNumberFormatterRoundFloor{ m  ?@�R
�R misccura�U  �T  �V  �W  v o  >?�Q�Q 0 asocformatter asocFormatter�Y   R  KW�P|}
�P .ascrerr ****      � ****| m  SV~~ � � T h e    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    r o u n d i n g   b e h a v i o r    i s   n o t   a n   a l l o w e d   c o n s t a n t .} �O��N
�O 
errn� m  OR�M�M�Y�N  ��  ��  ��  �y   � Q  ^w���� I  ai�L��K�L "0 _setbasicformat _setBasicFormat� ��� o  bc�J�J 0 asocformatter asocFormatter� ��� o  cd�I�I 0 formatstyle formatStyle� ��H� o  de�G�G 0 	thenumber 	theNumber�H  �K  � R      �F�E�
�F .ascrerr ****      � ****�E  � �D��C
�D 
errn� d      �� m      �B�B��C  � R  qw�A��@
�A .ascrerr ****      � ****� m  sv�� ��� ~ N o t   a    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d   o r   a n   a l l o w e d   c o n s t a n t .�@   � R      �?��
�? .ascrerr ****      � ****� o      �>�> 0 etext eText� �=��<
�= 
errn� d      �� m      �;�;��<   � n ���� I  ���:��9�: .0 throwinvalidparameter throwInvalidParameter� ��� o  ���8�8 0 formatstyle formatStyle� ��� m  ���� ��� 
 u s i n g� ��� J  ���� ��� m  ���7
�7 
reco� ��6� m  ���5
�5 
enum�6  � ��4� o  ���3�3 0 etext eText�4  �9  � o  ��2�2 0 _support   � ��� n ����� I  ���1��0�1 0 
setlocale_ 
setLocale_� ��/� l ����.�-� n ����� I  ���,��+�, *0 asnslocaleparameter asNSLocaleParameter� ��� o  ���*�* 0 
localecode 
localeCode� ��)� m  ���� ���  f o r   l o c a l e�)  �+  � o  ���(�( 0 _support  �.  �-  �/  �0  � o  ���'�' 0 asocformatter asocFormatter� ��&� L  ���� o  ���%�% 0 asocformatter asocFormatter�&   � � � theNumber is either the number being formatted or `missing value` when parsing; determines appropriate formatting style based on number's type and value when `native format` is specified    � ���v   t h e N u m b e r   i s   e i t h e r   t h e   n u m b e r   b e i n g   f o r m a t t e d   o r   ` m i s s i n g   v a l u e `   w h e n   p a r s i n g ;   d e t e r m i n e s   a p p r o p r i a t e   f o r m a t t i n g   s t y l e   b a s e d   o n   n u m b e r ' s   t y p e   a n d   v a l u e   w h e n   ` n a t i v e   f o r m a t `   i s   s p e c i f i e d � ��� l     �$�#�"�$  �#  �"  � ��� l     �!� ��!  �   �  � ��� i  6 9��� I      ���� "0 _setbasicformat _setBasicFormat� ��� o      �� 0 asocformatter asocFormatter� ��� o      �� 0 
formatname 
formatName� ��� o      �� 0 	thenumber 	theNumber�  �  � Z    F����� =    ��� o     �� 0 
formatname 
formatName� m    �
� MthZMth0� Z    ������ =   	��� o    �� 0 	thenumber 	theNumber� m    �
� 
msng� l   ���� n   ��� I    ���� "0 setnumberstyle_ setNumberStyle_� ��� l   ���� n   ��� o    �� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� m    �
� misccura�  �  �  �  � o    �� 0 asocformatter asocFormatter� ? 9 parsing always recognizes scientific notation by default   � ��� r   p a r s i n g   a l w a y s   r e c o g n i z e s   s c i e n t i f i c   n o t a t i o n   b y   d e f a u l t�  � l   ����� Z    ������ =   ��� n   ��� m    �
� 
pcls� o    �
�
 0 	thenumber 	theNumber� m    �	
�	 
long� l   '���� n   '��� I     '���� "0 setnumberstyle_ setNumberStyle_� ��� l    #���� n    #��� o   ! #�� 40 nsnumberformatternostyle NSNumberFormatterNoStyle� m     !�
� misccura�  �  �  �  � o     �� 0 asocformatter asocFormatter�   format integer   � ���    f o r m a t   i n t e g e r� ��� G   * _��� G   * W��� l 
 * ?�� ��� l  * ?������ F   * ?��� A   * 2��� d   * 0�� o   * /���� $0 _maxdecimalrange _maxDecimalRange� o   0 1���� 0 	thenumber 	theNumber� A   5 =��� o   5 6���� 0 	thenumber 	theNumber� d   6 <�� o   6 ;���� $0 _mindecimalrange _minDecimalRange��  ��  �   ��  � l 
 B U ����  l  B U���� F   B U A   B I o   B G���� $0 _mindecimalrange _minDecimalRange o   G H���� 0 	thenumber 	theNumber A   L S o   L M���� 0 	thenumber 	theNumber o   M R���� $0 _maxdecimalrange _maxDecimalRange��  ��  ��  ��  � =   Z ]	 o   Z [���� 0 	thenumber 	theNumber	 m   [ \����  � 
��
 l  b � k   b �  l  b b����   Y S use {basic format:decimal format, minimum decimal places:1, grouping separator:""}    � �   u s e   { b a s i c   f o r m a t : d e c i m a l   f o r m a t ,   m i n i m u m   d e c i m a l   p l a c e s : 1 ,   g r o u p i n g   s e p a r a t o r : " " }  n  b j I   c j������ "0 setnumberstyle_ setNumberStyle_ �� l  c f���� n  c f o   d f���� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle m   c d��
�� misccura��  ��  ��  ��   o   b c���� 0 asocformatter asocFormatter  n  k q  I   l q��!���� 60 setminimumfractiondigits_ setMinimumFractionDigits_! "��" m   l m���� ��  ��    o   k l���� 0 asocformatter asocFormatter #$# l  r x%&'% n  r x()( I   s x��*���� 60 setmaximumfractiondigits_ setMaximumFractionDigits_* +��+ m   s t�������  ��  ) o   r s���� 0 asocformatter asocFormatter&   kludge; see note below   ' �,, .   k l u d g e ;   s e e   n o t e   b e l o w$ -.- n  y /0/ I   z ��1���� 60 setusesgroupingseparator_ setUsesGroupingSeparator_1 2��2 m   z {��
�� boovfals��  ��  0 o   y z���� 0 asocformatter asocFormatter. 3��3 l  � ���45��  4 a [ asocFormatter's setAlwaysShowsDecimalSeparator:true -- see notes in _makeNumberFormatter()   5 �66 �   a s o c F o r m a t t e r ' s   s e t A l w a y s S h o w s D e c i m a l S e p a r a t o r : t r u e   - -   s e e   n o t e s   i n   _ m a k e N u m b e r F o r m a t t e r ( )��     format real as decimal    �77 .   f o r m a t   r e a l   a s   d e c i m a l��  � l  � �89:8 k   � �;; <=< n  � �>?> I   � ���@���� "0 setnumberstyle_ setNumberStyle_@ A��A l  � �B����B n  � �CDC o   � ����� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyleD m   � ���
�� misccura��  ��  ��  ��  ? o   � ����� 0 asocformatter asocFormatter= EFE l  � ���GH��  G S M for consistency with AS, always include minimum 1DP, e.g. "1.0E8", not "1E8"   H �II �   f o r   c o n s i s t e n c y   w i t h   A S ,   a l w a y s   i n c l u d e   m i n i m u m   1 D P ,   e . g .   " 1 . 0 E 8 " ,   n o t   " 1 E 8 "F JKJ n  � �LML I   � ���N���� 60 setminimumfractiondigits_ setMinimumFractionDigits_N O��O m   � ����� ��  ��  M o   � ����� 0 asocformatter asocFormatterK PQP l  � ���RS��  R note: for some reason `setAlwaysShowsDecimalSeparator:true` is ignored, while `setMinimumFractionDigits:1` causes number to be truncated (note: maximum seems to change as well as minimum, which is wrong) unless maximum is set to a higher value afterwards (NSNumberFormatter bugs?)   S �TT2   n o t e :   f o r   s o m e   r e a s o n   ` s e t A l w a y s S h o w s D e c i m a l S e p a r a t o r : t r u e `   i s   i g n o r e d ,   w h i l e   ` s e t M i n i m u m F r a c t i o n D i g i t s : 1 `   c a u s e s   n u m b e r   t o   b e   t r u n c a t e d   ( n o t e :   m a x i m u m   s e e m s   t o   c h a n g e   a s   w e l l   a s   m i n i m u m ,   w h i c h   i s   w r o n g )   u n l e s s   m a x i m u m   i s   s e t   t o   a   h i g h e r   v a l u e   a f t e r w a r d s   ( N S N u m b e r F o r m a t t e r   b u g s ? )Q UVU n  � �WXW I   � ���Y���� 60 setmaximumfractiondigits_ setMaximumFractionDigits_Y Z��Z m   � ��������  ��  X o   � ����� 0 asocformatter asocFormatterV [��[ l  � ���\]��  \ C = asocFormatter's setAlwaysShowsDecimalSeparator:true -- ditto   ] �^^ z   a s o c F o r m a t t e r ' s   s e t A l w a y s S h o w s D e c i m a l S e p a r a t o r : t r u e   - -   d i t t o��  9    format real as scientific   : �__ 4   f o r m a t   r e a l   a s   s c i e n t i f i c� Q K formatting switches between notations depending on number's type and value   � �`` �   f o r m a t t i n g   s w i t c h e s   b e t w e e n   n o t a t i o n s   d e p e n d i n g   o n   n u m b e r ' s   t y p e   a n d   v a l u e� aba =  � �cdc o   � ����� 0 
formatname 
formatNamed m   � ���
�� MthZMth3b efe l  � �ghig n  � �jkj I   � ���l���� "0 setnumberstyle_ setNumberStyle_l m��m l  � �n����n n  � �opo o   � ����� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStylep m   � ���
�� misccura��  ��  ��  ��  k o   � ����� 0 asocformatter asocFormatterh   uses exponent notation   i �qq .   u s e s   e x p o n e n t   n o t a t i o nf rsr =  � �tut o   � ����� 0 
formatname 
formatNameu m   � ���
�� MthZMth1s vwv l  � �xyzx n  � �{|{ I   � ���}���� "0 setnumberstyle_ setNumberStyle_} ~��~ l  � ����� n  � ���� o   � ����� 40 nsnumberformatternostyle NSNumberFormatterNoStyle� m   � ���
�� misccura��  ��  ��  ��  | o   � ����� 0 asocformatter asocFormattery n h uses plain integer notation (caution: do not use for reals unless rounding to whole number is intended)   z ��� �   u s e s   p l a i n   i n t e g e r   n o t a t i o n   ( c a u t i o n :   d o   n o t   u s e   f o r   r e a l s   u n l e s s   r o u n d i n g   t o   w h o l e   n u m b e r   i s   i n t e n d e d )w ��� =  � ���� o   � ����� 0 
formatname 
formatName� m   � ���
�� MthZMth2� ��� l  � ����� n  � ���� I   � �������� "0 setnumberstyle_ setNumberStyle_� ���� l  � ������� n  � ���� o   � ����� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle� m   � ���
�� misccura��  ��  ��  ��  � o   � ����� 0 asocformatter asocFormatter� 8 2 uses thousands separators by default, no exponent   � ��� d   u s e s   t h o u s a n d s   s e p a r a t o r s   b y   d e f a u l t ,   n o   e x p o n e n t� ��� =  � ���� o   � ����� 0 
formatname 
formatName� m   � ���
�� MthZMth5� ��� l  � ����� n  � ���� I   � �������� "0 setnumberstyle_ setNumberStyle_� ���� l  � ������� n  � ���� o   � ����� @0 nsnumberformattercurrencystyle NSNumberFormatterCurrencyStyle� m   � ���
�� misccura��  ��  ��  ��  � o   � ����� 0 asocformatter asocFormatter�   adds currency symbol   � ��� *   a d d s   c u r r e n c y   s y m b o l� ��� =  � ���� o   � ����� 0 
formatname 
formatName� m   � ���
�� MthZMth4� ��� l  � ����� n  � ���� I   � �������� "0 setnumberstyle_ setNumberStyle_� ���� l  � ������� n  � ���� o   � ����� >0 nsnumberformatterpercentstyle NSNumberFormatterPercentStyle� m   � ���
�� misccura��  ��  ��  ��  � o   � ����� 0 asocformatter asocFormatter� ( " multiplies by 100 and appends '%'   � ��� D   m u l t i p l i e s   b y   1 0 0   a n d   a p p e n d s   ' % '� ��� =  ���� o   � ����� 0 
formatname 
formatName� m   ���
�� MthZMth6� ��� l ���� n ��� I  ������� "0 setnumberstyle_ setNumberStyle_� ���� l ������ n ��� o  ���� @0 nsnumberformatterspelloutstyle NSNumberFormatterSpellOutStyle� m  ��
�� misccura��  ��  ��  ��  � o  ���� 0 asocformatter asocFormatter�   uses words   � ���    u s e s   w o r d s� ��� >  "��� l  ������ I  ���
� .corecnte****       ****� J  �� ��~� o  �}�} 0 
formatname 
formatName�~  � �|��{
�| 
kocl� m  �z
�z 
ctxt�{  ��  ��  � m   !�y�y  � ��x� n %+��� I  &+�w��v�w 0 
setformat_ 
setFormat_� ��u� o  &'�t�t 0 
formatname 
formatName�u  �v  � o  %&�s�s 0 asocformatter asocFormatter�x  � R  .F�r��
�r .ascrerr ****      � ****� m  BE�� ��� r I n v a l i d    b a s i c   f o r m a t    p r o p e r t y :   n o t   a n   a l l o w e d   c o n s t a n t .� �q��
�q 
errn� m  25�p�p�Y� �o��
�o 
erob� o  89�n�n 0 
formatname 
formatName� �m��l
�m 
errt� m  <?�k
�k 
enum�l  � ��� l     �j�i�h�j  �i  �h  � ��� l     �g�f�e�g  �f  �e  � ��� i  : =��� I      �d��c�d  0 _nameforformat _nameForFormat� ��b� o      �a�a 0 formatstyle formatStyle�b  �c  � l    H���� Z     H����� =    ��� o     �`�` 0 formatstyle formatStyle� m    �_
�_ MthZMth1� L    �� m    �� ���  i n t e g e r� ��� =   ��� o    �^�^ 0 formatstyle formatStyle� m    �]
�] MthZMth2� ��� L    �� m    �� ���  d e c i m a l� ��� =      o    �\�\ 0 formatstyle formatStyle m    �[
�[ MthZMth5�  L     m     �  c u r r e n c y  =  ! $	
	 o   ! "�Z�Z 0 formatstyle formatStyle
 m   " #�Y
�Y MthZMth4  L   ' ) m   ' ( �  p e r c e n t  =  , / o   , -�X�X 0 formatstyle formatStyle m   - .�W
�W MthZMth3  L   2 4 m   2 3 �  s c i e n t i f i c  =  7 : o   7 8�V�V 0 formatstyle formatStyle m   8 9�U
�U MthZMth6 �T L   = ? m   = > �    w o r d�T  � L   B H!! b   B G"#" b   B E$%$ m   B C&& �''  % o   C D�S�S 0 formatstyle formatStyle# m   E F(( �))  � G A used for error reporting; formatStyle is either constant or text   � �** �   u s e d   f o r   e r r o r   r e p o r t i n g ;   f o r m a t S t y l e   i s   e i t h e r   c o n s t a n t   o r   t e x t� +,+ l     �R�Q�P�R  �Q  �P  , -.- l     �O�N�M�O  �N  �M  . /0/ l     �L12�L  1  -----   2 �33 
 - - - - -0 454 l     �K�J�I�K  �J  �I  5 676 i  > A898 I     �H:;
�H .Mth:FNumnull���     nmbr: o      �G�G 0 	thenumber 	theNumber; �F<=
�F 
Usin< |�E�D>�C?�E  �D  > o      �B�B 0 formatstyle formatStyle�C  ? l     @�A�@@ m      �?
�? MthZMth0�A  �@  = �>A�=
�> 
LocaA |�<�;B�:C�<  �;  B o      �9�9 0 
localecode 
localeCode�:  C l     D�8�7D m      EE �FF  n o n e�8  �7  �=  9 Q     dGHIG k    NJJ KLK l   "MNOM Z   "PQ�6�5P =    RSR l   T�4�3T I   �2UV
�2 .corecnte****       ****U J    WW X�1X o    �0�0 0 	thenumber 	theNumber�1  V �/Y�.
�/ 
koclY m    �-
�- 
nmbr�.  �4  �3  S m    �,�,  Q n   Z[Z I    �+\�*�+ 60 throwinvalidparametertype throwInvalidParameterType\ ]^] o    �)�) 0 	thenumber 	theNumber^ _`_ m    aa �bb  ` cdc m    �(
�( 
nmbrd e�'e m    ff �gg  n u m b e r�'  �*  [ o    �&�& 0 _support  �6  �5  N � � only accept integer or real types (i.e. allowing a text parameter to be coerced to number would defeat the purpose of these handlers, which is to avoid unintended localization behavior)   O �hht   o n l y   a c c e p t   i n t e g e r   o r   r e a l   t y p e s   ( i . e .   a l l o w i n g   a   t e x t   p a r a m e t e r   t o   b e   c o e r c e d   t o   n u m b e r   w o u l d   d e f e a t   t h e   p u r p o s e   o f   t h e s e   h a n d l e r s ,   w h i c h   i s   t o   a v o i d   u n i n t e n d e d   l o c a l i z a t i o n   b e h a v i o r )L iji r   # -klk I   # +�%m�$�% ,0 _makenumberformatter _makeNumberFormatterm non o   $ %�#�# 0 formatstyle formatStyleo pqp o   % &�"�" 0 
localecode 
localeCodeq r�!r o   & '� �  0 	thenumber 	theNumber�!  �$  l o      �� 0 asocformatter asocFormatterj sts r   . 6uvu n  . 4wxw I   / 4�y�� &0 stringfromnumber_ stringFromNumber_y z�z o   / 0�� 0 	thenumber 	theNumber�  �  x o   . /�� 0 asocformatter asocFormatterv o      �� 0 
asocstring 
asocStringt {|{ l  7 I}~} Z  7 I����� =  7 :��� o   7 8�� 0 
asocstring 
asocString� m   8 9�
� 
msng� R   = E���
� .ascrerr ****      � ****� m   C D�� ��� F I n v a l i d   n u m b e r   ( c o n v e r s i o n   f a i l e d ) .� ���
� 
errn� m   ? @���Y� ���
� 
erob� o   A B�� 0 	thenumber 	theNumber�  �  �  ~ n h shouldn't fail, but -stringFromNumber:'s return type isn't declared as non-nullable so check to be sure    ��� �   s h o u l d n ' t   f a i l ,   b u t   - s t r i n g F r o m N u m b e r : ' s   r e t u r n   t y p e   i s n ' t   d e c l a r e d   a s   n o n - n u l l a b l e   s o   c h e c k   t o   b e   s u r e| ��� L   J N�� c   J M��� o   J K�� 0 
asocstring 
asocString� m   K L�
� 
ctxt�  H R      ���
� .ascrerr ****      � ****� o      �
�
 0 etext eText� �	��
�	 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  I I   V d���� 
0 _error  � ��� m   W Z�� ���  f o r m a t   n u m b e r� ��� o   Z [� �  0 etext eText� ��� o   [ \���� 0 enumber eNumber� ��� o   \ ]���� 0 efrom eFrom� ���� o   ] ^���� 
0 eto eTo��  �  7 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  B E��� I     ����
�� .Mth:PNumnull���     ctxt� o      ���� 0 thetext theText� ����
�� 
Usin� |����������  ��  � o      ���� 0 formatstyle formatStyle��  � l     ������ m      ��
�� MthZMth0��  ��  � �����
�� 
Loca� |����������  ��  � o      ���� 0 
localecode 
localeCode��  � l     ������ m      �� ���  n o n e��  ��  ��  � Q     ����� k    ��� ��� l   "���� Z   "������� =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ���� 0 thetext theText��  � �����
�� 
kocl� m    ��
�� 
ctxt��  ��  ��  � m    ����  � n   ��� I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 thetext theText� ��� m    �� ���  � ��� m    ��
�� 
ctxt� ���� m    �� ���  t e x t��  ��  � o    ���� 0 _support  ��  ��  � 1 + only accept text, for same reason as above   � ��� V   o n l y   a c c e p t   t e x t ,   f o r   s a m e   r e a s o n   a s   a b o v e� ��� r   # -��� I   # +������� ,0 _makenumberformatter _makeNumberFormatter� ��� o   $ %���� 0 formatstyle formatStyle� ��� o   % &���� 0 
localecode 
localeCode� ���� m   & '��
�� 
msng��  ��  � o      ���� 0 asocformatter asocFormatter� ��� r   . 6��� n  . 4��� I   / 4������� &0 numberfromstring_ numberFromString_� ���� o   / 0���� 0 thetext theText��  ��  � o   . /���� 0 asocformatter asocFormatter� o      ���� 0 
asocnumber 
asocNumber� ��� Z   7 �������� =  7 :��� o   7 8���� 0 
asocnumber 
asocNumber� m   8 9��
�� 
msng� k   = ��� ��� r   = J��� c   = H��� n  = F��� I   B F�������� $0 localeidentifier localeIdentifier��  ��  � n  = B��� I   > B�������� 
0 locale  ��  ��  � o   = >���� 0 asocformatter asocFormatter� m   F G��
�� 
ctxt� o      ���� $0 localeidentifier localeIdentifier� ��� Z   K `� ��� =   K P n  K N 1   L N��
�� 
leng o   K L���� $0 localeidentifier localeIdentifier m   N O����    l  S V r   S V	
	 m   S T �  n o
 o      ���� $0 localeidentifier localeIdentifier #  empty string = system locale    � :   e m p t y   s t r i n g   =   s y s t e m   l o c a l e��   r   Y ` b   Y ^ b   Y \ m   Y Z � 
 t h e    o   Z [���� $0 localeidentifier localeIdentifier m   \ ] �   o      ���� $0 localeidentifier localeIdentifier� �� R   a ���
�� .ascrerr ****      � **** l  m ����� b   m � b   m } b   m { !  b   m w"#" m   m p$$ �%% R I n v a l i d   t e x t   ( e x p e c t e d   n u m e r i c a l   t e x t   i n  # I   p v��&����  0 _nameforformat _nameForFormat& '��' o   q r���� 0 formatstyle formatStyle��  ��  ! m   w z(( �))    f o r m a t   f o r   o   { |���� $0 localeidentifier localeIdentifier m   } �** �++    l o c a l e ) .��  ��   ��,-
�� 
errn, m   e h�����Y- ��.��
�� 
erob. o   k l���� 0 thetext theText��  ��  ��  ��  � /��/ L   � �00 c   � �121 o   � ����� 0 
asocnumber 
asocNumber2 m   � ���
�� 
****��  � R      ��34
�� .ascrerr ****      � ****3 o      ���� 0 etext eText4 ��56
�� 
errn5 o      ���� 0 enumber eNumber6 ��78
�� 
erob7 o      ���� 0 efrom eFrom8 ��9��
�� 
errt9 o      ���� 
0 eto eTo��  � I   � ���:���� 
0 _error  : ;<; m   � �== �>>  p a r s e   n u m b e r< ?@? o   � ����� 0 etext eText@ ABA o   � ����� 0 enumber eNumberB CDC o   � ����� 0 efrom eFromD E��E o   � ����� 
0 eto eTo��  ��  � FGF l     ��������  ��  ��  G HIH l     ��������  ��  ��  I JKJ l     ��LM��  L J D--------------------------------------------------------------------   M �NN � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -K OPO l     ��QR��  Q $  Hexadecimal number conversion   R �SS <   H e x a d e c i m a l   n u m b e r   c o n v e r s i o nP TUT l     ��������  ��  ��  U VWV i  F IXYX I     ��Z[
�� .Mth:NuHenull���     ****Z o      ���� 0 	thenumber 	theNumber[ ��\]
�� 
Plac\ |����^��_��  ��  ^ o      �� 0 	chunksize 	chunkSize��  _ l     `�~�}` m      �|�|  �~  �}  ] �{a�z
�{ 
Prefa |�y�xb�wc�y  �x  b o      �v�v 0 	hasprefix 	hasPrefix�w  c l     d�u�td m      �s
�s boovfals�u  �t  �z  Y Q    efge k   �hh iji r    klk n   mnm I    �ro�q�r (0 asintegerparameter asIntegerParametero pqp o    	�p�p 0 	chunksize 	chunkSizeq r�or m   	 
ss �tt 
 w i d t h�o  �q  n o    �n�n 0 _support  l o      �m�m 0 	chunksize 	chunkSizej uvu l   wxyw r    z{z n   |}| I    �l~�k�l (0 asbooleanparameter asBooleanParameter~ � o    �j�j 0 	hasprefix 	hasPrefix� ��i� m    �� ���  p r e f i x�i  �k  } o    �h�h 0 _support  { o      �g�g 0 	hasprefix 	hasPrefixx � � (users shouldn't concatenate their own prefix as that would result in negative numbers appearing as "0x-N�" instead of "-0xN�")   y ���    ( u s e r s   s h o u l d n ' t   c o n c a t e n a t e   t h e i r   o w n   p r e f i x   a s   t h a t   w o u l d   r e s u l t   i n   n e g a t i v e   n u m b e r s   a p p e a r i n g   a s   " 0 x - N & "   i n s t e a d   o f   " - 0 x N & " )v ��f� Z   ����e�� =    *��� l   (��d�c� I   (�b��
�b .corecnte****       ****� J    "�� ��a� o     �`�` 0 	thenumber 	theNumber�a  � �_��^
�_ 
kocl� m   # $�]
�] 
list�^  �d  �c  � m   ( )�\�\  � l  -d���� k   -d�� ��� l  - :���� r   - :��� n  - 8��� I   2 8�[��Z�[ 00 aswholenumberparameter asWholeNumberParameter� ��� o   2 3�Y�Y 0 	thenumber 	theNumber� ��X� m   3 4�� ���  �X  �Z  � o   - 2�W�W 0 _support  � o      �V�V 0 	thenumber 	theNumber� ^ X numbers greater than 2^30 (max integer size) are okay as long as they're non-fractional   � ��� �   n u m b e r s   g r e a t e r   t h a n   2 ^ 3 0   ( m a x   i n t e g e r   s i z e )   a r e   o k a y   a s   l o n g   a s   t h e y ' r e   n o n - f r a c t i o n a l� ��� l  ; ;�U���U  � � � note that the 1024 max chunk size is somewhat arbitrary (the largest representable number requires ~309 chars; anything more will always be left-hand padding), but prevents completely silly values   � ����   n o t e   t h a t   t h e   1 0 2 4   m a x   c h u n k   s i z e   i s   s o m e w h a t   a r b i t r a r y   ( t h e   l a r g e s t   r e p r e s e n t a b l e   n u m b e r   r e q u i r e s   ~ 3 0 9   c h a r s ;   a n y t h i n g   m o r e   w i l l   a l w a y s   b e   l e f t - h a n d   p a d d i n g ) ,   b u t   p r e v e n t s   c o m p l e t e l y   s i l l y   v a l u e s� ��� Z  ; Z���T�S� G   ; F��� A   ; >��� o   ; <�R�R 0 	chunksize 	chunkSize� m   < =�Q�Q  � ?   A D��� o   A B�P�P 0 	chunksize 	chunkSize� m   B C�O�O � n  I V��� I   N V�N��M�N .0 throwinvalidparameter throwInvalidParameter� ��� o   N O�L�L 0 	chunksize 	chunkSize� ��� m   O P�� ��� 
 w i d t h� ��� m   P Q�K
�K 
long� ��J� m   Q R�� ��� L M u s t   b e   a n   i n t e g e r   b e t w e e n   0   a n d   1 0 2 4 .�J  �M  � o   I N�I�I 0 _support  �T  �S  � ��� r   [ `��� m   [ ^�� ���  � o      �H�H 0 hextext hexText� ��� Z   a���G�� A   a d��� o   a b�F�F 0 	thenumber 	theNumber� m   b c�E�E  � k   g ��� ��� Z  g ����D�C� F   g w��� ?   g j��� o   g h�B�B 0 	chunksize 	chunkSize� m   h i�A�A  � l  m u��@�?� A   m u��� o   m n�>�> 0 	thenumber 	theNumber� d   n t�� l  n s��=�<� a   n s��� m   n q�;�; � o   q r�:�: 0 	chunksize 	chunkSize�=  �<  �@  �?  � n  z ���� I    ��9��8�9 .0 throwinvalidparameter throwInvalidParameter� ��� o    ��7�7 0 	thenumber 	theNumber� ��� m   � ��� ���  � ��� m   � ��6
�6 
long� ��5� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ��� H N u m b e r   i s   t o o   l a r g e   t o   r e p r e s e n t   a s  � o   � ��4�4 0 	chunksize 	chunkSize� m   � ��� ��� J - d i g i t   h e x a d e c i m a l   t e x t   ( n o t   b e t w e e n  � _   � ���� d   � ��� l  � ���3�2� a   � �� � m   � ��1�1   o   � ��0�0 0 	chunksize 	chunkSize�3  �2  � m   � ��/�/ � m   � � � 
   a n d  � _   � � l  � ��.�- \   � � a   � �	 m   � ��,�, 	 o   � ��+�+ 0 	chunksize 	chunkSize m   � ��*�* �.  �-   m   � ��)�) � m   � �

 �  ) .�5  �8  � o   z �(�( 0 _support  �D  �C  �  r   � � m   � � �  - o      �'�' 0 	hexprefix 	hexPrefix �& r   � � d   � � o   � ��%�% 0 	thenumber 	theNumber o      �$�$ 0 	thenumber 	theNumber�&  �G  � k   �  r   � � m   � � �   o      �#�# 0 	hexprefix 	hexPrefix �" Z  ��!�  F   � � !  ?   � �"#" o   � ��� 0 	chunksize 	chunkSize# m   � ���  ! l  � �$��$ ?   � �%&% o   � ��� 0 	thenumber 	theNumber& \   � �'(' a   � �)*) m   � ��� * o   � ��� 0 	chunksize 	chunkSize( m   � ��� �  �   n  �
+,+ I   �
�-�� .0 throwinvalidparameter throwInvalidParameter- ./. o   � ��� 0 	thenumber 	theNumber/ 010 m   � �22 �33  1 454 m   � ��
� 
long5 6�6 b   �787 b   �9:9 b   � �;<; b   � �=>= b   � �?@? b   � �ABA m   � �CC �DD H N u m b e r   i s   t o o   l a r g e   t o   r e p r e s e n t   a s  B o   � ��� 0 	chunksize 	chunkSize@ m   � �EE �FF J - d i g i t   h e x a d e c i m a l   t e x t   ( n o t   b e t w e e n  > _   � �GHG d   � �II l  � �J��J a   � �KLK m   � ��� L o   � ��� 0 	chunksize 	chunkSize�  �  H m   � ��� < m   � �MM �NN 
   a n d  : _   �OPO l  � �Q��Q \   � �RSR a   � �TUT m   � ��
�
 U o   � ��	�	 0 	chunksize 	chunkSizeS m   � ��� �  �  P m   � �� 8 m  VV �WW  ) .�  �  , o   � ��� 0 _support  �!  �   �"  � XYX Z Z[��Z o  �� 0 	hasprefix 	hasPrefix[ r  \]\ b  ^_^ o  �� 0 	hexprefix 	hexPrefix_ m  `` �aa  0 x] o      �� 0 	hexprefix 	hexPrefix�  �  Y bcb V  Fded k  'Aff ghg r  '9iji b  '7klk l '5m� ��m n  '5non 4  *5��p
�� 
cobjp l -4q����q [  -4rsr `  -2tut o  -.���� 0 	thenumber 	theNumberu m  .1���� s m  23���� ��  ��  o m  '*vv �ww   0 1 2 3 4 5 6 7 8 9 A B C D E F�   ��  l o  56���� 0 hextext hexTextj o      ���� 0 hextext hexTexth x��x r  :Ayzy _  :?{|{ o  :;���� 0 	thenumber 	theNumber| m  ;>���� z o      ���� 0 	thenumber 	theNumber��  e ?  #&}~} o  #$���� 0 	thenumber 	theNumber~ m  $%����  c � V  G_��� r  SZ��� b  SX��� m  SV�� ���  0� o  VW���� 0 hextext hexText� o      ���� 0 hextext hexText� A  KR��� n  KP��� 1  LP��
�� 
leng� o  KL���� 0 hextext hexText� o  PQ���� 0 	chunksize 	chunkSize� ���� L  `d�� b  `c��� o  `a���� 0 	hexprefix 	hexPrefix� o  ab���� 0 hextext hexText��  �   format single number   � ��� *   f o r m a t   s i n g l e   n u m b e r�e  � l g����� k  g��� ��� l g����� Z g�������� G  gr��� A  gj��� o  gh���� 0 	chunksize 	chunkSize� m  hi���� � ?  mp��� o  mn���� 0 	chunksize 	chunkSize� m  no���� � n u���� I  z�������� .0 throwinvalidparameter throwInvalidParameter� ��� o  z{���� 0 	chunksize 	chunkSize� ��� m  {~�� ��� 
 w i d t h� ��� m  ~��
�� 
long� ���� m  ��� ��� L M u s t   b e   a n   i n t e g e r   b e t w e e n   1   a n d   1 0 2 4 .��  ��  � o  uz���� 0 _support  ��  ��  �   chunksize must be given   � ��� 0   c h u n k s i z e   m u s t   b e   g i v e n� ��� r  ����� J  ���� ��� m  ���� ���  � ���� \  ����� a  ����� m  ������ � o  ������ 0 	chunksize 	chunkSize� m  ������ ��  � J      �� ��� o      ���� 0 padtext padText� ���� o      ���� 0 maxsize maxSize��  � ��� U  ����� r  ����� b  ����� o  ������ 0 padtext padText� m  ���� ���  0� o      ���� 0 padtext padText� o  ������ 0 	chunksize 	chunkSize� ��� h  ������� 0 
resultlist 
resultList� j     	����� 
0 _list_  � n    ��� 2   ��
�� 
cobj� o     ���� 0 	thenumber 	theNumber� ��� Y  ���������� k  ���� ��� Q  �e���� k  ��� ��� r  ����� n ����� 4  �����
�� 
cobj� o  ������ 0 i  � n ����� o  ������ 
0 _list_  � o  ������ 0 
resultlist 
resultList� o      ���� 0 	thenumber 	theNumber� ��� r  ����� c  ����� o  ������ 0 	thenumber 	theNumber� m  ����
�� 
long� o      ���� 0 
theinteger 
theInteger� ���� Z �������� G  ���� G  ���� >  ����� o  ������ 0 
theinteger 
theInteger� c  ����� o  ������ 0 	thenumber 	theNumber� m  ����
�� 
doub� A  ���� o  ������ 0 
theinteger 
theInteger� m  � ����  � ?  	��� o  ���� 0 
theinteger 
theInteger� o  ���� 0 maxsize maxSize� R  �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� m  �����\��  ��  ��  ��  � R      ���� 
�� .ascrerr ****      � ****��    ����
�� 
errn d       m      �������  � k  $e  Z  $K�� ?  $'	
	 o  $%���� 0 
theinteger 
theInteger
 o  %&���� 0 maxsize maxSize r  *C b  *A b  *= b  *3 b  */ m  *- � H N u m b e r   i s   t o o   l a r g e   t o   r e p r e s e n t   a s   o  -.���� 0 	chunksize 	chunkSize m  /2 � V - d i g i t   h e x a d e c i m a l   t e x t   ( n o t   b e t w e e n   0   a n d   _  3< l 3:���� \  3: a  38 m  36����  o  67���� 0 	chunksize 	chunkSize m  89���� ��  ��   m  :;����  m  =@   �!!  ) . o      ���� 0 etext eText��   r  FK"#" m  FI$$ �%% T N o t   a   n o n - n e g a t i v e ,   n o n - f r a c t i o n a l   n u m b e r .# o      ���� 0 etext eText &��& n Le'(' I  Qe��)���� .0 throwinvalidparameter throwInvalidParameter) *+* N  Q\,, n Q[-.- 4  V[��/
�� 
cobj/ o  YZ���� 0 i  . n QV010 o  RV���� 
0 _list_  1 o  QR���� 0 
resultlist 
resultList+ 232 m  \_44 �55  3 676 m  _`��
�� 
long7 8��8 o  `a���� 0 etext eText��  ��  ( o  LQ���� 0 _support  ��  � 9:9 r  fk;<; m  fi== �>>  < o      ���� 0 hextext hexText: ?@? V  l�ABA k  t�CC DED r  t�FGF b  t�HIH l t�J����J n  t�KLK 4  w���M
�� 
cobjM l z�N����N [  z�OPO `  zQRQ o  z{���� 0 
theinteger 
theIntegerR m  {~���� P m  ����� ��  ��  L m  twSS �TT   0 1 2 3 4 5 6 7 8 9 A B C D E F��  ��  I o  ������ 0 hextext hexTextG o      ���� 0 hextext hexTextE U��U r  ��VWV _  ��XYX o  ������ 0 
theinteger 
theIntegerY m  ������ W o      ���� 0 
theinteger 
theInteger��  B ?  psZ[Z o  pq���� 0 
theinteger 
theInteger[ m  qr����  @ \��\ r  ��]^] n ��_`_ 7 ����ab
�� 
ctxta d  ��cc o  ������ 0 	chunksize 	chunkSizeb m  ��������` l ��d����d b  ��efe o  ������ 0 padtext padTextf o  ������ 0 hextext hexText��  ��  ^ n     ghg 4  ����i
�� 
cobji o  ���� 0 i  h n ��jkj o  ���~�~ 
0 _list_  k o  ���}�} 0 
resultlist 
resultList��  �� 0 i  � m  ���|�| � n ��lml 1  ���{
�{ 
lengm n ��non o  ���z�z 
0 _list_  o o  ���y�y 0 
resultlist 
resultList��  � pqp r  ��rsr n ��tut 1  ���x
�x 
txdlu 1  ���w
�w 
ascrs o      �v�v 0 oldtids oldTIDsq vwv r  ��xyx m  ��zz �{{  y n     |}| 1  ���u
�u 
txdl} 1  ���t
�t 
ascrw ~~ Z  �����s�� o  ���r�r 0 	hasprefix 	hasPrefix� r  ����� b  ����� m  ���� ���  0 x� n ����� o  ���q�q 
0 _list_  � o  ���p�p 0 
resultlist 
resultList� o      �o�o 0 hextext hexText�s  � r  ����� c  ����� n ����� o  ���n�n 
0 _list_  � o  ���m�m 0 
resultlist 
resultList� m  ���l
�l 
ctxt� o      �k�k 0 hextext hexText ��� r  ����� o  ���j�j 0 oldtids oldTIDs� n     ��� 1  ���i
�i 
txdl� 1  ���h
�h 
ascr� ��g� L  ���� o  ���f�f 0 hextext hexText�g  �   format list of number   � ��� ,   f o r m a t   l i s t   o f   n u m b e r�f  f R      �e��
�e .ascrerr ****      � ****� o      �d�d 0 etext eText� �c��
�c 
errn� o      �b�b 0 enumber eNumber� �a��
�a 
erob� o      �`�` 0 efrom eFrom� �_��^
�_ 
errt� o      �]�] 
0 eto eTo�^  g I  ��\��[�\ 
0 _error  � ��� m  ��� ���  f o r m a t   h e x� ��� o  �Z�Z 0 etext eText� ��� o  �Y�Y 0 enumber eNumber� ��� o  �X�X 0 efrom eFrom� ��W� o  �V�V 
0 eto eTo�W  �[  W ��� l     �U�T�S�U  �T  �S  � ��� l     �R�Q�P�R  �Q  �P  � ��� i  J M��� I     �O��
�O .Mth:HeNunull���     ctxt� o      �N�N 0 hextext hexText� �M��
�M 
Plac� |�L�K��J��L  �K  � o      �I�I 0 	chunksize 	chunkSize�J  � l     ��H�G� m      �F�F  �H  �G  � �E��D
�E 
Prec� |�C�B��A��C  �B  � o      �@�@ 0 	isprecise 	isPrecise�A  � l     ��?�>� m      �=
�= boovfals�?  �>  �D  � Q    `���� P   J���� k   I�� ��� r    ��� n   ��� I    �<��;�< "0 astextparameter asTextParameter� ��� o    �:�: 0 hextext hexText� ��9� m    �� ���  �9  �;  � o    �8�8 0 _support  � o      �7�7 0 hextext hexText� ��� r    #��� n   !��� I    !�6��5�6 (0 asintegerparameter asIntegerParameter� ��� o    �4�4 0 	chunksize 	chunkSize� ��3� m    �� ��� 
 w i d t h�3  �5  � o    �2�2 0 _support  � o      �1�1 0 	chunksize 	chunkSize� ��� Z  $ C���0�/� G   $ /��� A   $ '��� o   $ %�.�. 0 	chunksize 	chunkSize� m   % &�-�-  � ?   * -��� o   * +�,�, 0 	chunksize 	chunkSize� m   + ,�+�+ � n  2 ?��� I   7 ?�*��)�* .0 throwinvalidparameter throwInvalidParameter� ��� o   7 8�(�( 0 	chunksize 	chunkSize� ��� m   8 9�� ��� 
 w i d t h� ��� m   9 :�'
�' 
long� ��&� m   : ;�� ��� L M u s t   b e   a n   i n t e g e r   b e t w e e n   0   a n d   1 0 2 4 .�&  �)  � o   2 7�%�% 0 _support  �0  �/  � ��� r   D R��� H   D P�� n  D O��� I   I O�$��#�$ (0 asbooleanparameter asBooleanParameter� � � o   I J�"�" 0 	isprecise 	isPrecise  �! m   J K �  p r e c i s i o n   l o s s�!  �#  � o   D I� �  0 _support  � o      �� 0 	isprecise 	isPrecise� � Z   SI� =   S V	 o   S T�� 0 	chunksize 	chunkSize	 m   T U��   l  YA

 k   YA  Q   Y k   \ �  r   \ _ m   \ ]��   o      �� 0 	thenumber 	theNumber  r   ` e C   ` c o   ` a�� 0 hextext hexText m   a b �  - o      �� 0 
isnegative 
isNegative  !  Z  f }"#��" o   f g�� 0 
isnegative 
isNegative# r   j y$%$ n   j w&'& 7  k w�()
� 
ctxt( m   q s�� ) m   t v����' o   j k�� 0 hextext hexText% o      �� 0 hextext hexText�  �  ! *+* Z  ~ �,-��, C   ~ �./. o   ~ �� 0 hextext hexText/ m    �00 �11  0 x- r   � �232 n   � �454 7  � ��67
� 
ctxt6 m   � ��
�
 7 m   � ��	�	��5 o   � ��� 0 hextext hexText3 o      �� 0 hextext hexText�  �  + 8�8 X   � �9�:9 k   � �;; <=< r   � �>?> ]   � �@A@ o   � ��� 0 	thenumber 	theNumberA m   � ��� ? o      �� 0 	thenumber 	theNumber= BCB r   � �DED I  � �F�GF z� ��
�  .sysooffslong    ��� null
�� misccura�  G ��HI
�� 
psofH o   � ����� 0 charref charRefI ��J��
�� 
psinJ m   � �KK �LL   0 1 2 3 4 5 6 7 8 9 A B C D E F��  E o      ���� 0 i  C MNM Z  � �OP����O =   � �QRQ o   � ����� 0 i  R m   � �����  P R   � �����S
�� .ascrerr ****      � ****��  S ��T��
�� 
errnT m   � ������@��  ��  ��  N U��U r   � �VWV \   � �XYX [   � �Z[Z o   � ����� 0 	thenumber 	theNumber[ o   � ����� 0 i  Y m   � ����� W o      ���� 0 	thenumber 	theNumber��  � 0 charref charRef: o   � ����� 0 hextext hexText�   R      ����\
�� .ascrerr ****      � ****��  \ ��]��
�� 
errn] d      ^^ m      �������   l  �_`a_ n  �bcb I   ���d���� .0 throwinvalidparameter throwInvalidParameterd efe o   � ����� 0 hextext hexTextf ghg m   �ii �jj  h klk m  ��
�� 
ctxtl m��m m  nn �oo N T e x t   i s   n o t   a   v a l i d   h e x a d e c i m a l   n u m b e r .��  ��  c o   � ����� 0 _support  ` E ? catch errors if hexText is too short or contains non-hex chars   a �pp ~   c a t c h   e r r o r s   i f   h e x T e x t   i s   t o o   s h o r t   o r   c o n t a i n s   n o n - h e x   c h a r s qrq Z 1st����s F  uvu o  ���� 0 	isprecise 	isPrecisev l w����w =  xyx o  ���� 0 	thenumber 	theNumbery [  z{z o  ���� 0 	thenumber 	theNumber{ m  ���� ��  ��  t n -|}| I  -��~���� .0 throwinvalidparameter throwInvalidParameter~ � o   ���� 0 hextext hexText� ��� m   #�� ���  � ��� m  #&��
�� 
ctxt� ���� m  &)�� ��� � H e x a d e c i m a l   t e x t   i s   t o o   l a r g e   t o   r e p r e s e n t   a s   a   r e a l   n u m b e r   w i t h o u t   l o s i n g   p r e c i s i o n .��  ��  } o  ���� 0 _support  ��  ��  r ��� Z 2>������� o  23���� 0 
isnegative 
isNegative� r  6:��� d  68�� o  67���� 0 	thenumber 	theNumber� o      ���� 0 	thenumber 	theNumber��  ��  � ���� L  ?A�� o  ?@���� 0 	thenumber 	theNumber��     read as single number    ��� ,   r e a d   a s   s i n g l e   n u m b e r�   l DI���� k  DI�� ��� Z Dm������� >  DM��� `  DK��� l DI������ n DI��� 1  EI��
�� 
leng� o  DE���� 0 hextext hexText��  ��  � o  IJ���� 0 	chunksize 	chunkSize� m  KL����  � n Pi��� I  Ui������� .0 throwinvalidparameter throwInvalidParameter� ��� o  UV���� 0 hextext hexText� ��� m  VY�� ���  � ��� m  Y\��
�� 
ctxt� ���� b  \e��� b  \a��� m  \_�� ��� T C a n ' t   s p l i t   h e x a d e c i m a l   t e x t   e x a c t l y   i n t o  � o  _`���� 0 	chunksize 	chunkSize� m  ad�� ���  - d i g i t   c h u n k s .��  ��  � o  PU���� 0 _support  ��  ��  � ��� h  ny����� 0 
resultlist 
resultList� j     ����� 
0 _list_  � J     ����  � ��� Y  zA������� k  �<�� ��� r  ����� m  ������  � o      ���� 0 	thenumber 	theNumber� ��� X  ������� k  ���� ��� r  ����� ]  ����� o  ������ 0 	thenumber 	theNumber� m  ������ � o      ���� 0 	thenumber 	theNumber� ��� r  ����� I ������� z����
�� .sysooffslong    ��� null
�� misccura��  � ����
�� 
psof� o  ������ 0 charref charRef� �����
�� 
psin� m  ���� ���   0 1 2 3 4 5 6 7 8 9 A B C D E F��  � o      ���� 0 i  � ��� Z ��������� =  ����� o  ������ 0 i  � m  ������  � n ����� I  ��������� .0 throwinvalidparameter throwInvalidParameter� ��� o  ������ 0 hextext hexText� ��� m  ���� ���  � ��� m  ����
�� 
ctxt� ���� m  ���� ��� N T e x t   i s   n o t   a   v a l i d   h e x a d e c i m a l   n u m b e r .��  ��  � o  ������ 0 _support  ��  ��  � ���� r  ����� \  ����� [  ����� o  ������ 0 	thenumber 	theNumber� o  ������ 0 i  � m  ������ � o      ���� 0 	thenumber 	theNumber��  �� 0 charref charRef� n ����� 7 ������
�� 
ctxt� o  ������ 0 i  � l �������� \  ����� [  ����� o  ������ 0 i  � o  ������ 0 	chunksize 	chunkSize� m  ������ ��  ��  � o  ������ 0 hextext hexText� 	 		  Z �3		����	 F  �			 o  ������ 0 	isprecise 	isPrecise	 l 	����	 =  			 o  ���� 0 	thenumber 	theNumber	 [  			
		 o  ���� 0 	thenumber 	theNumber	
 m  ���� ��  ��  	 n /			 I  /��	���� .0 throwinvalidparameter throwInvalidParameter	 			 N  "		 n  !			 7 !��		
�� 
ctxt	 o  ���� 0 i  	 l  	����	 \   			 [  			 o  ���� 0 i  	 o  ���� 0 	chunksize 	chunkSize	 m  ���� ��  ��  	 o  ���� 0 hextext hexText	 			 m  "%		 �		  	 			 m  %(��
�� 
ctxt	 	 �	  m  (+	!	! �	"	" � H e x a d e c i m a l   t e x t   i s   t o o   l a r g e   t o   c o n v e r t   t o   n u m b e r   w i t h o u t   l o s i n g   p r e c i s i o n .�  ��  	 o  �~�~ 0 _support  ��  ��  	 	#�}	# r  4<	$	%	$ o  45�|�| 0 	thenumber 	theNumber	% n      	&	'	&  ;  :;	' n 5:	(	)	( o  6:�{�{ 
0 _list_  	) o  56�z�z 0 
resultlist 
resultList�}  �� 0 i  � m  }~�y�y � n ~�	*	+	* 1  ��x
�x 
leng	+ o  ~�w�w 0 hextext hexText� o  ���v�v 0 	chunksize 	chunkSize� 	,�u	, L  BI	-	- n BH	.	/	. o  CG�t�t 
0 _list_  	/ o  BC�s�s 0 
resultlist 
resultList�u  �   read as list of numbers   � �	0	0 0   r e a d   a s   l i s t   o f   n u m b e r s�  � �r	1
�r consdiac	1 �q	2
�q conshyph	2 �p	3
�p conspunc	3 �o�n
�o conswhit�n  � �m	4
�m conscase	4 �l�k
�l consnume�k  � R      �j	5	6
�j .ascrerr ****      � ****	5 o      �i�i 0 etext eText	6 �h	7	8
�h 
errn	7 o      �g�g 0 enumber eNumber	8 �f	9	:
�f 
erob	9 o      �e�e 0 efrom eFrom	: �d	;�c
�d 
errt	; o      �b�b 
0 eto eTo�c  � I  R`�a	<�`�a 
0 _error  	< 	=	>	= m  SV	?	? �	@	@  p a r s e   h e x	> 	A	B	A o  VW�_�_ 0 etext eText	B 	C	D	C o  WX�^�^ 0 enumber eNumber	D 	E	F	E o  XY�]�] 0 efrom eFrom	F 	G�\	G o  YZ�[�[ 
0 eto eTo�\  �`  � 	H	I	H l     �Z�Y�X�Z  �Y  �X  	I 	J	K	J l     �W�V�U�W  �V  �U  	K 	L	M	L l     �T	N	O�T  	N J D--------------------------------------------------------------------   	O �	P	P � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -	M 	Q	R	Q l     �S	S	T�S  	S !  General numeric operations   	T �	U	U 6   G e n e r a l   n u m e r i c   o p e r a t i o n s	R 	V	W	V l     �R�Q�P�R  �Q  �P  	W 	X	Y	X i  N Q	Z	[	Z I     �O	\�N
�O .Mth:DeRanull���     doub	\ o      �M�M 0 x  �N  	[ Q     	]	^	_	] L    	`	` ]    
	a	b	a l   	c�L�K	c c    	d	e	d o    �J�J 0 x  	e m    �I
�I 
doub�L  �K  	b l   		f�H�G	f ^    		g	h	g 1    �F
�F 
pi  	h m    �E�E ��H  �G  	^ R      �D	i	j
�D .ascrerr ****      � ****	i o      �C�C 0 etext eText	j �B	k	l
�B 
errn	k o      �A�A 0 enumber eNumber	l �@	m	n
�@ 
erob	m o      �?�? 0 efrom eFrom	n �>	o�=
�> 
errt	o o      �<�< 
0 eto eTo�=  	_ I    �;	p�:�; 
0 _error  	p 	q	r	q m    	s	s �	t	t  r a d i a n s	r 	u	v	u o    �9�9 0 etext eText	v 	w	x	w o    �8�8 0 enumber eNumber	x 	y	z	y o    �7�7 0 efrom eFrom	z 	{�6	{ o    �5�5 
0 eto eTo�6  �:  	Y 	|	}	| l     �4�3�2�4  �3  �2  	} 	~		~ l     �1�0�/�1  �0  �/  	 	�	�	� i  R U	�	�	� I     �.	��-
�. .Mth:RaDenull���     doub	� o      �,�, 0 x  �-  	� Q     	�	�	�	� L    	�	� ^    
	�	�	� l   	��+�*	� c    	�	�	� o    �)�) 0 x  	� m    �(
�( 
doub�+  �*  	� l   		��'�&	� ^    		�	�	� 1    �%
�% 
pi  	� m    �$�$ ��'  �&  	� R      �#	�	�
�# .ascrerr ****      � ****	� o      �"�" 0 etext eText	� �!	�	�
�! 
errn	� o      � �  0 enumber eNumber	� �	�	�
� 
erob	� o      �� 0 efrom eFrom	� �	��
� 
errt	� o      �� 
0 eto eTo�  	� I    �	��� 
0 _error  	� 	�	�	� m    	�	� �	�	�  d e g r e e s	� 	�	�	� o    �� 0 etext eText	� 	�	�	� o    �� 0 enumber eNumber	� 	�	�	� o    �� 0 efrom eFrom	� 	��	� o    �� 
0 eto eTo�  �  	� 	�	�	� l     ����  �  �  	� 	�	�	� l     ����  �  �  	� 	�	�	� l     ����  �  �  	� 	�	�	� i  V Y	�	�	� I     �
	��	
�
 .Mth:Abs_null���     nmbr	� o      �� 0 x  �	  	� Q     )	�	�	�	� k    	�	� 	�	�	� r    	�	�	� c    	�	�	� o    �� 0 x  	� m    �
� 
nmbr	� o      �� 0 x  	� 	��	� Z   	 	�	��	�	� A   	 	�	�	� o   	 
�� 0 x  	� m   
 ��  	� L    	�	� d    	�	� o    � �  0 x  �  	� L    	�	� o    ���� 0 x  �  	� R      ��	�	�
�� .ascrerr ****      � ****	� o      ���� 0 etext eText	� ��	�	�
�� 
errn	� o      ���� 0 enumber eNumber	� ��	�	�
�� 
erob	� o      ���� 0 efrom eFrom	� ��	���
�� 
errt	� o      ���� 
0 eto eTo��  	� I    )��	����� 
0 _error  	� 	�	�	� m     !	�	� �	�	�  a b s	� 	�	�	� o   ! "���� 0 etext eText	� 	�	�	� o   " #���� 0 enumber eNumber	� 	�	�	� o   # $���� 0 efrom eFrom	� 	���	� o   $ %���� 
0 eto eTo��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  Z ]	�	�	� I     ��	���
�� .Mth:CmpNnull���     ****	� J      	�	� 	�	�	� o      ���� 0 n1  	� 	���	� o      ���� 0 n2  ��  ��  	� Q     �	�	�	�	� k    �	�	� 	�	�	� Z    �	�	���	�	� =    	�	�	� l   	�����	� I   ��	�	�
�� .corecnte****       ****	� J    	�	� 	�	�	� o    ���� 0 n1  	� 	���	� o    ���� 0 n2  ��  	� ��	���
�� 
kocl	� m    	��
�� 
long��  ��  ��  	� m    ���� 	� Z   	�	�����	� =    	�	�	� o    ���� 0 n1  	� o    ���� 0 n2  	� L    	�	� m    ����  ��  ��  ��  	� k   ! �	�	� 	�	�	� r   ! 8	�	�	� J   ! )	�	� 
 

  c   ! $


 o   ! "���� 0 n1  
 m   " #��
�� 
doub
 
��
 c   $ '


 o   $ %���� 0 n2  
 m   % &��
�� 
doub��  	� J      

 

	
 o      ���� 0 n1  
	 

��

 o      ���� 0 n2  ��  	� 


 Z   9 T

��

 =   9 <


 o   9 :���� 0 n1  
 m   : ;����  
 r   ? H


 ]   ? F


 o   ? D���� 0 _isequaldelta _isEqualDelta
 o   D E���� 0 n2  
 o      ���� 0 dn  ��  
 r   K T


 ]   K R


 o   K P���� 0 _isequaldelta _isEqualDelta
 o   P Q���� 0 n1  
 o      ���� 0 dn  
 


 r   U Y


 d   U W

 o   U V���� 0 dn  
 o      ���� 0 dm  
 

 
 Z  Z w
!
"����
! ?   Z ]
#
$
# o   Z [���� 0 dm  
$ o   [ \���� 0 dn  
" r   ` s
%
&
% J   ` d
'
' 
(
)
( o   ` a���� 0 dm  
) 
*��
* o   a b���� 0 dn  ��  
& J      
+
+ 
,
-
, o      ���� 0 dn  
- 
.��
. o      ���� 0 dm  ��  ��  ��  
  
/
0
/ r   x }
1
2
1 \   x {
3
4
3 o   x y���� 0 n2  
4 o   y z���� 0 n1  
2 o      ���� 0 d  
0 
5��
5 Z  ~ �
6
7����
6 F   ~ �
8
9
8 ?   ~ �
:
;
: o   ~ ���� 0 d  
; o    ����� 0 dm  
9 A   � �
<
=
< o   � ����� 0 d  
= o   � ����� 0 dn  
7 L   � �
>
> m   � �����  ��  ��  ��  	� 
?��
? Z   � �
@
A��
B
@ A   � �
C
D
C o   � ����� 0 n1  
D o   � ����� 0 n2  
A L   � �
E
E m   � ���������  
B L   � �
F
F m   � ����� ��  	� R      ��
G
H
�� .ascrerr ****      � ****
G o      ���� 0 etext eText
H ��
I
J
�� 
errn
I o      ���� 0 enumber eNumber
J ��
K
L
�� 
erob
K o      ���� 0 efrom eFrom
L ��
M��
�� 
errt
M o      ���� 
0 eto eTo��  	� I   � ���
N���� 
0 _error  
N 
O
P
O m   � �
Q
Q �
R
R  c m p
P 
S
T
S o   � ����� 0 etext eText
T 
U
V
U o   � ����� 0 enumber eNumber
V 
W
X
W o   � ����� 0 efrom eFrom
X 
Y��
Y o   � ����� 
0 eto eTo��  ��  	� 
Z
[
Z l     ��������  ��  ��  
[ 
\
]
\ l     ��������  ��  ��  
] 
^
_
^ i  ^ a
`
a
` I     ��
b��
�� .Mth:MinNnull���     ****
b o      ���� 0 thelist theList��  
a Q     W
c
d
e
c k    E
f
f 
g
h
g h    
��
i�� 0 
listobject 
listObject
i j     ��
j�� 
0 _list_  
j n    
k
l
k I    ��
m���� "0 aslistparameter asListParameter
m 
n��
n o    
���� 0 thelist theList��  ��  
l o     ���� 0 _support  
h 
o
p
o l   
q
r
s
q r    
t
u
t c    
v
w
v l   
x����
x n    
y
z
y 4   ��
{
�� 
cobj
{ m    ���� 
z n   
|
}
| o    ���� 
0 _list_  
} o    ���� 0 
listobject 
listObject��  ��  
w m    �
� 
nmbr
u o      �~�~ 0 	theresult 	theResult
r #  error -1728 if list is empty   
s �
~
~ :   e r r o r   - 1 7 2 8   i f   l i s t   i s   e m p t y
p 

�
 X    B
��}
�
� k   ( =
�
� 
�
�
� l  ( /
�
�
�
� r   ( /
�
�
� c   ( -
�
�
� n  ( +
�
�
� 1   ) +�|
�| 
pcnt
� o   ( )�{�{ 0 aref aRef
� m   + ,�z
�z 
nmbr
� o      �y�y 0 x  
� > 8 error -1700 if item isn't (or can't coerce to) a number   
� �
�
� p   e r r o r   - 1 7 0 0   i f   i t e m   i s n ' t   ( o r   c a n ' t   c o e r c e   t o )   a   n u m b e r
� 
��x
� Z  0 =
�
��w�v
� A   0 3
�
�
� o   0 1�u�u 0 x  
� o   1 2�t�t 0 	theresult 	theResult
� r   6 9
�
�
� o   6 7�s�s 0 x  
� o      �r�r 0 	theresult 	theResult�w  �v  �x  �} 0 aref aRef
� n   
�
�
� o    �q�q 
0 _list_  
� o    �p�p 0 
listobject 
listObject
� 
��o
� L   C E
�
� o   C D�n�n 0 	theresult 	theResult�o  
d R      �m
�
�
�m .ascrerr ****      � ****
� o      �l�l 0 etext eText
� �k
�
�
�k 
errn
� o      �j�j 0 enumber eNumber
� �i
�
�
�i 
erob
� o      �h�h 0 efrom eFrom
� �g
��f
�g 
errt
� o      �e�e 
0 eto eTo�f  
e I   M W�d
��c�d 
0 _error  
� 
�
�
� m   N O
�
� �
�
�  m i n
� 
�
�
� o   O P�b�b 0 etext eText
� 
�
�
� o   P Q�a�a 0 enumber eNumber
� 
�
�
� o   Q R�`�` 0 efrom eFrom
� 
��_
� o   R S�^�^ 
0 eto eTo�_  �c  
_ 
�
�
� l     �]�\�[�]  �\  �[  
� 
�
�
� l     �Z�Y�X�Z  �Y  �X  
� 
�
�
� i  b e
�
�
� I     �W
��V
�W .Mth:MaxNnull���     ****
� o      �U�U 0 thelist theList�V  
� Q     W
�
�
�
� k    E
�
� 
�
�
� h    
�T
��T 0 
listobject 
listObject
� j     �S
��S 
0 _list_  
� n    
�
�
� I    �R
��Q�R "0 aslistparameter asListParameter
� 
��P
� o    
�O�O 0 thelist theList�P  �Q  
� o     �N�N 0 _support  
� 
�
�
� l   
�
�
�
� r    
�
�
� c    
�
�
� l   
��M�L
� n    
�
�
� 4   �K
�
�K 
cobj
� m    �J�J 
� n   
�
�
� o    �I�I 
0 _list_  
� o    �H�H 0 
listobject 
listObject�M  �L  
� m    �G
�G 
nmbr
� o      �F�F 0 	theresult 	theResult
�   ditto   
� �
�
�    d i t t o
� 
�
�
� X    B
��E
�
� k   ( =
�
� 
�
�
� l  ( /
�
�
�
� r   ( /
�
�
� c   ( -
�
�
� n  ( +
�
�
� 1   ) +�D
�D 
pcnt
� o   ( )�C�C 0 aref aRef
� m   + ,�B
�B 
nmbr
� o      �A�A 0 x  
�   ditto   
� �
�
�    d i t t o
� 
��@
� Z  0 =
�
��?�>
� ?   0 3
�
�
� o   0 1�=�= 0 x  
� o   1 2�<�< 0 	theresult 	theResult
� r   6 9
�
�
� o   6 7�;�; 0 x  
� o      �:�: 0 	theresult 	theResult�?  �>  �@  �E 0 aref aRef
� n   
�
�
� o    �9�9 
0 _list_  
� o    �8�8 0 
listobject 
listObject
� 
��7
� L   C E
�
� o   C D�6�6 0 	theresult 	theResult�7  
� R      �5
�
�
�5 .ascrerr ****      � ****
� o      �4�4 0 etext eText
� �3
�
�
�3 
errn
� o      �2�2 0 enumber eNumber
� �1
�
�
�1 
erob
� o      �0�0 0 efrom eFrom
� �/
��.
�/ 
errt
� o      �-�- 
0 eto eTo�.  
� I   M W�,
��+�, 
0 _error  
� 
�
�
� m   N O
�
� �
�
�  m a x
� 
�
�
� o   O P�*�* 0 etext eText
� 
�
�
� o   P Q�)�) 0 enumber eNumber
� 
� 
� o   Q R�(�( 0 efrom eFrom  �' o   R S�&�& 
0 eto eTo�'  �+  
�  l     �%�$�#�%  �$  �#    l     �"�!� �"  �!  �     i  f i	 I     �

� .Mth:RouNnull���     nmbr
 o      �� 0 num   �
� 
Plac |����  �   o      �� 0 decimalplaces decimalPlaces�   l     �� m      ��  �  �   ��
� 
Dire |����  �   o      �� &0 roundingdirection roundingDirection�   l     �� m      �
� MRndRNhE�  �  �  	 Q    � k   �  r     n    I    ��� "0 asrealparameter asRealParameter  !  o    	�
�
 0 num  ! "�	" m   	 
## �$$  �	  �   o    �� 0 _support   o      �� 0 num   %&% r    '(' n   )*) I    �+�� (0 asintegerparameter asIntegerParameter+ ,-, o    �� 0 decimalplaces decimalPlaces- .�. m    // �00  t o   p l a c e s�  �  * o    �� 0 _support  ( o      �� 0 decimalplaces decimalPlaces& 121 Z    834� ��3 >    "565 o     ���� 0 decimalplaces decimalPlaces6 m     !����  4 k   % 477 898 r   % *:;: a   % (<=< m   % &���� 
= o   & '���� 0 decimalplaces decimalPlaces; o      ���� 0 themultiplier theMultiplier9 >��> l  + 4?@A? r   + 4BCB ^   + 2DED ]   + 0FGF ]   + .HIH o   + ,���� 0 num  I m   , -���� 
G o   . /���� 0 themultiplier theMultiplierE m   0 1���� 
C o      ���� 0 num  @�� multiplying and dividing by 10 before and after applying the multiplier helps avoid poor rounding results for some numbers due to inevitable loss of precision in floating-point math (e.g. `324.21 * 100 div 1 / 100` returns 324.2 but needs to be 324.21), though this hasn't been tested on all possible values for obvious reasons -- TO DO: shouldn't /10 be done after rounding is applied (in which case following calculations should use mod 10, etc)?   A �JJ�   m u l t i p l y i n g   a n d   d i v i d i n g   b y   1 0   b e f o r e   a n d   a f t e r   a p p l y i n g   t h e   m u l t i p l i e r   h e l p s   a v o i d   p o o r   r o u n d i n g   r e s u l t s   f o r   s o m e   n u m b e r s   d u e   t o   i n e v i t a b l e   l o s s   o f   p r e c i s i o n   i n   f l o a t i n g - p o i n t   m a t h   ( e . g .   ` 3 2 4 . 2 1   *   1 0 0   d i v   1   /   1 0 0 `   r e t u r n s   3 2 4 . 2   b u t   n e e d s   t o   b e   3 2 4 . 2 1 ) ,   t h o u g h   t h i s   h a s n ' t   b e e n   t e s t e d   o n   a l l   p o s s i b l e   v a l u e s   f o r   o b v i o u s   r e a s o n s   - -   T O   D O :   s h o u l d n ' t   / 1 0   b e   d o n e   a f t e r   r o u n d i n g   i s   a p p l i e d   ( i n   w h i c h   c a s e   f o l l o w i n g   c a l c u l a t i o n s   s h o u l d   u s e   m o d   1 0 ,   e t c ) ?��  �   ��  2 KLK Z   9�MNOPM =  9 <QRQ o   9 :���� &0 roundingdirection roundingDirectionR l  : ;S����S m   : ;��
�� MRndRNhE��  ��  N Z   ? mTUVWT E  ? KXYX J   ? CZZ [\[ m   ? @]] ��      \ ^��^ m   @ A__ ?�      ��  Y J   C J`` a��a `   C Hbcb l  C Fd����d ^   C Fefe o   C D���� 0 num  f m   D E���� ��  ��  c m   F G���� ��  U l  N Sghig r   N Sjkj _   N Qlml o   N O���� 0 num  m m   O P���� k o      ���� 0 num  h T N if num ends in .5 and its div is even then round toward zero so it stays even   i �nn �   i f   n u m   e n d s   i n   . 5   a n d   i t s   d i v   i s   e v e n   t h e n   r o u n d   t o w a r d   z e r o   s o   i t   s t a y s   e v e nV opo ?   V Yqrq o   V W���� 0 num  r m   W X����  p s��s l  \ ctuvt r   \ cwxw _   \ ayzy l  \ _{����{ [   \ _|}| o   \ ]���� 0 num  } m   ] ^~~ ?�      ��  ��  z m   _ `���� x o      ���� 0 num  u H B else round to nearest whole digit (.5 will round up if positive�)   v � �   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t   ( . 5   w i l l   r o u n d   u p   i f   p o s i t i v e & )��  W l  f m���� r   f m��� _   f k��� l  f i������ \   f i��� o   f g���� 0 num  � m   g h�� ?�      ��  ��  � m   i j���� � o      ���� 0 num  � 4 . (�or down if negative to give an even result)   � ��� \   ( & o r   d o w n   i f   n e g a t i v e   t o   g i v e   a n   e v e n   r e s u l t )O ��� =  p s��� o   p q���� &0 roundingdirection roundingDirection� l  q r������ m   q r��
�� MRndRNhT��  ��  � ��� Z   v ������ E  v ���� J   v z�� ��� m   v w�� ��      � ���� m   w x�� ?�      ��  � J   z �� ���� `   z }��� o   z {���� 0 num  � m   { |���� ��  � l  � ����� r   � ���� _   � ���� o   � ����� 0 num  � m   � ����� � o      ���� 0 num  � 0 * if num ends in .5 then round towards zero   � ��� T   i f   n u m   e n d s   i n   . 5   t h e n   r o u n d   t o w a r d s   z e r o� ��� ?   � ���� o   � ����� 0 num  � m   � �����  � ���� l  � ����� r   � ���� _   � ���� l  � ������� [   � ���� o   � ����� 0 num  � m   � ��� ?�      ��  ��  � m   � ����� � o      ���� 0 num  � ( " else round to nearest whole digit   � ��� D   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t��  � r   � ���� _   � ���� l  � ������� \   � ���� o   � ����� 0 num  � m   � ��� ?�      ��  ��  � m   � ����� � o      ���� 0 num  � ��� =  � ���� o   � ����� &0 roundingdirection roundingDirection� l  � ������� m   � ���
�� MRndRNhF��  ��  � ��� Z   � ������ E  � ���� J   � ��� ��� m   � ��� ��      � ���� m   � ��� ?�      ��  � J   � ��� ���� `   � ���� o   � ����� 0 num  � m   � ����� ��  � l  � ����� Z   � ������� ?   � ���� o   � ����� 0 num  � m   � �����  � r   � ���� [   � ���� _   � ���� o   � ����� 0 num  � m   � ����� � m   � ����� � o      ���� 0 num  ��  � r   � ���� \   � ���� _   � ���� o   � ����� 0 num  � m   � ����� � m   � ����� � o      ���� 0 num  � 0 * if num ends in .5 then round towards zero   � ��� T   i f   n u m   e n d s   i n   . 5   t h e n   r o u n d   t o w a r d s   z e r o� ��� ?   � ���� o   � ����� 0 num  � m   � �����  � ���� l  � ����� r   � ���� _   � ���� l  � ������� [   � ���� o   � ����� 0 num  � m   � ��� ?�      ��  ��  � m   � ����� � o      ���� 0 num  � ( " else round to nearest whole digit   � �   D   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t��  � r   � � _   � � l  � ����� \   � � o   � ����� 0 num   m   � � ?�      ��  ��   m   � �����  o      ���� 0 num  � 	
	 =  � � o   � ����� &0 roundingdirection roundingDirection l  � ����� m   � ���
�� MRndRN_T��  ��  
  r   � � _   � � o   � ����� 0 num   m   � �����  o      ���� 0 num    =  � � o   � ����� &0 roundingdirection roundingDirection l  � ����� m   � ���
�� MRndRN_F��  ��    Z   ' =     `   !"! o   ���� 0 num  " m  ����   m  ����   r  #$# _  %&% o  	���� 0 num  & m  	
���� $ o      ���� 0 num   '(' ?  )*) o  ���� 0 num  * m  ����  ( +��+ r  ,-, [  ./. _  010 o  ���� 0 num  1 m  ���� / m  ���� - o      ���� 0 num  ��   r   '232 \   %454 _   #676 o   !���� 0 num  7 m  !"���� 5 m  #$���� 3 o      ���� 0 num   898 = *-:;: o  *+���� &0 roundingdirection roundingDirection; l +,<����< m  +,��
�� MRndRN_U��  ��  9 =>= l 0O?@A? Z  0OBC��DB G  0=EFE A  03GHG o  01�� 0 num  H m  12�~�~  F =  6;IJI `  69KLK o  67�}�} 0 num  L m  78�|�| J m  9:�{�{  C r  @EMNM _  @COPO o  @A�z�z 0 num  P m  AB�y�y N o      �x�x 0 num  ��  D r  HOQRQ [  HMSTS _  HKUVU o  HI�w�w 0 num  V m  IJ�v�v T m  KL�u�u R o      �t�t 0 num  @   ceil()   A �WW    c e i l ( )> XYX = RWZ[Z o  RS�s�s &0 roundingdirection roundingDirection[ l SV\�r�q\ m  SV�p
�p MRndRN_D�r  �q  Y ]�o] l Zy^_`^ Z  Zyab�nca G  Zgded ?  Z]fgf o  Z[�m�m 0 num  g m  [\�l�l  e =  `ehih `  `cjkj o  `a�k�k 0 num  k m  ab�j�j i m  cd�i�i  b r  jolml _  jmnon o  jk�h�h 0 num  o m  kl�g�g m o      �f�f 0 num  �n  c r  rypqp \  rwrsr _  rutut o  rs�e�e 0 num  u m  st�d�d s m  uv�c�c q o      �b�b 0 num  _   floor()   ` �vv    f l o o r ( )�o  P n |�wxw I  ���ay�`�a >0 throwinvalidconstantparameter throwInvalidConstantParametery z{z o  ���_�_ &0 roundingdirection roundingDirection{ |�^| m  ��}} �~~  b y�^  �`  x o  |��]�] 0 _support  L �\ Z  ������� =  ����� o  ���[�[ 0 decimalplaces decimalPlaces� m  ���Z�Z  � L  ���� _  ����� o  ���Y�Y 0 num  � m  ���X�X � ��� A  ����� o  ���W�W 0 decimalplaces decimalPlaces� m  ���V�V  � ��U� L  ���� _  ����� o  ���T�T 0 num  � o  ���S�S 0 themultiplier theMultiplier�U  � L  ���� ^  ����� o  ���R�R 0 num  � o  ���Q�Q 0 themultiplier theMultiplier�\   R      �P��
�P .ascrerr ****      � ****� o      �O�O 0 etext eText� �N��
�N 
errn� o      �M�M 0 enumber eNumber� �L��
�L 
erob� o      �K�K 0 efrom eFrom� �J��I
�J 
errt� o      �H�H 
0 eto eTo�I   I  ���G��F�G 
0 _error  � ��� m  ���� ���  r o u n d   n u m b e r� ��� o  ���E�E 0 etext eText� ��� o  ���D�D 0 enumber eNumber� ��� o  ���C�C 0 efrom eFrom� ��B� o  ���A�A 
0 eto eTo�B  �F   ��� l     �@�?�>�@  �?  �>  � ��� l     �=�<�;�=  �<  �;  � ��� l     �:���:  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �9���9  �   Trigonometry   � ���    T r i g o n o m e t r y� ��� l     �8�7�6�8  �7  �6  � ��� i  j m��� I      �5��4�5 0 _sin  � ��3� o      �2�2 0 x  �3  �4  � k     ��� ��� l    	���� r     	��� ]     ��� l    ��1�0� `     ��� o     �/�/ 0 x  � m    �.�.h�1  �0  � l   ��-�,� ^    ��� 1    �+
�+ 
pi  � m    �*�* ��-  �,  � o      �)�) 0 x  � &   convert from degrees to radians   � ��� @   c o n v e r t   f r o m   d e g r e e s   t o   r a d i a n s� ��� r   
 ��� A   
 ��� o   
 �(�( 0 x  � m    �'�'  � o      �&�& 0 isneg isNeg� ��� Z   ���%�$� o    �#�# 0 isneg isNeg� r    ��� d    �� o    �"�" 0 x  � o      �!�! 0 x  �%  �$  � ��� r    &��� _    $��� l   "�� �� ]    "��� o    �� 0 x  � l   !���� ^    !��� m    �� � 1     �
� 
pi  �  �  �   �  � m   " #�� � o      �� 0 y  � ��� r   ' 2��� \   ' 0��� o   ' (�� 0 y  � ]   ( /��� l  ( -���� _   ( -��� ]   ( +��� o   ( )�� 0 y  � m   ) *�� ?�      � m   + ,�� �  �  � m   - .�� � o      �� 0 z  � ��� Z   3 J����� =  3 8��� `   3 6��� o   3 4�� 0 z  � m   4 5�� � m   6 7�� � k   ; F�� ��� r   ; @   [   ; > o   ; <�� 0 z   m   < =�
�
  o      �	�	 0 z  � � r   A F [   A D o   A B�� 0 y   m   B C��  o      �� 0 y  �  �  �  � 	
	 r   K P `   K N o   K L�� 0 z   m   L M��  o      �� 0 z  
  Z   Q e��  ?   Q T o   Q R���� 0 z   m   R S����  k   W a  r   W [ H   W Y o   W X���� 0 isneg isNeg o      ���� 0 isneg isNeg �� r   \ a \   \ _ o   \ ]���� 0 z   m   ] ^����  o      ���� 0 z  ��  �  �     !  r   f u"#" \   f s$%$ l  f o&����& \   f o'(' l  f k)����) \   f k*+* o   f g���� 0 x  + ]   g j,-, o   g h���� 0 y  - m   h i.. ?�!�?��v��  ��  ( ]   k n/0/ o   k l���� 0 y  0 m   l m11 >dD,���J��  ��  % ]   o r232 o   o p���� 0 y  3 m   p q44 <�F���P�# o      ���� 0 z2  ! 565 r   v {787 ]   v y9:9 o   v w���� 0 z2  : o   w x���� 0 z2  8 o      ���� 0 zz  6 ;<; Z   | �=>��?= G   | �@A@ =  | BCB o   | }���� 0 z  C m   } ~���� A =  � �DED o   � ����� 0 z  E m   � ����� > r   � �FGF [   � �HIH \   � �JKJ m   � �LL ?�      K ^   � �MNM o   � ����� 0 zz  N m   � ����� I ]   � �OPO ]   � �QRQ o   � ����� 0 zz  R o   � ����� 0 zz  P l  � �S����S [   � �TUT ]   � �VWV l  � �X����X \   � �YZY ]   � �[\[ l  � �]����] [   � �^_^ ]   � �`a` l  � �b����b \   � �cdc ]   � �efe l  � �g����g [   � �hih ]   � �jkj m   � �ll ���I���k o   � ����� 0 zz  i m   � �mm >!�{N>���  ��  f o   � ����� 0 zz  d m   � �nn >�~O~�K���  ��  a o   � ����� 0 zz  _ m   � �oo >���D���  ��  \ o   � ����� 0 zz  Z m   � �pp ?V�l�=���  ��  W o   � ����� 0 zz  U m   � �qq ?�UUUV���  ��  G o      ���� 0 y  ��  ? r   � �rsr [   � �tut o   � ����� 0 z2  u ]   � �vwv ]   � �xyx o   � ����� 0 z2  y o   � ����� 0 zz  w l  � �z����z \   � �{|{ ]   � �}~} l  � ����� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� m   � ��� =���ќ�� o   � ����� 0 zz  � m   � ��� >Z��)[��  ��  � o   � ����� 0 zz  � m   � ��� >��V}H���  ��  � o   � ����� 0 zz  � m   � ��� ?*������  ��  � o   � ����� 0 zz  � m   � ��� ?�"w��  ��  ~ o   � ����� 0 zz  | m   � ��� ?�UUUU�?��  ��  s o      ���� 0 y  < ��� Z  � �������� o   � ����� 0 isneg isNeg� r   � ���� d   � ��� o   � ����� 0 y  � o      ���� 0 y  ��  ��  � ���� L   � ��� o   � ����� 0 y  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  n q��� I     �����
�� .Mth:Sin_null���     doub� o      ���� 0 x  ��  � Q     ���� L    �� I    ������� 0 _sin  � ���� c    ��� o    ���� 0 x  � m    ��
�� 
nmbr��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I    ������� 
0 _error  � ��� m    �� ���  s i n� ��� o    ���� 0 etext eText� ��� o    ���� 0 enumber eNumber� ��� o    ���� 0 efrom eFrom� ���� o    ���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  r u��� I     �����
�� .Mth:Cos_null���     doub� o      ���� 0 x  ��  � Q      ���� L    �� I    ������� 0 _sin  � ���� [    	��� l   ������ c    ��� o    ���� 0 x  � m    ��
�� 
nmbr��  ��  � m    ���� Z��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� ����
�� 
errt� o      �~�~ 
0 eto eTo�  � I     �}��|�} 
0 _error  � ��� m    �� ���  c o s� ��� o    �{�{ 0 etext eText� ��� o    �z�z 0 enumber eNumber� ��� o    �y�y 0 efrom eFrom� ��x� o    �w�w 
0 eto eTo�x  �|  � ��� l     �v�u�t�v  �u  �t  � ��� l     �s�r�q�s  �r  �q  � ��� i  v y��� I     �p��o
�p .Mth:Tan_null���     doub� o      �n�n 0 x  �o  � k    �� ��� l     �m���m  � a [ note: this starts to lose accuracy between 89.9999999 and 90�, but should be 'good enough'   � ��� �   n o t e :   t h i s   s t a r t s   t o   l o s e   a c c u r a c y   b e t w e e n   8 9 . 9 9 9 9 9 9 9   a n d   9 0 � ,   b u t   s h o u l d   b e   ' g o o d   e n o u g h '� ��l� Q    � � k    �  r     c     o    �k�k 0 x   m    �j
�j 
nmbr o      �i�i 0 x   	
	 l  	 # Z  	 #�h�g G   	  =  	  o   	 
�f�f 0 x   m   
 �e�e Z =    o    �d�d 0 x   m    �c�c R    �b
�b .ascrerr ****      � **** m     � F I n v a l i d   n u m b e r   ( r e s u l t   w o u l d   b e  " ) . �a
�a 
errn m    �`�`�s �_�^
�_ 
erob o    �]�] 0 x  �^  �h  �g   4 . -2701 normally indicates divide-by-zero error    � \   - 2 7 0 1   n o r m a l l y   i n d i c a t e s   d i v i d e - b y - z e r o   e r r o r
  l  $ - !"  r   $ -#$# ]   $ +%&% l  $ ''�\�[' `   $ '()( o   $ %�Z�Z 0 x  ) m   % &�Y�Yh�\  �[  & l  ' **�X�W* ^   ' *+,+ 1   ' (�V
�V 
pi  , m   ( )�U�U ��X  �W  $ o      �T�T 0 x  ! &   convert from degrees to radians   " �-- @   c o n v e r t   f r o m   d e g r e e s   t o   r a d i a n s ./. r   . 3010 A   . 1232 o   . /�S�S 0 x  3 m   / 0�R�R  1 o      �Q�Q 0 isneg isNeg/ 454 Z  4 @67�P�O6 o   4 5�N�N 0 isneg isNeg7 r   8 <898 d   8 ::: o   8 9�M�M 0 x  9 o      �L�L 0 x  �P  �O  5 ;<; r   A J=>= _   A H?@? l  A FA�K�JA ^   A FBCB o   A B�I�I 0 x  C l  B ED�H�GD ^   B EEFE 1   B C�F
�F 
pi  F m   C D�E�E �H  �G  �K  �J  @ m   F G�D�D > o      �C�C 0 y  < GHG r   K VIJI \   K TKLK o   K L�B�B 0 y  L ]   L SMNM l  L QO�A�@O _   L QPQP ]   L ORSR o   L M�?�? 0 y  S m   M NTT ?�      Q m   O P�>�> �A  �@  N m   Q R�=�= J o      �<�< 0 z  H UVU Z   W nWX�;�:W =  W \YZY `   W Z[\[ o   W X�9�9 0 z  \ m   X Y�8�8 Z m   Z [�7�7 X k   _ j]] ^_^ r   _ d`a` [   _ bbcb o   _ `�6�6 0 z  c m   ` a�5�5 a o      �4�4 0 z  _ d�3d r   e jefe [   e hghg o   e f�2�2 0 y  h m   f g�1�1 f o      �0�0 0 y  �3  �;  �:  V iji r   o �klk \   o ~mnm l  o xo�/�.o \   o xpqp l  o tr�-�,r \   o tsts o   o p�+�+ 0 x  t ]   p suvu o   p q�*�* 0 y  v m   q rww ?�!�P M�-  �,  q ]   t wxyx o   t u�)�) 0 y  y m   u vzz >A�`  �/  �.  n ]   x }{|{ o   x y�(�( 0 y  | m   y |}} <��&3\l o      �'�' 0 z2  j ~~ r   � ���� ]   � ���� o   � ��&�& 0 z2  � o   � ��%�% 0 z2  � o      �$�$ 0 zz   ��� Z   � ����#�� ?   � ���� o   � ��"�" 0 zz  � m   � ��� =����+�� r   � ���� [   � ���� o   � ��!�! 0 z2  � ^   � ���� ]   � ���� ]   � ���� o   � �� �  0 z2  � o   � ��� 0 zz  � l  � ����� \   � ���� ]   � ���� l  � ����� [   � ���� ]   � ���� m   � ��� �ɒ��O?D� o   � ��� 0 zz  � m   � ��� A1������  �  � o   � ��� 0 zz  � m   � ��� Aq��)�y�  �  � l  � ����� \   � ���� ]   � ���� l  � ����� [   � ���� ]   � ���� l  � ����� \   � ���� ]   � ���� l  � ����� [   � ���� o   � ��� 0 zz  � m   � ��� @ʸ��et�  �  � o   � ��� 0 zz  � m   � ��� A4'�X*���  �  � o   � ��� 0 zz  � m   � ��� Awُ�����  �  � o   � ��� 0 zz  � m   � ��� A���<�Z6�  �  � o      �� 0 y  �#  � r   � ���� o   � ��� 0 z2  � o      �
�
 0 y  � ��� Z  � ����	�� G   � ���� =  � ���� o   � ��� 0 z  � m   � ��� � =  � ���� o   � ��� 0 z  � m   � ��� � r   � ���� ^   � ���� m   � ������ o   � ��� 0 y  � o      �� 0 y  �	  �  � ��� Z  � ���� ��� o   � ����� 0 isneg isNeg� r   � ���� d   � ��� o   � ����� 0 y  � o      ���� 0 y  �   ��  � ���� L   � ��� o   � ����� 0 y  ��    R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��   I   �������� 
0 _error  � ��� m   � ��� ���  t a n� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  �l  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ������  �   inverse   � ���    i n v e r s e� ��� l     ��������  ��  ��  � ��� i  z }��� I      ������� 	0 _asin  � ���� o      ���� 0 x  ��  ��  � k     ��� ��� r     ��� A        o     ���� 0 x   m    ����  � o      ���� 0 isneg isNeg�  Z   ���� o    ���� 0 isneg isNeg r   
  d   
  o   
 ���� 0 x   o      ���� 0 x  ��  ��   	
	 Z   %���� ?     o    ���� 0 x   m    ����  R    !��
�� .ascrerr ****      � **** m      � T I n v a l i d   n u m b e r   ( n o t   b e t w e e n   - 1 . 0   a n d   1 . 0 ) . ��
�� 
errn m    �����Y ����
�� 
erob o    ���� 0 x  ��  ��  ��  
  Z   & � ?   & ) o   & '���� 0 x   m   ' ( ?�       k   ,   !  r   , 1"#" \   , /$%$ m   , -���� % o   - .���� 0 x  # o      ���� 0 zz  ! &'& r   2 W()( ^   2 U*+* ]   2 E,-, o   2 3���� 0 zz  - l  3 D.����. [   3 D/0/ ]   3 B121 l  3 @3����3 \   3 @454 ]   3 >676 l  3 <8����8 [   3 <9:9 ]   3 :;<; l  3 8=����= \   3 8>?> ]   3 6@A@ m   3 4BB ?hOØ��A o   4 5���� 0 zz  ? m   6 7CC ?��Y�,���  ��  < o   8 9���� 0 zz  : m   : ;DD @����?���  ��  7 o   < =���� 0 zz  5 m   > ?EE @9����"��  ��  2 o   @ A���� 0 zz  0 m   B CFF @<�b@����  ��  + l  E TG����G [   E THIH ]   E RJKJ l  E PL����L \   E PMNM ]   E NOPO l  E LQ����Q [   E LRSR ]   E JTUT l  E HV����V \   E HWXW o   E F���� 0 zz  X m   F GYY @5򢶿]R��  ��  U o   H I���� 0 zz  S m   J KZZ @bb�j1��  ��  P o   L M���� 0 zz  N m   N O[[ @w���c���  ��  K o   P Q���� 0 zz  I m   R S\\ @ug	��D���  ��  ) o      ���� 0 p  ' ]^] r   X __`_ a   X ]aba l  X [c����c [   X [ded o   X Y���� 0 zz  e o   Y Z���� 0 zz  ��  ��  b m   [ \ff ?�      ` o      ���� 0 zz  ^ ghg r   ` iiji \   ` gklk l  ` em����m ^   ` enon 1   ` c��
�� 
pi  o m   c d���� ��  ��  l o   e f���� 0 zz  j o      ���� 0 z  h pqp r   j srsr \   j qtut ]   j mvwv o   j k���� 0 zz  w o   k l���� 0 p  u m   m pxx <��&3\
s o      ���� 0 zz  q y��y r   t z{z [   t }|}| \   t w~~ o   t u���� 0 z   o   u v���� 0 zz  } l  w |������ ^   w |��� 1   w z��
�� 
pi  � m   z {���� ��  ��  { o      ���� 0 z  ��   ��� A   � ���� o   � ����� 0 x  � m   � ��� >Ey��0�:� ���� r   � ���� o   � ����� 0 x  � o      ���� 0 z  ��   k   � ��� ��� r   � ���� ]   � ���� o   � ����� 0 x  � o   � ����� 0 x  � o      ���� 0 zz  � ���� r   � ���� [   � ���� ]   � ���� ^   � ���� ]   � ���� o   � ����� 0 zz  � l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� m   � ��� ?qk��v�� o   � ����� 0 zz  � m   � ��� ?�CA3>M���  ��  � o   � ����� 0 zz  � m   � ��� @�K�/��  ��  � o   � ��� 0 zz  � m   � ��� @0C1�'����  ��  � o   � ��~�~ 0 zz  � m   � ��� @3��w����  ��  � o   � ��}�} 0 zz  � m   � ��� @ elΰ8��  ��  � l  � ���|�{� \   � ���� ]   � ���� l  � ���z�y� [   � ���� ]   � ���� l  � ���x�w� \   � ���� ]   � ���� l  � ���v�u� [   � ���� ]   � ���� l  � ���t�s� \   � ���� o   � ��r�r 0 zz  � m   � ��� @-{Y^��t  �s  � o   � ��q�q 0 zz  � m   � ��� @Q��%��6�v  �u  � o   � ��p�p 0 zz  � m   � ��� @be�m5v��x  �w  � o   � ��o�o 0 zz  � m   � ��� @apV�����z  �y  � o   � ��n�n 0 zz  � m   � ��� @H�"
6��|  �{  � o   � ��m�m 0 x  � o   � ��l�l 0 x  � o      �k�k 0 z  ��   ��� Z  � ����j�i� o   � ��h�h 0 isneg isNeg� r   � ���� d   � ��� o   � ��g�g 0 z  � o      �f�f 0 z  �j  �i  � ��e� L   � ��� ^   � ���� o   � ��d�d 0 z  � l  � ���c�b� ^   � ���� 1   � ��a
�a 
pi  � m   � ��`�` ��c  �b  �e  � ��� l     �_�^�]�_  �^  �]  � ��� l     �\�[�Z�\  �[  �Z  � ��� l     �Y�X�W�Y  �X  �W  � ��� i  ~ ���� I     �V��U
�V .Mth:Sinanull���     doub� o      �T�T 0 x  �U  � Q     ���� L    �� I    �S��R�S 	0 _asin  � ��Q� c    ��� o    �P�P 0 x  � m    �O
�O 
nmbr�Q  �R  � R      �N��
�N .ascrerr ****      � ****� o      �M�M 0 etext eText� �L��
�L 
errn� o      �K�K 0 enumber eNumber� �J��
�J 
erob� o      �I�I 0 efrom eFrom� �H��G
�H 
errt� o      �F�F 
0 eto eTo�G  � I    �E �D�E 
0 _error     m     �  a s i n  o    �C�C 0 etext eText  o    �B�B 0 enumber eNumber 	
	 o    �A�A 0 efrom eFrom
 �@ o    �?�? 
0 eto eTo�@  �D  �  l     �>�=�<�>  �=  �<    l     �;�:�9�;  �:  �9    i  � � I     �8�7
�8 .Mth:Cosanull���     doub o      �6�6 0 x  �7   Q       L     \     m    �5�5 Z l   �4�3 I    �2�1�2 	0 _asin   �0 c     o    �/�/ 0 x   m    �.
�. 
nmbr�0  �1  �4  �3   R      �- !
�- .ascrerr ****      � ****  o      �,�, 0 etext eText! �+"#
�+ 
errn" o      �*�* 0 enumber eNumber# �)$%
�) 
erob$ o      �(�( 0 efrom eFrom% �'&�&
�' 
errt& o      �%�% 
0 eto eTo�&   I     �$'�#�$ 
0 _error  ' ()( m    ** �++  a c o s) ,-, o    �"�" 0 etext eText- ./. o    �!�! 0 enumber eNumber/ 010 o    � �  0 efrom eFrom1 2�2 o    �� 
0 eto eTo�  �#   343 l     ����  �  �  4 565 l     ����  �  �  6 787 i  � �9:9 I     �;�
� .Mth:Tananull���     doub; o      �� 0 x  �  : Q     *<=>< k    ?? @A@ r    BCB c    DED o    �� 0 x  E m    �
� 
nmbrC o      �� 0 x  A F�F L   	 GG I   	 �H�� 	0 _asin  H I�I ^   
 JKJ o   
 �� 0 x  K l   L��L a    MNM l   O�
�	O [    PQP ]    RSR o    �� 0 x  S o    �� 0 x  Q m    �� �
  �	  N m    TT ?�      �  �  �  �  �  = R      �UV
� .ascrerr ****      � ****U o      �� 0 etext eTextV �WX
� 
errnW o      �� 0 enumber eNumberX �YZ
� 
erobY o      � �  0 efrom eFromZ ��[��
�� 
errt[ o      ���� 
0 eto eTo��  > I     *��\���� 
0 _error  \ ]^] m   ! "__ �``  a t a n^ aba o   " #���� 0 etext eTextb cdc o   # $���� 0 enumber eNumberd efe o   $ %���� 0 efrom eFromf g��g o   % &���� 
0 eto eTo��  ��  8 hih l     ��������  ��  ��  i jkj l     ��������  ��  ��  k lml l     ��no��  n  -----   o �pp 
 - - - - -m qrq l     ��st��  s   hyperbolic   t �uu    h y p e r b o l i cr vwv l     ��������  ��  ��  w xyx i  � �z{z I     ��|��
�� .Mth:Sinhnull���     doub| o      ���� 0 x  ��  { Q     .}~} k    �� ��� r    ��� c    ��� o    ���� 0 x  � m    ��
�� 
nmbr� o      ���� 0 x  � ���� L   	 �� ]   	 ��� m   	 
�� ?�      � l  
 ������ \   
 ��� a   
 ��� o   
 ���� 	0 __e__  � o    ���� 0 x  � a    ��� o    ���� 	0 __e__  � d    �� o    ���� 0 x  ��  ��  ��  ~ R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��   I   $ .������� 
0 _error  � ��� m   % &�� ��� 
 a s i n h� ��� o   & '���� 0 etext eText� ��� o   ' (���� 0 enumber eNumber� ��� o   ( )���� 0 efrom eFrom� ���� o   ) *���� 
0 eto eTo��  ��  y ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Mth:Coshnull���     doub� o      ���� 0 x  ��  � Q     .���� k    �� ��� r    ��� c    ��� o    ���� 0 x  � m    ��
�� 
nmbr� o      ���� 0 x  � ���� L   	 �� ]   	 ��� m   	 
�� ?�      � l  
 ������ [   
 ��� a   
 ��� o   
 ���� 	0 __e__  � o    ���� 0 x  � a    ��� o    ���� 	0 __e__  � d    �� o    ���� 0 x  ��  ��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I   $ .������� 
0 _error  � ��� m   % &�� ��� 
 a c o s h� ��� o   & '���� 0 etext eText� ��� o   ' (���� 0 enumber eNumber� ��� o   ( )���� 0 efrom eFrom� ���� o   ) *���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Mth:Tanhnull���     doub� o      ���� 0 x  ��  � Q     =���� k    +�� ��� r    ��� c    ��� o    ���� 0 x  � m    ��
�� 
nmbr� o      ���� 0 x  � ���� L   	 +�� ^   	 *��� l  	 ������ \   	 ��� a   	 ��� o   	 ���� 	0 __e__  � o    ���� 0 x  � a    ��� o    ���� 	0 __e__  � d    �� o    ���� 0 x  ��  ��  � l   )������ [    )��� a     ��� o    ���� 	0 __e__  � o    ���� 0 x  � a     (��� o     %���� 	0 __e__  � d   % '   o   % &���� 0 x  ��  ��  ��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  � I   3 =������ 
0 _error   	
	 m   4 5 � 
 a t a n h
  o   5 6���� 0 etext eText  o   6 7���� 0 enumber eNumber  o   7 8���� 0 efrom eFrom �� o   8 9���� 
0 eto eTo��  ��  �  l     �������  ��  �    l     �~�}�|�~  �}  �|    l     �{�{   J D--------------------------------------------------------------------    � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     �z �z     Logarithms     �!!    L o g a r i t h m s "#" l     �y�x�w�y  �x  �w  # $%$ i  � �&'& I      �v(�u�v 
0 _frexp  ( )�t) o      �s�s 0 m  �t  �u  ' k     n** +,+ Z    -.�r�q- =    /0/ o     �p�p 0 m  0 m    �o�o  . L    11 J    
22 343 m    55         4 6�n6 m    �m�m  �n  �r  �q  , 787 r    9:9 A    ;<; o    �l�l 0 m  < m    �k�k  : o      �j�j 0 isneg isNeg8 =>= Z   "?@�i�h? o    �g�g 0 isneg isNeg@ r    ABA d    CC o    �f�f 0 m  B o      �e�e 0 m  �i  �h  > DED r   # &FGF m   # $�d�d  G o      �c�c 0 e  E HIH W   ' [JKJ Z   7 VLM�bNL @   7 :OPO o   7 8�a�a 0 m  P m   8 9�`�` M k   = HQQ RSR r   = BTUT ^   = @VWV o   = >�_�_ 0 m  W m   > ?�^�^ U o      �]�] 0 m  S X�\X r   C HYZY [   C F[\[ o   C D�[�[ 0 e  \ m   D E�Z�Z Z o      �Y�Y 0 e  �\  �b  N k   K V]] ^_^ r   K P`a` ]   K Nbcb o   K L�X�X 0 m  c m   L M�W�W a o      �V�V 0 m  _ d�Ud r   Q Vefe \   Q Tghg o   Q R�T�T 0 e  h m   R S�S�S f o      �R�R 0 e  �U  K F   + 6iji @   + .klk o   + ,�Q�Q 0 m  l m   , -mm ?�      j A   1 4non o   1 2�P�P 0 m  o m   2 3�O�O I pqp Z  \ hrs�N�Mr o   \ ]�L�L 0 isneg isNegs r   ` dtut d   ` bvv o   ` a�K�K 0 m  u o      �J�J 0 m  �N  �M  q w�Iw L   i nxx J   i myy z{z o   i j�H�H 0 m  { |�G| o   j k�F�F 0 e  �G  �I  % }~} l     �E�D�C�E  �D  �C  ~ � l     �B�A�@�B  �A  �@  � ��� i  � ���� I      �?��>�? 	0 _logn  � ��=� o      �<�< 0 x  �=  �>  � k    ;�� ��� Z    ���;�:� B     ��� o     �9�9 0 x  � m    �8�8  � R    �7��
�7 .ascrerr ****      � ****� m   
 �� ��� 8 I n v a l i d   n u m b e r   ( m u s t   b e   > 0 ) .� �6��5
�6 
errn� m    	�4�4�Y�5  �;  �:  � ��� r    &��� I      �3��2�3 
0 _frexp  � ��1� o    �0�0 0 x  �1  �2  � J      �� ��� o      �/�/ 0 x  � ��.� o      �-�- 0 e  �.  � ��� Z   '8���,�� G   ' 2��� A   ' *��� o   ' (�+�+ 0 e  � m   ( )�*�*��� ?   - 0��� o   - .�)�) 0 e  � m   . /�(�( � k   5 ��� ��� Z   5 ^���'�� A   5 8��� o   5 6�&�& 0 x  � m   6 7�� ?栞fK�� l  ; N���� k   ; N�� ��� r   ; @��� \   ; >��� o   ; <�%�% 0 e  � m   < =�$�$ � o      �#�# 0 e  � ��� r   A F��� \   A D��� o   A B�"�" 0 x  � m   B C�� ?�      � o      �!�! 0 z  � �� � r   G N��� [   G L��� ]   G J��� m   G H�� ?�      � o   H I�� 0 z  � m   J K�� ?�      � o      �� 0 y  �   �   (2 ^ 0.5) / 2   � ���    ( 2   ^   0 . 5 )   /   2�'  � k   Q ^�� ��� r   Q V��� \   Q T��� o   Q R�� 0 x  � m   R S�� � o      �� 0 z  � ��� r   W ^��� [   W \��� ]   W Z��� m   W X�� ?�      � o   X Y�� 0 x  � m   Z [�� ?�      � o      �� 0 y  �  � ��� r   _ d��� ^   _ b��� o   _ `�� 0 z  � o   ` a�� 0 y  � o      �� 0 x  � ��� r   e j��� ]   e h��� o   e f�� 0 x  � o   f g�� 0 x  � o      �� 0 z  � ��� r   k ���� ^   k ���� ]   k x��� ]   k n��� o   k l�� 0 x  � o   l m�� 0 z  � l  n w���� \   n w��� ]   n u��� l  n s���� [   n s��� ]   n q��� m   n o�� ��D=�l�� o   o p�� 0 z  � m   q r�� @0b�s{��  �  � o   s t�
�
 0 z  � m   u v�� @P	"*?�  �  � l  x ���	�� \   x �   ]   x � l  x �� [   x  ]   x } l  x {	��	 \   x {

 o   x y�� 0 z   m   y z @A�C�l��  �   o   { |�� 0 z   m   } ~ @s��*�
�  �   o    ��� 0 z   m   � � @���?;�	  �  � o      � �  0 z  �  r   � � o   � ����� 0 e   o      ���� 0 y   �� r   � � [   � � [   � � \   � � o   � ����� 0 z   ]   � � o   � ����� 0 y   m   � � ?+�\a� o   � ����� 0 x   ]   � �  o   � ����� 0 e    m   � �!! ?�0      o      ���� 0 z  ��  �,  � k   �8"" #$# Z   � �%&��'% A   � �()( o   � ����� 0 x  ) m   � �** ?栞fK�& l  � �+,-+ k   � �.. /0/ r   � �121 \   � �343 o   � ����� 0 e  4 m   � ����� 2 o      ���� 0 e  0 5��5 r   � �676 \   � �898 ]   � �:;: m   � ����� ; o   � ����� 0 x  9 m   � ����� 7 o      ���� 0 x  ��  ,   (2 ^ 0.5) / 2   - �<<    ( 2   ^   0 . 5 )   /   2��  ' r   � �=>= \   � �?@? o   � ����� 0 x  @ m   � ����� > o      ���� 0 x  $ ABA r   � �CDC ]   � �EFE o   � ����� 0 x  F o   � ����� 0 x  D o      ���� 0 z  B GHG r   �IJI ^   �KLK ]   � �MNM ]   � �OPO o   � ����� 0 x  P o   � ����� 0 z  N l  � �Q����Q [   � �RSR ]   � �TUT l  � �V����V [   � �WXW ]   � �YZY l  � �[����[ [   � �\]\ ]   � �^_^ l  � �`����` [   � �aba ]   � �cdc l  � �e����e [   � �fgf ]   � �hih m   � �jj ?���i o   � ����� 0 x  g m   � �kk ?���?Vd���  ��  d o   � ����� 0 x  b m   � �ll @Һ�i���  ��  _ o   � ����� 0 x  ] m   � �mm @,�r�>����  ��  Z o   � ����� 0 x  X m   � �nn @1�֒K�R��  ��  U o   � ����� 0 x  S m   � �oo @�c}~ݝ��  ��  L l  �p����p [   �qrq ]   � �sts l  � �u����u [   � �vwv ]   � �xyx l  � �z����z [   � �{|{ ]   � �}~} l  � ����� [   � ���� ]   � ���� l  � ������� [   � ���� o   � ����� 0 x  � m   � ��� @&� �����  ��  � o   � ����� 0 x  � m   � ��� @F�,N���  ��  ~ o   � ����� 0 x  | m   � ��� @T�3�&����  ��  y o   � ����� 0 x  w m   � ��� @Q���^���  ��  t o   � ����� 0 x  r m   � �� @7 
�&5��  ��  J o      ���� 0 y  H ��� Z  ������� >  ��� o  ���� 0 e  � m  ����  � r  ��� \  ��� o  ���� 0 y  � ]  ��� o  ���� 0 e  � m  �� ?+�\a�� o      ���� 0 y  ��  ��  � ��� r  ��� \  ��� o  ���� 0 y  � l ������ ^  ��� o  ���� 0 z  � m  ���� ��  ��  � o      ���� 0 y  � ��� r  $��� [  "��� o   ���� 0 x  � o   !���� 0 y  � o      ���� 0 z  � ���� Z %8������� >  %(��� o  %&���� 0 e  � m  &'����  � r  +4��� [  +2��� o  +,���� 0 z  � ]  ,1��� o  ,-���� 0 e  � m  -0�� ?�0     � o      ���� 0 z  ��  ��  ��  � ���� L  9;�� o  9:���� 0 z  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Mth:Lognnull���     doub� o      ���� 0 x  ��  � Q     ���� L    �� I    ������� 	0 _logn  � ���� c    ��� o    ���� 0 x  � m    ��
�� 
nmbr��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I    ������� 
0 _error  � ��� m    �� ���  l o g n� ��� o    ���� 0 etext eText� ��� o    �� 0 enumber eNumber� ��� o    �� 0 efrom eFrom� ��� o    �� 
0 eto eTo�  ��  � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  � ���� I     ���
� .Mth:Lo10null���     doub� o      �� 0 x  �  � Q     $���� l   ���� L    �� ^    ��� ]    ��� l   ���� ^    ��� I    ���� 	0 _logn  � ��~� c    ��� o    �}�} 0 x  � m    �|
�| 
nmbr�~  �  � m    �� @k���T��  �  � m    �� @r�     � m    �� @r�    j�   correct for minor drift   � ��� 0   c o r r e c t   f o r   m i n o r   d r i f t� R      �{��
�{ .ascrerr ****      � ****� o      �z�z 0 etext eText� �y��
�y 
errn� o      �x�x 0 enumber eNumber� �w� 
�w 
erob� o      �v�v 0 efrom eFrom  �u�t
�u 
errt o      �s�s 
0 eto eTo�t  � I    $�r�q�r 
0 _error    m     � 
 l o g 1 0  o    �p�p 0 etext eText 	
	 o    �o�o 0 enumber eNumber
  o    �n�n 0 efrom eFrom �m o     �l�l 
0 eto eTo�m  �q  �  l     �k�j�i�k  �j  �i    l     �h�g�f�h  �g  �f    i  � � I     �e
�e .Mth:Logbnull���     doub o      �d�d 0 x   �c�b
�c 
Base o      �a�a 0 b  �b   Q     ' L     ^     I    �`�_�` 	0 _logn    �^  c    !"! o    �]�] 0 x  " m    �\
�\ 
nmbr�^  �_   l   #�[�Z# I    �Y$�X�Y 	0 _logn  $ %�W% c    &'& o    �V�V 0 b  ' m    �U
�U 
nmbr�W  �X  �[  �Z   R      �T()
�T .ascrerr ****      � ****( o      �S�S 0 etext eText) �R*+
�R 
errn* o      �Q�Q 0 enumber eNumber+ �P,-
�P 
erob, o      �O�O 0 efrom eFrom- �N.�M
�N 
errt. o      �L�L 
0 eto eTo�M   I    '�K/�J�K 
0 _error  / 010 m    22 �33  l o g b1 454 o     �I�I 0 etext eText5 676 o     !�H�H 0 enumber eNumber7 898 o   ! "�G�G 0 efrom eFrom9 :�F: o   " #�E�E 
0 eto eTo�F  �J   ;<; l     �D�C�B�D  �C  �B  < =�A= l     �@�?�>�@  �?  �>  �A       (�=>?@A h r ~ �BCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`�=  > &�<�;�:�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� ���������
�< 
pimr�; 0 _support  �: 
0 _error  �9 	0 __e__  �8 0 _isequaldelta _isEqualDelta�7 $0 _mindecimalrange _minDecimalRange�6 $0 _maxdecimalrange _maxDecimalRange�5 (0 _asintegerproperty _asIntegerProperty�4 ,0 _makenumberformatter _makeNumberFormatter�3 "0 _setbasicformat _setBasicFormat�2  0 _nameforformat _nameForFormat
�1 .Mth:FNumnull���     nmbr
�0 .Mth:PNumnull���     ctxt
�/ .Mth:NuHenull���     ****
�. .Mth:HeNunull���     ctxt
�- .Mth:DeRanull���     doub
�, .Mth:RaDenull���     doub
�+ .Mth:Abs_null���     nmbr
�* .Mth:CmpNnull���     ****
�) .Mth:MinNnull���     ****
�( .Mth:MaxNnull���     ****
�' .Mth:RouNnull���     nmbr�& 0 _sin  
�% .Mth:Sin_null���     doub
�$ .Mth:Cos_null���     doub
�# .Mth:Tan_null���     doub�" 	0 _asin  
�! .Mth:Sinanull���     doub
�  .Mth:Cosanull���     doub
� .Mth:Tananull���     doub
� .Mth:Sinhnull���     doub
� .Mth:Coshnull���     doub
� .Mth:Tanhnull���     doub� 
0 _frexp  � 	0 _logn  
� .Mth:Lognnull���     doub
� .Mth:Lo10null���     doub
� .Mth:Logbnull���     doub? �a� a  bcb �d�
� 
cobjd ee   � 
� 
frmk�  c �f�
� 
cobjf gg   �
� 
osax�  @ hh   � /
� 
scptA � 7��ij�� 
0 _error  � �
k�
 k  �	�����	 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  i ����� � 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom�  
0 eto eToj  G������ �� &0 throwcommanderror throwCommandError� b  ࠡ����+ B �� �����lm���� (0 _asintegerproperty _asIntegerProperty�� ��n�� n  �������� 0 thevalue theValue�� 0 propertyname propertyName�� 0 minvalue minValue��  l ���������� 0 thevalue theValue�� 0 propertyname propertyName�� 0 minvalue minValue�� 0 n  m 	������������o � �
�� 
long
�� 
doub
�� 
bool
�� 
errn���Y��  o ������
�� 
errn���Y��  �� 9 (��&E�O���&
 ���& )��lhY hO�W X  )��l�%�%C �� �����pq���� ,0 _makenumberformatter _makeNumberFormatter�� ��r�� r  �������� 0 formatstyle formatStyle�� 0 
localecode 
localeCode�� 0 	thenumber 	theNumber��  p ���������������� 0 formatstyle formatStyle�� 0 
localecode 
localeCode�� 0 	thenumber 	theNumber�� 0 asocformatter asocFormatter�� 0 formatrecord formatRecord�� 0 s  �� 0 etext eTextq G��������������������������������������������=��������d�����������s������������������~t���������
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
MthH�� �� 60 asoptionalrecordparameter asOptionalRecordParameter�� "0 _setbasicformat _setBasicFormat�� (0 _asintegerproperty _asIntegerProperty�� 60 setminimumfractiondigits_ setMinimumFractionDigits_����� 60 setmaximumfractiondigits_ setMaximumFractionDigits_� <0 setminimumsignificantdigits_ setMinimumSignificantDigits_� 60 setusessignificantdigits_ setUsesSignificantDigits_� <0 setmaximumsignificantdigits_ setMaximumSignificantDigits_
� 
ctxt
� 
leng
� 
errn��Y� ,0 setdecimalseparator_ setDecimalSeparator_�  s ���
� 
errn��\�  � 60 setusesgroupingseparator_ setUsesGroupingSeparator_� .0 setgroupingseparator_ setGroupingSeparator_
� MRndRNhE� @0 nsnumberformatterroundhalfeven NSNumberFormatterRoundHalfEven� $0 setroundingmode_ setRoundingMode_
� MRndRNhT� @0 nsnumberformatterroundhalfdown NSNumberFormatterRoundHalfDown
� MRndRNhF� <0 nsnumberformatterroundhalfup NSNumberFormatterRoundHalfUp
� MRndRN_T� 80 nsnumberformatterrounddown NSNumberFormatterRoundDown
� MRndRN_F� 40 nsnumberformatterroundup NSNumberFormatterRoundUp
� MRndRN_U� >0 nsnumberformatterroundceiling NSNumberFormatterRoundCeiling
� MRndRN_D� :0 nsnumberformatterroundfloor NSNumberFormatterRoundFloort ���
� 
errn��Y�  � 0 etext eText
� 
enum� � .0 throwinvalidparameter throwInvalidParameter� *0 asnslocaleparameter asNSLocaleParameter� 0 
setlocale_ 
setLocale_�����,j+ j+ E�Ok�kv��l k Ab  ����b  �,��������a �a �a �a a m+ E�O*���,�m+ O��,� !�*��,a jm+ k+ O�a k+ OPY hO��,� �*��,a jm+ k+ OPY hO��,� �*��,a jm+ k+ O�ek+ Y hO��,� �*��,a  jm+ k+ !O�ek+ Y hO�a ,� G 0�a ,a "&E�O�a #,j  )a $a %lhY hO��k+ &W X ' ()a $a %la )Y hO�a ,� H 1�a ,a "&E�O�a #,j  �fk+ *Y �ek+ *O��k+ +W X ' ()a $a %la ,Y hO�a ,� ��a ,a -  ��a .,k+ /Y ��a ,a 0  ��a 1,k+ /Y ��a ,a 2  ��a 3,k+ /Y r�a ,a 4  ��a 5,k+ /Y Y�a ,a 6  ��a 7,k+ /Y @�a ,a 8  ��a 9,k+ /Y '�a ,a :  ��a ;,k+ /Y )a $a %la <Y hY  *���m+ W X ' =)ja >W X ? =b  �a @�a Alv�a B+ CO�b  �a Dl+ Ek+ FO�D ����uv�� "0 _setbasicformat _setBasicFormat� �w� w  ���� 0 asocformatter asocFormatter� 0 
formatname 
formatName� 0 	thenumber 	theNumber�  u ���� 0 asocformatter asocFormatter� 0 
formatname 
formatName� 0 	thenumber 	theNumberv "�����������������~�}�|�{�z�y�x�w�v�u�t�s�r�q�p�o�n�
� MthZMth0
� 
msng
� misccura� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� "0 setnumberstyle_ setNumberStyle_
� 
pcls
� 
long� 40 nsnumberformatternostyle NSNumberFormatterNoStyle
� 
bool� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle� 60 setminimumfractiondigits_ setMinimumFractionDigits_��� 60 setmaximumfractiondigits_ setMaximumFractionDigits_� 60 setusesgroupingseparator_ setUsesGroupingSeparator_
� MthZMth3
� MthZMth1
�~ MthZMth2
�} MthZMth5�| @0 nsnumberformattercurrencystyle NSNumberFormatterCurrencyStyle
�{ MthZMth4�z >0 nsnumberformatterpercentstyle NSNumberFormatterPercentStyle
�y MthZMth6�x @0 nsnumberformatterspelloutstyle NSNumberFormatterSpellOutStyle
�w 
kocl
�v 
ctxt
�u .corecnte****       ****�t 0 
setformat_ 
setFormat_
�s 
errn�r�Y
�q 
erob
�p 
errt
�o 
enum�n �G��  ���  ���,k+ Y ���,�  ���,k+ Y tb  '�	 �b  '�&
 b  �	 �b  �&�&
 �j �& $���,k+ O�kk+ 
O��k+ O�fk+ OPY ���,k+ O�kk+ 
O��k+ OPY ���  ���,k+ Y ���  ���,k+ Y ��a   ���,k+ Y t�a   ��a ,k+ Y _�a   ��a ,k+ Y J�a   ��a ,k+ Y 5�kva a l j ��k+ Y )a a a �a a a  a !E �m��l�kxy�j�m  0 _nameforformat _nameForFormat�l �iz�i z  �h�h 0 formatstyle formatStyle�k  x �g�g 0 formatstyle formatStyley �f��e��d�c�b�a&(
�f MthZMth1
�e MthZMth2
�d MthZMth5
�c MthZMth4
�b MthZMth3
�a MthZMth6�j I��  �Y ?��  �Y 4��  �Y )��  �Y ��  �Y ��  �Y �%�%F �`9�_�^{|�]
�` .Mth:FNumnull���     nmbr�_ 0 	thenumber 	theNumber�^ �\}~
�\ 
Usin} {�[�Z�Y�[ 0 formatstyle formatStyle�Z  
�Y MthZMth0~ �X�W
�X 
Loca {�V�UE�V 0 
localecode 
localeCode�U  �W  { 	�T�S�R�Q�P�O�N�M�L�T 0 	thenumber 	theNumber�S 0 formatstyle formatStyle�R 0 
localecode 
localeCode�Q 0 asocformatter asocFormatter�P 0 
asocstring 
asocString�O 0 etext eText�N 0 enumber eNumber�M 0 efrom eFrom�L 
0 eto eTo| �K�J�Iaf�H�G�F�E�D�C�B�A��@�?���>�=
�K 
kocl
�J 
nmbr
�I .corecnte****       ****�H �G 60 throwinvalidparametertype throwInvalidParameterType�F ,0 _makenumberformatter _makeNumberFormatter�E &0 stringfromnumber_ stringFromNumber_
�D 
msng
�C 
errn�B�Y
�A 
erob
�@ 
ctxt�? 0 etext eText� �<�;�
�< 
errn�; 0 enumber eNumber� �:�9�
�: 
erob�9 0 efrom eFrom� �8�7�6
�8 
errt�7 
0 eto eTo�6  �> �= 
0 _error  �] e P�kv��l j  b  �����+ Y hO*���m+ E�O��k+ E�O��  )�����Y hO��&W X  *a ����a + G �5��4�3���2
�5 .Mth:PNumnull���     ctxt�4 0 thetext theText�3 �1��
�1 
Usin� {�0�/�.�0 0 formatstyle formatStyle�/  
�. MthZMth0� �-��,
�- 
Loca� {�+�*��+ 0 
localecode 
localeCode�*  �,  � 
�)�(�'�&�%�$�#�"�!� �) 0 thetext theText�( 0 formatstyle formatStyle�' 0 
localecode 
localeCode�& 0 asocformatter asocFormatter�% 0 
asocnumber 
asocNumber�$ $0 localeidentifier localeIdentifier�# 0 etext eText�" 0 enumber eNumber�! 0 efrom eFrom�  
0 eto eTo� ����������������$�(*���=��
� 
kocl
� 
ctxt
� .corecnte****       ****� � 60 throwinvalidparametertype throwInvalidParameterType
� 
msng� ,0 _makenumberformatter _makeNumberFormatter� &0 numberfromstring_ numberFromString_� 
0 locale  � $0 localeidentifier localeIdentifier
� 
leng
� 
errn��Y
� 
erob�  0 _nameforformat _nameForFormat
� 
****� 0 etext eText� ���
� 
errn� 0 enumber eNumber� �
�	�
�
 
erob�	 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �2 � ��kv��l j  b  �����+ Y hO*���m+ E�O��k+ 	E�O��  J�j+ 
j+ �&E�O��,j  �E�Y 	�%�%E�O)a a a ��a *�k+ %a %�%a %Y hO�a &W X  *a ����a + H �Y�����
� .Mth:NuHenull���     ****� 0 	thenumber 	theNumber� ���
� 
Plac� {� �����  0 	chunksize 	chunkSize��  ��  � �����
�� 
Pref� {�������� 0 	hasprefix 	hasPrefix��  
�� boovfals��  � �������������������������������� 0 	thenumber 	theNumber�� 0 	chunksize 	chunkSize�� 0 	hasprefix 	hasPrefix�� 0 hextext hexText�� 0 	hexprefix 	hexPrefix�� 0 padtext padText�� 0 maxsize maxSize�� 0 
resultlist 
resultList�� 0 i  �� 0 
theinteger 
theInteger�� 0 etext eText�� 0 oldtids oldTIDs�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� As��������������������������������
2CEMV`v������������������������ $4=S������z����������� (0 asintegerparameter asIntegerParameter�� (0 asbooleanparameter asBooleanParameter
�� 
kocl
�� 
list
�� .corecnte****       ****�� 00 aswholenumberparameter asWholeNumberParameter�� 
�� 
bool
�� 
long�� �� .0 throwinvalidparameter throwInvalidParameter�� 
�� 
cobj
�� 
leng�� 0 
resultlist 
resultList� �����������
�� .ascrinit****      � ****� k     	�� �����  ��  ��  � ���� 
0 _list_  � ����
�� 
cobj�� 
0 _list_  �� 
b   �-E��� 
0 _list_  
�� 
doub
�� 
errn���\��  � ������
�� 
errn���\��  
�� 
ctxt
�� 
ascr
�� 
txdl�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ����
�� 
errt� 
0 eto eTo�  �� �� 
0 _error  ��b  ��l+ E�Ob  ��l+ E�O�kv��l j <b  ��l+ E�O�j
 ���& b  �����+ Y hOa E�O�j Y�j	 �a �$'�& 7b  �a �a �%a %a �$'k"%a %a �$kk"%a %�+ Y hOa E�O�'E�Y Ra E�O�j	 �a �$k�& 7b  �a �a �%a %a �$'k"%a %a �$kk"%a %�+ Y hO� �a %E�Y hO &h�ja a  �a #k/�%E�O�a "E�[OY��O h�a !,�a "�%E�[OY��O��%Y��k
 ���& b  �a #�a $�+ Y hOa %a �$klvE[a  k/E�Z[a  l/E�ZO �kh�a &%E�[OY��Oa 'a (K )S�O �k�a *,a !,Ekh  @�a *,a  �/E�O��&E�O��a +&
 �j�&
 ���& )a ,a -lhY hW HX . /�� a 0�%a 1%a �$kk"%a 2%E�Y a 3E�Ob  �a *,a  �/a 4��+ Oa 5E�O &h�ja 6a  �a #k/�%E�O�a "E�[OY��O��%[a 7\[Z�'\Zi2�a *,a  �/F[OY�)O_ 8a 9,E�Oa :_ 8a 9,FO� a ;�a *,%E�Y �a *,a 7&E�O�_ 8a 9,FO�W X < =*a >����a ?+ @I �������
� .Mth:HeNunull���     ctxt� 0 hextext hexText� ���
� 
Plac� {���� 0 	chunksize 	chunkSize�  �  � ���
� 
Prec� {���� 0 	isprecise 	isPrecise�  
� boovfals�  � ������������� 0 hextext hexText� 0 	chunksize 	chunkSize� 0 	isprecise 	isPrecise� 0 	thenumber 	theNumber� 0 
isnegative 
isNegative� 0 charref charRef� 0 i  � 0 
resultlist 
resultList� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� 5���������������0�������K�����in������������		!���	?��� "0 astextparameter asTextParameter� (0 asintegerparameter asIntegerParameter� 
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
errn��@�  � ���
� 
errn��@�  
� 
leng� 0 
resultlist 
resultList� �������
� .ascrinit****      � ****� k     �� ���  �  �  � �� 
0 _list_  � �� 
0 _list_  � jv�� 
0 _list_  � 0 etext eText� ���
� 
errn� 0 enumber eNumber� �~�}�
�~ 
erob�} 0 efrom eFrom� �|�{�z
�| 
errt�{ 
0 eto eTo�z  � � 
0 _error  �aL��Db  ��l+ E�Ob  ��l+ E�O�j
 ���& b  �����+ Y hOb  ��l+ E�O�j  � �jE�O��E�O� �[a \[Zl\Zi2E�Y hO�a  �[a \[Zm\Zi2E�Y hO U�[a a l kh �a  E�Oa  *a �a a � UE�O�j  )a a lhY hO��kE�[OY��W X  b  �a a a  �+ O�	 	��k �& b  �a !a a "�+ Y hO� 	�'E�Y hO�Y�a #,�#j b  �a $a a %�%a &%�+ Y hOa 'a (K )S�O �k�a #,E�h jE�O n�[a \[Z�\Z��k2[a a l kh �a  E�Oa  *a �a a *� UE�O�j  b  �a +a a ,�+ Y hO��kE�[OY��O�	 	��k �& )b  �[a \[Z�\Z��k2a -a a .�+ Y hO��a /,6F[OY�GO�a /,EVW X 0 1*a 2����a 3+ 4J �y	[�x�w���v
�y .Mth:DeRanull���     doub�x 0 x  �w  � �u�t�s�r�q�u 0 x  �t 0 etext eText�s 0 enumber eNumber�r 0 efrom eFrom�q 
0 eto eTo� �p�o�n�m�	s�l�k
�p 
doub
�o 
pi  �n ��m 0 etext eText� �j�i�
�j 
errn�i 0 enumber eNumber� �h�g�
�h 
erob�g 0 efrom eFrom� �f�e�d
�f 
errt�e 
0 eto eTo�d  �l �k 
0 _error  �v  ��&��! W X  *塢���+ K �c	��b�a���`
�c .Mth:RaDenull���     doub�b 0 x  �a  � �_�^�]�\�[�_ 0 x  �^ 0 etext eText�] 0 enumber eNumber�\ 0 efrom eFrom�[ 
0 eto eTo� �Z�Y�X�W�	��V�U
�Z 
doub
�Y 
pi  �X ��W 0 etext eText� �T�S�
�T 
errn�S 0 enumber eNumber� �R�Q�
�R 
erob�Q 0 efrom eFrom� �P�O�N
�P 
errt�O 
0 eto eTo�N  �V �U 
0 _error  �`  ��&��!!W X  *塢���+ L �M	��L�K���J
�M .Mth:Abs_null���     nmbr�L 0 x  �K  � �I�H�G�F�E�I 0 x  �H 0 etext eText�G 0 enumber eNumber�F 0 efrom eFrom�E 
0 eto eTo� �D�C�	��B�A
�D 
nmbr�C 0 etext eText� �@�?�
�@ 
errn�? 0 enumber eNumber� �>�=�
�> 
erob�= 0 efrom eFrom� �<�;�:
�< 
errt�; 
0 eto eTo�:  �B �A 
0 _error  �J * ��&E�O�j �'Y �W X  *㡢���+ M �9	��8�7���6
�9 .Mth:CmpNnull���     ****�8 �5��5 �  �4�3�4 0 n1  �3 0 n2  �7  � 	�2�1�0�/�.�-�,�+�*�2 0 n1  �1 0 n2  �0 0 dn  �/ 0 dm  �. 0 d  �- 0 etext eText�, 0 enumber eNumber�+ 0 efrom eFrom�* 
0 eto eTo� �)�(�'�&�%�$�#�
Q�"�!
�) 
kocl
�( 
long
�' .corecnte****       ****
�& 
doub
�% 
cobj
�$ 
bool�# 0 etext eText� � ��
�  
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  �" �! 
0 _error  �6 � ���lv��l l  ��  jY hY s��&��&lvE[�k/E�Z[�l/E�ZO�j  b  � E�Y b  � E�O�'E�O�� ��lvE[�k/E�Z[�l/E�ZY hO��E�O��	 ���& jY hO�� iY kW X  *襦���+ 
N �
a�����
� .Mth:MinNnull���     ****� 0 thelist theList�  � 	���������� 0 thelist theList� 0 
listobject 
listObject� 0 	theresult 	theResult� 0 aref aRef� 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� �
i���
�	�����
���� 0 
listobject 
listObject� ���� ����
� .ascrinit****      � ****� k     �� 
i����  �  �   � ���� 
0 _list_  � ������ "0 aslistparameter asListParameter�� 
0 _list_  �� b  b   k+  �� 
0 _list_  
�
 
cobj
�	 
nmbr
� 
kocl
� .corecnte****       ****
� 
pcnt� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  � X G��K S�O��,�k/�&E�O +��,[��l kh ��,�&E�O�� �E�Y h[OY��O�W X 	 
*륦���+ O ��
���������
�� .Mth:MaxNnull���     ****�� 0 thelist theList��  � 	�������������������� 0 thelist theList�� 0 
listobject 
listObject�� 0 	theresult 	theResult�� 0 aref aRef�� 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ��
�����������������
������� 0 
listobject 
listObject� �����������
�� .ascrinit****      � ****� k     �� 
�����  ��  ��  � ���� 
0 _list_  � ������ "0 aslistparameter asListParameter�� 
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
pcnt�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� X G��K S�O��,�k/�&E�O +��,[��l kh ��,�&E�O�� �E�Y h[OY��O�W X 	 
*륦���+ P ��	��������
�� .Mth:RouNnull���     nmbr�� 0 num  �� ����
�� 
Plac� {�������� 0 decimalplaces decimalPlaces��  ��  � �����
�� 
Dire� {�������� &0 roundingdirection roundingDirection��  
�� MRndRNhE��  � ����������� 0 num  � 0 decimalplaces decimalPlaces� &0 roundingdirection roundingDirection� 0 themultiplier theMultiplier� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� #�/���]_~��������}������� "0 asrealparameter asRealParameter� (0 asintegerparameter asIntegerParameter� 

� MRndRNhE
� MRndRNhT
� MRndRNhF
� MRndRN_T
� MRndRN_F
� MRndRN_U
� 
bool
� MRndRN_D� >0 throwinvalidconstantparameter throwInvalidConstantParameter� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
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
�k"E�Y 	�k"kE�Y b  �a l+ O�j  	�k"Y �j 	��"Y ��!W X  *a ����a + Q �������� 0 _sin  � ��� �  �� 0 x  �  � ������� 0 x  � 0 isneg isNeg� 0 y  � 0 z  � 0 z2  � 0 zz  � �������.14�Llmnopq�������h
� 
pi  � �� � � 
� 
bool� ��#��! E�O�jE�O� 	�'E�Y hO���! k"E�O��� k"� E�O�l#k  �kE�O�kE�Y hO��#E�O�m �E�O��E�Y hO��� �� �� E�O�� E�O�k 
 �l �& *�l!�� � �� �� �� a � a  E�Y +��� a � a � a � a � a � a  E�O� 	�'E�Y hO�R �������
� .Mth:Sin_null���     doub� 0 x  �  � ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� �������
� 
nmbr� 0 _sin  � 0 etext eText� ���
� 
errn� 0 enumber eNumber� ��~�
� 
erob�~ 0 efrom eFrom� �}�|�{
�} 
errt�| 
0 eto eTo�{  � � 
0 _error  �  *��&k+ W X  *䡢���+ S �z��y�x���w
�z .Mth:Cos_null���     doub�y 0 x  �x  � �v�u�t�s�r�v 0 x  �u 0 etext eText�t 0 enumber eNumber�s 0 efrom eFrom�r 
0 eto eTo� �q�p�o�n���m�l
�q 
nmbr�p Z�o 0 _sin  �n 0 etext eText� �k�j�
�k 
errn�j 0 enumber eNumber� �i�h�
�i 
erob�h 0 efrom eFrom� �g�f�e
�g 
errt�f 
0 eto eTo�e  �m �l 
0 _error  �w ! *��&�k+ W X  *塢���+ T �d��c�b���a
�d .Mth:Tan_null���     doub�c 0 x  �b  � 
�`�_�^�]�\�[�Z�Y�X�W�` 0 x  �_ 0 isneg isNeg�^ 0 y  �] 0 z  �\ 0 z2  �[ 0 zz  �Z 0 etext eText�Y 0 enumber eNumber�X 0 efrom eFrom�W 
0 eto eTo� �V�U�T�S�R�Q�P�O�N�M�LT�Kwz}���������J�I���H�G
�V 
nmbr�U Z�T
�S 
bool
�R 
errn�Q�s
�P 
erob�O �Nh
�M 
pi  �L ��K �J �I 0 etext eText� �F�E�
�F 
errn�E 0 enumber eNumber� �D�C�
�D 
erob�C 0 efrom eFrom� �B�A�@
�B 
errt�A 
0 eto eTo�@  �H �G 
0 _error  �a ��&E�O�� 
 �� �& )�����Y hO��#��! E�O�jE�O� 	�'E�Y hO���!!k"E�O��� k"� E�O�l#k  �kE�O�kE�Y hO��� �� �a  E�O�� E�O�a  4��� a � a � a  �a � a � a � a !E�Y �E�O�l 
 	�a  �& 
i�!E�Y hO� 	�'E�Y hO�W X  *a ����a + U �?��>�=���<�? 	0 _asin  �> �;��; �  �:�: 0 x  �=  � �9�8�7�6�5�9 0 x  �8 0 isneg isNeg�7 0 zz  �6 0 p  �5 0 z  � �4�3�2�1BCDEFYZ[\f�0x�������������/
�4 
errn�3�Y
�2 
erob�1 
�0 
pi  �/ ��< ��jE�O� 	�'E�Y hO�k )�����Y hO�� Xk�E�O�� �� �� �� � ��� �� �� �!E�O���$E�O_ �!�E�O�� a E�O��_ �!E�Y ]�a  �E�Y O�� E�O�a � a � a � a � a � a  �a � a � a � a � a !� �E�O� 	�'E�Y hO�_ a !!V �.��-�,���+
�. .Mth:Sinanull���     doub�- 0 x  �,  � �*�)�(�'�&�* 0 x  �) 0 etext eText�( 0 enumber eNumber�' 0 efrom eFrom�& 
0 eto eTo� �%�$�#��"�!
�% 
nmbr�$ 	0 _asin  �# 0 etext eText� � ��
�  
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  �" �! 
0 _error  �+  *��&k+ W X  *䡢���+ W ������
� .Mth:Cosanull���     doub� 0 x  �  � ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� �����*��� Z
� 
nmbr� 	0 _asin  � 0 etext eText� �
�	�
�
 
errn�	 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � ! �*��&k+ W X  *塢���+ X �:����� 
� .Mth:Tananull���     doub� 0 x  �  � ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ��T�����_����
�� 
nmbr�� 	0 _asin  �� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �  + ��&E�O*��� k�$!k+ W X  *塢���+ Y ��{��������
�� .Mth:Sinhnull���     doub�� 0 x  ��  � ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� �����������
�� 
nmbr�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� ���� 
�� 
erob�� 0 efrom eFrom  ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� / ��&E�O�b  �$b  �'$ W X  *䡢���+ Z ���������
�� .Mth:Coshnull���     doub�� 0 x  ��   ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo ����������
�� 
nmbr�� 0 etext eText ����
�� 
errn�� 0 enumber eNumber ����
�� 
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� / ��&E�O�b  �$b  �'$ W X  *䡢���+ [ ���������
�� .Mth:Tanhnull���     doub�� 0 x  ��   ���������� 0 x  �� 0 etext eText�� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo ����
� 
nmbr� 0 etext eText ��	
� 
errn� 0 enumber eNumber	 ��

� 
erob� 0 efrom eFrom
 ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� > -��&E�Ob  �$b  �'$b  �$b  �'$!W X  *㡢���+ \ �'���� 
0 _frexp  � ��   �� 0 m  �   ���� 0 m  � 0 isneg isNeg� 0 e   5m�
� 
bool� o�j  
�jlvY hO�jE�O� 	�'E�Y hOjE�O 3h��	 �k�&�k �l!E�O�kE�Y �l E�O�kE�[OY��O� 	�'E�Y hO��lv] ������ 	0 _logn  � ��   �� 0 x  �   ����� 0 x  � 0 e  � 0 z  � 0 y   ������������!jklmno�����
� 
errn��Y� 
0 _frexp  
� 
cobj���
� 
bool�<�j )��l�Y hO*�k+ E[�k/E�Z[�l/E�ZO��
 �l�& j�� �kE�O��E�O� �E�Y �kE�O� �E�O��!E�O�� E�O�� � �� � ��� �� �!E�O�E�O��� ��a  E�Y ��� �kE�Ol� kE�Y �kE�O�� E�O�� a � a � a � a � a � a  �a � a � a � a � a !E�O�j ��� E�Y hO��l!E�O��E�O�j ��a  E�Y hO�^ �����
� .Mth:Lognnull���     doub� 0 x  �   ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo �����������
�� 
nmbr�� 	0 _logn  �� 0 etext eText ����
�� 
errn�� 0 enumber eNumber ����
�� 
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �  *��&k+ W X  *䡢���+ _ ���������
�� .Mth:Lo10null���     doub�� 0 x  ��   ��~�}�|�{� 0 x  �~ 0 etext eText�} 0 enumber eNumber�| 0 efrom eFrom�{ 
0 eto eTo 
�z�y����x�w�v
�z 
nmbr�y 	0 _logn  �x 0 etext eText �u�t
�u 
errn�t 0 enumber eNumber �s�r
�s 
erob�r 0 efrom eFrom �q�p�o
�q 
errt�p 
0 eto eTo�o  �w �v 
0 _error  �� % *��&k+ �!� �!W X  *硢���+ 	` �n�m�l�k
�n .Mth:Logbnull���     doub�m 0 x  �l �j�i�h
�j 
Base�i 0 b  �h   �g�f�e�d�c�b�g 0 x  �f 0 b  �e 0 etext eText�d 0 enumber eNumber�c 0 efrom eFrom�b 
0 eto eTo �a�`�_2�^�]
�a 
nmbr�` 	0 _logn  �_ 0 etext eText �\�[
�\ 
errn�[ 0 enumber eNumber �Z�Y
�Z 
erob�Y 0 efrom eFrom �X�W�V
�X 
errt�W 
0 eto eTo�V  �^ �] 
0 _error  �k ( *��&k+ *��&k+ !W X  *䢣���+  ascr  ��ޭ