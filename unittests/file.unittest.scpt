FasdUAS 1.101.10   ��   ��    k             x     �� ����    4     �� 
�� 
scpt  m     	 	 � 
 
  T e s t T o o l s��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l          x    $�� ����    4     �� 
�� 
scpt  m       �    F i l e��      the script being tested     �   0   t h e   s c r i p t   b e i n g   t e s t e d      l     ��������  ��  ��        l     ��������  ��  ��        h   $ +��  �� 00 suite_pathmanipulation suite_PathManipulation   k       ! !  " # " x     �� $����   $ 4    �� %
�� 
frmk % m     & & � ' '  F o u n d a t i o n��   #  ( ) ( l     ��������  ��  ��   )  * + * j    �� ,�� 0 	_username 	_userName , m    ��
�� 
msng +  - . - j    �� /�� 0 	_userhome 	_userHome / m    ��
�� 
msng .  0 1 0 l     ��������  ��  ��   1  2 3 2 i    4 5 4 I      �������� "0 configure_setup configure_setUp��  ��   5 k     / 6 6  7 8 7 O      9 : 9 k     ; ;  < = < r     > ? > n    	 @ A @ 1    	��
�� 
pnam A 1    ��
�� 
home ? o      ���� 0 	_username 	_userName =  B�� B r     C D C n     E F E 1    ��
�� 
psxp F l    G���� G c     H I H 1    ��
�� 
home I m    ��
�� 
alis��  ��   D o      ���� 0 	_userhome 	_userHome��   : m      J J�                                                                                  MACS  alis    t  Macintosh HD               �n+�H+  K��
Finder.app                                                     N7����        ����  	                CoreServices    �n�      ���    K��K��K��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   8  K�� K l   / L M N L n   / O P O I   & /�� Q���� :0 changecurrentdirectorypath_ changeCurrentDirectoryPath_ Q  R�� R o   & +���� 0 	_userhome 	_userHome��  ��   P n   & S T S I   " &��������  0 defaultmanager defaultManager��  ��   T n   " U V U o     "���� 0 nsfilemanager NSFileManager V m     ��
�� misccura M � } make sure CWD is always ~/ so that `normalize path` and `join path` always return known result when expanding relative paths    N � W W �   m a k e   s u r e   C W D   i s   a l w a y s   ~ /   s o   t h a t   ` n o r m a l i z e   p a t h `   a n d   ` j o i n   p a t h `   a l w a y s   r e t u r n   k n o w n   r e s u l t   w h e n   e x p a n d i n g   r e l a t i v e   p a t h s��   3  X Y X l     ��������  ��  ��   Y  Z [ Z i    \ ] \ I      �������� $0 test_convertpath test_convertPath��  ��   ] k     � ^ ^  _ ` _ I     a�� b a z�� 
�� .���:AsRenull��� ��� null��   b �� c d
�� 
Valu c l  	  e���� e I  	  f g h f z�� 
�� .Fil:ConPnull���     **** g m     i i � j j 8 / U s e r s / j s m i t h / U s e r   G u i d e . t x t h �� k��
�� 
To__ k m     l l z�� 
�� FLCTFLCH��  ��  ��   d �� m��
�� 
Equa m l    n���� n m     o o � p p P M a c i n t o s h   H D : U s e r s : j s m i t h : U s e r   G u i d e . t x t��  ��  ��   `  q r q I    A s�� t s z�� 
�� .���:AsRenull��� ��� null��   t �� u v
�� 
Valu u l  ) 8 w���� w I  ) 8 x y z x z�� 
�� .Fil:ConPnull���     **** y m   0 1 { { � | | P M a c i n t o s h   H D : U s e r s : j s m i t h : U s e r   G u i d e . t x t z �� }��
�� 
From } m   2 3 ~ ~ z�� 
�� FLCTFLCH��  ��  ��   v �� ��
�� 
Equa  l  9 < ����� � m   9 < � � � � � 8 / U s e r s / j s m i t h / U s e r   G u i d e . t x t��  ��  ��   r  � � � I  B p ��� � � z�� 
�� .���:AsRenull��� ��� null��   � �� � �
�� 
Valu � l  M b ����� � I  M b � � � � z�� 
�� .Fil:ConPnull���     **** � m   V Y � � � � � 8 / U s e r s / j s m i t h / U s e r   G u i d e . t x t � �� ���
�� 
To__ � m   Z ] � � z�� 
�� FLCTFLCX��  ��  ��   � �� ���
�� 
Equa � l  c k ����� � 4   c k�� �
�� 
psxf � m   g j � � � � � 8 / U s e r s / j s m i t h / U s e r   G u i d e . t x t��  ��  ��   �  ��� � I  q � ��� � � z�� 
�� .���:AsRenull��� ��� null��   � �� � �
�� 
Valu � l  | � ����� � I  | � � � � � z�� 
�� .Fil:ConPnull���     **** � l  � � ����� � 4   � ��� �
�� 
psxf � m   � � � � � � � 8 / U s e r s / j s m i t h / U s e r   G u i d e . t x t��  ��   � �� ���
�� 
To__ � m   � � � � z�� 
�� FLCTFLCU��  ��  ��   � �� ���
�� 
Equa � l  � � ����� � m   � � � � � � � J f i l e : / / / U s e r s / j s m i t h / U s e r % 2 0 G u i d e . t x t��  ��  ��  ��   [  � � � l     ��������  ��  ��   �  � � � i    � � � I      �������� (0 test_normalizepath test_normalizePath��  ��   � k     O � �  � � � I    % ��� � � z�� 
�� .���:AsRenull��� ��� null��   � �� � �
�� 
Valu � l  	  ���~ � I  	  � ��} � z�| 
�| .Fil:NorPnull���     ctxt � m     � � � � � H ~ / P i c t u r e s / C a m e r a   R o l l / . . / . . / M o v i e s /�}  �  �~   � �{ ��z
�{ 
Equa � l     ��y�x � b      � � � b     � � � m     � � � � �  / U s e r s / � o    �w�w 0 	_username 	_userName � m     � � � � �  / M o v i e s�y  �x  �z   �  ��v � I  & O ��u � � z�t 
�t .���:AsRenull��� ��� null�u   � �s � �
�s 
Valu � l  / > ��r�q � I  / > � � � � z�p 
�p .Fil:NorPnull���     ctxt � m   6 7 � � � � �  M u s i c / i T u n e s � �o ��n
�o 
ExpR � m   8 9�m
�m boovtrue�n  �r  �q   � �l ��k
�l 
Equa � l  ? J ��j�i � b   ? J � � � b   ? F � � � m   ? @ � � � � �  / U s e r s / � o   @ E�h�h 0 	_username 	_userName � m   F I � � � � �  / M u s i c / i T u n e s�j  �i  �k  �v   �  � � � l     �g�f�e�g  �f  �e   �  � � � i     � � � I      �d�c�b�d 0 test_joinpath test_joinPath�c  �b   � k     } � �  � � � I    " ��a � � z�` 
�` .���:AsRenull��� ��� null�a   � �_ � �
�_ 
Valu � l  	  ��^�] � I  	  � ��\ � z�[ 
�[ .Fil:JoiPnull���     **** � J     � �  � � � m     � � � � �  / �  � � � m     � � � � � 
 U s e r s �  � � � m     � � � � �  j s m i t h �  ��Z � m     � � � � �  D e s k t o p�Z  �\  �^  �]   � �Y ��X
�Y 
Equa � l    ��W�V � m     � � � � � * / U s e r s / j s m i t h / D e s k t o p�W  �V  �X   �  �  � I  # M�U z�T 
�T .���:AsRenull��� ��� null�U   �S
�S 
Valu l  , D�R�Q I  , D z�P 
�P .Fil:JoiPnull���     **** J   3 9		 

 m   3 4 �  D o c u m e n t s �O m   4 7 �  R e a d M e�O   �N�M
�N 
Exte m   < ? �  t x t�M  �R  �Q   �L�K
�L 
Equa l  E H�J�I m   E H � ( D o c u m e n t s / R e a d M e . t x t�J  �I  �K    �H I  N }�G z�F 
�F .���:AsRenull��� ��� null�G   �E
�E 
Valu l  Y t�D�C I  Y t�B z�A 
�A .Fil:JoiPnull���     **** J   b o   !"! 4   b j�@#
�@ 
psxf# m   f i$$ �%%  / U s e r s / j s m i t h" &�?& m   j m'' �(( ( D o c u m e n t s / R e a d M e . t x t�?  �B  �D  �C   �>)�=
�> 
Equa) l  u x*�<�;* m   u x++ �,, D / U s e r s / j s m i t h / D o c u m e n t s / R e a d M e . t x t�<  �;  �=  �H   � -.- l     �:�9�8�:  �9  �8  . /0/ i  ! $121 I      �7�6�5�7  0 test_splitpath test_splitPath�6  �5  2 k     �33 454 I     6�476 z�3 
�3 .���:AsRenull��� ��� null�4  7 �289
�2 
Valu8 l  	 :�1�0: I  	 ;<�/; z�. 
�. .Fil:SplPnull���     ctxt< m    == �>> D / U s e r s / j s m i t h / D o c u m e n t s / R e a d M e . t x t�/  �1  �0  9 �-?�,
�- 
Equa? l   @�+�*@ J    AA BCB m    DD �EE . / U s e r s / j s m i t h / D o c u m e n t sC F�)F m    GG �HH  R e a d M e . t x t�)  �+  �*  �,  5 IJI I  ! WK�(LK z�' 
�' .���:AsRenull��� ��� null�(  L �&MN
�& 
ValuM l  * >O�%�$O I  * >PQRP z�# 
�# .Fil:SplPnull���     ctxtQ l  1 5S�"�!S 4   1 5� T
�  
psxfT m   3 4UU �VV D / U s e r s / j s m i t h / D o c u m e n t s / R e a d M e . t x t�"  �!  R �W�
� 
UponW m   6 9XX z� 
� FLSPFLSA�  �%  �$  N �Y�
� 
EquaY l  ? RZ��Z J   ? R[[ \]\ m   ? B^^ �__  /] `a` m   B Ebb �cc 
 U s e r sa ded m   E Hff �gg  j s m i t he hih m   H Kjj �kk  D o c u m e n t si l�l m   K Nmm �nn  R e a d M e . t x t�  �  �  �  J o�o I  X �p�qp z� 
� .���:AsRenull��� ��� null�  q �rs
� 
Valur l  c xt��t I  c xuvwu z� 
� .Fil:SplPnull���     ctxtv m   l oxx �yy D / U s e r s / j s m i t h / D o c u m e n t s / R e a d M e . t x tw �z�
� 
Uponz m   p s{{ z� 
� FLSPFLSE�  �  �  s �|�
� 
Equa| l  y �}��
} J   y �~~ � m   y |�� ��� < / U s e r s / j s m i t h / D o c u m e n t s / R e a d M e� ��	� m   | �� ���  t x t�	  �  �
  �  �  0 ��� l     ����  �  �  �    ��� l     ����  �  �  � ��� l     �� ���  �   ��  � ��� l     ��������  ��  ��  � ��� h   , 3����� *0 suite_readwritefile suite_ReadWriteFile� l     ������  �   TO DO: implement   � ��� "   T O   D O :   i m p l e m e n t� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� h   4 ;����� 40 suite_shellscriptsupport suite_ShellScriptSupport� k      �� ��� l     ��������  ��  ��  � ��� j     -����� 0 	_options1  � J     ,�� ��� l 	   ������ K     �� ������ 0 propertyname propertyName� m    �� ���  a b l e� ������� 0 	shortname 	shortName� m    �� ���  a��  ��  ��  � ��� l 	  ������ K    �� ������ 0 propertyname propertyName� m    �� ��� 
 b a k e r� ������� 0 longname longName� m   	 
�� ��� 
 b a k e r��  ��  ��  � ��� l 	  ������ K    �� ������ 0 propertyname propertyName� m    �� ���  c h a r l i e� ������ 0 	shortname 	shortName� m    �� ���  c� ������ 0 longname longName� m    �� ���  c h a r� ������� 0 	valuetype 	valueType� m    ��
�� 
long��  ��  ��  � ���� l 	  *������ K    *�� ������ 0 propertyname propertyName� m    �� ��� 
 d e l t a� ������ 0 	shortname 	shortName� m    �� ���  d� ������ 0 	valuetype 	valueType� m    ��
�� 
long� ������ 0 defaultvalue defaultValue� m     ������� ������� $0 valueplaceholder valuePlaceholder� m   # &�� ���  B A Z��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� j   . 2����� 0 _options1_description  � m   . 1�� ��� � 
 O P T I O N S 
 
     - a   T E X T 
 
     - - b a k e r   T E X T 
 
     - c ,   - - c h a r   I N T E G E R 
 
     - d   B A Z 
             D e f a u l t :    - 1      
� ��� j   3 7����� >0 _options1_descriptiondefaults _options1_descriptionDefaults� m   3 6�� ��� � 
     - h ,   - - h e l p 
             P r i n t   t h i s   h e l p   a n d   e x i t . 
 
     - v ,   - - v e r s i o n 
             P r i n t   v e r s i o n   n u m b e r   a n d   e x i t . 
� ��� l     ��������  ��  ��  � ��� j   8 Q����� 0 _arguments1  � J   8 P�� ��� l 	 8 >������ K   8 >�� ������� 0 propertyname propertyName� m   9 <�� ���  f i r s t A r g��  ��  ��  � ���� l 	 > N������ K   > N�� ������ 0 propertyname propertyName� m   ? B�� ���  r e s t A r g s� ������ 0 	valuetype 	valueType� m   C F��
�� 
file� ������� 0 islist isList� m   I J��
�� boovtrue��  ��  ��  ��  � � � l     ��������  ��  ��     j   R V���� 0 _arguments1_description   m   R U � > 
 A R G U M E N T S 
 
     T E X T 
 
     F I L E   . . . 
  l     ��������  ��  ��   	 l     ��������  ��  ��  	 

 i  W Z I      �������� "0 test_formathelp test_formatHelp��  ��   k      l     ����   Q K TO DO: also test with args only, opts ony, without summary/default options    � �   T O   D O :   a l s o   t e s t   w i t h   a r g s   o n l y ,   o p t s   o n y ,   w i t h o u t   s u m m a r y / d e f a u l t   o p t i o n s  l     ��������  ��  ��    I    %�� z�� 
�� .���:AsRenull��� ��� null��   ��
�� 
Valu l  	 ���� I  	 �� z�� 
�� .Fil:FHlpnull��� ��� null��   �� 
�� 
Name m    !! �""  f o o - b a r  ��#$
�� 
VFmt# m    ��
�� boovfals$ ��#��
�� 
DefO��  ��  ��   ��%&
�� 
Equa% l   '����' m    (( �)) J N A M E 
 
     f o o - b a r 
 
 S Y N O P S I S 
 
     f o o - b a r 
��  ��  & ��*��
�� 
Summ* m     ++ �,, * m i n i m u m   d o c u m e n t a t i o n��   -.- l  & &��������  ��  ��  . /0/ I  & l1��21 z�� 
�� .���:AsRenull��� ��� null��  2 ��34
�� 
Valu3 l  / U5����5 I  / U6��76 z�� 
�� .Fil:FHlpnull��� ��� null��  7 ��89
�� 
Name8 m   : =:: �;;  f o o - b a r9 ��<=
�� 
OpsA< K   @ N>> ��?@�� 0 propertyname propertyName? m   C FAA �BB  a r g u m e n t s L i s t@ ��C���� 0 islist isListC m   I J��
�� boovtrue��  = ��D��
�� 
VFmtD m   O P��
�� boovfals��  ��  ��  4 ��EF
�� 
EquaE l  V cG����G b   V cHIH b   V _JKJ m   V YLL �MM � N A M E 
 
     f o o - b a r 
 
 S Y N O P S I S 
 
     f o o - b a r   [ - h v ]   [ - - ]   T E X T   . . . 
 
 O P T I O N S 
K o   Y ^���� >0 _options1_descriptiondefaults _options1_descriptionDefaultsI m   _ bNN �OO . 
 A R G U M E N T S 
 
     T E X T   . . . 
��  ��  F �P�~
� 
SummP m   d gQQ �RR � f o r m a t   h e l p   f o r   d e f a u l t   - h   a n d   - v   o p t i o n s   a n d   l i s t   o f   o n e   o r   m o r e   a r g u m e n t s�~  0 STS l  m m�}�|�{�}  �|  �{  T UVU l  m m�z�y�x�z  �y  �x  V WXW I  m �Y�wZY z�v 
�v .���:AsRenull��� ��� null�w  Z �u[\
�u 
Valu[ l  x �]�t�s] I  x �^�r_^ z�q 
�q .Fil:FHlpnull��� ��� null�r  _ �p`a
�p 
Name` m   � �bb �cc  f o o - b a ra �ode
�o 
OpsAd K   � �ff �ngh�n 0 propertyname propertyNameg m   � �ii �jj  a r g u m e n t s L i s th �mkl�m 0 islist isListk m   � ��l
�l boovtruel �km�j�k 0 defaultvalue defaultValuem J   � ��i�i  �j  e �hn�g
�h 
VFmtn m   � ��f
�f boovfals�g  �t  �s  \ �eop
�e 
Equao l  � �q�d�cq b   � �rsr b   � �tut m   � �vv �ww � N A M E 
 
     f o o - b a r 
 
 S Y N O P S I S 
 
     f o o - b a r   [ - h v ]   [ - - ]   [ T E X T   . . . ] 
 
 O P T I O N S 
u o   � ��b�b >0 _options1_descriptiondefaults _options1_descriptionDefaultss m   � �xx �yy . 
 A R G U M E N T S 
 
     T E X T   . . . 
�d  �c  p �az�`
�a 
Summz m   � �{{ �|| � f o r m a t   h e l p   f o r   d e f a u l t   - h   a n d   - v   o p t i o n s   a n d   l i s t   o f   z e r o   o r   m o r e   a r g u m e n t s�`  X }~} l  � ��_�^�]�_  �^  �]  ~ �\ I  ���[�� z�Z 
�Z .���:AsRenull��� ��� null�[  � �Y��
�Y 
Valu� l  � ���X�W� I  � ���V�� z�U 
�U .Fil:FHlpnull��� ��� null�V  � �T��
�T 
Name� m   � ��� ���  f o o - b a r� �S��
�S 
OpsD� o   � ��R�R 0 	_options1  � �Q��
�Q 
OpsA� o   � ��P�P 0 _arguments1  � �O��
�O 
Summ� m   � ��� ��� , s h o r t   d e s c r i p t i v e   t e x t� �N��M
�N 
VFmt� m   � ��L
�L boovfals�M  �X  �W  � �K��J
�K 
Equa� l  ���I�H� b   ���� b   � ���� b   � ���� m   � ��� ���  N A M E 
 
     f o o - b a r   - -   s h o r t   d e s c r i p t i v e   t e x t 
 
 S Y N O P S I S 
 
     f o o - b a r   [ - h v ]   - a   T E X T   - b a k e r   T E X T   - c   I N T E G E R   [ - d   B A Z ]   [ - - ]   T E X T   F I L E   . . . 
� o   � ��G�G 0 _options1_description  � o   � ��F�F >0 _options1_descriptiondefaults _options1_descriptionDefaults� o   ��E�E 0 _arguments1_description  �I  �H  �J  �\   ��� l     �D�C�B�D  �C  �B  � ��� i  [ ^��� I      �A�@�?�A *0 test_parsearguments test_parseArguments�@  �?  � k     ��� ��� I    #��>�� z�= 
�= .���:AsRenull��� ��� null�>  � �<��
�< 
Valu� l  	 ��;�:� I  	 ���9� z�8 
�8 .Fil:Argvnull���     ****� J    �7�7  �9  �;  �:  � �6��5
�6 
Equa� K    �� �4���4 0 help  � m    �3
�3 boovfals� �2��1�2 0 version  � m    �0
�0 boovfals�1  �5  � ��� I  $ M��/�� z�. 
�. .���:AsRenull��� ��� null�/  � �-��
�- 
Valu� l  - =��,�+� I  - =���*� z�) 
�) .Fil:Argvnull���     ****� J   4 8�� ��� m   4 5�� ���  - h� ��(� m   5 6�� ���  - v�(  �*  �,  �+  � �'��
�' 
Equa� K   > D�� �&���& 0 help  � m   ? @�%
�% boovtrue� �$��#�$ 0 version  � m   A B�"
�" boovfals�#  � �!�� 
�! 
Summ� m   E F�� ��� � p a r s e r   s h o u l d   r e t u r n   a s   s o o n   a s   a   d e f a u l t   - h   o p t i o n   i s   e n c o u n t e r e d ,   i g n o r i n g   r e m a i n i n g   a r g s�   � ��� l  N ����� I  N ����� z� 
� .���:AsRenull��� ��� null�  � ���
� 
Valu� l  Y o���� I  Y o���� z� 
� .Fil:Argvnull���     ****� J   b j�� ��� m   b e�� ���  - v� ��� m   e h�� ���  - h�  �  �  �  � ���
� 
Equa� K   p v�� ���� 0 help  � m   q r�
� boovfals� ���� 0 version  � m   s t�
� boovtrue�  � ���
� 
Summ� m   w z�� ��� � p a r s e r   s h o u l d   r e t u r n   a s   s o o n   a s   a   d e f a u l t   - v   o p t i o n   i s   e n c o u n t e r e d ,   i g n o r i n g   r e m a i n i n g   a r g s�  � [ U TO DO: also need to test when -h/-v is overridden by custom option definition record   � ��� �   T O   D O :   a l s o   n e e d   t o   t e s t   w h e n   - h / - v   i s   o v e r r i d d e n   b y   c u s t o m   o p t i o n   d e f i n i t i o n   r e c o r d� ��� I  � ����� z� 
� .���:AsRenull��� ��� null�  � ���
� 
Valu� l  � ����� I  � ����� z�
 
�
 .Fil:Argvnull���     ****� J   � ��� ��� m   � ��� ���  f o o� ��	� m   � ��� ���  b a r�	  � ���
� 
OpsA� K   � ��� �� � 0 propertyname propertyName� m   � � �  a r g u m e n t s L i s t  ��� 0 islist isList m   � ��
� boovtrue�  �  �  �  � ��
� 
Equa K   � � � �  0 help   m   � ���
�� boovfals ��	�� 0 version   m   � ���
�� boovfals	 ��
���� 0 argumentslist argumentsList
 J   � �  m   � � �  f o o �� m   � � �  b a r��  ��  �  � �� I  � ��� z�� 
�� .���:AsErnull��� ��� null��   ��
�� 
Args J   � �  J   � �����    J   � �����   �� K   � � �� �� 0 propertyname propertyName m   � �!! �""  a r g u m e n t s L i s t  ��#���� 0 islist isList# m   � ���
�� boovtrue��  ��   ��$��
�� 
Equa$ K   � �%% ��&'�� 0 errornumber errorNumber& m   � �����'' ��(���� 0 errormessage errorMessage( m   � �)) �** \ M i s s i n g   1 s t   r e q u i r e d   a r g u m e n t   ( e x p e c t e d   T E X T ) .��  ��  ��  � +,+ l     ��������  ��  ��  , -.- i  _ b/0/ I      ��1���� *0 call_parsearguments call_parseArguments1 2��2 J      33 454 o      ���� 0 argslist argsList5 676 o      ���� 0 optdefs optDefs7 8��8 o      ���� 0 argdefs argDefs��  ��  ��  0 I    9:;9 z�� 
�� .Fil:Argvnull���     ****: o    ���� 0 argslist argsList; ��<=
�� 
OpsD< o   	 
���� 0 optdefs optDefs= ��>��
�� 
OpsA> o    ���� 0 argdefs argDefs��  . ?��? l     ��������  ��  ��  ��  � @A@ l     ��������  ��  ��  A BCB l     ��������  ��  ��  C DED i   < ?FGF I     ������
�� .aevtoappnull  �   � ****��  ��  G l    HIJH I    KL��K z�� 
�� .���:RunTnull���     fileL l   M����M I   ��N��
�� .earsffdralis        afdrN  f    ��  ��  ��  ��  I N H including this command allows tests to be run directly in Script Editor   J �OO �   i n c l u d i n g   t h i s   c o m m a n d   a l l o w s   t e s t s   t o   b e   r u n   d i r e c t l y   i n   S c r i p t   E d i t o rE PQP l     ��������  ��  ��  Q R��R l     ��������  ��  ��  ��       ��STUVWX��  S ����������
�� 
pimr�� 00 suite_pathmanipulation suite_PathManipulation�� *0 suite_readwritefile suite_ReadWriteFile�� 40 suite_shellscriptsupport suite_ShellScriptSupport
�� .aevtoappnull  �   � ****T ��Y�� Y  Z[\Z ��]��
�� 
cobj] ^^   �� 	
�� 
scpt��  [ ��_��
�� 
cobj_ ``   ��
�� 
osax��  \ ��a��
�� 
cobja bb   �� 
�� 
scpt��  U ��    c�� 00 suite_pathmanipulation suite_PathManipulationc 
��de����fghij��  d ����������������
�� 
pimr�� 0 	_username 	_userName�� 0 	_userhome 	_userHome�� "0 configure_setup configure_setUp�� $0 test_convertpath test_convertPath�� (0 test_normalizepath test_normalizePath�� 0 test_joinpath test_joinPath��  0 test_splitpath test_splitPathe ��k�� k  ll ��m��
�� 
cobjm nn   �� &
�� 
frmk��  
�� 
msng
�� 
msngf �� 5����op���� "0 configure_setup configure_setUp��  ��  o  p 	 J����������������
�� 
home
�� 
pnam
�� 
alis
�� 
psxp
�� misccura�� 0 nsfilemanager NSFileManager��  0 defaultmanager defaultManager�� :0 changecurrentdirectorypath_ changeCurrentDirectoryPath_�� 0� *�,�,Ec  O*�,�&�,Ec  UO��,j+ b  k+ g �� ]����qr���� $0 test_convertpath test_convertPath��  ��  q  r �� 	��  i�������� o���� 	  {�� � 	  ����� � 	  ��� �
�� 
scpt
�� 
Valu
�� 
To__
�� FLCTFLCH
�� .Fil:ConPnull���     ****
�� 
Equa�� 
�� .���:AsRenull��� ��� null
�� 
From
�� FLCTFLCX
�� 
psxf
�� FLCTFLCU�� �)��/ *�)��/ 	���l U��� UO)��/ *�)��/ 	���l U�a � UO)�a / &*�)�a / a �a l U�)a a /� UO)�a / &*�)�a / )a a /�a l U�a � Uh �� ����st�~�� (0 test_normalizepath test_normalizePath��  �  s  t �} 	�|  ��{�z � ��y�x 	  ��w � �
�} 
scpt
�| 
Valu
�{ .Fil:NorPnull���     ctxt
�z 
Equa�y 
�x .���:AsRenull��� ��� null
�w 
ExpR�~ P)��/ *�)��/ �j U��b  %�%� 
UO)��/ #*�)��/ 	��el U��b  %a %� 
Ui �v ��u�tuv�s�v 0 test_joinpath test_joinPath�u  �t  u  v �r 	�q  � � � ��p�o�n ��m 	 �l 	 �k$'+
�r 
scpt
�q 
Valu�p 
�o .Fil:JoiPnull���     ****
�n 
Equa
�m .���:AsRenull��� ��� null
�l 
Exte
�k 
psxf�s ~)��/ *�)��/ �����vj 	U��� UO)��/ $*�)��/ �a lva a l 	U�a � UO)�a / '*�)�a / )a a /a lvj 	U�a � Uj �j2�i�hwx�g�j  0 test_splitpath test_splitPath�i  �h  w  x �f 	�e =�d�cDG�b�a 	 �`U�_�^^bfjm�] 	 x�\��
�f 
scpt
�e 
Valu
�d .Fil:SplPnull���     ctxt
�c 
Equa�b 
�a .���:AsRenull��� ��� null
�` 
psxf
�_ 
Upon
�^ FLSPFLSA�] 
�\ FLSPFLSE�g �)��/ *�)��/ �j U���lv� 
UO)��/ 0*�)��/ )��/�a l U�a a a a a a v� 
UO)�a / &*�)�a / a �a l U�a a lv� 
UV �[�  y�[ *0 suite_readwritefile suite_ReadWriteFiley �Zz�Z  z  W �Y�  {�Y 40 suite_shellscriptsupport suite_ShellScriptSupport{ 
�X|}��~���X  | �W�V�U�T�S�R�Q�P�W 0 	_options1  �V 0 _options1_description  �U >0 _options1_descriptiondefaults _options1_descriptionDefaults�T 0 _arguments1  �S 0 _arguments1_description  �R "0 test_formathelp test_formatHelp�Q *0 test_parsearguments test_parseArguments�P *0 call_parsearguments call_parseArguments} �O��O �  ����� �N���N 0 propertyname propertyName� �M��L�M 0 	shortname 	shortName�L  � �K���K 0 propertyname propertyName� �J��I�J 0 longname longName�I  � �H���H 0 propertyname propertyName� �G���G 0 	shortname 	shortName� �F���F 0 longname longName� �E�D�C�E 0 	valuetype 	valueType
�D 
long�C  � �B���B 0 propertyname propertyName� �A���A 0 	shortname 	shortName� �@�?��@ 0 	valuetype 	valueType
�? 
long� �>�=��> 0 defaultvalue defaultValue�=��� �<��;�< $0 valueplaceholder valuePlaceholder�;  ~ �:��: �  ��� �9��8�9 0 propertyname propertyName�8  � �7���7 0 propertyname propertyName� �6�5��6 0 	valuetype 	valueType
�5 
file� �4�3�2�4 0 islist isList
�3 boovtrue�2   �1�0�/���.�1 "0 test_formathelp test_formatHelp�0  �/  �  � )�- 	�, �+!�*�)�(�'�&(�%+�$ 	 :�#�"A�!� LNQ 	 bi�vx{ 	 �����
�- 
scpt
�, 
Valu
�+ 
Name
�* 
VFmt
�) 
DefO�( 
�' .Fil:FHlpnull��� ��� null
�& 
Equa
�% 
Summ
�$ .���:AsRenull��� ��� null
�# 
OpsA�" 0 propertyname propertyName�! 0 islist isList�  � 0 defaultvalue defaultValue
� 
OpsD� 
�.)��/ *�)��/ *���f�f� 	U����� UO)��/ @*�)�a / *�a a a a a ea �f� 	U�a b  %a %�a � UO)�a / C*�)�a / !*�a a a a a ea jv��f� 	U�a b  %a  %�a !� UO)�a "/ K*�)�a #/ #*�a $a %b   a b  �a &�fa ' 	U�a (b  %b  %b  %a  U� �������� *0 test_parsearguments test_parseArguments�  �  �  � )� 	� ������ 	 ����� 	 ��� 	 ������ 	�
!�	��)�
� 
scpt
� 
Valu
� .Fil:Argvnull���     ****
� 
Equa� 0 help  � 0 version  � 
� .���:AsRenull��� ��� null
� 
Summ� 
� 
OpsA� 0 propertyname propertyName� 0 islist isList� 0 argumentslist argumentsList
�
 
Args�	 0 errornumber errorNumber�'� 0 errormessage errorMessage
� .���:AsErnull��� ��� null� )��/ *�)��/ jvj U��f�f�� 	UO)��/ #*�)��/ 
��lvj U��e�f���a  	UO)�a / +*�)�a / a a lvj U��f�e��a a  	UO)�a / A*�)�a / a a lva a a a e�l U��f�fa a a  lva � 	UO)�a !/ +*a "jvjva a #a e�mv�a $a %a &a '�� (U� �0������ *0 call_parsearguments call_parseArguments� ��� �  �� � ��  �  �������� 0 argslist argsList�� 0 optdefs optDefs�� 0 argdefs argDefs�  � �������� 0 argslist argsList�� 0 optdefs optDefs�� 0 argdefs argDefs� �� ��������
�� 
scpt
�� 
OpsD
�� 
OpsA�� 
�� .Fil:Argvnull���     ****� )��/ ���� UX ��G��������
�� .aevtoappnull  �   � ****��  ��  �  � �� 	����
�� 
scpt
�� .earsffdralis        afdr
�� .���:RunTnull���     file�� )��/ )j j U ascr  ��ޭ