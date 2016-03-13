FasdUAS 1.101.10   ��   ��    k             l      ��  ��   71 File -- common file system and path string operations

Notes:

- Path manipulation commands all operate on POSIX paths, as those are reliable whereas HFS paths (which are already deprecated everywhere else in OS X) are not.


TO DO:

- Should (and can?) ALL ObjC class, method, enum, etc names always be enclosed in pipes? e.g. This library was accidentally recompiled and resaved after AS converted 'NSURL' identifiers to 'nsurl', causing handlers that used it to break as ASOC, unlike AS, is case-sensitive. (Normalizing identifier case in not just current script but all imported scripts too is a fundamental AS flaw that will continue to break users' ASOC code until fixed at source, but these libraries need to be as robust as possible, even if that means crudding up the ASOC parts with pipes. The big annoyance is that unless identical names but with different case are also defined without pipes, AS will remove the pipes from names that do have them on compilation, whereupon the library code is right back where it started, at risk of breaking in future use.)


     � 	 	b   F i l e   - -   c o m m o n   f i l e   s y s t e m   a n d   p a t h   s t r i n g   o p e r a t i o n s 
 
 N o t e s : 
 
 -   P a t h   m a n i p u l a t i o n   c o m m a n d s   a l l   o p e r a t e   o n   P O S I X   p a t h s ,   a s   t h o s e   a r e   r e l i a b l e   w h e r e a s   H F S   p a t h s   ( w h i c h   a r e   a l r e a d y   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X )   a r e   n o t . 
 
 
 T O   D O : 
 
 -   S h o u l d   ( a n d   c a n ? )   A L L   O b j C   c l a s s ,   m e t h o d ,   e n u m ,   e t c   n a m e s   a l w a y s   b e   e n c l o s e d   i n   p i p e s ?   e . g .   T h i s   l i b r a r y   w a s   a c c i d e n t a l l y   r e c o m p i l e d   a n d   r e s a v e d   a f t e r   A S   c o n v e r t e d   ' N S U R L '   i d e n t i f i e r s   t o   ' n s u r l ' ,   c a u s i n g   h a n d l e r s   t h a t   u s e d   i t   t o   b r e a k   a s   A S O C ,   u n l i k e   A S ,   i s   c a s e - s e n s i t i v e .   ( N o r m a l i z i n g   i d e n t i f i e r   c a s e   i n   n o t   j u s t   c u r r e n t   s c r i p t   b u t   a l l   i m p o r t e d   s c r i p t s   t o o   i s   a   f u n d a m e n t a l   A S   f l a w   t h a t   w i l l   c o n t i n u e   t o   b r e a k   u s e r s '   A S O C   c o d e   u n t i l   f i x e d   a t   s o u r c e ,   b u t   t h e s e   l i b r a r i e s   n e e d   t o   b e   a s   r o b u s t   a s   p o s s i b l e ,   e v e n   i f   t h a t   m e a n s   c r u d d i n g   u p   t h e   A S O C   p a r t s   w i t h   p i p e s .   T h e   b i g   a n n o y a n c e   i s   t h a t   u n l e s s   i d e n t i c a l   n a m e s   b u t   w i t h   d i f f e r e n t   c a s e   a r e   a l s o   d e f i n e d   w i t h o u t   p i p e s ,   A S   w i l l   r e m o v e   t h e   p i p e s   f r o m   n a m e s   t h a t   d o   h a v e   t h e m   o n   c o m p i l a t i o n ,   w h e r e u p o n   t h e   l i b r a r y   c o d e   i s   r i g h t   b a c k   w h e r e   i t   s t a r t e d ,   a t   r i s k   o f   b r e a k i n g   i n   f u t u r e   u s e . ) 
 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �        s u p p o r t   ! " ! l     ��������  ��  ��   "  # $ # l      % & ' % j    �� (�� 0 _support   ( N     ) ) 4    �� *
�� 
scpt * m     + + � , ,  T y p e S u p p o r t & "  used for parameter checking    ' � - - 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g $  . / . l     ��������  ��  ��   /  0 1 0 l     ��������  ��  ��   1  2 3 2 i   ! 4 5 4 I      �� 6���� 
0 _error   6  7 8 7 o      ���� 0 handlername handlerName 8  9 : 9 o      ���� 0 etext eText :  ; < ; o      ���� 0 enumber eNumber <  = > = o      ���� 0 efrom eFrom >  ?�� ? o      ���� 
0 eto eTo��  ��   5 n     @ A @ I    �� B���� &0 throwcommanderror throwCommandError B  C D C m     E E � F F  F i l e D  G H G o    ���� 0 handlername handlerName H  I J I o    ���� 0 etext eText J  K L K o    	���� 0 enumber eNumber L  M N M o   	 
���� 0 efrom eFrom N  O�� O o   
 ���� 
0 eto eTo��  ��   A o     ���� 0 _support   3  P Q P l     ��������  ��  ��   Q  R S R l     ��������  ��  ��   S  T U T l     �� V W��   V J D--------------------------------------------------------------------    W � X X � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - U  Y Z Y l     �� [ \��   [  File Read/Write; these are atomic alternatives to StandardAdditions' File Read/Write suite, with better support for text encodings (incremental read/write is almost entirely useless in practice as AS doesn't have the capabilities or smarts to do it right)    \ � ] ]    F i l e   R e a d / W r i t e ;   t h e s e   a r e   a t o m i c   a l t e r n a t i v e s   t o   S t a n d a r d A d d i t i o n s '   F i l e   R e a d / W r i t e   s u i t e ,   w i t h   b e t t e r   s u p p o r t   f o r   t e x t   e n c o d i n g s   ( i n c r e m e n t a l   r e a d / w r i t e   i s   a l m o s t   e n t i r e l y   u s e l e s s   i n   p r a c t i c e   a s   A S   d o e s n ' t   h a v e   t h e   c a p a b i l i t i e s   o r   s m a r t s   t o   d o   i t   r i g h t ) Z  ^ _ ^ l     ��������  ��  ��   _  ` a ` h   " )�� b�� (0 _nsstringencodings _NSStringEncodings b k       c c  d e d l     �� f g��   f � � note: AS can't natively represent integers larger than 2^30, but as long as they're not larger than 2^50 (1e15) then AS's real (Double) representation will reliably coerce back to integer when passed to ASOC    g � h h�   n o t e :   A S   c a n ' t   n a t i v e l y   r e p r e s e n t   i n t e g e r s   l a r g e r   t h a n   2 ^ 3 0 ,   b u t   a s   l o n g   a s   t h e y ' r e   n o t   l a r g e r   t h a n   2 ^ 5 0   ( 1 e 1 5 )   t h e n   A S ' s   r e a l   ( D o u b l e )   r e p r e s e n t a t i o n   w i l l   r e l i a b l y   c o e r c e   b a c k   t o   i n t e g e r   w h e n   p a s s e d   t o   A S O C e  i j i l     ��������  ��  ��   j  k l k l     �� m n��   m $  NS...StringEncoding constants    n � o o <   N S . . . S t r i n g E n c o d i n g   c o n s t a n t s l  p q p j     ��� r�� 
0 _list_   r J     � s s  t u t l 	    v���� v J      w w  x y x m     ��
�� FEncFE01 y  z�� z m    ���� ��  ��  ��   u  { | { l 	   }���� } J     ~ ~   �  m    ��
�� FEncFE02 �  ��� � m    ���� 
��  ��  ��   |  � � � l 	   ����� � J     � �  � � � m    	��
�� FEncFE03 �  ��� � m   	 
 � � A�      ��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE04 �  ��� � m     � � A�     ��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE05 �  ��� � m     � � A�     ��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE06 �  ��� � m     � � A�      ��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE07 �  ��� � m     � � A�     ��  ��  ��   �  � � � l 	    ����� � J      � �  � � � m    ��
�� FEncFE11 �  ��� � m    ���� ��  ��  ��   �  � � � l 	   & ����� � J     & � �  � � � m     !��
�� FEncFE12 �  ��� � m   ! $���� ��  ��  ��   �  � � � l 	 & . ����� � J   & . � �  � � � m   & )��
�� FEncFE13 �  ��� � m   ) ,���� ��  ��  ��   �  � � � l 	 . 6 ����� � J   . 6 � �  � � � m   . 1��
�� FEncFE14 �  ��� � m   1 4���� 	��  ��  ��   �  � � � l 	 6 < ����� � J   6 < � �  � � � m   6 9��
�� FEncFE15 �  ��� � m   9 :���� ��  ��  ��   �  � � � l 	 < D ����� � J   < D � �  � � � m   < ?��
�� FEncFE16 �  ��� � m   ? B���� ��  ��  ��   �  � � � l 	 D L ����� � J   D L � �  � � � m   D G��
�� FEncFE17 �  ��� � m   G J���� ��  ��  ��   �  � � � l 	 L T ���� � J   L T � �  � � � m   L O�~
�~ FEncFE18 �  ��} � m   O R�|�| �}  ��  �   �  � � � l 	 T \ ��{�z � J   T \ � �  � � � m   T W�y
�y FEncFE19 �  ��x � m   W Z�w�w �x  �{  �z   �  � � � l 	 \ d ��v�u � J   \ d � �  � � � m   \ _�t
�t FEncFE50 �  ��s � m   _ b�r�r �s  �v  �u   �  � � � l 	 d l ��q�p � J   d l � �  � � � m   d g�o
�o FEncFE51 �  ��n � m   g j�m�m �n  �q  �p   �  � � � l 	 l t ��l�k � J   l t � �  � � � m   l o�j
�j FEncFE52 �  ��i � m   o r�h�h �i  �l  �k   �  � � � l 	 t | �g�f  J   t |  m   t w�e
�e FEncFE53 �d m   w z�c�c �d  �g  �f   � �b l 	 | ��a�` J   | � 	 m   | �_
�_ FEncFE54	 
�^
 m    ��]�] �^  �a  �`  �b   q  l     �\�[�Z�\  �[  �Z   �Y i  � � I      �X�W�X 0 getencoding getEncoding �V o      �U�U 0 textencoding textEncoding�V  �W   k     W  Q     K k    3  r     c     o    �T�T 0 textencoding textEncoding m    �S
�S 
enum o      �R�R 0 textencoding textEncoding �Q X   	 3 �P!  Z   ."#�O�N" =   !$%$ n   &'& 4    �M(
�M 
cobj( m    �L�L ' o    �K�K 0 aref aRef% o     �J�J 0 textencoding textEncoding# L   $ *)) n  $ )*+* 4   % (�I,
�I 
cobj, m   & '�H�H + o   $ %�G�G 0 aref aRef�O  �N  �P 0 aref aRef! n   -.- o    �F�F 
0 _list_  .  f    �Q   R      �E�D/
�E .ascrerr ****      � ****�D  / �C0�B
�C 
errn0 d      11 m      �A�A��B   l  ; K2342 Q   ; K5675 L   > B88 c   > A9:9 o   > ?�@�@ 0 textencoding textEncoding: m   ? @�?
�? 
long6 R      �>�=;
�> .ascrerr ****      � ****�=  ; �<<�;
�< 
errn< d      == m      �:�:��;  7 l  J J�9>?�9  >   fall through   ? �@@    f a l l   t h r o u g h3 ] W not a predefined constant, but hedge bets as it might be a raw NSStringEncoding number   4 �AA �   n o t   a   p r e d e f i n e d   c o n s t a n t ,   b u t   h e d g e   b e t s   a s   i t   m i g h t   b e   a   r a w   N S S t r i n g E n c o d i n g   n u m b e r B�8B n  L WCDC I   Q W�7E�6�7 >0 throwinvalidconstantparameter throwInvalidConstantParameterE FGF o   Q R�5�5 0 textencoding textEncodingG H�4H m   R SII �JJ 
 u s i n g�4  �6  D o   L Q�3�3 0 _support  �8  �Y   a KLK l     �2�1�0�2  �1  �0  L MNM l     �/�.�-�/  �.  �-  N OPO l     �,QR�,  Q  -----   R �SS 
 - - - - -P TUT l     �+�*�)�+  �*  �)  U VWV i  * -XYX I     �(Z[
�( .Fil:Readnull���     fileZ o      �'�' 0 thefile theFile[ �&\]
�& 
Type\ |�%�$^�#_�%  �$  ^ o      �"�" 0 datatype dataType�#  _ l     `�!� ` m      �
� 
ctxt�!  �   ] �a�
� 
Encoa |��b�c�  �  b o      �� 0 textencoding textEncoding�  c l     d��d m      �
� FEncFE01�  �  �  Y Q     �efge k    �hh iji r    klk n   mnm I    �o�� ,0 asposixpathparameter asPOSIXPathParametero pqp o    	�� 0 thefile theFileq r�r m   	 
ss �tt  �  �  n o    �� 0 _support  l o      �� 0 	posixpath 	posixPathj uvu r    wxw n   yzy I    �{�� "0 astypeparameter asTypeParameter{ |}| o    �� 0 datatype dataType} ~�~ m     ���  a s�  �  z o    �� 0 _support  x o      �
�
 0 datatype dataTypev ��	� Z    ������ F    *��� =   "��� o     �� 0 datatype dataType� m     !�
� 
ctxt� >  % (��� o   % &�� 0 textencoding textEncoding� m   & '�
� FEncFEPE� l  - }���� k   - }�� ��� r   - 9��� n  - 7��� I   2 7���� 0 getencoding getEncoding� ��� o   2 3� �  0 textencoding textEncoding�  �  � o   - 2���� (0 _nsstringencodings _NSStringEncodings� o      ���� 0 textencoding textEncoding� ��� r   : S��� n  : D��� I   = D������� T0 (stringwithcontentsoffile_encoding_error_ (stringWithContentsOfFile_encoding_error_� ��� o   = >���� 0 	posixpath 	posixPath� ��� o   > ?���� 0 textencoding textEncoding� ���� l  ? @������ m   ? @��
�� 
obj ��  ��  ��  ��  � n  : =��� o   ; =���� 0 nsstring NSString� m   : ;��
�� misccura� J      �� ��� o      ���� 0 
asocstring 
asocString� ���� o      ���� 0 theerror theError��  � ��� Z  T x������� =  T W��� o   T U���� 0 
asocstring 
asocString� m   U V��
�� 
msng� R   Z t����
�� .ascrerr ****      � ****� l  l s������ c   l s��� n  l q��� I   m q�������� ,0 localizeddescription localizedDescription��  ��  � o   l m���� 0 theerror theError� m   q r��
�� 
ctxt��  ��  � ����
�� 
errn� n  \ a��� I   ] a�������� 0 code  ��  ��  � o   \ ]���� 0 theerror theError� ����
�� 
erob� o   d e���� 0 thefile theFile� �����
�� 
errt� o   h i���� 0 datatype dataType��  ��  ��  � ���� L   y }�� c   y |��� o   y z���� 0 
asocstring 
asocString� m   z {��
�� 
ctxt��  �'! note: AS treats `text`, `string`, and `Unicode text` as synonyms when comparing for equality, which is a little bit problematic as StdAdds' `read` command treats `string` as 'primary encoding' and `Unicode text` as UTF16; passing `primary encoding` for `using` parameter provides an 'out'   � ���B   n o t e :   A S   t r e a t s   ` t e x t ` ,   ` s t r i n g ` ,   a n d   ` U n i c o d e   t e x t `   a s   s y n o n y m s   w h e n   c o m p a r i n g   f o r   e q u a l i t y ,   w h i c h   i s   a   l i t t l e   b i t   p r o b l e m a t i c   a s   S t d A d d s '   ` r e a d `   c o m m a n d   t r e a t s   ` s t r i n g `   a s   ' p r i m a r y   e n c o d i n g '   a n d   ` U n i c o d e   t e x t `   a s   U T F 1 6 ;   p a s s i n g   ` p r i m a r y   e n c o d i n g `   f o r   ` u s i n g `   p a r a m e t e r   p r o v i d e s   a n   ' o u t '�  � k   � ��� ��� r   � ���� I  � ������
�� .rdwropenshor       file� l  � ������� c   � ���� o   � ����� 0 	posixpath 	posixPath� m   � ���
�� 
psxf��  ��  ��  � o      ���� 0 fh  � ���� Q   � ����� k   � ��� ��� r   � ���� I  � �����
�� .rdwrread****        ****� o   � ����� 0 fh  � �����
�� 
as  � o   � ����� 0 datatype dataType��  � o      ���� 0 	theresult 	theResult� ��� I  � ������
�� .rdwrclosnull���     ****� o   � ����� 0 fh  ��  � ���� L   � ��� o   � ����� 0 	theresult 	theResult��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � k   � ��� ��� Q   � ������ I  � ������
�� .rdwrclosnull���     ****� o   � ����� 0 fh  ��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  � ���� R   � �����
�� .ascrerr ****      � ****� o   � ����� 0 etext eText� ����
�� 
errn� o   � ����� 0 enumber eNumber� ����
�� 
erob� o   � ����� 0 efrom eFrom� �����
�� 
errt� o   � ����� 
0 eto eTo��  ��  ��  �	  f R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  g I   � �������� 
0 _error  � ��� m   � ��� ���  r e a d   f i l e� ��� o   � ����� 0 etext eText�    o   � ����� 0 enumber eNumber  o   � ����� 0 efrom eFrom �� o   � ����� 
0 eto eTo��  ��  W  l     ��������  ��  ��    l     ��������  ��  ��   	
	 i  . 1 I     ��
�� .Fil:Writnull���     file o      ���� 0 thefile theFile ��
�� 
Data o      ���� 0 thedata theData ��
�� 
Type |��������  ��   o      ���� 0 datatype dataType��   l     ���� m      ��
�� 
ctxt��  ��   ����
�� 
Enco |��������  ��   o      ���� 0 textencoding textEncoding��   l     ���� m      ��
�� FEncFE01��  ��  ��   Q    	 k    �  r     !  n   "#" I    �$�~� ,0 asposixpathparameter asPOSIXPathParameter$ %&% o    	�}�} 0 thefile theFile& '�|' m   	 
(( �))  �|  �~  # o    �{�{ 0 _support  ! o      �z�z 0 	posixpath 	posixPath *+* r    ,-, n   ./. I    �y0�x�y "0 astypeparameter asTypeParameter0 121 o    �w�w 0 datatype dataType2 3�v3 m    44 �55  a s�v  �x  / o    �u�u 0 _support  - o      �t�t 0 datatype dataType+ 6�s6 Z    �78�r97 F    *:;: =   "<=< o     �q�q 0 datatype dataType= m     !�p
�p 
ctxt; >  % (>?> o   % &�o�o 0 textencoding textEncoding? m   & '�n
�n FEncFEPE8 k   - �@@ ABA r   - ACDC n  - ?EFE I   0 ?�mG�l�m &0 stringwithstring_ stringWithString_G H�kH l  0 ;I�j�iI n  0 ;JKJ I   5 ;�hL�g�h "0 astextparameter asTextParameterL MNM o   5 6�f�f 0 thedata theDataN O�eO m   6 7PP �QQ  d a t a�e  �g  K o   0 5�d�d 0 _support  �j  �i  �k  �l  F n  - 0RSR o   . 0�c�c 0 nsstring NSStringS m   - .�b
�b misccuraD o      �a�a 0 
asocstring 
asocStringB TUT r   B NVWV n  B LXYX I   G L�`Z�_�` 0 getencoding getEncodingZ [�^[ o   G H�]�] 0 textencoding textEncoding�^  �_  Y o   B G�\�\ (0 _nsstringencodings _NSStringEncodingsW o      �[�[ 0 textencoding textEncodingU \]\ r   O k^_^ n  O X`a` I   P X�Zb�Y�Z P0 &writetofile_atomically_encoding_error_ &writeToFile_atomically_encoding_error_b cdc o   P Q�X�X 0 	posixpath 	posixPathd efe m   Q R�W
�W boovtruef ghg o   R S�V�V 0 textencoding textEncodingh i�Ui l  S Tj�T�Sj m   S T�R
�R 
obj �T  �S  �U  �Y  a o   O P�Q�Q 0 
asocstring 
asocString_ J      kk lml o      �P�P 0 
didsucceed 
didSucceedm n�On o      �N�N 0 theerror theError�O  ] o�Mo Z   l �pq�L�Kp H   l nrr o   l m�J�J 0 
didsucceed 
didSucceedq R   q ��Ist
�I .ascrerr ****      � ****s l  � �u�H�Gu c   � �vwv n  � �xyx I   � ��F�E�D�F ,0 localizeddescription localizedDescription�E  �D  y o   � ��C�C 0 theerror theErrorw m   � ��B
�B 
ctxt�H  �G  t �Az{
�A 
errnz n  u z|}| I   v z�@�?�>�@ 0 code  �?  �>  } o   u v�=�= 0 theerror theError{ �<~
�< 
erob~ o   } ~�;�; 0 thefile theFile �:��9
�: 
errt� o   � ��8�8 0 datatype dataType�9  �L  �K  �M  �r  9 k   � ��� ��� r   � ���� I  � ��7��
�7 .rdwropenshor       file� l  � ���6�5� c   � ���� o   � ��4�4 0 	posixpath 	posixPath� m   � ��3
�3 
psxf�6  �5  � �2��1
�2 
perm� m   � ��0
�0 boovtrue�1  � o      �/�/ 0 fh  � ��.� Q   � ����� k   � ��� ��� l  � ����� I  � ��-��
�- .rdwrseofnull���     ****� o   � ��,�, 0 fh  � �+��*
�+ 
set2� m   � ��)�)  �*  � e _ important: when overwriting an existing file, make sure its previous contents are erased first   � ��� �   i m p o r t a n t :   w h e n   o v e r w r i t i n g   a n   e x i s t i n g   f i l e ,   m a k e   s u r e   i t s   p r e v i o u s   c o n t e n t s   a r e   e r a s e d   f i r s t� ��� I  � ��(��
�( .rdwrwritnull���     ****� o   � ��'�' 0 thedata theData� �&��
�& 
refn� o   � ��%�% 0 fh  � �$��#
�$ 
as  � o   � ��"�" 0 datatype dataType�#  � ��� I  � ��!�� 
�! .rdwrclosnull���     ****� o   � ��� 0 fh  �   � ��� L   � ���  �  � R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � k   � ��� ��� Q   � ����� I  � ����
� .rdwrclosnull���     ****� o   � ��� 0 fh  �  � R      ���
� .ascrerr ****      � ****�  �  �  � ��� R   � ����
� .ascrerr ****      � ****� o   � ��
�
 0 etext eText� �	��
�	 
errn� o   � ��� 0 enumber eNumber� ���
� 
erob� o   � ��� 0 efrom eFrom� ���
� 
errt� o   � ��� 
0 eto eTo�  �  �.  �s   R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� � ��
�  
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��   I   �	������� 
0 _error  � ��� m   � ��� ���  w r i t e   f i l e� ��� o   � ���� 0 etext eText� ��� o   ���� 0 enumber eNumber� ��� o  ���� 0 efrom eFrom� ���� o  ���� 
0 eto eTo��  ��  
 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   POSIX path manipulation   � ��� 0   P O S I X   p a t h   m a n i p u l a t i o n� ��� l     ��������  ��  ��  � ��� i  2 5��� I     ����
�� .Fil:ConPnull���     ****� o      ���� 0 filepath filePath� ����
�� 
From� |����������  ��  � o      ���� 0 
fromformat 
fromFormat��  � l     ������ m      ��
�� FLCTFLCP��  ��  � �����
�� 
To__� |����������  ��  � o      ���� 0 toformat toFormat��  � l     ������ m      ��
�� FLCTFLCP��  ��  ��  � l   b���� Q    b���� k   L�� ��� Z    ������� =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ���� 0 filepath filePath��  � �����
�� 
kocl� m    ��
�� 
ctxt��  ��  ��  � m    ����  � l      r     n    I    ������ ,0 asposixpathparameter asPOSIXPathParameter 	 o    ���� 0 filepath filePath	 
��
 m     �  ��  ��   o    ���� 0 _support   o      ���� 0 	posixpath 	posixPath F @ assume it's a file identifier object (alias, �class furl�, etc)    � �   a s s u m e   i t ' s   a   f i l e   i d e n t i f i e r   o b j e c t   ( a l i a s ,   � c l a s s   f u r l � ,   e t c )��  � l  ! � Z   ! � =  ! $ o   ! "���� 0 
fromformat 
fromFormat m   " #��
�� FLCTFLCP r   ' * o   ' (���� 0 filepath filePath o      ���� 0 	posixpath 	posixPath  =  - 0 o   - .���� 0 
fromformat 
fromFormat m   . /��
�� FLCTFLCH  l  3 ; ! r   3 ;"#" n   3 9$%$ 1   7 9��
�� 
psxp% l  3 7&����& 4   3 7��'
�� 
file' o   5 6���� 0 filepath filePath��  ��  # o      ���� 0 	posixpath 	posixPath  � � caution: HFS path format is flawed and deprecated everywhere else in OS X (unlike POSIX path format, it can't distinguish between two volumes with the same name), but is still used by AS and a few older scriptable apps so must be supported   ! �((�   c a u t i o n :   H F S   p a t h   f o r m a t   i s   f l a w e d   a n d   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X   ( u n l i k e   P O S I X   p a t h   f o r m a t ,   i t   c a n ' t   d i s t i n g u i s h   b e t w e e n   t w o   v o l u m e s   w i t h   t h e   s a m e   n a m e ) ,   b u t   i s   s t i l l   u s e d   b y   A S   a n d   a   f e w   o l d e r   s c r i p t a b l e   a p p s   s o   m u s t   b e   s u p p o r t e d )*) =  > A+,+ o   > ?���� 0 
fromformat 
fromFormat, m   ? @��
�� FLCTFLCU* -��- k   D w.. /0/ r   D N121 n  D L343 I   G L��5����  0 urlwithstring_ URLWithString_5 6��6 o   G H���� 0 filepath filePath��  ��  4 n  D G787 o   E G���� 	0 NSURL  8 m   D E��
�� misccura2 o      ���� 0 asocurl asocURL0 9��9 Z  O w:;����: G   O ]<=< =  O R>?> o   O P���� 0 asocurl asocURL? m   P Q��
�� 
msng= H   U [@@ n  U ZABA I   V Z�������� 0 fileurl fileURL��  ��  B o   U V���� 0 asocurl asocURL; n  ` sCDC I   e s��E���� .0 throwinvalidparameter throwInvalidParameterE FGF o   e f���� 0 filepath filePathG HIH m   f iJJ �KK  I LML m   i j��
�� 
ctxtM N��N m   j mOO �PP  N o t   a   f i l e   U R L .��  ��  D o   ` e���� 0 _support  ��  ��  ��  ��   n  z �QRQ I    ���S���� >0 throwinvalidconstantparameter throwInvalidConstantParameterS TUT o    ����� 0 
fromformat 
fromFormatU V��V m   � �WW �XX  f r o m��  ��  R o   z ���� 0 _support   \ V it's a text path in the user-specified format, so convert it to a standard POSIX path    �YY �   i t ' s   a   t e x t   p a t h   i n   t h e   u s e r - s p e c i f i e d   f o r m a t ,   s o   c o n v e r t   i t   t o   a   s t a n d a r d   P O S I X   p a t h� Z[Z l  � ���\]��  \   sanity check   ] �^^    s a n i t y   c h e c k[ _`_ Z  � �ab����a =   � �cdc n  � �efe 1   � ���
�� 
lengf o   � ����� 0 	posixpath 	posixPathd m   � �����  b n  � �ghg I   � ���i���� .0 throwinvalidparameter throwInvalidParameteri jkj o   � ����� 0 filepath filePathk lml m   � �nn �oo  m pqp m   � ���
�� 
ctxtq r��r m   � �ss �tt ( P a t h   c a n  t   b e   e m p t y .��  ��  h o   � ����� 0 _support  ��  ��  ` uvu l  � ���wx��  w ; 5 convert POSIX path text to the requested format/type   x �yy j   c o n v e r t   P O S I X   p a t h   t e x t   t o   t h e   r e q u e s t e d   f o r m a t / t y p ev z��z Z   �L{|}~{ =  � �� o   � ����� 0 toformat toFormat� m   � ���
�� FLCTFLCP| L   � ��� o   � ����� 0 	posixpath 	posixPath} ��� =  � ���� o   � ����� 0 toformat toFormat� m   � ���
�� FLCTFLCA� ��� l  � ����� L   � ��� c   � ���� c   � ���� o   � ����� 0 	posixpath 	posixPath� m   � ���
�� 
psxf� m   � ���
�� 
alis� %  returns object of type `alias`   � ��� >   r e t u r n s   o b j e c t   o f   t y p e   ` a l i a s `� ��� =  � ���� o   � ����� 0 toformat toFormat� m   � ���
�� FLCTFLCX� ��� l  � ����� L   � ��� c   � ���� o   � ����� 0 	posixpath 	posixPath� m   � ���
�� 
psxf� , & returns object of type `�class furl�`   � ��� L   r e t u r n s   o b j e c t   o f   t y p e   ` � c l a s s   f u r l � `� ��� =  � ���� o   � ����� 0 toformat toFormat� m   � ��
� FLCTFLCS� ��� l  � ����� L   � ��� N   � ��� n   � ���� 4   � ��~�
�~ 
file� l  � ���}�|� c   � ���� c   � ���� o   � ��{�{ 0 	posixpath 	posixPath� m   � ��z
�z 
psxf� m   � ��y
�y 
ctxt�}  �|  � 1   � ��x
�x 
ascr�NH returns an _object specifier_ of type 'file'. Caution: unlike alias and �class furl� objects, this is not a true object but may be used by some applications; not to be confused with the deprecated `file specifier` type (�class fss�), although it uses the same `file TEXT` constructor. Furthermore, it uses an HFS path string so suffers the same problems as HFS paths. Also, being a specifier, requires disambiguation when used [e.g.] in an `open` command otherwise command will be dispatched to it instead of target app, e.g. `tell app "TextEdit" to open {fileSpecifierObject}`. Horribly nasty, brittle, and confusing mis-feature, in other words, but supported (though not encouraged) as an option here for sake of compatibility as there's usually some scriptable app or other API in AS that will absolutely refuse to accept anything else.   � ����   r e t u r n s   a n   _ o b j e c t   s p e c i f i e r _   o f   t y p e   ' f i l e ' .   C a u t i o n :   u n l i k e   a l i a s   a n d   � c l a s s   f u r l �   o b j e c t s ,   t h i s   i s   n o t   a   t r u e   o b j e c t   b u t   m a y   b e   u s e d   b y   s o m e   a p p l i c a t i o n s ;   n o t   t o   b e   c o n f u s e d   w i t h   t h e   d e p r e c a t e d   ` f i l e   s p e c i f i e r `   t y p e   ( � c l a s s   f s s � ) ,   a l t h o u g h   i t   u s e s   t h e   s a m e   ` f i l e   T E X T `   c o n s t r u c t o r .   F u r t h e r m o r e ,   i t   u s e s   a n   H F S   p a t h   s t r i n g   s o   s u f f e r s   t h e   s a m e   p r o b l e m s   a s   H F S   p a t h s .   A l s o ,   b e i n g   a   s p e c i f i e r ,   r e q u i r e s   d i s a m b i g u a t i o n   w h e n   u s e d   [ e . g . ]   i n   a n   ` o p e n `   c o m m a n d   o t h e r w i s e   c o m m a n d   w i l l   b e   d i s p a t c h e d   t o   i t   i n s t e a d   o f   t a r g e t   a p p ,   e . g .   ` t e l l   a p p   " T e x t E d i t "   t o   o p e n   { f i l e S p e c i f i e r O b j e c t } ` .   H o r r i b l y   n a s t y ,   b r i t t l e ,   a n d   c o n f u s i n g   m i s - f e a t u r e ,   i n   o t h e r   w o r d s ,   b u t   s u p p o r t e d   ( t h o u g h   n o t   e n c o u r a g e d )   a s   a n   o p t i o n   h e r e   f o r   s a k e   o f   c o m p a t i b i l i t y   a s   t h e r e ' s   u s u a l l y   s o m e   s c r i p t a b l e   a p p   o r   o t h e r   A P I   i n   A S   t h a t   w i l l   a b s o l u t e l y   r e f u s e   t o   a c c e p t   a n y t h i n g   e l s e .� ��� =  � ���� o   � ��w�w 0 toformat toFormat� m   � ��v
�v FLCTFLCH� ��� L   ��� c   ���� c   � ���� o   � ��u�u 0 	posixpath 	posixPath� m   � ��t
�t 
psxf� m   � �s
�s 
ctxt� ��� = ��� o  �r�r 0 toformat toFormat� m  �q
�q FLCTFLCU� ��p� k  <�� ��� r  ��� n ��� I  �o��n�o $0 fileurlwithpath_ fileURLWithPath_� ��m� o  �l�l 0 	posixpath 	posixPath�m  �n  � n ��� o  �k�k 	0 NSURL  � m  �j
�j misccura� o      �i�i 0 asocurl asocURL� ��� Z 3���h�g� = ��� o  �f�f 0 asocurl asocURL� m  �e
�e 
msng� n /��� I  !/�d��c�d .0 throwinvalidparameter throwInvalidParameter� ��� o  !"�b�b 0 filepath filePath� ��� m  "%�� ���  � ��a� 4  %+�`�
�` 
ctxt� m  '*�� ��� 4 C a n  t   c o n v e r t   t o   f i l e   U R L .�a  �c  � o  !�_�_ 0 _support  �h  �g  � ��^� L  4<�� c  4;��� l 49��]�\� n 49��� I  59�[�Z�Y�[  0 absolutestring absoluteString�Z  �Y  � o  45�X�X 0 asocurl asocURL�]  �\  � m  9:�W
�W 
ctxt�^  �p  ~ n ?L��� I  DL�V��U�V >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o  DE�T�T 0 toformat toFormat� ��S� m  EH�� ���  t o�S  �U  � o  ?D�R�R 0 _support  ��  � R      �Q��
�Q .ascrerr ****      � ****� o      �P�P 0 etext eText� �O��
�O 
errn� o      �N�N 0 enumber eNumber� �M��
�M 
erob� o      �L�L 0 efrom eFrom� �K��J
�K 
errt� o      �I�I 
0 eto eTo�J  � I  Tb�H��G�H 
0 _error  � ��� m  UX�� ���  c o n v e r t   p a t h� ��� o  XY�F�F 0 etext eText� ��� o  YZ�E�E 0 enumber eNumber� � � o  Z[�D�D 0 efrom eFrom  �C o  [\�B�B 
0 eto eTo�C  �G  � x r brings a modicum of sanity to the horrible mess that is AppleScript's file path formats and file identifier types   � � �   b r i n g s   a   m o d i c u m   o f   s a n i t y   t o   t h e   h o r r i b l e   m e s s   t h a t   i s   A p p l e S c r i p t ' s   f i l e   p a t h   f o r m a t s   a n d   f i l e   i d e n t i f i e r   t y p e s�  l     �A�@�?�A  �@  �?    l     �>�=�<�>  �=  �<    i  6 9	
	 I     �;
�; .Fil:NorPnull���     ctxt o      �:�: 0 filepath filePath �9�8
�9 
ExpR |�7�6�5�7  �6   o      �4�4 0 isexpanding isExpanding�5   l     �3�2 m      �1
�1 boovfals�3  �2  �8  
 Q     R k    @  r     n    I    �0�/�0 ,0 asposixpathparameter asPOSIXPathParameter  o    	�.�. 0 filepath filePath �- m   	 
 �    �-  �/   o    �,�, 0 _support   o      �+�+ 0 filepath filePath !"! Z    0#$�*�)# F    %&% o    �(�( 0 isexpanding isExpanding& H    '' C    ()( o    �'�' 0 filepath filePath) m    ** �++  /$ r    ,,-, I   *�&.�%
�& .Fil:JoiPnull���     ****. J    &// 010 I   #�$�#�"
�$ .Fil:CurFnull��� ��� null�#  �"  1 2�!2 o   # $� �  0 filepath filePath�!  �%  - o      �� 0 filepath filePath�*  �)  " 3�3 L   1 @44 c   1 ?565 l  1 =7��7 n  1 =898 I   9 =���� 60 stringbystandardizingpath stringByStandardizingPath�  �  9 l  1 9:��: n  1 9;<; I   4 9�=�� &0 stringwithstring_ stringWithString_= >�> o   4 5�� 0 filepath filePath�  �  < n  1 4?@? o   2 4�� 0 nsstring NSString@ m   1 2�
� misccura�  �  �  �  6 m   = >�
� 
ctxt�   R      �AB
� .ascrerr ****      � ****A o      �� 0 etext eTextB �CD
� 
errnC o      �� 0 enumber eNumberD �E�

� 
errtE o      �	�	 
0 eto eTo�
   I   H R�F�� 
0 _error  F GHG m   I JII �JJ  n o r m a l i z e   p a t hH KLK o   J K�� 0 etext eTextL MNM o   K L�� 0 enumber eNumberN OPO o   L M�� 0 filepath filePathP Q�Q o   M N�� 
0 eto eTo�  �   RSR l     �� ���  �   ��  S TUT l     ��������  ��  ��  U VWV i  : =XYX I     ��Z[
�� .Fil:JoiPnull���     ****Z o      ����  0 pathcomponents pathComponents[ ��\��
�� 
Exte\ |����]��^��  ��  ] o      ���� 0 fileextension fileExtension��  ^ l     _����_ m      `` �aa  ��  ��  ��  Y Q     �bcdb k    �ee fgf r    hih n    jkj 2   ��
�� 
cobjk n   lml I    ��n���� "0 aslistparameter asListParametern opo o    	����  0 pathcomponents pathComponentsp q��q m   	 
rr �ss  ��  ��  m o    ���� 0 _support  i o      ���� 0 subpaths subPathsg tut Q    avwxv k    Lyy z{z Z   %|}����| =   ~~ o    ���� 0 subpaths subPaths J    ����  } R    !������
�� .ascrerr ****      � ****��  ��  ��  ��  { ���� X   & L����� r   6 G��� n  6 C��� I   ; C������� ,0 asposixpathparameter asPOSIXPathParameter� ��� n  ; >��� 1   < >��
�� 
pcnt� o   ; <���� 0 aref aRef� ���� m   > ?�� ���  ��  ��  � o   6 ;���� 0 _support  � n     ��� 1   D F��
�� 
pcnt� o   C D���� 0 aref aRef�� 0 aref aRef� o   ) *���� 0 subpaths subPaths��  w R      ������
�� .ascrerr ****      � ****��  ��  x n  T a��� I   Y a������� .0 throwinvalidparameter throwInvalidParameter� ��� o   Y Z����  0 pathcomponents pathComponents� ��� m   Z [�� ���  � ��� m   [ \��
�� 
list� ���� m   \ ]�� ��� X E x p e c t e d   o n e   o r   m o r e   t e x t   a n d / o r   f i l e   i t e m s .��  ��  � o   T Y���� 0 _support  u ��� r   b n��� l  b l������ n  b l��� I   g l������� *0 pathwithcomponents_ pathWithComponents_� ���� o   g h���� 0 subpaths subPaths��  ��  � n  b g��� o   c g���� 0 nsstring NSString� m   b c��
�� misccura��  ��  � o      ���� 0 asocpath asocPath� ��� r   o ~��� n  o |��� I   t |������� "0 astextparameter asTextParameter� ��� o   t u���� 0 fileextension fileExtension� ���� m   u x�� ��� ( u s i n g   f i l e   e x t e n s i o n��  ��  � o   o t���� 0 _support  � o      ���� 0 fileextension fileExtension� ��� Z    �������� >    ���� n   ���� 1   � ���
�� 
leng� o    ����� 0 fileextension fileExtension� m   � �����  � k   � ��� ��� r   � ���� n  � ���� I   � �������� B0 stringbyappendingpathextension_ stringByAppendingPathExtension_� ���� o   � ����� 0 fileextension fileExtension��  ��  � o   � ����� 0 asocpath asocPath� o      ���� 0 asocpath asocPath� ���� Z  � �������� =  � ���� o   � ����� 0 asocpath asocPath� m   � ���
�� 
msng� n  � ���� I   � �������� .0 throwinvalidparameter throwInvalidParameter� ��� o   � ����� 0 fileextension fileExtension� ��� m   � ��� ��� ( u s i n g   f i l e   e x t e n s i o n� ��� m   � ���
�� 
ctxt� ���� m   � ��� ��� . I n v a l i d   f i l e   e x t e n s i o n .��  ��  � o   � ����� 0 _support  ��  ��  ��  ��  ��  � ���� L   � ��� c   � ���� o   � ����� 0 asocpath asocPath� m   � ���
�� 
ctxt��  c R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  d I   � �������� 
0 _error  � ��� m   � ��� ���  j o i n   p a t h� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  W ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  > A��� I     ����
�� .Fil:SplPnull���     ctxt� o      ���� 0 filepath filePath� �����
�� 
Upon� |����������  ��  � o      ���� 0 splitposition splitPosition��  � l     ������ m      ��
�� FLSPFLSL��  ��  ��  � Q     ~� � k    h  r     n    I    ��	���� &0 stringwithstring_ stringWithString_	 
��
 l   ���� n    I    ������ ,0 asposixpathparameter asPOSIXPathParameter  o    �� 0 filepath filePath �~ m     �  �~  ��   o    �}�} 0 _support  ��  ��  ��  ��   n    o    �|�| 0 nsstring NSString m    �{
�{ misccura o      �z�z 0 asocpath asocPath �y Z    h =    o    �x�x 0 splitposition splitPosition m    �w
�w FLSPFLSL L    / J    .   c    %!"! l   ##�v�u# n   #$%$ I    #�t�s�r�t F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent�s  �r  % o    �q�q 0 asocpath asocPath�v  �u  " m   # $�p
�p 
ctxt  &�o& c   % ,'(' l  % *)�n�m) n  % **+* I   & *�l�k�j�l &0 lastpathcomponent lastPathComponent�k  �j  + o   % &�i�i 0 asocpath asocPath�n  �m  ( m   * +�h
�h 
ctxt�o   ,-, =  2 5./. o   2 3�g�g 0 splitposition splitPosition/ m   3 4�f
�f FLSPFLSE- 010 L   8 I22 J   8 H33 454 c   8 ?676 l  8 =8�e�d8 n  8 =9:9 I   9 =�c�b�a�c >0 stringbydeletingpathextension stringByDeletingPathExtension�b  �a  : o   8 9�`�` 0 asocpath asocPath�e  �d  7 m   = >�_
�_ 
ctxt5 ;�^; c   ? F<=< l  ? D>�]�\> n  ? D?@? I   @ D�[�Z�Y�[ 0 pathextension pathExtension�Z  �Y  @ o   ? @�X�X 0 asocpath asocPath�]  �\  = m   D E�W
�W 
ctxt�^  1 ABA =  L OCDC o   L M�V�V 0 splitposition splitPositionD m   M N�U
�U FLSPFLSAB E�TE L   R ZFF c   R YGHG l  R WI�S�RI n  R WJKJ I   S W�Q�P�O�Q  0 pathcomponents pathComponents�P  �O  K o   R S�N�N 0 asocpath asocPath�S  �R  H m   W X�M
�M 
list�T   n  ] hLML I   b h�LN�K�L >0 throwinvalidconstantparameter throwInvalidConstantParameterN OPO o   b c�J�J 0 matchformat matchFormatP Q�IQ m   c dRR �SS  a t�I  �K  M o   ] b�H�H 0 _support  �y    R      �GTU
�G .ascrerr ****      � ****T o      �F�F 0 etext eTextU �EVW
�E 
errnV o      �D�D 0 enumber eNumberW �CXY
�C 
erobX o      �B�B 0 efrom eFromY �AZ�@
�A 
errtZ o      �?�? 
0 eto eTo�@   I   p ~�>[�=�> 
0 _error  [ \]\ m   q t^^ �__  s p l i t   p a t h] `a` o   t u�<�< 0 etext eTexta bcb o   u v�;�; 0 enumber eNumberc ded o   v w�:�: 0 efrom eFrome f�9f o   w x�8�8 
0 eto eTo�9  �=  � ghg l     �7�6�5�7  �6  �5  h iji l     �4�3�2�4  �3  �2  j klk l     �1mn�1  m J D--------------------------------------------------------------------   n �oo � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -l pqp l     �0rs�0  r S M Shell Script Support handlers for use in AppleScripts that run via osascript   s �tt �   S h e l l   S c r i p t   S u p p o r t   h a n d l e r s   f o r   u s e   i n   A p p l e S c r i p t s   t h a t   r u n   v i a   o s a s c r i p tq uvu l     �/�.�-�/  �.  �-  v wxw l     yz{y j   B F�,|�,  0 _argvusererror _ArgvUserError| m   B E�+�+'z�� error code used to indicate the shell script's user supplied invalid command line options (errors due to bugs in invalid option/argument definitions supplied by shell script author use standard AS error codes); need to decide what's a sensible code to use and document it in SDEF (unfortunately, `on error number ...` blocks only accept literal integer (for pattern matching) or identifier (for assignment) and don't allow a command as parameter, so there's no way to supply library-defined error numbers as 'named constants' via library-defined commands, e.g. `on error number (command line user error)`, that return the appropriate number)   { �}}   e r r o r   c o d e   u s e d   t o   i n d i c a t e   t h e   s h e l l   s c r i p t ' s   u s e r   s u p p l i e d   i n v a l i d   c o m m a n d   l i n e   o p t i o n s   ( e r r o r s   d u e   t o   b u g s   i n   i n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n s   s u p p l i e d   b y   s h e l l   s c r i p t   a u t h o r   u s e   s t a n d a r d   A S   e r r o r   c o d e s ) ;   n e e d   t o   d e c i d e   w h a t ' s   a   s e n s i b l e   c o d e   t o   u s e   a n d   d o c u m e n t   i t   i n   S D E F   ( u n f o r t u n a t e l y ,   ` o n   e r r o r   n u m b e r   . . . `   b l o c k s   o n l y   a c c e p t   l i t e r a l   i n t e g e r   ( f o r   p a t t e r n   m a t c h i n g )   o r   i d e n t i f i e r   ( f o r   a s s i g n m e n t )   a n d   d o n ' t   a l l o w   a   c o m m a n d   a s   p a r a m e t e r ,   s o   t h e r e ' s   n o   w a y   t o   s u p p l y   l i b r a r y - d e f i n e d   e r r o r   n u m b e r s   a s   ' n a m e d   c o n s t a n t s '   v i a   l i b r a r y - d e f i n e d   c o m m a n d s ,   e . g .   ` o n   e r r o r   n u m b e r   ( c o m m a n d   l i n e   u s e r   e r r o r ) ` ,   t h a t   r e t u r n   t h e   a p p r o p r i a t e   n u m b e r )x ~~ l     �*�)�(�*  �)  �(   ��� h   G R�'��' 0 novalue NoValue� l     �&���&  � J D unique constant used to indicate no defaultValue property was given   � ��� �   u n i q u e   c o n s t a n t   u s e d   t o   i n d i c a t e   n o   d e f a u l t V a l u e   p r o p e r t y   w a s   g i v e n� ��� l     �%�$�#�%  �$  �#  � ��� j   S [�"��" 
0 lf2 LF2� b   S Z��� 1   S V�!
�! 
lnfd� 1   V Y� 
�  
lnfd� ��� j   \ `��� 0 indent1 Indent1� m   \ _�� ���     � ��� j   a e��� 0 indent2 Indent2� m   a d�� ���             � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  f i��� I      ���� 0 vt100 VT100� ��� o      �� 0 
formatcode 
formatCode�  �  � k     �� ��� l      ����  �F@ Returns a magic character sequence that will apply the specified formatting or other control operation in Terminal.app and other VT100 terminal emulators. Multiple codes may be given as semicolon-separated numeric text, e.g. "1;7". Commonly used style codes are:
	
		0 = reset/normal
		1 = bold
		2 = faint
		4 = underline
		5 = blink
		7 = negative
		8 = conceal
		30-37 = foreground colors (black, red, green, yellow, blue, magenta, cyan, white)
		38;5;N = xterm-256 foreground colors (N = 0-255)
		39 = default foreground color
		40-49 = background colors (as for 30-39)
	   � ����   R e t u r n s   a   m a g i c   c h a r a c t e r   s e q u e n c e   t h a t   w i l l   a p p l y   t h e   s p e c i f i e d   f o r m a t t i n g   o r   o t h e r   c o n t r o l   o p e r a t i o n   i n   T e r m i n a l . a p p   a n d   o t h e r   V T 1 0 0   t e r m i n a l   e m u l a t o r s .   M u l t i p l e   c o d e s   m a y   b e   g i v e n   a s   s e m i c o l o n - s e p a r a t e d   n u m e r i c   t e x t ,   e . g .   " 1 ; 7 " .   C o m m o n l y   u s e d   s t y l e   c o d e s   a r e : 
 	 
 	 	 0   =   r e s e t / n o r m a l 
 	 	 1   =   b o l d 
 	 	 2   =   f a i n t 
 	 	 4   =   u n d e r l i n e 
 	 	 5   =   b l i n k 
 	 	 7   =   n e g a t i v e 
 	 	 8   =   c o n c e a l 
 	 	 3 0 - 3 7   =   f o r e g r o u n d   c o l o r s   ( b l a c k ,   r e d ,   g r e e n ,   y e l l o w ,   b l u e ,   m a g e n t a ,   c y a n ,   w h i t e ) 
 	 	 3 8 ; 5 ; N   =   x t e r m - 2 5 6   f o r e g r o u n d   c o l o r s   ( N   =   0 - 2 5 5 ) 
 	 	 3 9   =   d e f a u l t   f o r e g r o u n d   c o l o r 
 	 	 4 0 - 4 9   =   b a c k g r o u n d   c o l o r s   ( a s   f o r   3 0 - 3 9 ) 
 	� ��� L     �� b     ��� b     	��� b     ��� l    ���� 5     ���
� 
cha � m    �
�
 
� kfrmID  �  �  � m    �� ���  [� o    �	�	 0 
formatcode 
formatCode� m   	 
�� ���  m�  � ��� l     ����  �  �  � ��� l     ����  �  -----   � ��� 
 - - - - -� ��� l     ����  � - ' convert raw args to supported AS types   � ��� N   c o n v e r t   r a w   a r g s   t o   s u p p o r t e d   A S   t y p e s� ��� l     ����  �  �  � ��� i  j m��� I      � ����  0 _unpackvalue _unpackValue� ��� o      ���� 0 thevalue theValue� ���� o      ���� $0 definitionrecord definitionRecord��  ��  � k    ��� ��� l     ������  � � � note that only ASOC-friendly AS types are supported here since NSDictionaries are used as temporary storage for parsed options and arguments   � ���   n o t e   t h a t   o n l y   A S O C - f r i e n d l y   A S   t y p e s   a r e   s u p p o r t e d   h e r e   s i n c e   N S D i c t i o n a r i e s   a r e   u s e d   a s   t e m p o r a r y   s t o r a g e   f o r   p a r s e d   o p t i o n s   a n d   a r g u m e n t s� ��� r     ��� c     ��� n    ��� o    ���� 0 	valuetype 	valueType� o     ���� $0 definitionrecord definitionRecord� m    ��
�� 
type� o      ���� 0 	valuetype 	valueType� ��� Z   ������ =   ��� o    	���� 0 	valuetype 	valueType� m   	 
��
�� 
ctxt� r    ��� o    ���� 0 thevalue theValue� o      ���� 0 	theresult 	theResult� ��� E   ��� J    �� ��� m    ��
�� 
long� ��� m    ��
�� 
doub� ���� m    ��
�� 
nmbr��  � J    �� ���� o    ���� 0 	valuetype 	valueType��  � ��� l    ����� k     ��� ��� r     -��� n    +��� I   ' +�������� 0 init  ��  ��  � n    '��� I   # '�������� 	0 alloc  ��  ��  � n    #� � o   ! #���� &0 nsnumberformatter NSNumberFormatter  m     !��
�� misccura� o      ���� 0 asocformatter asocFormatter�  n  . 6 I   / 6������ "0 setnumberstyle_ setNumberStyle_ �� l  / 2���� n  / 2	 o   0 2���� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle	 m   / 0��
�� misccura��  ��  ��  ��   o   . /���� 0 asocformatter asocFormatter 

 n  7 C I   8 C������ 0 
setlocale_ 
setLocale_ �� l  8 ?���� n  8 ? I   ; ?�������� 0 systemlocale systemLocale��  ��   n  8 ; o   9 ;���� 0 nslocale NSLocale m   8 9��
�� misccura��  ��  ��  ��   o   7 8���� 0 asocformatter asocFormatter  r   D L n  D J I   E J������ &0 numberfromstring_ numberFromString_ �� o   E F���� 0 thevalue theValue��  ��   o   D E���� 0 asocformatter asocFormatter o      ���� 0 
asocresult 
asocResult  Z  M i ���� =  M R!"! o   M N���� 0 
asocresult 
asocResult" m   N Q��
�� 
msng  R   U e��#$
�� .ascrerr ****      � ****# b   _ d%&% m   _ b'' �(( ( N o t   a   v a l i d   n u m b e r :  & o   b c���� 0 thevalue theValue$ ��)��
�� 
errn) o   Y ^����  0 _argvusererror _ArgvUserError��  ��  ��   *+* r   j q,-, c   j o./. o   j k���� 0 
asocresult 
asocResult/ m   k n��
�� 
****- o      ���� 0 	theresult 	theResult+ 0��0 Z   r �12����1 =  r u343 o   r s���� 0 	valuetype 	valueType4 m   s t��
�� 
long2 k   x �55 676 Z  x �89����8 >   x }:;: `   x {<=< o   x y���� 0 	theresult 	theResult= m   y z���� ; m   { |����  9 R   � ���>?
�� .ascrerr ****      � ****> b   � �@A@ m   � �BB �CC * N o t   a   v a l i d   i n t e g e r :  A o   � ����� 0 thevalue theValue? ��D��
�� 
errnD o   � �����  0 _argvusererror _ArgvUserError��  ��  ��  7 E��E r   � �FGF c   � �HIH o   � ����� 0 	theresult 	theResultI m   � ���
�� 
longG o      ���� 0 	theresult 	theResult��  ��  ��  ��  � 6 0 note: decimal numbers must be in canonical form   � �JJ `   n o t e :   d e c i m a l   n u m b e r s   m u s t   b e   i n   c a n o n i c a l   f o r m� KLK E  � �MNM J   � �OO PQP m   � ���
�� 
furlQ RSR m   � ���
�� 
alisS TUT m   � ���
�� 
fileU V��V m   � ���
�� 
psxf��  N J   � �WW X��X o   � ����� 0 	valuetype 	valueType��  L YZY l  �G[\][ k   �G^^ _`_ l  � ���ab��  a   expand/normalize path   b �cc ,   e x p a n d / n o r m a l i z e   p a t h` ded Z   �fg����f H   � �hh C   � �iji o   � ����� 0 thevalue theValuej m   � �kk �ll  /g k   � �mm non r   � �pqp n  � �rsr I   � ��������� ,0 currentdirectorypath currentDirectoryPath��  ��  s n  � �tut I   � ���������  0 defaultmanager defaultManager��  ��  u n  � �vwv o   � ����� 0 nsfilemanager NSFileManagerw m   � ���
�� misccuraq o      ���� 0 basepath basePatho xyx Z  � �z{����z =  � �|}| o   � ����� 0 basepath basePath} m   � ���
�� 
msng{ R   � ���~
�� .ascrerr ****      � ****~ b   � ���� m   � ��� ��� � C a n ' t   e x p a n d   r e l a t i v e   f i l e   p a t h   ( c u r r e n t   w o r k i n g   d i r e c t o r y   i s   u n k n o w n ) :  � o   � ����� 0 thevalue theValue �����
�� 
errn� o   � �����  0 _argvusererror _ArgvUserError��  ��  ��  y ���� r   � ���� l  � ������� n  � ���� I   � �������� *0 pathwithcomponents_ pathWithComponents_� ���� J   � ��� ��� o   � ����� 0 basepath basePath� ���� o   � ����� 0 thevalue theValue��  ��  ��  � n  � ���� o   � ����� 0 nsstring NSString� m   � ���
�� misccura��  ��  � o      ���� 0 thevalue theValue��  ��  ��  e ��� r  ��� c  ��� c  ��� l ������ n ��� I  ����~�� 60 stringbystandardizingpath stringByStandardizingPath�  �~  � l ��}�|� n ��� I  �{��z�{ &0 stringwithstring_ stringWithString_� ��y� o  �x�x 0 thevalue theValue�y  �z  � n ��� o  �w�w 0 nsstring NSString� m  �v
�v misccura�}  �|  ��  ��  � m  �u
�u 
ctxt� m  �t
�t 
psxf� o      �s�s 0 	theresult 	theResult� ��r� Q  G���� Z /���q�p� = !��� o  �o�o 0 	valuetype 	valueType� m   �n
�n 
alis� r  $+��� c  $)��� o  $%�m�m 0 	theresult 	theResult� m  %(�l
�l 
alis� o      �k�k 0 	theresult 	theResult�q  �p  � R      �j�i�
�j .ascrerr ****      � ****�i  � �h��g
�h 
errn� d      �� m      �f�f +�g  � l 7G���� R  7G�e��
�e .ascrerr ****      � ****� b  AF��� m  AD�� ��� 2 F i l e   p a t h   d o e s n  t   e x i s t :  � o  DE�d�d 0 thevalue theValue� �c��b
�c 
errn� o  ;@�a�a  0 _argvusererror _ArgvUserError�b  �   file not found   � ���    f i l e   n o t   f o u n d�r  \ � � note: `file` is treated as synonym for `POSIX file` here, as actual 'file' object specifiers are both mostly pointless and much more problematic due to using HFS paths   ] ���P   n o t e :   ` f i l e `   i s   t r e a t e d   a s   s y n o n y m   f o r   ` P O S I X   f i l e `   h e r e ,   a s   a c t u a l   ' f i l e '   o b j e c t   s p e c i f i e r s   a r e   b o t h   m o s t l y   p o i n t l e s s   a n d   m u c h   m o r e   p r o b l e m a t i c   d u e   t o   u s i n g   H F S   p a t h sZ ��� = JO��� o  JK�`�` 0 	valuetype 	valueType� m  KN�_
�_ 
bool� ��^� l R����� P  R���]�� Z  Y������ E Yp��� J  Yl�� ��� m  Y\�� ���  t r u e� ��� m  \_�� ���  y e s� ��� m  _b�� ���  t� ��� m  be�� ���  y� ��\� m  eh�� ���  1�\  � J  lo�� ��[� o  lm�Z�Z 0 thevalue theValue�[  � L  su�� m  st�Y
�Y boovtrue� ��� E x���� J  x��� ��� m  x{�� ��� 
 f a l s e� ��� m  {~�� ���  n o� ��� m  ~��� ���  f� ��� m  ���� ���  n� ��X� m  ���� ���  0�X  � J  ����  �W  o  ���V�V 0 thevalue theValue�W  � �U L  �� m  ���T
�T boovfals�U  � R  ���S
�S .ascrerr ****      � **** b  �� m  �� � 2 N o t    y e s    o r    n o    ( Y | N ) :   o  ���R�R 0 thevalue theValue �Q	�P
�Q 
errn	 o  ���O�O  0 _argvusererror _ArgvUserError�P  �]  � �N�M
�N conscase�M  � W Q may be used by boolean argument definitions (boolean options don't take a value)   � �

 �   m a y   b e   u s e d   b y   b o o l e a n   a r g u m e n t   d e f i n i t i o n s   ( b o o l e a n   o p t i o n s   d o n ' t   t a k e   a   v a l u e )�^  � R  ���L
�L .ascrerr ****      � **** m  �� � r I n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n   ( n o t   a n   a l l o w e d   t y p e ) . �K
�K 
errn m  ���J�J�Y �I
�I 
erob l ���H�G N  �� n  �� o  ���F�F 0 	valuetype 	valueType o  ���E�E $0 definitionrecord definitionRecord�H  �G   �D�C
�D 
errt m  ���B
�B 
type�C  � �A L  �� o  ���@�@ 0 	theresult 	theResult�A  �  l     �?�>�=�?  �>  �=    l     �<�;�:�<  �;  �:    i  n q !  I      �9"�8�9 40 _defaultvalueplaceholder _defaultValuePlaceholder" #�7# o      �6�6 $0 definitionrecord definitionRecord�7  �8  ! l    g$%&$ k     g'' ()( r     *+* c     ,-, n    ./. o    �5�5 0 	valuetype 	valueType/ o     �4�4 $0 definitionrecord definitionRecord- m    �3
�3 
type+ o      �2�2 0 	valuetype 	valueType) 010 l   �123�1  2 ^ X note: the following conditional block should implement same branches as in _unpackValue   3 �44 �   n o t e :   t h e   f o l l o w i n g   c o n d i t i o n a l   b l o c k   s h o u l d   i m p l e m e n t   s a m e   b r a n c h e s   a s   i n   _ u n p a c k V a l u e1 5�05 Z    g67896 =   :;: o    	�/�/ 0 	valuetype 	valueType; m   	 
�.
�. 
ctxt7 L    << m    == �>>  T E X T8 ?@? E   ABA J    CC DED m    �-
�- 
longE FGF m    �,
�, 
doubG H�+H m    �*
�* 
nmbr�+  B J    II J�)J o    �(�( 0 	valuetype 	valueType�)  @ KLK Z    ,MN�'OM =   "PQP o     �&�& 0 	valuetype 	valueTypeQ m     !�%
�% 
longN L   % 'RR m   % &SS �TT  I N T E G E R�'  O L   * ,UU m   * +VV �WW  N U M B E RL XYX E  / 9Z[Z J   / 5\\ ]^] m   / 0�$
�$ 
furl^ _`_ m   0 1�#
�# 
alis` aba m   1 2�"
�" 
fileb c�!c m   2 3� 
�  
psxf�!  [ J   5 8dd e�e o   5 6�� 0 	valuetype 	valueType�  Y fgf L   < >hh m   < =ii �jj  F I L Eg klk =  A Dmnm o   A B�� 0 	valuetype 	valueTypen m   B C�
� 
booll o�o L   G Kpp m   G Jqq �rr  Y | N�  9 R   N g�st
� .ascrerr ****      � ****s m   c fuu �vv r I n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n   ( n o t   a n   a l l o w e d   t y p e ) .t �wx
� 
errnw m   R U���Yx �yz
� 
eroby l  X \{��{ N   X \|| n   X [}~} o   Y [�� 0 	valuetype 	valueType~ o   X Y�� $0 definitionrecord definitionRecord�  �  z ��
� 
errt m   _ `�
� 
type�  �0  % z t given an option/argument definition record, returns the appropriate default placeholderValue according to valueType   & ��� �   g i v e n   a n   o p t i o n / a r g u m e n t   d e f i n i t i o n   r e c o r d ,   r e t u r n s   t h e   a p p r o p r i a t e   d e f a u l t   p l a c e h o l d e r V a l u e   a c c o r d i n g   t o   v a l u e T y p e ��� l     ����  �  �  � ��� l     ���
�  �  �
  � ��� i  r u��� I      �	���	 *0 _formatdefaultvalue _formatDefaultValue� ��� o      �� $0 definitionrecord definitionRecord�  �  � l    ����� k     ��� ��� r     ��� n     ��� o    �� 0 defaultvalue defaultValue� o     �� $0 definitionrecord definitionRecord� o      �� 0 defaultvalue defaultValue� ��� Z   (����� F    ��� >    ��� l   �� ��� I   ����
�� .corecnte****       ****� J    	�� ���� o    ���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   
 ��
�� 
list��  �   ��  � m    ����  � =    ��� n    ��� 1    ��
�� 
leng� o    ���� 0 defaultvalue defaultValue� m    ���� � r    $��� n    "��� 4    "���
�� 
cobj� m     !���� � o    ���� 0 defaultvalue defaultValue� o      ���� 0 defaultvalue defaultValue�  �  � ��� Z   ) ������ >   ) 4��� l  ) 2������ I  ) 2����
�� .corecnte****       ****� J   ) ,�� ���� o   ) *���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   - .��
�� 
ctxt��  ��  ��  � m   2 3����  � r   7 :��� o   7 8���� 0 defaultvalue defaultValue� o      ���� 0 defaulttext defaultText� ��� G   = X��� >   = H��� l  = F������ I  = F����
�� .corecnte****       ****� J   = @�� ���� o   = >���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   A B��
�� 
long��  ��  ��  � m   F G����  � >   K V��� l  K T������ I  K T����
�� .corecnte****       ****� J   K N�� ���� o   K L���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   O P��
�� 
doub��  ��  ��  � m   T U����  � ��� k   [ ��� ��� r   [ h��� n  [ f��� I   b f�������� 0 init  ��  ��  � n  [ b��� I   ^ b�������� 	0 alloc  ��  ��  � n  [ ^��� o   \ ^���� &0 nsnumberformatter NSNumberFormatter� m   [ \��
�� misccura� o      ���� 0 asocformatter asocFormatter� ��� n  i q��� I   j q������� "0 setnumberstyle_ setNumberStyle_� ���� l  j m������ n  j m��� o   k m���� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle� m   j k��
�� misccura��  ��  ��  ��  � o   i j���� 0 asocformatter asocFormatter� ��� n  r ���� I   s �������� 0 
setlocale_ 
setLocale_� ���� l  s |������ n  s |��� I   x |�������� 0 systemlocale systemLocale��  ��  � n  s x��� o   t x���� 0 nslocale NSLocale� m   s t��
�� misccura��  ��  ��  ��  � o   r s���� 0 asocformatter asocFormatter� ���� r   � ���� c   � ���� l  � ������� n  � ���� I   � �������� &0 stringfromnumber_ stringFromNumber_� ���� o   � ����� 0 defaultvalue defaultValue��  ��  � o   � ����� 0 asocformatter asocFormatter��  ��  � m   � ���
�� 
****� o      ���� 0 defaulttext defaultText��  � ��� G   � ���� >   � �� � l  � ����� I  � ���
�� .corecnte****       **** J   � � �� o   � ����� 0 defaultvalue defaultValue��   ����
�� 
kocl m   � ���
�� 
furl��  ��  ��    m   � �����  � >   � � l  � �	����	 I  � ���

�� .corecnte****       ****
 J   � � �� o   � ����� 0 defaultvalue defaultValue��   ����
�� 
kocl m   � ���
�� 
alis��  ��  ��   m   � �����  �  r   � � n   � � 1   � ���
�� 
psxp o   � ����� 0 defaultvalue defaultValue o      ���� 0 defaulttext defaultText  =  � � o   � ����� 0 defaultvalue defaultValue m   � ���
�� boovtrue  r   � � m   � � �  Y o      ���� 0 defaulttext defaultText   =  � �!"! o   � ����� 0 defaultvalue defaultValue" m   � ���
�� boovfals  #��# r   � �$%$ m   � �&& �''  N% o      ���� 0 defaulttext defaultText��  � L   � �(( m   � �)) �**  � +��+ L   � �,, b   � �-.- b   � �/0/ m   � �11 �22  D e f a u l t :   0 o   � ����� 0 defaulttext defaultText. m   � �33 �44    ��  � G A formats default value for inclusion in OPTIONS/ARGUMENTS section   � �55 �   f o r m a t s   d e f a u l t   v a l u e   f o r   i n c l u s i o n   i n   O P T I O N S / A R G U M E N T S   s e c t i o n� 676 l     ��������  ��  ��  7 898 l     ��:;��  :  -----   ; �<< 
 - - - - -9 =>= l     ��?@��  ?   parse ARGV   @ �AA    p a r s e   A R G V> BCB l     ��������  ��  ��  C DED i  v yFGF I      ��H���� (0 _buildoptionstable _buildOptionsTableH I��I o      ���� &0 optiondefinitions optionDefinitions��  ��  G k    �JJ KLK l     ��MN��  M � � create a case-sensitive lookup table of all short and long option names (e.g. "-a", "-A", "-o", "--output-file", etc); used by _parseOptions() to retrieve the definition record for each option it encounters   N �OO�   c r e a t e   a   c a s e - s e n s i t i v e   l o o k u p   t a b l e   o f   a l l   s h o r t   a n d   l o n g   o p t i o n   n a m e s   ( e . g .   " - a " ,   " - A " ,   " - o " ,   " - - o u t p u t - f i l e " ,   e t c ) ;   u s e d   b y   _ p a r s e O p t i o n s ( )   t o   r e t r i e v e   t h e   d e f i n i t i o n   r e c o r d   f o r   e a c h   o p t i o n   i t   e n c o u n t e r sL PQP r     RSR J     ����  S o      ���� 0 
foundnames 
foundNamesQ TUT r    VWV n   XYX I    ����~�� 0 
dictionary  �  �~  Y n   Z[Z o    �}�} *0 nsmutabledictionary NSMutableDictionary[ m    �|
�| misccuraW o      �{�{ 20 optiondefinitionsbyname optionDefinitionsByNameU \]\ X   �^�z_^ k   �`` aba l   ;cdec r    ;fgf b    9hih l   $j�y�xj c    $klk n   "mnm 1     "�w
�w 
pcntn o     �v�v 0 	optionref 	optionRefl m   " #�u
�u 
reco�y  �x  i K   $ 8oo �tpq�t 0 	shortname 	shortNamep m   % &rr �ss  q �stu�s 0 longname longNamet m   ' (vv �ww  u �rxy�r 0 propertyname propertyNamex m   ) *zz �{{  y �q|}�q 0 	valuetype 	valueType| m   + ,�p
�p 
ctxt} �o~�o 0 islist isList~ m   / 0�n
�n boovfals �m��l�m 0 defaultvalue defaultValue� m   3 4�k
�k boovfals�l  g o      �j�j $0 optiondefinition optionDefinitiond 5 / this defaultValue is only used by boolean opts   e ��� ^   t h i s   d e f a u l t V a l u e   i s   o n l y   u s e d   b y   b o o l e a n   o p t sb ��� Q   < y���� k   ? _�� ��� r   ? F��� c   ? D��� n  ? B��� o   @ B�i�i 0 propertyname propertyName� o   ? @�h�h $0 optiondefinition optionDefinition� m   B C�g
�g 
ctxt� o      �f�f 0 propertyname propertyName� ��e� Z  G _���d�c� =  G N��� n  G J��� o   H J�b�b 0 propertyname propertyName� o   G H�a�a $0 optiondefinition optionDefinition� m   J M�� ���  � R   Q [�`�_�
�` .ascrerr ****      � ****�_  � �^��]
�^ 
errn� m   U X�\�\�\�]  �d  �c  �e  � R      �[�Z�
�[ .ascrerr ****      � ****�Z  � �Y��X
�Y 
errn� d      �� m      �W�W��X  � R   g y�V��
�V .ascrerr ****      � ****� m   u x�� ��� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( p r o p e r t y   n a m e   m u s t   b e   n o n - e m p t y   t e x t ) .� �U��
�U 
errn� m   k n�T�T�Y� �S��R
�S 
erob� o   q r�Q�Q 0 	optionref 	optionRef�R  � ��� r   z ���� n   z ��� 1   { �P
�P 
leng� o   z {�O�O 0 
foundnames 
foundNames� o      �N�N 0 	namecount 	nameCount� ��� X   ����M�� k   ���� ��� r   � ���� o   � ��L�L 0 aref aRef� J      �� ��� o      �K�K 0 thename theName� ��J� o      �I�I 0 
nameprefix 
namePrefix�J  � ��� Q   � ����� r   � ���� c   � ���� o   � ��H�H 0 thename theName� m   � ��G
�G 
ctxt� o      �F�F 0 thename theName� R      �E�D�
�E .ascrerr ****      � ****�D  � �C��B
�C 
errn� d      �� m      �A�A��B  � R   � ��@��
�@ .ascrerr ****      � ****� m   � ��� ��� r I n v a l i d   o p t i o n   d e f i n i t i o n   ( s h o r t / l o n g   n a m e   m u s t   b e   t e x t ) .� �?��
�? 
errn� m   � ��>�>�\� �=��<
�= 
erob� o   � ��;�; 0 	optionref 	optionRef�<  � ��:� Z   �����9�8� >  � ���� o   � ��7�7 0 thename theName� m   � ��� ���  � k   ���� ��� Z  � ����6�5� E  � ���� o   � ��4�4 0 
foundnames 
foundNames� J   � ��� ��3� o   � ��2�2 0 thename theName�3  � R   � ��1��
�1 .ascrerr ****      � ****� m   � ��� ��� x I n v a l i d   o p t i o n   d e f i n i t i o n   ( f o u n d   d u p l i c a t e   s h o r t / l o n g   n a m e ) .� �0��
�0 
errn� m   � ��/�/�Y� �.��-
�. 
erob� o   � ��,�, 0 	optionref 	optionRef�-  �6  �5  � ��� r   ���� o   � ��+�+ 0 thename theName� n      ���  ;   � o   � �*�* 0 
foundnames 
foundNames� ��� P  ���)�� Z  
����(�� =  
��� n 
��� 1  �'
�' 
leng� o  
�&�& 0 
nameprefix 
namePrefix� m  �%�% � l A���� Z A���$�#� l (��"�!� G  (��� >  ��� n ��� 1  � 
�  
leng� o  �� 0 thename theName� m  �� � H  $�� E #	 		  m  !		 �		 4 a b c d e f g h i j k l m n o p q r s t u v w x y z	 o  !"�� 0 thename theName�"  �!  � R  +=�		
� .ascrerr ****      � ****	 m  9<		 �		 � I n v a l i d   o p t i o n   d e f i n i t i o n   ( s h o r t   n a m e   m u s t   b e   a   s i n g l e   A - Z   o r   a - z   c h a r a c t e r ) .	 �			
� 
errn	 m  /2���Y		 �	
�
� 
erob	
 o  56�� 0 	optionref 	optionRef�  �$  �#  �   validate short name   � �		 (   v a l i d a t e   s h o r t   n a m e�(  � l D�				 k  D�		 			 Z D�		��	 G  Di			 G  D]			 =  DK			 n DI			 1  EI�
� 
leng	 o  DE�� 0 thename theName	 m  IJ��  	 H  NY		 E NX			 m  NQ		 �	 	  4 a b c d e f g h i j k l m n o p q r s t u v w x y z	 n QW	!	"	! 4  RW�	#
� 
cha 	# m  UV�� 	" o  QR�� 0 thename theName	 D  `e	$	%	$ o  `a�� 0 thename theName	% m  ad	&	& �	'	'  -	 R  l~�	(	)
� .ascrerr ****      � ****	( m  z}	*	* �	+	+ � I n v a l i d   o p t i o n   d e f i n i t i o n   ( l o n g   n a m e   m u s t   s t a r t   w i t h   A - Z   o r   a - z   c h a r a c t e r ) .	) �	,	-
� 
errn	, m  ps���Y	- �
	.�	
�
 
erob	. o  vw�� 0 	optionref 	optionRef�	  �  �  	 	/�	/ X  ��	0�	1	0 Z ��	2	3��	2 H  ��	4	4 E ��	5	6	5 m  ��	7	7 �	8	8 J a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0 -	6 n ��	9	:	9 1  ���
� 
pcnt	: o  ���� 0 charref charRef	3 R  ���	;	<
� .ascrerr ****      � ****	; m  ��	=	= �	>	> � I n v a l i d   o p t i o n   d e f i n i t i o n   ( l o n g   n a m e   c a n   o n l y   c o n t a i n   A - Z ,   a - z ,   0 - 9   o r   h y p h e n   c h a r a c t e r s ) .	< � 	?	@
�  
errn	? m  �������Y	@ ��	A��
�� 
erob	A o  ������ 0 	optionref 	optionRef��  �  �  � 0 charref charRef	1 o  ������ 0 thename theName�  	   validate long name   	 �	B	B &   v a l i d a t e   l o n g   n a m e�)  � ����
�� conscase��  � 	C��	C l ��	D����	D n ��	E	F	E I  ����	G���� &0 setobject_forkey_ setObject_forKey_	G 	H	I	H o  ������ $0 optiondefinition optionDefinition	I 	J��	J l ��	K����	K b  ��	L	M	L o  ������ 0 
nameprefix 
namePrefix	M o  ������ 0 thename theName��  ��  ��  ��  	F o  ������ 20 optiondefinitionsbyname optionDefinitionsByName��  ��  ��  �9  �8  �:  �M 0 aref aRef� J   � �	N	N 	O	P	O J   � �	Q	Q 	R	S	R n  � �	T	U	T o   � ����� 0 	shortname 	shortName	U o   � ����� $0 optiondefinition optionDefinition	S 	V��	V m   � �	W	W �	X	X  -��  	P 	Y��	Y J   � �	Z	Z 	[	\	[ n  � �	]	^	] o   � ����� 0 longname longName	^ o   � ����� $0 optiondefinition optionDefinition	\ 	_��	_ m   � �	`	` �	a	a  - -��  ��  � 	b��	b Z ��	c	d����	c =  ��	e	f	e n  ��	g	h	g 1  ����
�� 
leng	h o  ������ 0 
foundnames 
foundNames	f o  ������ 0 	namecount 	nameCount	d R  ����	i	j
�� .ascrerr ****      � ****	i m  ��	k	k �	l	l � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   n o n - e m p t y    s h o r t N a m e    a n d / o r    l o n g N a m e    p r o p e r t y ) .	j ��	m	n
�� 
errn	m m  �������Y	n ��	o��
�� 
erob	o o  ������ 0 	optionref 	optionRef��  ��  ��  ��  �z 0 	optionref 	optionRef_ o    ���� &0 optiondefinitions optionDefinitions] 	p��	p L  ��	q	q o  ������ 20 optiondefinitionsbyname optionDefinitionsByName��  E 	r	s	r l     ��������  ��  ��  	s 	t	u	t l     ��������  ��  ��  	u 	v	w	v i  z }	x	y	x I      ��	z���� 0 _parseoptions _parseOptions	z 	{	|	{ o      ���� 0 rawarguments rawArguments	| 	}	~	} o      ���� &0 optiondefinitions optionDefinitions	~ 	��	 o      ���� &0 hasdefaultoptions hasDefaultOptions��  ��  	y k    n	�	� 	�	�	� l     ��	�	���  	�oi given a list of raw arguments passed to script's run handler, extract those items that are command option names and (where relevant) their corresponding values, converting those values to the required type and returning an NSMutableDictionary of option name-value pairs plus a list of any remaining (i.e. non-option) arguments to be passed to _parseArguments()   	� �	�	��   g i v e n   a   l i s t   o f   r a w   a r g u m e n t s   p a s s e d   t o   s c r i p t ' s   r u n   h a n d l e r ,   e x t r a c t   t h o s e   i t e m s   t h a t   a r e   c o m m a n d   o p t i o n   n a m e s   a n d   ( w h e r e   r e l e v a n t )   t h e i r   c o r r e s p o n d i n g   v a l u e s ,   c o n v e r t i n g   t h o s e   v a l u e s   t o   t h e   r e q u i r e d   t y p e   a n d   r e t u r n i n g   a n   N S M u t a b l e D i c t i o n a r y   o f   o p t i o n   n a m e - v a l u e   p a i r s   p l u s   a   l i s t   o f   a n y   r e m a i n i n g   ( i . e .   n o n - o p t i o n )   a r g u m e n t s   t o   b e   p a s s e d   t o   _ p a r s e A r g u m e n t s ( )	� 	�	�	� l     ��	�	���  	� 6 0 first build a lookup table of all known options   	� �	�	� `   f i r s t   b u i l d   a   l o o k u p   t a b l e   o f   a l l   k n o w n   o p t i o n s	� 	�	�	� r     	�	�	� I     ��	����� (0 _buildoptionstable _buildOptionsTable	� 	���	� o    ���� &0 optiondefinitions optionDefinitions��  ��  	� o      ���� 20 optiondefinitionsbyname optionDefinitionsByName	� 	�	�	� r   	 	�	�	� n  	 	�	�	� I    �������� 0 
dictionary  ��  ��  	� n  	 	�	�	� o   
 ���� *0 nsmutabledictionary NSMutableDictionary	� m   	 
��
�� misccura	� o      ���� (0 asocparametersdict asocParametersDict	� 	�	�	� l   	�	�	�	� r    	�	�	� m    	�	� �	�	�  =	� n     	�	�	� 1    ��
�� 
txdl	� 1    ��
�� 
ascr	� P J note: a long option can use a space or '=' to separate its name and value   	� �	�	� �   n o t e :   a   l o n g   o p t i o n   c a n   u s e   a   s p a c e   o r   ' = '   t o   s e p a r a t e   i t s   n a m e   a n d   v a l u e	� 	�	�	� l   ��	�	���  	� R L consume raw arguments list until it is empty or a non-option is encountered   	� �	�	� �   c o n s u m e   r a w   a r g u m e n t s   l i s t   u n t i l   i t   i s   e m p t y   o r   a   n o n - o p t i o n   i s   e n c o u n t e r e d	� 	�	�	� W   h	�	�	� k   "c	�	� 	�	�	� r   " (	�	�	� n   " &	�	�	� 4  # &��	�
�� 
cobj	� m   $ %���� 	� o   " #���� 0 rawarguments rawArguments	� o      ���� 0 thearg theArg	� 	�	�	� Z   ) 	�	�	�	�	� C   ) ,	�	�	� o   ) *���� 0 thearg theArg	� m   * +	�	� �	�	�  - -	� l  / m	�	�	�	� k   / m	�	� 	�	�	� Z   / @	�	�����	� =  / 2	�	�	� o   / 0���� 0 thearg theArg	� m   0 1	�	� �	�	�  - -	� l  5 <	�	�	�	� k   5 <	�	� 	�	�	� r   5 :	�	�	� n   5 8	�	�	� 1   6 8��
�� 
rest	� o   5 6���� 0 rawarguments rawArguments	� o      ���� 0 rawarguments rawArguments	� 	���	�  S   ; <��  	� i c double-hypens terminates the option list, so anything left in rawArguments is positional arguments   	� �	�	� �   d o u b l e - h y p e n s   t e r m i n a t e s   t h e   o p t i o n   l i s t ,   s o   a n y t h i n g   l e f t   i n   r a w A r g u m e n t s   i s   p o s i t i o n a l   a r g u m e n t s��  ��  	� 	�	�	� l  A G	�	�	�	� r   A G	�	�	� n   A E	�	�	� 4  B E��	�
�� 
citm	� m   C D���� 	� o   A B���� 0 thearg theArg	� o      ���� 0 
optionname 
optionName	�   get "--NAME"   	� �	�	�    g e t   " - - N A M E "	� 	���	� Z   H m	�	���	�	� ?   H Q	�	�	� l  H O	�����	� I  H O��	�	�
�� .corecnte****       ****	� o   H I���� 0 thearg theArg	� ��	���
�� 
kocl	� m   J K��
�� 
citm��  ��  ��  	� m   O P���� 	� l  T e	�	�	�	� r   T e	�	�	� n   T `	�	�	� 7  U `��	�	�
�� 
ctxt	� l  Y \	�����	� 4   Y \��	�
�� 
citm	� m   Z [���� ��  ��  	� m   ] _������	� o   T U���� 0 thearg theArg	� n      	�	�	� 4  a d��	�
�� 
cobj	� m   b c���� 	� o   ` a���� 0 rawarguments rawArguments	� * $ put "VALUE" back on stack for later   	� �	�	� H   p u t   " V A L U E "   b a c k   o n   s t a c k   f o r   l a t e r��  	� l  h m	�	�	�	� r   h m	�
 	� n   h k


 1   i k��
�� 
rest
 o   h i���� 0 rawarguments rawArguments
  o      ���� 0 rawarguments rawArguments	� ( " remove the option name from stack   	� �

 D   r e m o v e   t h e   o p t i o n   n a m e   f r o m   s t a c k��  	� < 6 found "--[NAME[=VALUE]]" (NAME is a long option name)   	� �

 l   f o u n d   " - - [ N A M E [ = V A L U E ] ] "   ( N A M E   i s   a   l o n g   o p t i o n   n a m e )	� 


 C   p s


 o   p q���� 0 thearg theArg
 m   q r
	
	 �



  -
 
��
 l  v �



 k   v �

 


 l  v �



 Z  v �

����
 G   v �


 =  v {


 o   v w���� 0 thearg theArg
 m   w z

 �

  -
 E  ~ �


 m   ~ �

 �
 
   0 1 2 3 4 5 6 7 8 9 0
 n  � �
!
"
! 4   � ���
#
�� 
cha 
# m   � ����� 
" o   � ����� 0 thearg theArg
  S   � ���  ��  
 � { it's a lone hyphen or a negative number (i.e. not an option), so treat it and rest of rawArguments as positional arguments   
 �
$
$ �   i t ' s   a   l o n e   h y p h e n   o r   a   n e g a t i v e   n u m b e r   ( i . e .   n o t   a n   o p t i o n ) ,   s o   t r e a t   i t   a n d   r e s t   o f   r a w A r g u m e n t s   a s   p o s i t i o n a l   a r g u m e n t s
 
%
&
% l  � �
'
(
)
' r   � �
*
+
* n   � �
,
-
, 7  � ���
.
/
�� 
ctxt
. m   � ����� 
/ m   � ����� 
- o   � ����� 0 thearg theArg
+ o      ���� 0 
optionname 
optionName
(  	 get "-N"   
) �
0
0    g e t   " - N "
& 
1��
1 Z   � �
2
3��
4
2 ?   � �
5
6
5 n  � �
7
8
7 1   � ���
�� 
leng
8 o   � ����� 0 thearg theArg
6 m   � ����� 
3 l  � �
9
:
;
9 k   � �
<
< 
=
>
= r   � �
?
@
? n   � �
A
B
A 7  � ���
C
D
�� 
ctxt
C m   � ����� 
D m   � �����
B o   � ��~�~ 0 thearg theArg
@ n      
E
F
E 4  � ��}
G
�} 
cobj
G m   � ��|�| 
F o   � ��{�{ 0 rawarguments rawArguments
> 
H
I
H r   � �
J
K
J n  � �
L
M
L I   � ��z
N�y�z 0 objectforkey_ objectForKey_
N 
O�x
O o   � ��w�w 0 
optionname 
optionName�x  �y  
M o   � ��v�v 20 optiondefinitionsbyname optionDefinitionsByName
K o      �u�u $0 optiondefinition optionDefinition
I 
P�t
P Z   � �
Q
R�s�r
Q F   � �
S
T
S >  � �
U
V
U o   � ��q�q $0 optiondefinition optionDefinition
V m   � ��p
�p 
msng
T =  � �
W
X
W n  � �
Y
Z
Y o   � ��o�o 0 	valuetype 	valueType
Z l  � �
[�n�m
[ c   � �
\
]
\ o   � ��l�l $0 optiondefinition optionDefinition
] m   � ��k
�k 
****�n  �m  
X m   � ��j
�j 
bool
R r   � �
^
_
^ b   � �
`
a
` m   � �
b
b �
c
c  -
a n   � �
d
e
d 4  � ��i
f
�i 
cobj
f m   � ��h�h 
e o   � ��g�g 0 rawarguments rawArguments
_ n      
g
h
g 4  � ��f
i
�f 
cobj
i m   � ��e�e 
h o   � ��d�d 0 rawarguments rawArguments�s  �r  �t  
: / ) put "[-N�]VALUE" back on stack for later   
; �
j
j R   p u t   " [ - N & ] V A L U E "   b a c k   o n   s t a c k   f o r   l a t e r��  
4 l  � �
k
l
m
k r   � �
n
o
n n   � �
p
q
p 1   � ��c
�c 
rest
q o   � ��b�b 0 rawarguments rawArguments
o o      �a�a 0 rawarguments rawArguments
l ' !remove the option name from stack   
m �
r
r B r e m o v e   t h e   o p t i o n   n a m e   f r o m   s t a c k��  
 H B found "-N[N�][VALUE]" (N is a single-character short option name)   
 �
s
s �   f o u n d   " - N [ N & ] [ V A L U E ] "   ( N   i s   a   s i n g l e - c h a r a c t e r   s h o r t   o p t i o n   n a m e )��  	� l  � 
t
u
v
t  S   � 
u S M not an option name, so anything left in rawArguments is positional arguments   
v �
w
w �   n o t   a n   o p t i o n   n a m e ,   s o   a n y t h i n g   l e f t   i n   r a w A r g u m e n t s   i s   p o s i t i o n a l   a r g u m e n t s	� 
x
y
x l �`
z
{�`  
z - ' look up the option's definition record   
{ �
|
| N   l o o k   u p   t h e   o p t i o n ' s   d e f i n i t i o n   r e c o r d
y 
}
~
} r  	

�
 n 
�
�
� I  �_
��^�_ 0 objectforkey_ objectForKey_
� 
��]
� o  �\�\ 0 
optionname 
optionName�]  �^  
� o  �[�[ 20 optiondefinitionsbyname optionDefinitionsByName
� o      �Z�Z $0 optiondefinition optionDefinition
~ 
�
�
� Z  
�
�
��Y�X
� = 

�
�
� o  
�W�W $0 optiondefinition optionDefinition
� m  �V
�V 
msng
� l �
�
�
�
� k  �
�
� 
�
�
� Z  t
�
��U�T
� o  �S�S &0 hasdefaultoptions hasDefaultOptions
� k  p
�
� 
�
�
� r  ?
�
�
� J  0
�
� 
�
�
� E "
�
�
� J  
�
� 
�
�
� m  
�
� �
�
�  - h
� 
��R
� m  
�
� �
�
�  - - h e l p�R  
� J  !
�
� 
��Q
� o  �P�P 0 
optionname 
optionName�Q  
� 
��O
� E ".
�
�
� J  "*
�
� 
�
�
� m  "%
�
� �
�
�  - v
� 
��N
� m  %(
�
� �
�
�  - - v e r s i o n�N  
� J  *-
�
� 
��M
� o  *+�L�L 0 
optionname 
optionName�M  �O  
� J      
�
� 
�
�
� o      �K�K 0 ishelp isHelp
� 
��J
� o      �I�I 0 	isversion 	isVersion�J  
� 
��H
� Z  @p
�
��G�F
� G  @I
�
�
� o  @A�E�E 0 ishelp isHelp
� o  DE�D�D 0 	isversion 	isVersion
� l Ll
�
�
�
� k  Ll
�
� 
�
�
� n LQ
�
�
� I  MQ�C�B�A�C $0 removeallobjects removeAllObjects�B  �A  
� o  LM�@�@ (0 asocparametersdict asocParametersDict
� 
�
�
� n R[
�
�
� I  S[�?
��>�? $0 setvalue_forkey_ setValue_forKey_
� 
�
�
� o  ST�=�= 0 ishelp isHelp
� 
��<
� m  TW
�
� �
�
�  h e l p�<  �>  
� o  RS�;�; (0 asocparametersdict asocParametersDict
� 
�
�
� n \e
�
�
� I  ]e�:
��9�: $0 setvalue_forkey_ setValue_forKey_
� 
�
�
� o  ]^�8�8 0 	isversion 	isVersion
� 
��7
� m  ^a
�
� �
�
�  v e r s i o n�7  �9  
� o  \]�6�6 (0 asocparametersdict asocParametersDict
� 
�
�
� r  fj
�
�
� J  fh�5�5  
� o      �4�4 0 rawarguments rawArguments
� 
��3
�  S  kl�3  
�  � ignore everything else and return a minimal record containing only `help` and `version` properties, one or both of which are true, so must be dealt with accordingly by `run` handler (i.e. format+log help text and return and/or return version number)   
� �
�
��   i g n o r e   e v e r y t h i n g   e l s e   a n d   r e t u r n   a   m i n i m a l   r e c o r d   c o n t a i n i n g   o n l y   ` h e l p `   a n d   ` v e r s i o n `   p r o p e r t i e s ,   o n e   o r   b o t h   o f   w h i c h   a r e   t r u e ,   s o   m u s t   b e   d e a l t   w i t h   a c c o r d i n g l y   b y   ` r u n `   h a n d l e r   ( i . e .   f o r m a t + l o g   h e l p   t e x t   a n d   r e t u r n   a n d / o r   r e t u r n   v e r s i o n   n u m b e r )�G  �F  �H  �U  �T  
� 
��2
� R  u��1
�
�
�1 .ascrerr ****      � ****
� b  �
�
�
� m  �
�
� �
�
�   U n k n o w n   o p t i o n :  
� o  ���0�0 0 
optionname 
optionName
� �/
��.
�/ 
errn
� o  y~�-�-  0 _argvusererror _ArgvUserError�.  �2  
� A ; check for default options (help/version), else raise error   
� �
�
� v   c h e c k   f o r   d e f a u l t   o p t i o n s   ( h e l p / v e r s i o n ) ,   e l s e   r a i s e   e r r o r�Y  �X  
� 
�
�
� r  ��
�
�
� c  ��
�
�
� o  ���,�, $0 optiondefinition optionDefinition
� m  ���+
�+ 
****
� o      �*�* $0 optiondefinition optionDefinition
� 
�
�
� r  ��
�
�
� n ��
�
�
� o  ���)�) 0 propertyname propertyName
� o  ���(�( $0 optiondefinition optionDefinition
� o      �'�' 0 propertyname propertyName
� 
�
�
� l ���&
�
��&  
� #  now process the option value   
� �
�
� :   n o w   p r o c e s s   t h e   o p t i o n   v a l u e
� 
�
�
� Z  �
�
��%
�
� = ��
�
�
� n ��   o  ���$�$ 0 	valuetype 	valueType o  ���#�# $0 optiondefinition optionDefinition
� m  ���"
�" 
bool
� Q  �� r  �� H  �� n ��	 o  ���!�! 0 defaultvalue defaultValue	 o  ��� �  $0 optiondefinition optionDefinition o      �� 0 thevalue theValue R      ���
� .ascrerr ****      � ****�  �   R  ���

� .ascrerr ****      � ****
 b  �� m  �� � J B a d   d e f a u l t V a l u e   f o r   b o o l e a n   o p t i o n :   o  ���� 0 
optionname 
optionName �
� 
errn m  �����\ ��
� 
erob l ���� N  �� n  �� o  ���� 0 defaultvalue defaultValue o  ���� $0 optiondefinition optionDefinition�  �  �  �%  
� k  �  Z ���� = �� o  ���� 0 rawarguments rawArguments J  ����   R  ���
� .ascrerr ****      � **** b  �� !  m  ��"" �## 4 M i s s i n g   v a l u e   f o r   o p t i o n :  ! o  ���� 0 
optionname 
optionName �$�

� 
errn$ o  ���	�	  0 _argvusererror _ArgvUserError�
  �  �   %&% r  ��'(' I  ���)�� 0 _unpackvalue _unpackValue) *+* n  ��,-, 4 ���.
� 
cobj. m  ���� - o  ���� 0 rawarguments rawArguments+ /�/ o  ���� $0 optiondefinition optionDefinition�  �  ( o      �� 0 thevalue theValue& 0� 0 r  �121 n  �343 1  ���
�� 
rest4 o  ������ 0 rawarguments rawArguments2 o      ���� 0 rawarguments rawArguments�   
� 565 Z  [789��7 n 
:;: o  	���� 0 islist isList; o  ���� $0 optiondefinition optionDefinition8 l 7<=>< k  7?? @A@ r  BCB n DED I  ��F���� 0 objectforkey_ objectForKey_F G��G o  ���� 0 propertyname propertyName��  ��  E o  ���� (0 asocparametersdict asocParametersDictC o      ���� 0 thelist theListA H��H Z  7IJ��KI = LML o  ���� 0 thelist theListM m  ��
�� 
msngJ r  *NON n (PQP I  #(��R���� $0 arraywithobject_ arrayWithObject_R S��S o  #$���� 0 thevalue theValue��  ��  Q n #TUT o  #����  0 nsmutablearray NSMutableArrayU m  ��
�� misccuraO o      ���� 0 thevalue theValue��  K k  -7VV WXW n -3YZY I  .3��[���� 0 
addobject_ 
addObject_[ \��\ o  ./���� 0 thevalue theValue��  ��  Z o  -.���� 0 thelist theListX ]��] r  47^_^ o  45���� 0 thelist theList_ o      ���� 0 thevalue theValue��  ��  = = 7 option can appear multiple times, so collect in a list   > �`` n   o p t i o n   c a n   a p p e a r   m u l t i p l e   t i m e s ,   s o   c o l l e c t   i n   a   l i s t9 aba > :Dcdc l :@e����e n :@fgf I  ;@��h���� 0 objectforkey_ objectForKey_h i��i o  ;<���� 0 propertyname propertyName��  ��  g o  :;���� (0 asocparametersdict asocParametersDict��  ��  d m  @C��
�� 
msngb j��j R  GW��kl
�� .ascrerr ****      � ****k b  QVmnm m  QToo �pp $ D u p l i c a t e   o p t i o n :  n o  TU���� 0 
optionname 
optionNamel ��q��
�� 
errnq o  KP����  0 _argvusererror _ArgvUserError��  ��  ��  6 r��r n \csts I  ]c��u���� &0 setobject_forkey_ setObject_forKey_u vwv o  ]^���� 0 thevalue theValuew x��x o  ^_���� 0 propertyname propertyName��  ��  t o  \]���� (0 asocparametersdict asocParametersDict��  	� =   !yzy o    ���� 0 rawarguments rawArgumentsz J     ����  	� {��{ L  in|| J  im}} ~~ o  ij���� (0 asocparametersdict asocParametersDict ���� o  jk���� 0 rawarguments rawArguments��  ��  	w ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  ~ ���� I      ������� (0 _adddefaultoptions _addDefaultOptions� ��� o      ���� (0 asocparametersdict asocParametersDict� ���� o      ���� &0 optiondefinitions optionDefinitions��  ��  � k     ��� ��� X     ������ k    ��� ��� r    "��� b     ��� l   ������ c    ��� o    ���� 0 recref recRef� m    ��
�� 
reco��  ��  � K    �� ������ 0 propertyname propertyName� m    �� ���  � ������ 0 longname longName� m    �� ���  � ������� 0 defaultvalue defaultValue� o    ���� 0 novalue NoValue��  � o      ���� 0 rec  � ��� r   # (��� n  # &��� o   $ &���� 0 propertyname propertyName� o   # $���� 0 rec  � o      ���� 0 propertyname propertyName� ��� Z  ) 8������� =  ) ,��� o   ) *���� 0 propertyname propertyName� m   * +�� ���  � r   / 4��� n  / 2��� o   0 2���� 0 longname longName� o   / 0���� 0 rec  � o      ���� 0 propertyname propertyName��  ��  � ���� Z   9 �������� =  9 A��� l  9 ?������ n  9 ?��� I   : ?������� 0 objectforkey_ objectForKey_� ���� o   : ;���� 0 propertyname propertyName��  ��  � o   9 :���� (0 asocparametersdict asocParametersDict��  ��  � m   ? @��
�� 
msng� k   D ��� ��� r   D I��� n  D G��� o   E G���� 0 defaultvalue defaultValue� o   D E���� 0 rec  � o      ���� 0 thevalue theValue� ��� Z   J �������� =  J Q��� o   J K���� 0 thevalue theValue� o   K P���� 0 novalue NoValue� l  T ����� k   T ��� ��� r   T [��� b   T Y��� m   T U�� ���  - -� n  U X��� o   V X���� 0 longname longName� o   U V���� 0 rec  � o      ���� 0 
optionname 
optionName� ��� Z  \ o������� =  \ _��� o   \ ]���� 0 
optionname 
optionName� m   ] ^�� ���  - -� r   b k��� b   b i��� m   b c�� ���  -� n  c h��� o   d h���� 0 	shortname 	shortName� o   c d���� 0 rec  � o      ���� 0 
optionname 
optionName��  ��  � ���� R   p �����
�� .ascrerr ****      � ****� b   z ��� m   z }�� ��� 2 M i s s i n g   r e q u i r e d   o p t i o n :  � o   } ~���� 0 
optionname 
optionName� �����
�� 
errn� o   t y����  0 _argvusererror _ArgvUserError��  ��  � 2 , record doesn't have a defaultValue property   � ��� X   r e c o r d   d o e s n ' t   h a v e   a   d e f a u l t V a l u e   p r o p e r t y��  ��  � ��� Z  � �������� =  � ���� o   � ����� 0 thevalue theValue� m   � ���
�� 
msng� r   � ���� n  � ���� I   � �������� 0 null  ��  �  � n  � �   o   � ��~�~ 0 nsnull NSNull m   � ��}
�} misccura� o      �|�| 0 thevalue theValue��  ��  � �{ l  � ��z�y n  � � I   � ��x�w�x &0 setobject_forkey_ setObject_forKey_  o   � ��v�v 0 thevalue theValue 	�u	 o   � ��t�t 0 propertyname propertyName�u  �w   o   � ��s�s (0 asocparametersdict asocParametersDict�z  �y  �{  ��  ��  ��  �� 0 recref recRef� o    �r�r &0 optiondefinitions optionDefinitions� 

 l  � ��q�q   k e add default 'help', 'version' properties to parameters dict (record) if not already supplied by user    � �   a d d   d e f a u l t   ' h e l p ' ,   ' v e r s i o n '   p r o p e r t i e s   t o   p a r a m e t e r s   d i c t   ( r e c o r d )   i f   n o t   a l r e a d y   s u p p l i e d   b y   u s e r �p X   � ��o Z  � ��n�m =  � � l  � ��l�k n  � � I   � ��j�i�j 0 objectforkey_ objectForKey_ �h l  � ��g�f n  � � 1   � ��e
�e 
pcnt o   � ��d�d "0 propertynameref propertyNameRef�g  �f  �h  �i   o   � ��c�c (0 asocparametersdict asocParametersDict�l  �k   m   � ��b
�b 
msng l  � ��a�` n  � �  I   � ��_!�^�_ &0 setobject_forkey_ setObject_forKey_! "#" m   � ��]
�] boovfals# $�\$ l  � �%�[�Z% n  � �&'& 1   � ��Y
�Y 
pcnt' o   � ��X�X "0 propertynameref propertyNameRef�[  �Z  �\  �^    o   � ��W�W (0 asocparametersdict asocParametersDict�a  �`  �n  �m  �o "0 propertynameref propertyNameRef J   � �(( )*) m   � �++ �,,  h e l p* -�V- m   � �.. �//  v e r s i o n�V  �p  � 010 l     �U�T�S�U  �T  �S  1 232 l     �R�Q�P�R  �Q  �P  3 454 l     �O�N�M�O  �N  �M  5 676 l     �L�K�J�L  �K  �J  7 898 i  � �:;: I      �I<�H�I  0 _ordinalnumber _ordinalNumber< =�G= o      �F�F 0 n  �G  �H  ; Z     7>?�E@> F     ABA E    CDC J     EE FGF m     �D�D G HIH m    �C�C I J�BJ m    �A�A �B  D J    
KK L�@L `    MNM o    �?�? 0 n  N m    �>�> 
�@  B H    OO E   PQP J    RR STS m    �=�= T UVU m    �<�< V W�;W m    �:�: �;  Q J    XX Y�9Y `    Z[Z o    �8�8 0 n  [ m    �7�7 d�9  ? L    .\\ b    -]^] l   "_�6�5_ c    "`a` o     �4�4 0 n  a m     !�3
�3 
ctxt�6  �5  ^ n   " ,bcb 4   ' ,�2d
�2 
cobjd l  ( +e�1�0e `   ( +fgf o   ( )�/�/ 0 n  g m   ) *�.�. 
�1  �0  c J   " 'hh iji m   " #kk �ll  s tj mnm m   # $oo �pp  n dn q�-q m   $ %rr �ss  r d�-  �E  @ L   1 7tt b   1 6uvu l  1 4w�,�+w c   1 4xyx o   1 2�*�* 0 n  y m   2 3�)
�) 
ctxt�,  �+  v m   4 5zz �{{  t h9 |}| l     �(�'�&�(  �'  �&  } ~~ l     �%�$�#�%  �$  �#   ��� i  � ���� I      �"��!�" "0 _parsearguments _parseArguments� ��� o      � �  0 argumentslist argumentsList� ��� o      �� *0 argumentdefinitions argumentDefinitions� ��� o      �� (0 asocparametersdict asocParametersDict�  �!  � k    ��� ��� l     ����  � q k parse the remaining raw arguments, converting to the required type and adding to the parameters dictionary   � ��� �   p a r s e   t h e   r e m a i n i n g   r a w   a r g u m e n t s ,   c o n v e r t i n g   t o   t h e   r e q u i r e d   t y p e   a n d   a d d i n g   t o   t h e   p a r a m e t e r s   d i c t i o n a r y� ��� r     ��� m     ��  � o      �� 0 i  � ��� r    	��� n   ��� 1    �
� 
leng� o    �� 0 argumentslist argumentsList� o      �� 0 argcount argCount� ��� l  
 ���� r   
 ��� m   
 �
� boovfals� o      ��  0 mustbeoptional mustBeOptional� � � repeat loop will throw invalid argument definition error if an optional argument definition is followed by a required argument definition   � ���   r e p e a t   l o o p   w i l l   t h r o w   i n v a l i d   a r g u m e n t   d e f i n i t i o n   e r r o r   i f   a n   o p t i o n a l   a r g u m e n t   d e f i n i t i o n   i s   f o l l o w e d   b y   a   r e q u i r e d   a r g u m e n t   d e f i n i t i o n� ��� X   k���� k   f�� ��� r    #��� [    !��� o    �� 0 i  � m     �� � o      �� 0 i  � ��� r   $ <��� b   $ :��� l  $ )���� c   $ )��� n  $ '��� 1   % '�
� 
pcnt� o   $ %�� 0 argref argRef� m   ' (�
� 
reco�  �  � K   ) 9�� ���� 0 propertyname propertyName� m   * +�� ���  � �
���
 0 	valuetype 	valueType� m   , -�	
�	 
ctxt� ���� 0 islist isList� m   . /�
� boovfals� ���� 0 defaultvalue defaultValue� o   0 5�� 0 novalue NoValue� ���� $0 valueplaceholder valuePlaceholder� m   6 7�� ���  �  � o      �� (0 argumentdefinition argumentDefinition� ��� Z   = w����� >  = F��� n  = @��� o   > @� �  0 defaultvalue defaultValue� o   = >���� (0 argumentdefinition argumentDefinition� o   @ E���� 0 novalue NoValue� r   I L��� m   I J��
�� boovtrue� o      ����  0 mustbeoptional mustBeOptional� ��� F   O ^��� o   O P����  0 mustbeoptional mustBeOptional� =  S \��� n  S V��� o   T V���� 0 defaultvalue defaultValue� o   S T���� (0 argumentdefinition argumentDefinition� o   V [���� 0 novalue NoValue� ���� R   a s����
�� .ascrerr ****      � ****� m   o r�� ��� � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( a   n o n - o p t i o n a l   a r g u m e n t   c a n n o t   f o l l o w   a n   o p t i o n a l   a r g u m e n t ) .� ����
�� 
errn� m   e h�����Y� �����
�� 
erob� o   k l���� 0 argref argRef��  ��  �  � ��� Z  x �������� =  x ��� n  x {��� o   y {���� 0 propertyname propertyName� o   x y���� (0 argumentdefinition argumentDefinition� m   { ~�� ���  � R   � �����
�� .ascrerr ****      � ****� m   � ��� ��� � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   n o n - e m p t y   p r o p e r t y N a m e   p r o p e r t y ) .� ����
�� 
errn� m   � ������Y� �����
�� 
erob� o   � ����� 0 argref argRef��  ��  ��  � ��� Z   ������� =   � ���� o   � ����� 0 argumentslist argumentsList� J   � �����  � k   � ��� ��� r   � ���� n  � ���� o   � ����� 0 defaultvalue defaultValue� o   � ����� (0 argumentdefinition argumentDefinition� o      ���� 0 thevalue theValue�  ��  Z   � ����� =  � � o   � ����� 0 thevalue theValue o   � ����� 0 novalue NoValue l  � � k   � � 	
	 r   � � n  � � o   � ����� $0 valueplaceholder valuePlaceholder o   � ����� (0 argumentdefinition argumentDefinition o      ���� "0 placeholdertext placeholderText
  Z  � ����� =   � � n  � � 1   � ���
�� 
leng o   � ����� "0 placeholdertext placeholderText m   � �����   r   � � I   � ������� 40 _defaultvalueplaceholder _defaultValuePlaceholder �� o   � ����� (0 argumentdefinition argumentDefinition��  ��   o      ���� "0 placeholdertext placeholderText��  ��   �� R   � ���
�� .ascrerr ****      � **** b   � � b   � � !  b   � �"#" b   � �$%$ m   � �&& �''  M i s s i n g  % I   � ���(����  0 _ordinalnumber _ordinalNumber( )��) o   � ����� 0 i  ��  ��  # m   � �** �++ :   r e q u i r e d   a r g u m e n t   ( e x p e c t e d  ! o   � ����� "0 placeholdertext placeholderText m   � �,, �--  ) . ��.��
�� 
errn. o   � �����  0 _argvusererror _ArgvUserError��  ��   W Q record doesn't have a defaultValue property, so user should've supplied argument    �// �   r e c o r d   d o e s n ' t   h a v e   a   d e f a u l t V a l u e   p r o p e r t y ,   s o   u s e r   s h o u l d ' v e   s u p p l i e d   a r g u m e n t��  ��  ��  ��  � k   �00 121 r   � �343 I   � ���5���� 0 _unpackvalue _unpackValue5 676 n   � �898 4  � ���:
�� 
cobj: m   � ����� 9 o   � ����� 0 argumentslist argumentsList7 ;��; o   � ����� (0 argumentdefinition argumentDefinition��  ��  4 o      ���� 0 thevalue theValue2 <��< r   �=>= n   �?@? 1   ���
�� 
rest@ o   � ����� 0 argumentslist argumentsList> o      ���� 0 argumentslist argumentsList��  � ABA Z  \CD����C n 
EFE o  	���� 0 islist isListF o  ���� (0 argumentdefinition argumentDefinitionD k  XGG HIH Z +JK����J A  LML o  ���� 0 i  M n  NON 1  ��
�� 
lengO o  ���� *0 argumentdefinitions argumentDefinitionsK R  '��PQ
�� .ascrerr ****      � ****P m  #&RR �SS � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( o n l y   t h e   l a s t   a r g u m e n t   d e f i n i t i o n   m a y   c o n t a i n   a n    i s L i s t : t r u e    p r o p e r t y ) .Q ��TU
�� 
errnT m  �����YU ��V��
�� 
erobV o   ���� 0 argref argRef��  ��  ��  I WXW r  ,1YZY J  ,/[[ \��\ o  ,-���� 0 thevalue theValue��  Z o      ���� 0 thevalue theValueX ]^] X  2S_��`_ r  BNaba I  BK��c���� 0 _unpackvalue _unpackValuec ded n CFfgf 1  DF��
�� 
pcntg o  CD���� 0 aref aRefe h��h o  FG���� (0 argumentdefinition argumentDefinition��  ��  b n      iji  ;  LMj o  KL���� 0 thevalue theValue�� 0 aref aRef` o  56���� 0 argumentslist argumentsList^ k��k r  TXlml J  TV����  m o      ���� 0 argumentslist argumentsList��  ��  ��  B n��n l ]fo����o n ]fpqp I  ^f��r���� &0 setobject_forkey_ setObject_forKey_r sts o  ^_���� 0 thevalue theValuet u��u l _bv����v n _bwxw o  `b���� 0 propertyname propertyNamex o  _`���� (0 argumentdefinition argumentDefinition��  ��  ��  ��  q o  ]^���� (0 asocparametersdict asocParametersDict��  ��  ��  � 0 argref argRef� o    ���� *0 argumentdefinitions argumentDefinitions� y��y Z l�z{����z > lp|}| o  lm���� 0 argumentslist argumentsList} J  mo����  { R  s���~
�� .ascrerr ****      � ****~ b  }���� b  }���� b  }���� b  }���� m  }��� ��� : T o o   m a n y   a r g u m e n t s   ( e x p e c t e d  � n  ����� 1  ����
�� 
leng� o  ������ *0 argumentdefinitions argumentDefinitions� m  ���� ���    b u t   r e c e i v e d  � o  ������ 0 argcount argCount� m  ���� ���  ) . �����
�� 
errn� o  w|����  0 _argvusererror _ArgvUserError��  ��  ��  ��  � ��� l     �������  ��  �  � ��� l     �~�}�|�~  �}  �|  � ��� l     �{���{  �  -----   � ��� 
 - - - - -� ��� l     �z���z  � ) # format built-in help documentation   � ��� F   f o r m a t   b u i l t - i n   h e l p   d o c u m e n t a t i o n� ��� l     �y�x�w�y  �x  �w  � ��� i  � ���� I      �v��u�v  0 _formatoptions _formatOptions� ��� o      �t�t &0 optiondefinitions optionDefinitions� ��� o      �s�s 0 vtstyle vtStyle� ��r� o      �q�q &0 hasdefaultoptions hasDefaultOptions�r  �u  � k    �� ��� l     �p���p  � ] W generates OPTIONS section, along with options synopsis for inclusion in autogenerated    � ��� �   g e n e r a t e s   O P T I O N S   s e c t i o n ,   a l o n g   w i t h   o p t i o n s   s y n o p s i s   f o r   i n c l u s i o n   i n   a u t o g e n e r a t e d  � ��� Z    ���o�n� F     ��� =    ��� o     �m�m &0 optiondefinitions optionDefinitions� J    �l�l  � H    	�� o    �k�k &0 hasdefaultoptions hasDefaultOptions� L    �� J    �� ��� m    �� ���  � ��j� m    �� ���  �j  �o  �n  � ��� r    3��� J    �� ��� m    �� ���  � ��� m    �� ���  � ��i� m    �� ���  �i  � J      �� ��� o      �h�h  0 defaultoptions defaultOptions� ��� o      �g�g  0 booleanoptions booleanOptions� ��f� o      �e�e 0 otheroptions otherOptions�f  � ��� r   4 ?��� b   4 =��� b   4 9��� n  4 7��� o   5 7�d�d 0 b  � o   4 5�c�c 0 vtstyle vtStyle� m   7 8�� ���  O P T I O N S� n  9 <��� o   : <�b�b 0 n  � o   9 :�a�a 0 vtstyle vtStyle� o      �`�`  0 optionssection optionsSection� ��� X   @*��_�� k   P%�� ��� r   P ~��� b   P |��� l  P S��^�]� c   P S��� o   P Q�\�\ 0 	optionref 	optionRef� m   Q R�[
�[ 
reco�^  �]  � K   S {�� �Z���Z 0 	shortname 	shortName� m   T U�� ���  � �Y���Y 0 longname longName� m   V Y�� ���  � �X���X 0 	valuetype 	valueType� m   \ _�W
�W 
ctxt� �V �V 0 islist isList  m   b c�U
�U boovfals �T�T 0 defaultvalue defaultValue o   f k�S�S 0 novalue NoValue �R�R $0 valueplaceholder valuePlaceholder m   n q �   �Q�P�Q $0 valuedescription valueDescription m   t w		 �

  �P  � o      �O�O $0 optiondefinition optionDefinition�  Q    � k   � �  r   � � c   � � n  � � o   � ��N�N 0 	shortname 	shortName o   � ��M�M $0 optiondefinition optionDefinition m   � ��L
�L 
ctxt o      �K�K 0 	shortname 	shortName  r   � � c   � � n  � �  o   � ��J�J 0 longname longName  o   � ��I�I $0 optiondefinition optionDefinition m   � ��H
�H 
ctxt o      �G�G 0 longname longName !"! r   � �#$# c   � �%&% n  � �'(' o   � ��F�F 0 	valuetype 	valueType( o   � ��E�E $0 optiondefinition optionDefinition& m   � ��D
�D 
type$ o      �C�C 0 	valuetype 	valueType" )*) r   � �+,+ c   � �-.- n  � �/0/ o   � ��B�B 0 islist isList0 o   � ��A�A $0 optiondefinition optionDefinition. m   � ��@
�@ 
bool, o      �?�? 0 islist isList* 121 r   � �343 c   � �565 n  � �787 o   � ��>�> $0 valueplaceholder valuePlaceholder8 o   � ��=�= $0 optiondefinition optionDefinition6 m   � ��<
�< 
ctxt4 o      �;�; $0 valueplaceholder valuePlaceholder2 9�:9 r   � �:;: c   � �<=< n  � �>?> o   � ��9�9 $0 valuedescription valueDescription? o   � ��8�8 $0 optiondefinition optionDefinition= m   � ��7
�7 
ctxt; o      �6�6 $0 valuedescription valueDescription�:   R      �5�4@
�5 .ascrerr ****      � ****�4  @ �3A�2
�3 
errnA d      BB m      �1�1��2   n  � �CDC I   � ��0E�/�0 60 throwinvalidparametertype throwInvalidParameterTypeE FGF o   � ��.�. &0 optiondefinitions optionDefinitionsG HIH m   � �JJ �KK  o p t i o n sI LML m   � ��-
�- 
recoM N�,N m   � �OO �PP ` l i s t   o f    c o m m a n d   l i n e   o p t i o n   d e f i n i t i o n    r e c o r d s�,  �/  D o   � ��+�+ 0 _support   QRQ r   � �STS b   � �UVU b   � �WXW o   � ��*�*  0 optionssection optionsSectionX o   � ��)�) 
0 lf2 LF2V o   � ��(�( 0 indent1 Indent1T o      �'�'  0 optionssection optionsSectionR YZY Z   �I[\�&][ =  � �^_^ o   � ��%�% 0 	shortname 	shortName_ m   � �`` �aa  \ k   �#bb cdc Z  �ef�$�#e =  � �ghg o   � ��"�" 0 longname longNameh m   � �ii �jj  f R   ��!kl
�! .ascrerr ****      � ****k m  mm �nn � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a    s h o r t N a m e    a n d / o r    l o n g N a m e    p r o p e r t y ) .l � op
�  
errno m  ���Yp �q�
� 
erobq o  	
�� 0 	optionref 	optionRef�  �$  �#  d rsr r  tut o  �� 0 longname longNameu o      �� 0 
optionname 
optionNames v�v r  #wxw b  !yzy b  {|{ o  ��  0 optionssection optionsSection| m  }} �~~  - -z o   �� 0 longname longNamex o      ��  0 optionssection optionsSection�  �&  ] k  &I ��� r  &)��� o  &'�� 0 	shortname 	shortName� o      �� 0 
optionname 
optionName� ��� r  *3��� b  *1��� b  */��� o  *+��  0 optionssection optionsSection� m  +.�� ���  -� o  /0�� 0 	shortname 	shortName� o      ��  0 optionssection optionsSection� ��� Z 4I����� > 49��� o  45�� 0 longname longName� m  58�� ���  � r  <E��� b  <C��� b  <A��� o  <=��  0 optionssection optionsSection� m  =@�� ���  ,   - -� o  AB�� 0 longname longName� o      �
�
  0 optionssection optionsSection�  �  �  Z ��� Z  J���	�� = JM��� o  JK�� 0 	valuetype 	valueType� m  KL�
� 
bool� l PU���� r  PU��� b  PS��� o  PQ��  0 booleanoptions booleanOptions� o  QR�� 0 
optionname 
optionName� o      ��  0 booleanoptions booleanOptions� ) # group all boolean flags as "[-N�]"   � ��� F   g r o u p   a l l   b o o l e a n   f l a g s   a s   " [ - N & ] "�	  � k  X�� ��� r  Xg��� > Xc��� n X]��� o  Y]�� 0 defaultvalue defaultValue� o  XY�� $0 optiondefinition optionDefinition� o  ]b�� 0 novalue NoValue� o      � �  0 
isoptional 
isOptional� ��� r  ho��� b  hm��� o  hi���� 0 otheroptions otherOptions� 1  il��
�� 
spac� o      ���� 0 otheroptions otherOptions� ��� Z p�������� o  ps���� 0 
isoptional 
isOptional� r  v}��� b  v{��� o  vw���� 0 otheroptions otherOptions� m  wz�� ���  [� o      ���� 0 otheroptions otherOptions��  ��  � ��� r  ����� b  ����� b  ����� o  ������ 0 otheroptions otherOptions� m  ���� ���  -� o  ������ 0 
optionname 
optionName� o      ���� 0 otheroptions otherOptions� ��� r  ����� o  ������ $0 valueplaceholder valuePlaceholder� o      ���� $0 valueplaceholder valuePlaceholder� ��� Z ��������� = ����� o  ������ $0 valueplaceholder valuePlaceholder� m  ���� ���  � r  ����� I  ��������� 40 _defaultvalueplaceholder _defaultValuePlaceholder� ���� o  ������ $0 optiondefinition optionDefinition��  ��  � o      ���� $0 valueplaceholder valuePlaceholder��  ��  � ��� r  ����� b  ����� b  ����� n ����� o  ������ 0 u  � o  ������ 0 vtstyle vtStyle� o  ������ $0 valueplaceholder valuePlaceholder� n ����� o  ������ 0 n  � o  ������ 0 vtstyle vtStyle� o      ���� $0 valueplaceholder valuePlaceholder� ��� r  ����� b  ����� b  ����� o  ������ 0 otheroptions otherOptions� 1  ����
�� 
spac� o  ������ $0 valueplaceholder valuePlaceholder� o      ���� 0 otheroptions otherOptions� ��� Z ��������� o  ������ 0 
isoptional 
isOptional� r  ����� b  ����� o  ������ 0 otheroptions otherOptions� m  ���� ���  ]� o      ���� 0 otheroptions otherOptions��  ��  � ��� r  ��� � b  �� b  �� o  ������  0 optionssection optionsSection 1  ����
�� 
spac o  ������ $0 valueplaceholder valuePlaceholder  o      ����  0 optionssection optionsSection�  Z ������ > ��	
	 n �� o  ������ 0 defaultvalue defaultValue o  ������ $0 optiondefinition optionDefinition
 o  ������ 0 novalue NoValue r  �� b  �� o  ������ $0 valuedescription valueDescription I  �������� *0 _formatdefaultvalue _formatDefaultValue �� o  ������ $0 optiondefinition optionDefinition��  ��   o      ���� $0 valuedescription valueDescription��  ��   �� Z ����� o  ������ 0 islist isList r  � b  �� o  ������ $0 valuedescription valueDescription m  �� � N T h i s   o p t i o n   c a n   b e   u s e d   m u l t i p l e   t i m e s . o      ���� $0 valuedescription valueDescription��  ��  ��  � �� Z %���� >   o  ���� $0 valuedescription valueDescription  m  
!! �""   r  !#$# b  %&% b  '(' b  )*) b  +,+ o  ����  0 optionssection optionsSection, 1  ��
�� 
lnfd* o  ���� 0 indent2 Indent2( o  ���� $0 valuedescription valueDescription& 1  ��
�� 
spac$ o      ����  0 optionssection optionsSection��  ��  ��  �_ 0 	optionref 	optionRef� o   C D���� &0 optiondefinitions optionDefinitions� -.- l ++��/0��  / � document default -h and -v options as needed (these will appear at bottom of OPTIONS section, which isn't aesthetically ideal but is simplest to implement and avoids messing with the order of the option definitions specified by the shell script's author)   0 �11�   d o c u m e n t   d e f a u l t   - h   a n d   - v   o p t i o n s   a s   n e e d e d   ( t h e s e   w i l l   a p p e a r   a t   b o t t o m   o f   O P T I O N S   s e c t i o n ,   w h i c h   i s n ' t   a e s t h e t i c a l l y   i d e a l   b u t   i s   s i m p l e s t   t o   i m p l e m e n t   a n d   a v o i d s   m e s s i n g   w i t h   t h e   o r d e r   o f   t h e   o p t i o n   d e f i n i t i o n s   s p e c i f i e d   b y   t h e   s h e l l   s c r i p t ' s   a u t h o r ). 232 Z  +�45����4 o  +,���� &0 hasdefaultoptions hasDefaultOptions5 k  /�66 787 Z  /e9:����9 H  /5;; E  /4<=< o  /0����  0 booleanoptions booleanOptions= m  03>> �??  h: k  8a@@ ABA r  8?CDC b  8=EFE m  8;GG �HH  hF o  ;<����  0 defaultoptions defaultOptionsD o      ����  0 defaultoptions defaultOptionsB I��I r  @aJKJ b  @_LML b  @[NON b  @UPQP b  @QRSR b  @MTUT b  @GVWV o  @A����  0 optionssection optionsSectionW o  AF���� 
0 lf2 LF2U o  GL���� 0 indent1 Indent1S m  MPXX �YY  - h ,   - - h e l pQ 1  QT��
�� 
lnfdO o  UZ���� 0 indent2 Indent2M m  [^ZZ �[[ 2 P r i n t   t h i s   h e l p   a n d   e x i t .K o      ����  0 optionssection optionsSection��  ��  ��  8 \��\ Z  f�]^����] H  fl__ E  fk`a` o  fg����  0 booleanoptions booleanOptionsa m  gjbb �cc  v^ k  o�dd efe r  ovghg b  otiji o  op����  0 defaultoptions defaultOptionsj m  pskk �ll  vh o      ����  0 defaultoptions defaultOptionsf m��m r  w�non b  w�pqp b  w�rsr b  w�tut b  w�vwv b  w�xyx b  w~z{z o  wx����  0 optionssection optionsSection{ o  x}���� 
0 lf2 LF2y o  ~����� 0 indent1 Indent1w m  ��|| �}}  - v ,   - - v e r s i o nu 1  ����
�� 
lnfds o  ������ 0 indent2 Indent2q m  ��~~ � < P r i n t   v e r s i o n   n u m b e r   a n d   e x i t .o o      ����  0 optionssection optionsSection��  ��  ��  ��  ��  ��  3 ��� r  ����� m  ���� ���  � o      ���� "0 optionssynopsis optionsSynopsis� ��� Z ��������� > ����� o  ������  0 defaultoptions defaultOptions� m  ���� ���  � r  ����� b  ����� b  ����� b  ����� o  ������ "0 optionssynopsis optionsSynopsis� m  ���� ���    [ -� o  ������  0 defaultoptions defaultOptions� m  ���� ���  ]� o      ���� "0 optionssynopsis optionsSynopsis��  ��  � ��� Z ��������� > ����� o  ������  0 booleanoptions booleanOptions� m  ���� ���  � r  ����� b  ����� b  ����� b  ����� o  ������ "0 optionssynopsis optionsSynopsis� m  ���� ���    [ -� o  ������  0 booleanoptions booleanOptions� m  ���� ���  ]� o      ���� "0 optionssynopsis optionsSynopsis��  ��  � ��� Z ��������� > ����� o  ������ 0 otheroptions otherOptions� m  ���� ���  � r  ����� b  ����� o  ������ "0 optionssynopsis optionsSynopsis� o  ������ 0 otheroptions otherOptions� o      ���� "0 optionssynopsis optionsSynopsis��  ��  � ���� L  ��� J  ��� ��� o  ������ "0 optionssynopsis optionsSynopsis� ���� o  ������  0 optionssection optionsSection��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I      ������� $0 _formatarguments _formatArguments� ��� o      �� *0 argumentdefinitions argumentDefinitions� ��~� o      �}�} 0 vtstyle vtStyle�~  ��  � k    >�� ��� Z    ���|�{� =    ��� o     �z�z *0 argumentdefinitions argumentDefinitions� J    �y�y  � L    �� J    �� ��� m    �� ���  � ��x� m    	�� ���  �x  �|  �{  � ��� r    ��� m    �� ���  � o      �w�w &0 argumentssynopsis argumentsSynopsis� ��� r     ��� b    ��� b    ��� n   ��� o    �v�v 0 b  � o    �u�u 0 vtstyle vtStyle� m    �� ���  A R G U M E N T S� n   ��� o    �t�t 0 n  � o    �s�s 0 vtstyle vtStyle� o      �r�r $0 argumentssection argumentsSection� ��� X   !4��q�� k   1/�� ��� r   1 M��� b   1 K��� l  1 4��p�o� c   1 4��� o   1 2�n�n 0 argumentref argumentRef� m   2 3�m
�m 
reco�p  �o  � K   4 J�� �l� �l 0 	valuetype 	valueType� m   5 6�k
�k 
ctxt  �j�j 0 islist isList m   7 8�i
�i boovfals �h�h 0 defaultvalue defaultValue o   9 >�g�g 0 novalue NoValue �f�f $0 valueplaceholder valuePlaceholder m   ? @ �   �e	�d�e $0 valuedescription valueDescription	 m   C F

 �  �d  � o      �c�c (0 argumentdefinition argumentDefinition�  Q   N � k   Q v  r   Q Z c   Q X n  Q T o   R T�b�b 0 	valuetype 	valueType o   Q R�a�a (0 argumentdefinition argumentDefinition m   T W�`
�` 
type o      �_�_ 0 	valuetype 	valueType  r   [ d c   [ b n  [ ^ !  o   \ ^�^�^ 0 islist isList! o   [ \�]�] (0 argumentdefinition argumentDefinition m   ^ a�\
�\ 
bool o      �[�[ 0 islist isList "#" r   e l$%$ c   e j&'& n  e h()( o   f h�Z�Z $0 valueplaceholder valuePlaceholder) o   e f�Y�Y (0 argumentdefinition argumentDefinition' m   h i�X
�X 
ctxt% o      �W�W $0 valueplaceholder valuePlaceholder# *�V* r   m v+,+ c   m t-.- n  m r/0/ o   n r�U�U $0 valuedescription valueDescription0 o   m n�T�T (0 argumentdefinition argumentDefinition. m   r s�S
�S 
ctxt, o      �R�R $0 valuedescription valueDescription�V   R      �Q�P1
�Q .ascrerr ****      � ****�P  1 �O2�N
�O 
errn2 d      33 m      �M�M��N   n  ~ �454 I   � ��L6�K�L 60 throwinvalidparametertype throwInvalidParameterType6 787 o   � ��J�J *0 argumentdefinitions argumentDefinitions8 9:9 m   � �;; �<<  a r g u m e n t s: =>= m   � ��I
�I 
reco> ?�H? m   � �@@ �AA d l i s t   o f    c o m m a n d   l i n e   a r g u m e n t   d e f i n i t i o n    r e c o r d s�H  �K  5 o   ~ ��G�G 0 _support   BCB Z  � �DE�F�ED =  � �FGF o   � ��D�D $0 valueplaceholder valuePlaceholderG m   � �HH �II  E r   � �JKJ I   � ��CL�B�C 40 _defaultvalueplaceholder _defaultValuePlaceholderL M�AM o   � ��@�@ (0 argumentdefinition argumentDefinition�A  �B  K o      �?�? $0 valueplaceholder valuePlaceholder�F  �E  C NON Z  � �PQ�>�=P o   � ��<�< 0 islist isListQ r   � �RSR b   � �TUT o   � ��;�; $0 valueplaceholder valuePlaceholderU m   � �VV �WW    . . .S o      �:�: $0 valueplaceholder valuePlaceholder�>  �=  O XYX r   � �Z[Z b   � �\]\ b   � �^_^ b   � �`a` b   � �bcb b   � �ded o   � ��9�9 $0 argumentssection argumentsSectione o   � ��8�8 
0 lf2 LF2c o   � ��7�7 0 indent1 Indent1a n  � �fgf o   � ��6�6 0 u  g o   � ��5�5 0 vtstyle vtStyle_ o   � ��4�4 $0 valueplaceholder valuePlaceholder] n  � �hih o   � ��3�3 0 n  i o   � ��2�2 0 vtstyle vtStyle[ o      �1�1 $0 argumentssection argumentsSectionY jkj Z  � �lm�0�/l >  � �non n  � �pqp o   � ��.�. 0 defaultvalue defaultValueq o   � ��-�- (0 argumentdefinition argumentDefinitiono o   � ��,�, 0 novalue NoValuem r   � �rsr b   � �tut o   � ��+�+ $0 valuedescription valueDescriptionu I   � ��*v�)�* *0 _formatdefaultvalue _formatDefaultValuev w�(w o   � ��'�' (0 argumentdefinition argumentDefinition�(  �)  s o      �&�& $0 valuedescription valueDescription�0  �/  k xyx Z  �	z{�%�$z >  � �|}| o   � ��#�# $0 valuedescription valueDescription} m   � �~~ �  { r   ���� b   ���� b   ���� b   � ���� o   � ��"�" $0 argumentssection argumentsSection� 1   � ��!
�! 
lnfd� o   � � �  0 indent2 Indent2� o  �� $0 valuedescription valueDescription� o      �� $0 argumentssection argumentsSection�%  �$  y ��� Z 
%����� > 
��� n 
��� o  �� 0 defaultvalue defaultValue� o  
�� (0 argumentdefinition argumentDefinition� o  �� 0 novalue NoValue� r  !��� b  ��� b  ��� m  �� ���  [� o  �� $0 valueplaceholder valuePlaceholder� m  �� ���  ]� o      �� $0 valueplaceholder valuePlaceholder�  �  � ��� r  &/��� b  &-��� b  &+��� o  &'�� &0 argumentssynopsis argumentsSynopsis� 1  '*�
� 
spac� o  +,�� $0 valueplaceholder valuePlaceholder� o      �� &0 argumentssynopsis argumentsSynopsis�  �q 0 argumentref argumentRef� o   $ %�� *0 argumentdefinitions argumentDefinitions� ��� L  5>�� J  5=�� ��� b  5:��� m  58�� ��� 
   [ - - ]� o  89�� &0 argumentssynopsis argumentsSynopsis� ��� o  :;�� $0 argumentssection argumentsSection�  �  � ��� l     ���
�  �  �
  � ��� l     �	���	  �  -----   � ��� 
 - - - - -� ��� l     ����  �  �  � ��� i  � ���� I     ���
� .Fil:Argvnull���     ****� l 
    ���� o      �� 0 argv  �  �  � ���
� 
OpsD� |� �������   ��  � o      ���� &0 optiondefinitions optionDefinitions��  � l 
    ������ J      ����  ��  ��  � ����
�� 
OpsA� |����������  ��  � o      ���� *0 argumentdefinitions argumentDefinitions��  � l 
    ������ J      ����  ��  ��  � �����
�� 
DefO� |����������  ��  � o      ���� &0 hasdefaultoptions hasDefaultOptions��  � l     ������ m      ��
�� boovtrue��  ��  ��  � k     ��� ��� l     ������  ��� note: while NSUserDefaults provides some argument parsing support (see its NSArgumentDomain), it uses an atypical syntax and reads directly from argv, making it difficult both to omit arguments provided to osascript itself and to extract any arguments remaining after options are parsed; thus, this handler implements its own argv parser that avoids NSUserDefaults' deficiencies while also providing a better optparse-style UI/UX to both shell script authors and users   � ����   n o t e :   w h i l e   N S U s e r D e f a u l t s   p r o v i d e s   s o m e   a r g u m e n t   p a r s i n g   s u p p o r t   ( s e e   i t s   N S A r g u m e n t D o m a i n ) ,   i t   u s e s   a n   a t y p i c a l   s y n t a x   a n d   r e a d s   d i r e c t l y   f r o m   a r g v ,   m a k i n g   i t   d i f f i c u l t   b o t h   t o   o m i t   a r g u m e n t s   p r o v i d e d   t o   o s a s c r i p t   i t s e l f   a n d   t o   e x t r a c t   a n y   a r g u m e n t s   r e m a i n i n g   a f t e r   o p t i o n s   a r e   p a r s e d ;   t h u s ,   t h i s   h a n d l e r   i m p l e m e n t s   i t s   o w n   a r g v   p a r s e r   t h a t   a v o i d s   N S U s e r D e f a u l t s '   d e f i c i e n c i e s   w h i l e   a l s o   p r o v i d i n g   a   b e t t e r   o p t p a r s e - s t y l e   U I / U X   t o   b o t h   s h e l l   s c r i p t   a u t h o r s   a n d   u s e r s� ���� P     ����� k    ��� ��� r    
��� n   ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� o      ���� 0 oldtids oldTIDs� ���� Q    ����� k    j�� ��� l   ������  � ) # first, ensure parameters are lists   � ��� F   f i r s t ,   e n s u r e   p a r a m e t e r s   a r e   l i s t s� ��� r    ��� n   ��� I    ������� "0 aslistparameter asListParameter� ���� o    ���� 0 argv  ��  ��  � o    ���� 0 _support  � o      ���� 0 argv  � ��� r    '��� n   %��� I     %������� "0 aslistparameter asListParameter� ���� o     !���� &0 optiondefinitions optionDefinitions��  ��  � o     ���� 0 _support  � o      ���� &0 optiondefinitions optionDefinitions� ��� r   ( 4��� n  ( 2��� I   - 2������� "0 aslistparameter asListParameter� ���� o   - .���� *0 argumentdefinitions argumentDefinitions��  ��  � o   ( -���� 0 _support  � o      ���� *0 argumentdefinitions argumentDefinitions� ��� l  5 5������  � � � next iterate over the raw argument list, identifying option names and (if non-boolean) values, returning a NSMutableDictionary of parsed option values plus a list of any remaining (i.e. non-option) arguments   � �  �   n e x t   i t e r a t e   o v e r   t h e   r a w   a r g u m e n t   l i s t ,   i d e n t i f y i n g   o p t i o n   n a m e s   a n d   ( i f   n o n - b o o l e a n )   v a l u e s ,   r e t u r n i n g   a   N S M u t a b l e D i c t i o n a r y   o f   p a r s e d   o p t i o n   v a l u e s   p l u s   a   l i s t   o f   a n y   r e m a i n i n g   ( i . e .   n o n - o p t i o n )   a r g u m e n t s�  r   5 N I      ������ 0 _parseoptions _parseOptions  n   6 9	 2  7 9��
�� 
cobj	 o   6 7���� 0 argv   

 o   9 :���� &0 optiondefinitions optionDefinitions �� o   : ;���� &0 hasdefaultoptions hasDefaultOptions��  ��   J        o      ���� (0 asocparametersdict asocParametersDict �� o      ���� 0 argumentslist argumentsList��    l  O O����   v p add default values for any missing options to asocParametersDict, raising error if a required option is missing    � �   a d d   d e f a u l t   v a l u e s   f o r   a n y   m i s s i n g   o p t i o n s   t o   a s o c P a r a m e t e r s D i c t ,   r a i s i n g   e r r o r   i f   a   r e q u i r e d   o p t i o n   i s   m i s s i n g  I   O V������ (0 _adddefaultoptions _addDefaultOptions  o   P Q���� (0 asocparametersdict asocParametersDict �� o   Q R���� &0 optiondefinitions optionDefinitions��  ��    l  W W����   b \ parse the remaining arguments as named positional parameters, adding them to the dictionary    �   �   p a r s e   t h e   r e m a i n i n g   a r g u m e n t s   a s   n a m e d   p o s i t i o n a l   p a r a m e t e r s ,   a d d i n g   t h e m   t o   t h e   d i c t i o n a r y !"! I   W _��#���� "0 _parsearguments _parseArguments# $%$ o   X Y���� 0 argumentslist argumentsList% &'& o   Y Z���� *0 argumentdefinitions argumentDefinitions' (��( o   Z [���� (0 asocparametersdict asocParametersDict��  ��  " )*) r   ` e+,+ o   ` a���� 0 oldtids oldTIDs, n     -.- 1   b d��
�� 
txdl. 1   a b��
�� 
ascr* /��/ l  f j0120 L   f j33 c   f i454 o   f g���� (0 asocparametersdict asocParametersDict5 m   g h��
�� 
****1 : 4 coerce the dictionary to an AS record and return it   2 �66 h   c o e r c e   t h e   d i c t i o n a r y   t o   a n   A S   r e c o r d   a n d   r e t u r n   i t��  � R      ��78
�� .ascrerr ****      � ****7 o      ���� 0 etext eText8 ��9:
�� 
errn9 o      ���� 0 enumber eNumber: ��;<
�� 
erob; o      ���� 0 efrom eFrom< ��=��
�� 
errt= o      ���� 
0 eto eTo��  � k   r �>> ?@? r   r wABA o   r s���� 0 oldtids oldTIDsB n     CDC 1   t v��
�� 
txdlD 1   s t��
�� 
ascr@ E��E Z   x �FG��HF =   x IJI o   x y���� 0 enumber eNumberJ o   y ~����  0 _argvusererror _ArgvUserErrorG R   � ���KL
�� .ascrerr ****      � ****K o   � ����� 0 etext eTextL ��MN
�� 
errnM o   � ����� 0 enumber eNumberN ��OP
�� 
erobO o   � ����� 0 efrom eFromP ��Q��
�� 
errtQ o   � ����� 
0 eto eTo��  ��  H I   � ���R���� 
0 _error  R STS m   � �UU �VV 8 p a r s e   c o m m a n d   l i n e   a r g u m e n t sT WXW o   � ����� 0 etext eTextX YZY o   � ����� 0 enumber eNumberZ [\[ o   � ����� 0 efrom eFrom\ ]��] o   � ����� 
0 eto eTo��  ��  ��  ��  � ��^
�� conscase^ ��_
�� consdiac_ ��`
�� conshyph` ��a
�� conspunca ����
�� conswhit��  � ����
�� consnume��  ��  � bcb l     ��������  ��  ��  c ded l     ��������  ��  ��  e fgf i  � �hih I     ����j
�� .Fil:FHlpnull��� ��� null��  j ��kl
�� 
Namek |���m�~n��  �  m o      �}�} 0 commandname commandName�~  n l 
    o�|�{o l     p�z�yp m      qq �rr  �z  �y  �|  �{  l �xst
�x 
Summs |�w�vu�uv�w  �v  u o      �t�t $0 shortdescription shortDescription�u  v l 
    w�s�rw l     x�q�px m      yy �zz  �q  �p  �s  �r  t �o{|
�o 
Usag{ |�n�m}�l~�n  �m  } o      �k�k "0 commandsynopses commandSynopses�l  ~ l 
    �j�i J      �h�h  �j  �i  | �g��
�g 
OpsD� |�f�e��d��f  �e  � o      �c�c &0 optiondefinitions optionDefinitions�d  � l 
    ��b�a� J      �`�`  �b  �a  � �_��
�_ 
OpsA� |�^�]��\��^  �]  � o      �[�[ *0 argumentdefinitions argumentDefinitions�\  � l 
    ��Z�Y� J      �X�X  �Z  �Y  � �W��
�W 
Docu� |�V�U��T��V  �U  � o      �S�S "0 longdescription longDescription�T  � l 
    ��R�Q� l     ��P�O� m      �� ���  �P  �O  �R  �Q  � �N��
�N 
VFmt� |�M�L��K��M  �L  � o      �J�J 0 isstyled isStyled�K  � l 
    ��I�H� l     ��G�F� m      �E
�E boovtrue�G  �F  �I  �H  � �D��C
�D 
DefO� |�B�A��@��B  �A  � o      �?�? &0 hasdefaultoptions hasDefaultOptions�@  � l     ��>�=� m      �<
�< boovtrue�>  �=  �C  i P    ���� Q   ���� k   ��� ��� r    ��� n   ��� I    �;��:�; "0 astextparameter asTextParameter� ��� o    �9�9 0 commandname commandName� ��8� m    �� ���  n a m e�8  �:  � o    �7�7 0 _support  � o      �6�6 0 commandname commandName� ��� r    "��� n    ��� I     �5��4�5 "0 aslistparameter asListParameter� ��3� o    �2�2 &0 optiondefinitions optionDefinitions�3  �4  � o    �1�1 0 _support  � o      �0�0 &0 optiondefinitions optionDefinitions� ��� r   # /��� n  # -��� I   ( -�/��.�/ "0 aslistparameter asListParameter� ��-� o   ( )�,�, *0 argumentdefinitions argumentDefinitions�-  �.  � o   # (�+�+ 0 _support  � o      �*�* *0 argumentdefinitions argumentDefinitions� ��� r   0 <��� n  0 :��� I   5 :�)��(�) "0 aslistparameter asListParameter� ��'� o   5 6�&�& "0 commandsynopses commandSynopses�'  �(  � o   0 5�%�% 0 _support  � o      �$�$ "0 commandsynopses commandSynopses� ��� r   = J��� n  = H��� I   B H�#��"�# "0 astextparameter asTextParameter� ��� o   B C�!�! $0 shortdescription shortDescription� �� � m   C D�� ���  s u m m a r y�   �"  � o   = B�� 0 _support  � o      �� $0 shortdescription shortDescription� ��� r   K X��� n  K V��� I   P V���� "0 astextparameter asTextParameter� ��� o   P Q�� "0 longdescription longDescription� ��� m   Q R�� ���  d o c u m e n t a t i o n�  �  � o   K P�� 0 _support  � o      �� "0 longdescription longDescription� ��� Z   Y ������ n  Y d��� I   ^ d���� (0 asbooleanparameter asBooleanParameter� ��� o   ^ _�� 0 isstyled isStyled� ��� m   _ `�� ���  t e r m i n a l   s t y l e s�  �  � o   Y ^�� 0 _support  � l  g ����� r   g ���� K   g ~�� ���� 0 n  � I   h n���� 0 vt100 VT100� ��� m   i j��  �  �  � ���� 0 b  � I   o u���
� 0 vt100 VT100� ��	� m   p q�� �	  �
  � ���� 0 u  � I   v |���� 0 vt100 VT100� ��� m   w x�� �  �  �  � o      �� 0 vtstyle vtStyle�   normal, bold, underline   � ��� 0   n o r m a l ,   b o l d ,   u n d e r l i n e�  � r   � ���� K   � �   � �  0 n   m   � � �   ���� 0 b   m   � � �   ��	���� 0 u  	 m   � �

 �  ��  � o      ���� 0 vtstyle vtStyle�  l  � �����   %  construct NAME summary section    � >   c o n s t r u c t   N A M E   s u m m a r y   s e c t i o n  Z   � ����� =  � � o   � ����� 0 commandname commandName m   � � �   l  � � Q   � � r   � �  l  � �!����! I  � ���"��
�� .Fil:SplPnull���     ctxt" l  � �#����# n   � �$%$ o   � ����� 0 _  % l  � �&����& I  � �������
�� .Fil:EnVanull��� ��� null��  ��  ��  ��  ��  ��  ��  ��  ��    o      ���� 0 commandname commandName R      ������
�� .ascrerr ****      � ****��  ��   l  � �'()' r   � �*+* m   � �,, �--  C O M M A N D+ o      ���� 0 commandname commandName( T N fallback on the offchance the above should fail to get the script's file name   ) �.. �   f a l l b a c k   o n   t h e   o f f c h a n c e   t h e   a b o v e   s h o u l d   f a i l   t o   g e t   t h e   s c r i p t ' s   f i l e   n a m e B < use the AppleScript shell script's own file name by default    �// x   u s e   t h e   A p p l e S c r i p t   s h e l l   s c r i p t ' s   o w n   f i l e   n a m e   b y   d e f a u l t��  ��   010 r   � �232 b   � �454 b   � �676 b   � �898 b   � �:;: b   � �<=< n  � �>?> o   � ����� 0 b  ? o   � ����� 0 vtstyle vtStyle= m   � �@@ �AA  N A M E; n  � �BCB o   � ����� 0 n  C o   � ����� 0 vtstyle vtStyle9 o   � ����� 
0 lf2 LF27 o   � ����� 0 indent1 Indent15 o   � ����� 0 commandname commandName3 o      ���� 0 helptext helpText1 DED Z   � �FG����F >  � �HIH o   � ����� $0 shortdescription shortDescriptionI m   � �JJ �KK  G r   � �LML b   � �NON b   � �PQP o   � ����� 0 helptext helpTextQ m   � �RR �SS    - -  O o   � ����� $0 shortdescription shortDescriptionM o      ���� 0 helptext helpText��  ��  E TUT l  � ���VW��  V B < construct default SYNOPSIS, OPTIONS, and ARGUMENTS sections   W �XX x   c o n s t r u c t   d e f a u l t   S Y N O P S I S ,   O P T I O N S ,   a n d   A R G U M E N T S   s e c t i o n sU YZY r   �[\[ I      ��]����  0 _formatoptions _formatOptions] ^_^ o   � ����� &0 optiondefinitions optionDefinitions_ `a` o   � ����� 0 vtstyle vtStylea b��b o   � ����� &0 hasdefaultoptions hasDefaultOptions��  ��  \ J      cc ded o      ���� 00 defaultoptionssynopsis defaultOptionsSynopsise f��f o      ����  0 optionssection optionsSection��  Z ghg r  &iji I      ��k���� $0 _formatarguments _formatArgumentsk lml o  ���� *0 argumentdefinitions argumentDefinitionsm n��n o  ���� 0 vtstyle vtStyle��  ��  j J      oo pqp o      ���� 40 defaultargumentssynopsis defaultArgumentsSynopsisq r��r o      ���� $0 argumentssection argumentsSection��  h sts r  '<uvu b  ':wxw b  '6yzy b  '2{|{ b  '.}~} o  '(���� 0 helptext helpText~ o  (-���� 
0 lf2 LF2| n .1� o  /1���� 0 b  � o  ./���� 0 vtstyle vtStylez m  25�� ���  S Y N O P S I Sx n 69��� o  79���� 0 n  � o  67���� 0 vtstyle vtStylev o      ���� 0 helptext helpTextt ��� Z  =Q������� = =A��� o  =>���� "0 commandsynopses commandSynopses� J  >@����  � r  DM��� J  DK�� ���� b  DI��� b  DG��� o  DE���� 0 commandname commandName� o  EF���� 00 defaultoptionssynopsis defaultOptionsSynopsis� o  GH���� 40 defaultargumentssynopsis defaultArgumentsSynopsis��  � o      ���� "0 commandsynopses commandSynopses��  ��  � ��� Q  R����� X  U����� r  iz��� b  ix��� b  iv��� b  ip��� o  ij���� 0 helptext helpText� o  jo���� 
0 lf2 LF2� o  pu���� 0 indent1 Indent1� o  vw���� 0 textref textRef� o      ���� 0 helptext helpText�� 0 textref textRef� o  XY���� "0 commandsynopses commandSynopses� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � n ����� I  ��������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o  ������ "0 commandsynopses commandSynopses� ��� m  ���� ���  s y n o p s i s� ��� m  ����
�� 
list� ���� m  ���� ���  l i s t   o f   t e x t��  ��  � o  ������ 0 _support  � ��� Z ��������� > ����� o  ������  0 optionssection optionsSection� m  ���� ���  � r  ����� b  ����� b  ����� o  ������ 0 helptext helpText� o  ������ 
0 lf2 LF2� o  ������  0 optionssection optionsSection� o      ���� 0 helptext helpText��  ��  � ��� Z ��������� > ����� o  ������ $0 argumentssection argumentsSection� m  ���� ���  � r  ����� b  ����� b  ����� o  ������ 0 helptext helpText� o  ������ 
0 lf2 LF2� o  ������ $0 argumentssection argumentsSection� o      ���� 0 helptext helpText��  ��  � ��� l ��������  � - ' add long DESCRIPTION section, if given   � ��� N   a d d   l o n g   D E S C R I P T I O N   s e c t i o n ,   i f   g i v e n� ��� Z  ��������� > ����� o  ������ "0 longdescription longDescription� m  ���� ���  � r  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� o  ������ 0 helptext helpText� o  ������ 
0 lf2 LF2� n ����� o  ������ 0 b  � o  ���� 0 vtstyle vtStyle� m  ���� ���  D E S C R I P T I O N� n ����� o  ���� 0 n  � o  ���� 0 vtstyle vtStyle� o  ���� 
0 lf2 LF2� o  ���� "0 longdescription longDescription� o      �� 0 helptext helpText��  ��  � ��� L  ���� b  ����� o  ���� 0 helptext helpText� 1  ���
� 
lnfd�  � R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �~�~ 
0 eto eTo�  � I  �}��|�} 
0 _error  � ��� m  �� ��� 0 f o r m a t   c o m m a n d   l i n e   h e l p�    o  �{�{ 0 etext eText  o  �z�z 0 enumber eNumber  o  �y�y 0 efrom eFrom �x o  �w�w 
0 eto eTo�x  �|  � �v
�v conscase �u
�u consdiac �t	
�t conshyph	 �s

�s conspunc
 �r�q
�r conswhit�q  � �p�o
�p consnume�o  g  l     �n�m�l�n  �m  �l    l     �k�j�i�k  �j  �i    l     �h�g�f�h  �g  �f    i  � � I     �e�d�c
�e .Fil:CurFnull��� ��� null�d  �c   Q     : k    (  r     n    I   
 �b�a�`�b ,0 currentdirectorypath currentDirectoryPath�a  �`   n   
  I    
�_�^�]�_  0 defaultmanager defaultManager�^  �]    n   !"! o    �\�\ 0 nsfilemanager NSFileManager" m    �[
�[ misccura o      �Z�Z 0 asocpath asocPath #$# Z   !%&�Y�X% =   '(' o    �W�W 0 asocpath asocPath( m    �V
�V 
msng& R    �U)*
�U .ascrerr ****      � ****) m    ++ �,,  N o t   a v a i l a b l e .* �T-�S
�T 
errn- m    �R�R�@�S  �Y  �X  $ .�Q. L   " (// c   " '010 c   " %232 o   " #�P�P 0 asocpath asocPath3 m   # $�O
�O 
ctxt1 m   % &�N
�N 
psxf�Q   R      �M45
�M .ascrerr ****      � ****4 o      �L�L 0 etext eText5 �K67
�K 
errn6 o      �J�J 0 enumber eNumber7 �I89
�I 
erob8 o      �H�H 0 efrom eFrom9 �G:�F
�G 
errt: o      �E�E 
0 eto eTo�F   I   0 :�D;�C�D 
0 _error  ; <=< m   1 2>> �?? 2 c u r r e n t   w o r k i n g   d i r e c t o r y= @A@ o   2 3�B�B 0 etext eTextA BCB o   3 4�A�A 0 enumber eNumberC DED o   4 5�@�@ 0 efrom eFromE F�?F o   5 6�>�> 
0 eto eTo�?  �C   GHG l     �=�<�;�=  �<  �;  H IJI l     �:�9�8�:  �9  �8  J KLK i  � �MNM I     �7�6�5
�7 .Fil:EnVanull��� ��� null�6  �5  N L     OO c     PQP l    R�4�3R n    STS I    �2�1�0�2 0 environment  �1  �0  T n    UVU I    �/�.�-�/ 0 processinfo processInfo�.  �-  V n    WXW o    �,�, 0 nsprocessinfo NSProcessInfoX m     �+
�+ misccura�4  �3  Q m    �*
�* 
****L YZY l     �)�(�'�)  �(  �'  Z [\[ l     �&�%�$�&  �%  �$  \ ]^] i  � �_`_ I     �#�"a
�# .Fil:RSInnull��� ��� null�"  a �!bc
�! 
Prmtb |� �d�e�   �  d o      �� 0 
prompttext 
promptText�  e l     f��f m      gg �hh  > >  �  �  c �i�
� 
ReToi |��j�k�  �  j o      �� 0 isinteractive isInteractive�  k l     l��l m      �
� boovfals�  �  �  ` Q     �mnom k    �pp qrq r    sts n   
uvu I    
���� :0 filehandlewithstandardinput fileHandleWithStandardInput�  �  v n   wxw o    �� 0 nsfilehandle NSFileHandlex m    �
� misccurat o      �� 0 	asocstdin 	asocStdinr yzy Z    ={|�}{ o    �
�
 0 isinteractive isInteractive| k    3~~ � I   �	��
�	 .Fil:WSOunull���     ctxt� o    �� 0 
prompttext 
promptText� ���
� 
SLiB� m    �
� boovfals� ���
� 
ALiE�  � ��� r    "��� n    ��� I     ���� 0 availabledata availableData�  �  � o    � �  0 	asocstdin 	asocStdin� o      ���� 0 asocdata asocData� ���� Z  # 3������� =   # *��� n  # (��� I   $ (�������� 
0 length  ��  ��  � o   # $���� 0 asocdata asocData� m   ( )����  � L   - /�� m   - .��
�� 
msng��  ��  ��  �  } r   6 =��� n  6 ;��� I   7 ;�������� *0 readdatatoendoffile readDataToEndOfFile��  ��  � o   6 7���� 0 	asocstdin 	asocStdin� o      ���� 0 asocdata asocDataz ��� r   > O��� n  > M��� I   E M������� 00 initwithdata_encoding_ initWithData_encoding_� ��� o   E F���� 0 asocdata asocData� ���� l  F I������ n  F I��� o   G I���� ,0 nsutf8stringencoding NSUTF8StringEncoding� m   F G��
�� misccura��  ��  ��  ��  � n  > E��� I   A E�������� 	0 alloc  ��  ��  � n  > A��� o   ? A���� 0 nsstring NSString� m   > ?��
�� misccura� o      ���� 0 
asocstring 
asocString� ��� Z  P d������� =  P S��� o   P Q���� 0 
asocstring 
asocString� m   Q R��
�� 
msng� R   V `����
�� .ascrerr ****      � ****� m   \ _�� ��� > I n p u t   i s   n o t   U T F 8 - e n c o d e d   t e x t .� �����
�� 
errn� m   X [�����\��  ��  ��  � ��� Z  e �������� n  e m��� I   f m������� 0 
hassuffix_ 
hasSuffix_� ���� 1   f i��
�� 
lnfd��  ��  � o   e f���� 0 
asocstring 
asocString� r   p ~��� n  p |��� I   q |������� &0 substringtoindex_ substringToIndex_� ���� l  q x������ \   q x��� l  q v������ n  q v��� I   r v�������� 
0 length  ��  ��  � o   q r���� 0 
asocstring 
asocString��  ��  � m   v w���� ��  ��  ��  ��  � o   p q���� 0 
asocstring 
asocString� o      ���� 0 
asocstring 
asocString��  ��  � ���� L   � ��� c   � ���� o   � ����� 0 
asocstring 
asocString� m   � ���
�� 
ctxt��  n R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  o I   � ����� 
0 _error  � ��� m   � ��� ��� 0 r e a d   f r o m   s t a n d a r d   i n p u t� ��� o   � ��� 0 etext eText� ��� o   � ��� 0 enumber eNumber� ��� o   � ��� 0 efrom eFrom� ��� o   � ��� 
0 eto eTo�  �  ^ ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  � ���� I     ���
� .Fil:WSOunull���     ctxt� o      �� 0 thetext theText� ���
� 
SLiB� |������  �  � o      �� 0 uselinefeeds useLinefeeds�  � l     ���� m      �
� boovtrue�  �  � ���
� 
ALiE� |������  �  � o      ��  0 withlineending withLineEnding�  � l     ���� m      �
� boovtrue�  �  �  � Q     ����� k    �� ��� r    ��� n   ��� I    ���� &0 asnsmutablestring asNSMutableString� ��� n   ��� I    ���� "0 astextparameter asTextParameter�    o    �� 0 thetext theText � m     �  �  �  � o    �� 0 _support  �  �  � o    �� 0 _support  � o      �� 0 
asocstring 
asocString�  Z    I�� o    �� 0 uselinefeeds useLinefeeds k    E		 

 n   2 I    2��� l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_  l 
  "�� l   "�� b    " o     �
� 
ret  1     !�
� 
lnfd�  �  �  �    l  " #�� 1   " #�
� 
lnfd�  �    m   # $��   � K   $ . �� 0 location   m   % &�~�~   �}�|�} 
0 length   n  ' ,  I   ( ,�{�z�y�{ 
0 length  �z  �y    o   ' (�x�x 0 
asocstring 
asocString�|  �  �   o    �w�w 0 
asocstring 
asocString !�v! n  3 E"#" I   4 E�u$�t�u l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_$ %&% l 
 4 5'�s�r' l  4 5(�q�p( o   4 5�o
�o 
ret �q  �p  �s  �r  & )*) l  5 6+�n�m+ 1   5 6�l
�l 
lnfd�n  �m  * ,-, m   6 7�k�k  - .�j. K   7 A// �i01�i 0 location  0 m   8 9�h�h  1 �g2�f�g 
0 length  2 n  : ?343 I   ; ?�e�d�c�e 
0 length  �d  �c  4 o   : ;�b�b 0 
asocstring 
asocString�f  �j  �t  # o   3 4�a�a 0 
asocstring 
asocString�v  �  �   565 Z  J d78�`�_7 F   J W9:9 o   J K�^�^  0 withlineending withLineEnding: H   N U;; l  N T<�]�\< n  N T=>= I   O T�[?�Z�[ 0 
hassuffix_ 
hasSuffix_? @�Y@ 1   O P�X
�X 
lnfd�Y  �Z  > o   N O�W�W 0 
asocstring 
asocString�]  �\  8 n  Z `ABA I   [ `�VC�U�V 0 appendstring_ appendString_C D�TD 1   [ \�S
�S 
lnfd�T  �U  B o   Z [�R�R 0 
asocstring 
asocString�`  �_  6 EFE r   e nGHG n  e lIJI I   h l�Q�P�O�Q <0 filehandlewithstandardoutput fileHandleWithStandardOutput�P  �O  J n  e hKLK o   f h�N�N 0 nsfilehandle NSFileHandleL m   e f�M
�M misccuraH o      �L�L 0 
asocstdout 
asocStdoutF MNM n  o |OPO I   p |�KQ�J�K 0 
writedata_ 
writeData_Q R�IR l  p xS�H�GS n  p xTUT I   q x�FV�E�F (0 datausingencoding_ dataUsingEncoding_V W�DW l  q tX�C�BX n  q tYZY o   r t�A�A ,0 nsutf8stringencoding NSUTF8StringEncodingZ m   q r�@
�@ misccura�C  �B  �D  �E  U o   p q�?�? 0 
asocstring 
asocString�H  �G  �I  �J  P o   o p�>�> 0 
asocstdout 
asocStdoutN [�=[ L   } �<�<  �=  � R      �;\]
�; .ascrerr ****      � ****\ o      �:�: 0 etext eText] �9^_
�9 
errn^ o      �8�8 0 enumber eNumber_ �7`a
�7 
erob` o      �6�6 0 efrom eFroma �5b�4
�5 
errtb o      �3�3 
0 eto eTo�4  � I   � ��2c�1�2 
0 _error  c ded m   � �ff �gg 0 w r i t e   t o   s t a n d a r d   o u t p u te hih o   � ��0�0 0 etext eTexti jkj o   � ��/�/ 0 enumber eNumberk lml o   � ��.�. 0 efrom eFromm n�-n o   � ��,�, 
0 eto eTo�-  �1  � opo l     �+�*�)�+  �*  �)  p q�(q l     �'�&�%�'  �&  �%  �(       "�$rstuvwxyz{|�#}~�������������������$  r  �"�!� ����������������������
�	������
�" 
pimr�! 0 _support  �  
0 _error  � (0 _nsstringencodings _NSStringEncodings
� .Fil:Readnull���     file
� .Fil:Writnull���     file
� .Fil:ConPnull���     ****
� .Fil:NorPnull���     ctxt
� .Fil:JoiPnull���     ****
� .Fil:SplPnull���     ctxt�  0 _argvusererror _ArgvUserError� 0 novalue NoValue� 
0 lf2 LF2� 0 indent1 Indent1� 0 indent2 Indent2� 0 vt100 VT100� 0 _unpackvalue _unpackValue� 40 _defaultvalueplaceholder _defaultValuePlaceholder� *0 _formatdefaultvalue _formatDefaultValue� (0 _buildoptionstable _buildOptionsTable� 0 _parseoptions _parseOptions� (0 _adddefaultoptions _addDefaultOptions�  0 _ordinalnumber _ordinalNumber� "0 _parsearguments _parseArguments�
  0 _formatoptions _formatOptions�	 $0 _formatarguments _formatArguments
� .Fil:Argvnull���     ****
� .Fil:FHlpnull��� ��� null
� .Fil:CurFnull��� ��� null
� .Fil:EnVanull��� ��� null
� .Fil:RSInnull��� ��� null
� .Fil:WSOunull���     ctxts ��� �  ��� ��� 
� 
cobj� ��   �� 
�� 
frmk�   � �����
�� 
cobj� ��   ��
�� 
osax��  t ��   �� +
�� 
scptu �� 5���������� 
0 _error  �� ����� �  ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo��  � ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�  E������ �� &0 throwcommanderror throwCommandError�� b  ࠡ����+ v �� b  ��� (0 _nsstringencodings _NSStringEncodings�  ���� ������ 
0 _list_  �� 0 getencoding getEncoding� ����� �  ���������������������� ����� �  ����
�� FEncFE01�� � ����� �  ����
�� FEncFE02�� 
� ����� �  �� �
�� FEncFE03� ����� �  �� �
�� FEncFE04� ����� �  �� �
�� FEncFE05� ����� �  �� �
�� FEncFE06� ����� �  �� �
�� FEncFE07� ����� �  ����
�� FEncFE11�� � ����� �  ����
�� FEncFE12�� � ����� �  ����
�� FEncFE13�� � ����� �  ����
�� FEncFE14�� 	� ����� �  ����
�� FEncFE15�� � ����� �  ����
�� FEncFE16�� � ����� �  ����
�� FEncFE17�� � ����� �  ��
� FEncFE18� � ��� �  ��
� FEncFE19� � ��� �  ��
� FEncFE50� � ��� �  ��
� FEncFE51� � ��� �  ��
� FEncFE52� � ��� �  ��
� FEncFE53� � ��� �  ��
� FEncFE54� � ������� 0 getencoding getEncoding� ��� �  �� 0 textencoding textEncoding�  � ��� 0 textencoding textEncoding� 0 aref aRef� 
��������I�
� 
enum� 
0 _list_  
� 
kocl
� 
cobj
� .corecnte****       ****�  � ���
� 
errn��\�  
� 
long� >0 throwinvalidconstantparameter throwInvalidConstantParameter� X 5��&E�O ))�,[��l kh ��k/�  ��l/EY h[OY��W X   	��&W X  hOb  ��l+ 	w �Y�����
� .Fil:Readnull���     file� 0 thefile theFile� ���
� 
Type� {���� 0 datatype dataType�  
� 
ctxt� ���
� 
Enco� {���� 0 textencoding textEncoding�  
� FEncFE01�  � ������������� 0 thefile theFile� 0 datatype dataType� 0 textencoding textEncoding� 0 	posixpath 	posixPath� 0 
asocstring 
asocString� 0 theerror theError� 0 fh  � 0 	theresult 	theResult� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  s��~�}�|�{�z�y�x�w�v�u�t�s�r�q�p�o�n�m�l�k�j�i�h��g�f��e�d� ,0 asposixpathparameter asPOSIXPathParameter�~ "0 astypeparameter asTypeParameter
�} 
ctxt
�| FEncFEPE
�{ 
bool�z 0 getencoding getEncoding
�y misccura�x 0 nsstring NSString
�w 
obj �v T0 (stringwithcontentsoffile_encoding_error_ (stringWithContentsOfFile_encoding_error_
�u 
cobj
�t 
msng
�s 
errn�r 0 code  
�q 
erob
�p 
errt�o �n ,0 localizeddescription localizedDescription
�m 
psxf
�l .rdwropenshor       file
�k 
as  
�j .rdwrread****        ****
�i .rdwrclosnull���     ****�h 0 etext eText� �c�b�
�c 
errn�b 0 enumber eNumber� �a�`�
�a 
erob�` 0 efrom eFrom� �_�^�]
�_ 
errt�^ 
0 eto eTo�]  �g  �f  �e �d 
0 _error  � � �b  ��l+ E�Ob  ��l+ E�O�� 	 ���& Ub  �k+ E�O��,���m+ E[�k/E�Z[�l/E�ZO��  )�j+ a �a �a �j+ �&Y hO��&Y O�a &j E�O �a �l E�O�j O�W )X   
�j W X  hO)�a �a �a �W X  *a ����a + x �\�[�Z���Y
�\ .Fil:Writnull���     file�[ 0 thefile theFile�Z �X�W�
�X 
Data�W 0 thedata theData� �V��
�V 
Type� {�U�T�S�U 0 datatype dataType�T  
�S 
ctxt� �R��Q
�R 
Enco� {�P�O�N�P 0 textencoding textEncoding�O  
�N FEncFE01�Q  � �M�L�K�J�I�H�G�F�E�D�C�B�A�M 0 thefile theFile�L 0 thedata theData�K 0 datatype dataType�J 0 textencoding textEncoding�I 0 	posixpath 	posixPath�H 0 
asocstring 
asocString�G 0 
didsucceed 
didSucceed�F 0 theerror theError�E 0 fh  �D 0 etext eText�C 0 enumber eNumber�B 0 efrom eFrom�A 
0 eto eTo� '(�@4�?�>�=�<�;�:P�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#��"�!�� ��@ ,0 asposixpathparameter asPOSIXPathParameter�? "0 astypeparameter asTypeParameter
�> 
ctxt
�= FEncFEPE
�< 
bool
�; misccura�: 0 nsstring NSString�9 "0 astextparameter asTextParameter�8 &0 stringwithstring_ stringWithString_�7 0 getencoding getEncoding
�6 
obj �5 �4 P0 &writetofile_atomically_encoding_error_ &writeToFile_atomically_encoding_error_
�3 
cobj
�2 
errn�1 0 code  
�0 
erob
�/ 
errt�. �- ,0 localizeddescription localizedDescription
�, 
psxf
�+ 
perm
�* .rdwropenshor       file
�) 
set2
�( .rdwrseofnull���     ****
�' 
refn
�& 
as  
�% .rdwrwritnull���     ****
�$ .rdwrclosnull���     ****�# 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  �"  �!  �  � 
0 _error  �Y
 �b  ��l+ E�Ob  ��l+ E�O�� 	 ���& i��,b  ��l+ 
k+ E�Ob  �k+ E�O��e���+ E[a k/E�Z[a l/E�ZO� !)a �j+ a �a �a �j+ �&Y hY a�a &a el E�O %�a jl O�a �a �� O�j OhW +X   ! 
�j W X " #hO)a �a �a �a �W X   !*a $����a %+ &y �������
� .Fil:ConPnull���     ****� 0 filepath filePath� ���
� 
From� {���� 0 
fromformat 
fromFormat�  
� FLCTFLCP� ���
� 
To__� {���� 0 toformat toFormat�  
� FLCTFLCP�  � 	�
�	��������
 0 filepath filePath�	 0 
fromformat 
fromFormat� 0 toformat toFormat� 0 	posixpath 	posixPath� 0 asocurl asocURL� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� )�� ��������������������������JO����W����ns���������������������������
� 
kocl
�  
ctxt
�� .corecnte****       ****�� ,0 asposixpathparameter asPOSIXPathParameter
�� FLCTFLCP
�� FLCTFLCH
�� 
file
�� 
psxp
�� FLCTFLCU
�� misccura�� 	0 NSURL  ��  0 urlwithstring_ URLWithString_
�� 
msng�� 0 fileurl fileURL
�� 
bool�� �� .0 throwinvalidparameter throwInvalidParameter�� >0 throwinvalidconstantparameter throwInvalidConstantParameter
�� 
leng
�� FLCTFLCA
�� 
psxf
�� 
alis
�� FLCTFLCX
�� FLCTFLCS
�� 
ascr�� $0 fileurlwithpath_ fileURLWithPath_��  0 absolutestring absoluteString�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �cN�kv��l j  b  ��l+ E�Y h��  �E�Y \��  *�/�,E�Y K��  8��,�k+ E�O�� 
 
�j+ �& b  �a �a a + Y hY b  �a l+ O�a ,j  b  �a �a a + Y hO��  �Y ��a   �a &a &Y ��a   �a &Y s�a   _ �a &�&/Y Z��  �a &�&Y I��  6��,�k+ E�O��  b  �a  *�a !/m+ Y hO�j+ "�&Y b  �a #l+ W X $ %*a &����a '+ (z ��
��������
�� .Fil:NorPnull���     ctxt�� 0 filepath filePath�� �����
�� 
ExpR� {�������� 0 isexpanding isExpanding��  
�� boovfals��  � ������������ 0 filepath filePath�� 0 isexpanding isExpanding�� 0 etext eText�� 0 enumber eNumber�� 
0 eto eTo� ��*�������������������I������ ,0 asposixpathparameter asPOSIXPathParameter
�� 
bool
�� .Fil:CurFnull��� ��� null
�� .Fil:JoiPnull���     ****
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� 60 stringbystandardizingpath stringByStandardizingPath
�� 
ctxt�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� ����
�� 
errt� 
0 eto eTo�  �� �� 
0 _error  �� S Bb  ��l+ E�O�	 ���& *j �lvj E�Y hO��,�k+ j+ 	�&W X  *������+ { �Y�����
� .Fil:JoiPnull���     ****�  0 pathcomponents pathComponents� ���
� 
Exte� {��`� 0 fileextension fileExtension�  �  � 	����������  0 pathcomponents pathComponents� 0 fileextension fileExtension� 0 subpaths subPaths� 0 aref aRef� 0 asocpath asocPath� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� r������������������������������� "0 aslistparameter asListParameter
� 
cobj
� 
kocl
� .corecnte****       ****
� 
pcnt� ,0 asposixpathparameter asPOSIXPathParameter�  �  
� 
list� � .0 throwinvalidparameter throwInvalidParameter
� misccura� 0 nsstring NSString� *0 pathwithcomponents_ pathWithComponents_� "0 astextparameter asTextParameter
� 
leng� B0 stringbyappendingpathextension_ stringByAppendingPathExtension_
� 
msng
� 
ctxt� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � � �b  ��l+ �-E�O ;�jv  	)jhY hO %�[��l kh b  ��,�l+ ��,F[OY��W X  	b  �����+ O�a ,�k+ E�Ob  �a l+ E�O�a ,j -��k+ E�O�a   b  �a a a �+ Y hY hO�a &W X  *a ����a + | �������
� .Fil:SplPnull���     ctxt� 0 filepath filePath� ���
� 
Upon� {���� 0 splitposition splitPosition�  
� FLSPFLSL�  � ��������� 0 filepath filePath� 0 splitposition splitPosition� 0 asocpath asocPath� 0 matchformat matchFormat� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� �~�}�|�{�z�y�x�w�v�u�t�s�r�qR�p�o�^�n�m
�~ misccura�} 0 nsstring NSString�| ,0 asposixpathparameter asPOSIXPathParameter�{ &0 stringwithstring_ stringWithString_
�z FLSPFLSL�y F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent
�x 
ctxt�w &0 lastpathcomponent lastPathComponent
�v FLSPFLSE�u >0 stringbydeletingpathextension stringByDeletingPathExtension�t 0 pathextension pathExtension
�s FLSPFLSA�r  0 pathcomponents pathComponents
�q 
list�p >0 throwinvalidconstantparameter throwInvalidConstantParameter�o 0 etext eText� �l�k�
�l 
errn�k 0 enumber eNumber� �j�i�
�j 
erob�i 0 efrom eFrom� �h�g�f
�h 
errt�g 
0 eto eTo�f  �n �m 
0 _error  �  j��,b  ��l+ k+ E�O��  �j+ �&�j+ �&lvY 8��  �j+ 
�&�j+ �&lvY ��  �j+ �&Y b  ��l+ W X  *a ����a + �#'} �e�  ��e 0 novalue NoValue�  ��  ~ ���  
 
 �d��c�b���a�d 0 vt100 VT100�c �`��` �  �_�_ 0 
formatcode 
formatCode�b  � �^�^ 0 
formatcode 
formatCode� �]�\�[��
�] 
cha �\ 
�[ kfrmID  �a )���0�%�%�%� �Z��Y�X���W�Z 0 _unpackvalue _unpackValue�Y �V �V    �U�T�U 0 thevalue theValue�T $0 definitionrecord definitionRecord�X  � �S�R�Q�P�O�N�M�S 0 thevalue theValue�R $0 definitionrecord definitionRecord�Q 0 	valuetype 	valueType�P 0 	theresult 	theResult�O 0 asocformatter asocFormatter�N 0 
asocresult 
asocResult�M 0 basepath basePath� 9�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;'�:B�9�8�7�6�5k�4�3�2��1�0�/�.�-��,�������+������*�)�(�'�L 0 	valuetype 	valueType
�K 
type
�J 
ctxt
�I 
long
�H 
doub
�G 
nmbr
�F misccura�E &0 nsnumberformatter NSNumberFormatter�D 	0 alloc  �C 0 init  �B D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle�A "0 setnumberstyle_ setNumberStyle_�@ 0 nslocale NSLocale�? 0 systemlocale systemLocale�> 0 
setlocale_ 
setLocale_�= &0 numberfromstring_ numberFromString_
�< 
msng
�; 
errn
�: 
****
�9 
furl
�8 
alis
�7 
file
�6 
psxf�5 �4 0 nsfilemanager NSFileManager�3  0 defaultmanager defaultManager�2 ,0 currentdirectorypath currentDirectoryPath�1 0 nsstring NSString�0 *0 pathwithcomponents_ pathWithComponents_�/ &0 stringwithstring_ stringWithString_�. 60 stringbystandardizingpath stringByStandardizingPath�-   �&�%�$
�& 
errn�%���$  
�, 
bool�+ �*�Y
�) 
erob
�( 
errt�' �Wȡ�,�&E�O��  �E�Y����mv�kv ���,j+ j+ 	E�O���,k+ O���,j+ k+ O��k+ E�O�a   )a b  
la �%Y hO�a &E�O��  '�k#j )a b  
la �%Y hO��&E�Y hY%a a a a a v�kv ��a  A�a ,j+ j+ E�O�a   )a b  
la �%Y hO�a ,��lvk+  E�Y hO�a ,�k+ !j+ "�&a &E�O �a   �a &E�Y hW X # $)a b  
la %�%Y |�a &  [ga ' Qa (a )a *a +a ,a -v�kv eY 1a .a /a 0a 1a 2a -v�kv fY )a b  
la 3�%VY )a a 4a 5��,a 6�a 7a 8O�� �#!�"�!� �# 40 _defaultvalueplaceholder _defaultValuePlaceholder�" ��   �� $0 definitionrecord definitionRecord�!   ��� $0 definitionrecord definitionRecord� 0 	valuetype 	valueType ���=���SV�����i�q�����u� 0 	valuetype 	valueType
� 
type
� 
ctxt
� 
long
� 
doub
� 
nmbr
� 
furl
� 
alis
� 
file
� 
psxf� 
� 
bool
� 
errn��Y
� 
erob
� 
errt� �  h��,�&E�O��  �Y V���mv�kv ��  �Y �Y :�����v�kv �Y (��  	a Y )a a a ��,a �a a � �
��	���
 *0 _formatdefaultvalue _formatDefaultValue�	 ��   �� $0 definitionrecord definitionRecord�   ����� $0 definitionrecord definitionRecord� 0 defaultvalue defaultValue� 0 defaulttext defaultText� 0 asocformatter asocFormatter � ����������������������������������������������&)13�  0 defaultvalue defaultValue
�� 
kocl
�� 
list
�� .corecnte****       ****
�� 
leng
�� 
bool
�� 
cobj
�� 
ctxt
�� 
long
�� 
doub
�� misccura�� &0 nsnumberformatter NSNumberFormatter�� 	0 alloc  �� 0 init  �� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle�� "0 setnumberstyle_ setNumberStyle_�� 0 nslocale NSLocale�� 0 systemlocale systemLocale�� 0 
setlocale_ 
setLocale_�� &0 stringfromnumber_ stringFromNumber_
�� 
****
�� 
furl
�� 
alis
�� 
psxp� ��,E�O�kv��l j	 	��,k �& ��k/E�Y hO�kv��l j �E�Y ��kv��l j
 �kv��l j�& 7��,j+ j+ E�O���,k+ O��a ,j+ k+ O��k+ a &E�Y N�kv�a l j
 �kv�a l j�& �a ,E�Y "�e  
a E�Y �f  
a E�Y a Oa �%a %� ��G����	���� (0 _buildoptionstable _buildOptionsTable�� ��
�� 
  ���� &0 optiondefinitions optionDefinitions��   ������������������������ &0 optiondefinitions optionDefinitions�� 0 
foundnames 
foundNames�� 20 optiondefinitionsbyname optionDefinitionsByName�� 0 	optionref 	optionRef�� $0 optiondefinition optionDefinition�� 0 propertyname propertyName�� 0 	namecount 	nameCount�� 0 aref aRef�� 0 thename theName�� 0 
nameprefix 
namePrefix�� 0 charref charRef	 .������������������r��v��z��������������������������	W	`����	��		�	&	*	7	=�	k
�� misccura�� *0 nsmutabledictionary NSMutableDictionary�� 0 
dictionary  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
reco�� 0 	shortname 	shortName�� 0 longname longName�� 0 propertyname propertyName�� 0 	valuetype 	valueType
�� 
ctxt�� 0 islist isList�� 0 defaultvalue defaultValue�� 
�� 
errn���\��   ���
� 
errn��\�  ���Y
�� 
erob�� 
�� 
leng
�� 
bool
� 
cha � &0 setobject_forkey_ setObject_forKey_���jvE�O��,j+ E�O�[��l kh ��,�&��������a fa fa %E�O %��,�&E�O��,a   )a a lhY hW X  )a a a �a a O�a ,E�OJ��,a lv��,a lvlv[��l kh �E[�k/E�Z[�l/E�ZO 
��&E�W X  )a a a �a a O�a   ꡨkv )a a a �a a !Y hO��6FOga " ��a ,k  2�a ,k
 a #�a $& )a a a �a a %Y hY w�a ,j 
 a &�a 'k/a $&
 �a (a $& )a a a �a a )Y hO 5�[��l kh 
a *��, )a a a �a a +Y h[OY��VO����%l+ ,Y h[OY��O�a ,�  )a a a �a a -Y h[OY�+O�� �	y���� 0 _parseoptions _parseOptions� ��   ���� 0 rawarguments rawArguments� &0 optiondefinitions optionDefinitions� &0 hasdefaultoptions hasDefaultOptions�   �������������� 0 rawarguments rawArguments� &0 optiondefinitions optionDefinitions� &0 hasdefaultoptions hasDefaultOptions� 20 optiondefinitionsbyname optionDefinitionsByName� (0 asocparametersdict asocParametersDict� 0 thearg theArg� 0 
optionname 
optionName� $0 optiondefinition optionDefinition� 0 ishelp isHelp� 0 	isversion 	isVersion� 0 propertyname propertyName� 0 thevalue theValue� 0 thelist theList 4����	����	�	������
	

�������
b
�
�
�
��
��
��
���������������"����������o��� (0 _buildoptionstable _buildOptionsTable
� misccura� *0 nsmutabledictionary NSMutableDictionary� 0 
dictionary  
� 
ascr
� 
txdl
� 
cobj
� 
rest
� 
citm
� 
kocl
� .corecnte****       ****
� 
ctxt
� 
cha 
� 
bool
� 
leng� 0 objectforkey_ objectForKey_
� 
msng
� 
****� 0 	valuetype 	valueType� $0 removeallobjects removeAllObjects� $0 setvalue_forkey_ setValue_forKey_
� 
errn�� 0 propertyname propertyName�� 0 defaultvalue defaultValue��  ��  ���\
�� 
erob�� �� 0 _unpackvalue _unpackValue�� 0 islist isList��  0 nsmutablearray NSMutableArray�� $0 arraywithobject_ arrayWithObject_�� 0 
addobject_ 
addObject_�� &0 setobject_forkey_ setObject_forKey_�o*�k+  E�O��,j+ E�O���,FONh�jv ��k/E�O�� C��  ��,E�OY hO��k/E�O���l k �[�\[�l/\Zi2��k/FY ��,E�Y ��� ��a  
 a �a l/a & Y hO�[�\[Zk\Zl2E�O�a ,l L�[�\[Zm\Zi2��k/FO��k+ E�O�a 	 �a &a ,a  a & a ��k/%��k/FY hY ��,E�Y O��k+ E�O�a   x� _a a lv�kva a lv�kvlvE[�k/E�Z[�l/E�ZO�
 �a & %�j+ O��a l+  O��a !l+  OjvE�OY hY hO)a "b  
la #�%Y hO�a &E�O�a $,E�O�a ,a   1 �a %,E�W  X & ')a "a (a )�a %,a *a +�%Y 0�jv  )a "b  
la ,�%Y hO*��k/�l+ -E�O��,E�O�a .,E /��k+ E�O�a   �a /,�k+ 0E�Y ��k+ 1O�E�Y #��k+ a  )a "b  
la 2�%Y hO���l+ 3[OY��O��lv� ���������� (0 _adddefaultoptions _addDefaultOptions�� �~�~   �}�|�} (0 asocparametersdict asocParametersDict�| &0 optiondefinitions optionDefinitions��   �{�z�y�x�w�v�u�t�{ (0 asocparametersdict asocParametersDict�z &0 optiondefinitions optionDefinitions�y 0 recref recRef�x 0 rec  �w 0 propertyname propertyName�v 0 thevalue theValue�u 0 
optionname 
optionName�t "0 propertynameref propertyNameRef �s�r�q�p�o��n��m�l��k�j����i�h��g�f�e�d+.�c
�s 
kocl
�r 
cobj
�q .corecnte****       ****
�p 
reco�o 0 propertyname propertyName�n 0 longname longName�m 0 defaultvalue defaultValue�l �k 0 objectforkey_ objectForKey_
�j 
msng�i 0 	shortname 	shortName
�h 
errn
�g misccura�f 0 nsnull NSNull�e 0 null  �d &0 setobject_forkey_ setObject_forKey_
�c 
pcnt� � ��[��l kh ��&�����b  �%E�O��,E�O��  
��,E�Y hO��k+ �  e��,E�O�b    1���,%E�O��  �a ,%E�Y hO)a b  
la �%Y hO��  a a ,j+ E�Y hO���l+ Y h[OY�bO 9a a lv[��l kh ��a ,k+ �  �f�a ,l+ Y h[OY��� �b;�a�`�_�b  0 _ordinalnumber _ordinalNumber�a �^�^   �]�] 0 n  �`   �\�\ 0 n   �[�Z�Y�X�W�V�Ukor�Tz�[ 
�Z �Y �X �W d
�V 
bool
�U 
ctxt
�T 
cobj�_ 8klmmv��#kv	 ���mv��#kv�& ��&���mv��#/%Y ��&�%� �S��R�Q�P�S "0 _parsearguments _parseArguments�R �O�O   �N�M�L�N 0 argumentslist argumentsList�M *0 argumentdefinitions argumentDefinitions�L (0 asocparametersdict asocParametersDict�Q   �K�J�I�H�G�F�E�D�C�B�A�K 0 argumentslist argumentsList�J *0 argumentdefinitions argumentDefinitions�I (0 asocparametersdict asocParametersDict�H 0 i  �G 0 argcount argCount�F  0 mustbeoptional mustBeOptional�E 0 argref argRef�D (0 argumentdefinition argumentDefinition�C 0 thevalue theValue�B "0 placeholdertext placeholderText�A 0 aref aRef #�@�?�>�=�<�;�:��9�8�7�6�5��4�3�2�1�0�/����.&�-*,�,�+R�*���
�@ 
leng
�? 
kocl
�> 
cobj
�= .corecnte****       ****
�< 
pcnt
�; 
reco�: 0 propertyname propertyName�9 0 	valuetype 	valueType
�8 
ctxt�7 0 islist isList�6 0 defaultvalue defaultValue�5 $0 valueplaceholder valuePlaceholder�4 

�3 
bool
�2 
errn�1�Y
�0 
erob�/ �. 40 _defaultvalueplaceholder _defaultValuePlaceholder�-  0 _ordinalnumber _ordinalNumber�, 0 _unpackvalue _unpackValue
�+ 
rest�* &0 setobject_forkey_ setObject_forKey_�P�jE�O��,E�OfE�O\�[��l kh �kE�O��,�&�����f�b  ���%E�O��,b   eE�Y *�	 ��,b   �& )a a a �a a Y hO��,a   )a a a �a a Y hO�jv  S��,E�O�b    ?��,E�O��,j  *�k+ E�Y hO)a b  
la *�k+ %a %�%a %Y hY *��k/�l+ E�O�a ,E�O��,E P���, )a a a �a a Y hO�kvE�O  �[��l kh 
*��,�l+ �6F[OY��OjvE�Y hO����,l+ [OY��O�jv !)a b  
la  ��,%a !%�%a "%Y h� �)��(�'�&�)  0 _formatoptions _formatOptions�( �%�%   �$�#�"�$ &0 optiondefinitions optionDefinitions�# 0 vtstyle vtStyle�" &0 hasdefaultoptions hasDefaultOptions�'   �!� �����������������! &0 optiondefinitions optionDefinitions�  0 vtstyle vtStyle� &0 hasdefaultoptions hasDefaultOptions�  0 defaultoptions defaultOptions�  0 booleanoptions booleanOptions� 0 otheroptions otherOptions�  0 optionssection optionsSection� 0 	optionref 	optionRef� $0 optiondefinition optionDefinition� 0 	shortname 	shortName� 0 longname longName� 0 	valuetype 	valueType� 0 islist isList� $0 valueplaceholder valuePlaceholder� $0 valuedescription valueDescription� 0 
optionname 
optionName� 0 
isoptional 
isOptional� "0 optionssynopsis optionsSynopsis F������������
�	����������	� ����JO����`i������m}���������������!��>GXZbk|~��������
� 
bool
� 
cobj� 0 b  � 0 n  
� 
kocl
�
 .corecnte****       ****
�	 
reco� 0 	shortname 	shortName� 0 longname longName� 0 	valuetype 	valueType
� 
ctxt� 0 islist isList� 0 defaultvalue defaultValue� $0 valueplaceholder valuePlaceholder� $0 valuedescription valueDescription�  
�� 
type��   ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType
�� 
errn���Y
�� 
erob
�� 
spac�� 40 _defaultvalueplaceholder _defaultValuePlaceholder�� 0 u  �� *0 _formatdefaultvalue _formatDefaultValue
�� 
lnfd�&�jv 	 ��& 
��lvY hO���mvE[�k/E�Z[�l/E�Z[�m/E�ZO��,�%��,%E�O�[��l kh ��&���a a a a fa b  a a a a a %E�O F��,a &E�O��,a &E�O�a ,a &E�O�a ,�&E�O�a ,a &E�O�a ,a &E�W X  b  �a �a a +  O�b  %b  %E�O�a !  1�a "  )a #a $a %�a a &Y hO�E�O�a '%�%E�Y %�E�O�a (%�%E�O�a ) �a *%�%E�Y hO��  
��%E�Y ��a ,b  E^ O�_ +%E�O]  �a ,%E�Y hO�a -%�%E�O�E�O�a .  *�k+ /E�Y hO�a 0,�%��,%E�O�_ +%�%E�O]  �a 1%E�Y hO�_ +%�%E�O�a ,b   �*�k+ 2%E�Y hO� �a 3%E�Y hO�a 4 �_ 5%b  %�%_ +%E�Y h[OY�%O� r�a 6 .a 7�%E�O�b  %b  %a 8%_ 5%b  %a 9%E�Y hO�a : .�a ;%E�O�b  %b  %a <%_ 5%b  %a =%E�Y hY hOa >E^ O�a ? ] a @%�%a A%E^ Y hO�a B ] a C%�%a D%E^ Y hO�a E ] �%E^ Y hO] �lv� ����������� $0 _formatarguments _formatArguments�� ����   ������ *0 argumentdefinitions argumentDefinitions�� 0 vtstyle vtStyle��   
���������������������� *0 argumentdefinitions argumentDefinitions�� 0 vtstyle vtStyle�� &0 argumentssynopsis argumentsSynopsis�� $0 argumentssection argumentsSection�� 0 argumentref argumentRef�� (0 argumentdefinition argumentDefinition�� 0 	valuetype 	valueType�� 0 islist isList�� $0 valueplaceholder valuePlaceholder�� $0 valuedescription valueDescription &����������������������������
��������;@����H��V����~��������� 0 b  �� 0 n  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
reco�� 0 	valuetype 	valueType
�� 
ctxt�� 0 islist isList�� 0 defaultvalue defaultValue�� $0 valueplaceholder valuePlaceholder�� $0 valuedescription valueDescription�� 

�� 
type
�� 
bool��   ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType�� 40 _defaultvalueplaceholder _defaultValuePlaceholder�� 0 u  �� *0 _formatdefaultvalue _formatDefaultValue
�� 
lnfd
�� 
spac��?�jv  
��lvY hO�E�O��,�%��,%E�O�[��l kh ��&���f�b  ��a a a %E�O *��,a &E�O��,a &E�O��,�&E�O�a ,�&E�W X  b  �a �a a + O�a   *�k+ E�Y hO� �a %E�Y hO�b  %b  %�a ,%�%��,%E�O��,b   �*�k+ %E�Y hO�a   �_ !%b  %�%E�Y hO��,b   a "�%a #%E�Y hO�_ $%�%E�[OY��Oa %�%�lv� ������� !��
�� .Fil:Argvnull���     ****�� 0 argv  �� ��"#
�� 
OpsD" {������ &0 optiondefinitions optionDefinitions�  �  # �$%
� 
OpsA$ {���� *0 argumentdefinitions argumentDefinitions�  �  % �&�
� 
DefO& {���� &0 hasdefaultoptions hasDefaultOptions�  
� boovtrue�    ������������ 0 argv  � &0 optiondefinitions optionDefinitions� *0 argumentdefinitions argumentDefinitions� &0 hasdefaultoptions hasDefaultOptions� 0 oldtids oldTIDs� (0 asocparametersdict asocParametersDict� 0 argumentslist argumentsList� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo! �����������'����U��
� 
ascr
� 
txdl� "0 aslistparameter asListParameter
� 
cobj� 0 _parseoptions _parseOptions� (0 _adddefaultoptions _addDefaultOptions� "0 _parsearguments _parseArguments
� 
****� 0 etext eText' ��(
� 
errn� 0 enumber eNumber( ��)
� 
erob� 0 efrom eFrom) ���
� 
errt� 
0 eto eTo�  
� 
errn
� 
erob
� 
errt� � � 
0 _error  �� ��� ���,E�O ab  �k+ E�Ob  �k+ E�Ob  �k+ E�O*��-��m+ E[�k/E�Z[�l/E�ZO*��l+ O*���m+ O���,FO��&W 2X 
 ���,FO�b  
  )�����Y *a ����a + V� �i��*+�
� .Fil:FHlpnull��� ��� null�  � �,-
� 
Name, {��q� 0 commandname commandName�  - �./
� 
Summ. {��y� $0 shortdescription shortDescription�  / �01
� 
Usag0 {���� "0 commandsynopses commandSynopses�  �  1 �23
� 
OpsD2 {���� &0 optiondefinitions optionDefinitions�  �  3 �45
� 
OpsA4 {���~� *0 argumentdefinitions argumentDefinitions�  �~  5 �}67
�} 
Docu6 {�|�{��| "0 longdescription longDescription�{  7 �z89
�z 
VFmt8 {�y�x�w�y 0 isstyled isStyled�x  
�w boovtrue9 �v:�u
�v 
DefO: {�t�s�r�t &0 hasdefaultoptions hasDefaultOptions�s  
�r boovtrue�u  * �q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�q 0 commandname commandName�p $0 shortdescription shortDescription�o "0 commandsynopses commandSynopses�n &0 optiondefinitions optionDefinitions�m *0 argumentdefinitions argumentDefinitions�l "0 longdescription longDescription�k 0 isstyled isStyled�j &0 hasdefaultoptions hasDefaultOptions�i 0 vtstyle vtStyle�h 0 helptext helpText�g 00 defaultoptionssynopsis defaultOptionsSynopsis�f  0 optionssection optionsSection�e 40 defaultargumentssynopsis defaultArgumentsSynopsis�d $0 argumentssection argumentsSection�c 0 textref textRef�b 0 etext eText�a 0 enumber eNumber�` 0 efrom eFrom�_ 
0 eto eTo+ 1����^�]����\�[�Z�Y�X�W�V
�U�T�S�R�Q,@JR�P�O�N��M�L;��K��J�����I�H<��G�F�^ "0 astextparameter asTextParameter�] "0 aslistparameter asListParameter�\ (0 asbooleanparameter asBooleanParameter�[ 0 n  �Z 0 vt100 VT100�Y 0 b  �X 0 u  �W �V 
�U .Fil:EnVanull��� ��� null�T 0 _  
�S .Fil:SplPnull���     ctxt�R  �Q  �P  0 _formatoptions _formatOptions
�O 
cobj�N $0 _formatarguments _formatArguments
�M 
kocl
�L .corecnte****       ****; �E�D�C
�E 
errn�D�\�C  
�K 
list�J 60 throwinvalidparametertype throwInvalidParameterType
�I 
lnfd�H 0 etext eText< �B�A=
�B 
errn�A 0 enumber eNumber= �@�?>
�@ 
erob�? 0 efrom eFrom> �>�=�<
�> 
errt�= 
0 eto eTo�<  �G �F 
0 _error  ����b  ��l+ E�Ob  �k+ E�Ob  �k+ E�Ob  �k+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+  �*jk+ 
�*kk+ 
�*�k+ 
�E�Y ���a �a �E�O�a   $ *j a ,j E�W X  a E�Y hO��,a %��,%b  %b  %�%E�O�a  �a %�%E�Y hO*���m+ E[a k/E�Z[a l/E�ZO*��l+ E[a k/E�Z[a l/E�ZO�b  %��,%a %��,%E�O�jv  ��%�%kvE�Y hO / )�[a  a l !kh �b  %b  %�%E�[OY��W X  "b  �a #a $a %�+ &O�a ' �b  %�%E�Y hO�a ( �b  %�%E�Y hO�a ) "�b  %��,%a *%��,%b  %�%E�Y hO�_ +%W X , -*a .�] ] ] a /+ 0V� �;�:�9?@�8
�; .Fil:CurFnull��� ��� null�:  �9  ? �7�6�5�4�3�7 0 asocpath asocPath�6 0 etext eText�5 0 enumber eNumber�4 0 efrom eFrom�3 
0 eto eTo@ �2�1�0�/�.�-�,+�+�*�)A>�(�'
�2 misccura�1 0 nsfilemanager NSFileManager�0  0 defaultmanager defaultManager�/ ,0 currentdirectorypath currentDirectoryPath
�. 
msng
�- 
errn�,�@
�+ 
ctxt
�* 
psxf�) 0 etext eTextA �&�%B
�& 
errn�% 0 enumber eNumberB �$�#C
�$ 
erob�# 0 efrom eFromC �"�!� 
�" 
errt�! 
0 eto eTo�   �( �' 
0 _error  �8 ; *��,j+ j+ E�O��  )��l�Y hO��&�&W X 
 *졢���+ � �N��DE�
� .Fil:EnVanull��� ��� null�  �  D  E �����
� misccura� 0 nsprocessinfo NSProcessInfo� 0 processinfo processInfo� 0 environment  
� 
****� ��,j+ j+ �&� �`��FG�
� .Fil:RSInnull��� ��� null�  � �HI
� 
PrmtH {��g� 0 
prompttext 
promptText�  I �J�
� 
ReToJ {���� 0 isinteractive isInteractive�  
� boovfals�  F 	�
�	��������
 0 
prompttext 
promptText�	 0 isinteractive isInteractive� 0 	asocstdin 	asocStdin� 0 asocdata asocData� 0 
asocstring 
asocString� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToG �� �����������������������������������������K�����
� misccura�  0 nsfilehandle NSFileHandle�� :0 filehandlewithstandardinput fileHandleWithStandardInput
�� 
SLiB
�� 
ALiE�� 
�� .Fil:WSOunull���     ctxt�� 0 availabledata availableData�� 
0 length  
�� 
msng�� *0 readdatatoendoffile readDataToEndOfFile�� 0 nsstring NSString�� 	0 alloc  �� ,0 nsutf8stringencoding NSUTF8StringEncoding�� 00 initwithdata_encoding_ initWithData_encoding_
�� 
errn���\
�� 
lnfd�� 0 
hassuffix_ 
hasSuffix_�� &0 substringtoindex_ substringToIndex_
�� 
ctxt�� 0 etext eTextK ����L
�� 
errn�� 0 enumber eNumberL ����M
�� 
erob�� 0 efrom eFromM ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � � ���,j+ E�O� '��f�f� O�j+ E�O�j+ j  �Y hY 	�j+ 
E�O��,j+ ���,l+ E�O��  )�a la Y hO�_ k+  ��j+ kk+ E�Y hO�a &W X  *a ����a + � �������NO��
�� .Fil:WSOunull���     ctxt�� 0 thetext theText�� ��PQ
�� 
SLiBP {�������� 0 uselinefeeds useLinefeeds��  
�� boovtrueQ ��R��
�� 
ALiER {��������  0 withlineending withLineEnding��  
�� boovtrue��  N 	�������������������� 0 thetext theText�� 0 uselinefeeds useLinefeeds��  0 withlineending withLineEnding�� 0 
asocstring 
asocString�� 0 
asocstdout 
asocStdout�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToO �������������������������������Sf���� "0 astextparameter asTextParameter�� &0 asnsmutablestring asNSMutableString
�� 
ret 
�� 
lnfd�� 0 location  �� 
0 length  �� �� l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_�� 0 
hassuffix_ 
hasSuffix_
�� 
bool�� 0 appendstring_ appendString_
�� misccura�� 0 nsfilehandle NSFileHandle� <0 filehandlewithstandardoutput fileHandleWithStandardOutput� ,0 nsutf8stringencoding NSUTF8StringEncoding� (0 datausingencoding_ dataUsingEncoding_� 0 
writedata_ 
writeData_� 0 etext eTextS ��T
� 
errn� 0 enumber eNumberT ��U
� 
erob� 0 efrom eFromU ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� � �b  b  ��l+ k+ E�O� ,���%�j�j�j+ ��+ O���j�j�j+ ��+ Y hO�	 ��k+ 	�& ��k+ Y hO��,j+ E�O����,k+ k+ OhW X  *a ����a + ascr  ��ޭ