FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        x     �� 	����   	 4   6 <�� 

�� 
scpt 
 m   8 ;   �    T e s t L i b��        l     ��������  ��  ��        l          x    �� ����    4     �� 
�� 
scpt  m       �    T e x t L i b��    � � the script being tested (note: when testing non-library scripts, Standard Additions' `load script` should be used instead; eventually TestLib should provide convenience APIs to do this automatically)     �  �   t h e   s c r i p t   b e i n g   t e s t e d   ( n o t e :   w h e n   t e s t i n g   n o n - l i b r a r y   s c r i p t s ,   S t a n d a r d   A d d i t i o n s '   ` l o a d   s c r i p t `   s h o u l d   b e   u s e d   i n s t e a d ;   e v e n t u a l l y   T e s t L i b   s h o u l d   p r o v i d e   c o n v e n i e n c e   A P I s   t o   d o   t h i s   a u t o m a t i c a l l y )      l     ��������  ��  ��        l     ��  ��    � � note: more library idiocy: keyword-based library handlers in imported library take precedence over identically named handlers in script that imported them� what could possibly go wrong?     �  t   n o t e :   m o r e   l i b r a r y   i d i o c y :   k e y w o r d - b a s e d   l i b r a r y   h a n d l e r s   i n   i m p o r t e d   l i b r a r y   t a k e   p r e c e d e n c e   o v e r   i d e n t i c a l l y   n a m e d   h a n d l e r s   i n   s c r i p t   t h a t   i m p o r t e d   t h e m &   w h a t   c o u l d   p o s s i b l y   g o   w r o n g ?     !   l     ��������  ��  ��   !  " # " h    �� $�� $0 suite_modifytext suite_ModifyText $ k       % %  & ' & l     ��������  ��  ��   '  ( ) ( i     *�� * I      �������� 0 setup setUp��  ��  ��   )  + , + l     ��������  ��  ��   ,  - . - i    /�� / I      �������� 0 teardown tearDown��  ��  ��   .  0 1 0 l     ��������  ��  ��   1  2 3 2 l     �� 4 5��   4 d ^ consider optional handler for determining if a given test should run, skip, or expect to fail    5 � 6 6 �   c o n s i d e r   o p t i o n a l   h a n d l e r   f o r   d e t e r m i n i n g   i f   a   g i v e n   t e s t   s h o u l d   r u n ,   s k i p ,   o r   e x p e c t   t o   f a i l 3  7 8 7 l     ��������  ��  ��   8  9 : 9 i    ; < ; I      �������� 0 test_uppercase  ��  ��   < k     � = =  > ? > I     @�� A @ z�� 	
�� .���:AsRenull��� ��� null��   A �� B C
�� 
Valu B l  	  D���� D I  	  E F�� E z�� 
�� .Txt:UppTnull���     ctxt F m     G G � H H  f o � b � r��  ��  ��   C �� I��
�� 
Equa I m     J J � K K  F O � B � R��   ?  L M L I   ; N�� O N z�� 	
�� .���:AsRenull��� ��� null��   O �� P Q
�� 
Valu P l  ' 4 R���� R I  ' 4 S T�� S z�� 
�� .Txt:UppTnull���     ctxt T m   . / U U @      ��  ��  ��   Q �� V��
�� 
Equa V m   5 6 W W � X X  3 . 5��   M  Y Z Y X   <  [�� \ [ I  Z z ]�� ^ ] z�� 	
�� .���:AsErnull��� ��� null��   ^ �� _ `
�� 
Args _ n  g l a b a 1   h l��
�� 
pcnt b o   g h���� 0 aref aRef ` �� c��
�� 
Equa c K   m u d d �� e���� 0 errornumber errorNumber e m   p s�����Y��  ��  �� 0 aref aRef \ J   ? J f f  g h g K   ? C i i �� j���� 0 a   j m   @ A k k � l l  f o o��   h  m�� m J   C H n n  o�� o 1   C F��
�� 
ascr��  ��   Z  p�� p l  � � q r s q I  � � t�� u t z�� 	
�� .���:AsRenull��� ��� null��   u �� v w
�� 
Valu v l  � � x���� x I  � � y z�� y z�� 
�� .Txt:UppTnull���     ctxt z m   � � { { � | |  b o b��  ��  ��   w �� }��
�� 
Equa } m   � � ~ ~ �    m a r y��   r 7 1 TEST (contrived to fail to test error reporting)    s � � � b   T E S T   ( c o n t r i v e d   t o   f a i l   t o   t e s t   e r r o r   r e p o r t i n g )��   :  � � � l     ��������  ��  ��   �  � � � i    � � � I      �������� 0 test_lowercase  ��  ��   � k     [ � �  � � � I     ��� � � z�� 	
�� .���:AsRenull��� ��� null��   � �� � �
�� 
Valu � l  	  ����� � I  	  � ��� � z�� 
�� .Txt:LowTnull���     ctxt � m     � � � � �  F O � B � R��  ��  ��   � �� ���
�� 
Equa � m     � � � � �  f o � b � r��   �  ��� � X    [ ��� � � I  6 V ��� � � z�� 	
�� .���:AsErnull��� ��� null��   � �� � �
�� 
Args � n  C H � � � 1   D H��
�� 
pcnt � o   C D���� 0 aref aRef � �� ���
�� 
Equa � K   I Q � � �� ����� 0 errornumber errorNumber � m   L O�����Y��  ��  �� 0 aref aRef � J   ! * � �  � � � K   ! % � � �� ����� 0 a   � m   " # � � � � �  f o o��   �  ��� � J   % ( � �  ��� � 1   % &��
�� 
ascr��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i    � � � I      �������� 0 test_capitalize  ��  ��   � k     a � �  � � � I     ��� � � z� 	
� .���:AsRenull��� ��� null��   � �~ � �
�~ 
Valu � l  	  ��}�| � I  	  � ��{ � z�z 
�z .Txt:CapTnull���     ctxt � m     � � � � �  F O � B � R�{  �}  �|   � �y ��x
�y 
Equa � m     � � � � �  F o � b � r�x   �  ��w � X    a ��v � � l  6 \ � � � � I  6 \ ��u � � z�t 	
�t .���:AsErnull��� ��� null�u   � �s � �
�s 
Args � n  C H � � � 1   D H�r
�r 
pcnt � o   C D�q�q 0 aref aRef � �p ��o
�p 
Equa � K   I W � � �n � ��n 0 errornumber errorNumber � m   L O�m�m�Y � �l ��k�l 0 	errortext 	errorText � m   R U � � � � �  w i b b l e�k  �o   �   TEST (ditto)    � � � �    T E S T   ( d i t t o )�v 0 aref aRef � J   ! * � �  � � � K   ! % � � �j ��i�j 0 a   � m   " # � � � � �  f o o�i   �  ��h � J   % ( � �  ��g � 1   % &�f
�f 
ascr�g  �h  �w   �  � � � l     �e�d�c�e  �d  �c   �  � � � i    � � � I      �b ��a�b 0 call_uppercase   �  ��` � o      �_�_ 	0 param  �`  �a   � l     � � � � I     � ��^ � z�] 
�] .Txt:UppTnull���     ctxt � o    �\�\ 	0 param  �^   � X R important: call_NAME handlers contain ONLY the command being tested; nothing else    � � � � �   i m p o r t a n t :   c a l l _ N A M E   h a n d l e r s   c o n t a i n   O N L Y   t h e   c o m m a n d   b e i n g   t e s t e d ;   n o t h i n g   e l s e �  � � � l     �[�Z�Y�[  �Z  �Y   �  � � � i    � � � I      �X ��W�X 0 call_lowercase   �  ��V � o      �U�U 	0 param  �V  �W   � k      � �  � � � l     � � � � L      � � m      � � � � �  w i b b l e �   TEST    � � � � 
   T E S T �  ��T � I    �S  z�R 
�R .Txt:LowTnull���     ctxt o   
 �Q�Q 	0 param  �S  �T   �  l     �P�O�N�P  �O  �N    i    I      �M�L�M 0 call_capitalize   	�K	 o      �J�J 	0 param  �K  �L   I    
�I
 z�H 
�H .Txt:CapTnull���     ctxt o    �G�G 	0 param  �I   �F l     �E�D�C�E  �D  �C  �F   #  l     �B�A�@�B  �A  �@   �? l     �>�=�<�>  �=  �<  �?       �;�;   �:�9
�: 
pimr�9 $0 suite_modifytext suite_ModifyText �8�8    �7�6
�7 
cobj    �5 
�5 
scpt�6   �4�3
�4 
cobj    �2 
�2 
scpt�3   �1 $  �1 $0 suite_modifytext suite_ModifyText 
�0 !"#�0   �/�.�-�,�+�*�)�(�/ 0 setup setUp�. 0 teardown tearDown�- 0 test_uppercase  �, 0 test_lowercase  �+ 0 test_capitalize  �* 0 call_uppercase  �) 0 call_lowercase  �( 0 call_capitalize   �'�&�%�$$%�#�' 0 setup setUp�&  �%  �$  $  %  �# h �"�!� �&'��" 0 teardown tearDown�!  �   �  &  '  � h � <��()�� 0 test_uppercase  �  �  ( �� 0 aref aRef) � �  G�� J��   U W� k���� ����
�	   { ~
� 
scpt
� 
Valu
� .Txt:UppTnull���     ctxt
� 
Equa� 
� .���:AsRenull��� ��� null� 0 a  
� 
ascr
� 
kocl
� 
cobj
� .corecnte****       ****
� 
Args
� 
pcnt� 0 errornumber errorNumber�
�Y
�	 .���:AsErnull��� ��� null� �)��/ *�)��/ �j U��� 	UO)��/ *�)��/ �j U��� 	UO B��l_ kvlv[a a l kh  )�a / *a �a ,�a a l� U[OY��O)�a / *�)�a / 	a j U�a � 	U � ���*+�� 0 test_lowercase  �  �  * �� 0 aref aRef+ � �  ���  ������� ��������� ����������
� 
scpt
� 
Valu
� .Txt:LowTnull���     ctxt
�  
Equa�� 
�� .���:AsRenull��� ��� null�� 0 a  
�� 
ascr
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
Args
�� 
pcnt�� 0 errornumber errorNumber���Y
�� .���:AsErnull��� ��� null� \)��/ *�)��/ �j U��� 	UO <��l�kvlv[��l kh  )�a / *a �a ,�a a l� U[OY��  �� �����,-���� 0 test_capitalize  ��  ��  , ���� 0 aref aRef- �� ��  ����� ������� ��������� ���������� ���
�� 
scpt
�� 
Valu
�� .Txt:CapTnull���     ctxt
�� 
Equa�� 
�� .���:AsRenull��� ��� null�� 0 a  
�� 
ascr
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
Args
�� 
pcnt�� 0 errornumber errorNumber���Y�� 0 	errortext 	errorText
�� .���:AsErnull��� ��� null�� b)��/ *�)��/ �j U��� 	UO B��l�kvlv[��l kh  )�a / *a �a ,�a a a a �� U[OY��! �� �����./���� 0 call_uppercase  �� ��0�� 0  ���� 	0 param  ��  . ���� 	0 param  / �� ��
�� 
scpt
�� .Txt:UppTnull���     ctxt�� )��/ �j U" �� �����12���� 0 call_lowercase  �� ��3�� 3  ���� 	0 param  ��  1 ���� 	0 param  2  ��� ��
�� 
scpt
�� .Txt:LowTnull���     ctxt�� �O)��/ �j U# ������45���� 0 call_capitalize  �� ��6�� 6  ���� 	0 param  ��  4 ���� 	0 param  5 �� ��
�� 
scpt
�� .Txt:CapTnull���     ctxt�� )��/ �j Uascr  ��ޭ