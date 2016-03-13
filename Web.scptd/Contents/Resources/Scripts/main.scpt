FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� Web -- commands for manipulating URLs and sending HTTP requests

TO DO:

- add `normalize URL` handler? see NSURL's standardizedURL(); need to decide if it's worth putting in for users to call directly (note that `split URL` and anything else that uses TypeSupport's asNSURLParameter() already normalizes URLs automatically; OTOH, `join URL` does not)


- what about `split/join URL parameter string`? (see also below)

- how to split path components from parameter strings? RFC2396 allows parameters on all path portions (NSURL only allows parameters after final path portion), so probably also need to rework/rewrite `split/join URL` handlers to support this newer form as standard; see also Python's urllib.parse.urlsplit(), which unlike its older NSURL-like urlparse() function doesn't split parameters from path (although Python doesn't provide a parse function for such paths either, presumably leaving it to users to deal with themselves as needed).

   3.3. Path Component

   The path component contains data, specific to the authority (or the
   scheme if there is no authority component), identifying the resource
   within the scope of that scheme and authority.

      --path          = [ abs_path | opaque_part ]

      --path_segments = segment *( "/" segment )
      --segment       = *pchar *( ";" param )
      --param         = *pchar

      --pchar         = unreserved | escaped | ":" | "@" | "&" | "=" | "+" | "$" | ","

   The path may consist of a sequence of path segments separated by a
   single slash "/" character.  Within a path segment, the characters
   "/", ";", "=", and "?" are reserved.  Each path segment may include a
   sequence of parameters, indicated by the semicolon ";" character.
   The parameters are not significant to the parsing of relative
   references.


- NSURL's component properties don't appear to support generic resource locators, e.g. given "mailto:foo@example.org", NSURL.path returns nil; may be the case that a vanilla parser implemented according to RFC3986 would be a better solution than using NSURL


- `send HTTP request` -- urllib.request.Request(url, data=None, headers={}, origin_req_host=None, unverifiable=False, method=None) [method=GET/POST/PUT/etc]

	- see -[NSURLSession dataTaskWithRequest:] (10.9+) plus NSMutableURLRequest, and NSURL[Data]SessionTask plus NSURLResponse -- main question is whether to make it pure synchronous handler which blocks until completion, or a constructor that returns a script wrapper around NSURLDataSessionTask instance, allowing scripts to monitor progress in their own loops if they wish. The downside of the latter is that persistent NSObjects break SE autosave and AS serialization, but HTTP transfer is relatively specialized compared to, say, dictionary and set objects, so it won't be an everyday task for most users, and may be worth the tradeoff for those that do use it as long as documentation makes this issue clear.

	- Q. need to give some thought to encoding/decoding HTTP request/response body: simplest might be for message body to be either text (i.e. UTF8-encoded text data, where request/response headers concur) or raw data (cRawData='rdat', i.e. �data rdat...�), and leave other encoding/decoding to TextLib (which currently doesn't include transcoding commands, but could provide them if there's a use case)


- commands for converting HTML entities? (&amp;/&lt;/&gt;/&quot;); what about &apos;? what about non-ASCII entities? (decode command would need to handle all entities; encode command could probably just do required entities which is sufficient for use in Unicode [UTF8] encoded documents, possibly providing a Boolean option to encode all non-ASCII entities should users have to produce non-Unicode documents [though this shouldn't be encouraged]); OTOH, one might argue that if users are dealing with HTML content they should use a proper library that understands and processes HTML correctly, and providing commands here for encoding/decoding HTML entities is just encouraging them to hack it (something a stdlib really shouldn't do); given what a mess of complexity it is, might be wisest to leave HTML processing for other libraries to deal with

	- see NSString's stringByApplyingTransform:reverse:, using "Any-Hex/XML;Any-Hex/XML10" to convert "&#x10FFFF;" and "&1114111;" (what about HTML entity names?)

- worth including `encode/decode Base64` commands? (see NSData's base64EncodedStringWithOptions:)

- any other commands needed?

     � 	 	#   W e b   - -   c o m m a n d s   f o r   m a n i p u l a t i n g   U R L s   a n d   s e n d i n g   H T T P   r e q u e s t s 
 
 T O   D O : 
 
 -   a d d   ` n o r m a l i z e   U R L `   h a n d l e r ?   s e e   N S U R L ' s   s t a n d a r d i z e d U R L ( ) ;   n e e d   t o   d e c i d e   i f   i t ' s   w o r t h   p u t t i n g   i n   f o r   u s e r s   t o   c a l l   d i r e c t l y   ( n o t e   t h a t   ` s p l i t   U R L `   a n d   a n y t h i n g   e l s e   t h a t   u s e s   T y p e S u p p o r t ' s   a s N S U R L P a r a m e t e r ( )   a l r e a d y   n o r m a l i z e s   U R L s   a u t o m a t i c a l l y ;   O T O H ,   ` j o i n   U R L `   d o e s   n o t ) 
 
 
 -   w h a t   a b o u t   ` s p l i t / j o i n   U R L   p a r a m e t e r   s t r i n g ` ?   ( s e e   a l s o   b e l o w ) 
 
 -   h o w   t o   s p l i t   p a t h   c o m p o n e n t s   f r o m   p a r a m e t e r   s t r i n g s ?   R F C 2 3 9 6   a l l o w s   p a r a m e t e r s   o n   a l l   p a t h   p o r t i o n s   ( N S U R L   o n l y   a l l o w s   p a r a m e t e r s   a f t e r   f i n a l   p a t h   p o r t i o n ) ,   s o   p r o b a b l y   a l s o   n e e d   t o   r e w o r k / r e w r i t e   ` s p l i t / j o i n   U R L `   h a n d l e r s   t o   s u p p o r t   t h i s   n e w e r   f o r m   a s   s t a n d a r d ;   s e e   a l s o   P y t h o n ' s   u r l l i b . p a r s e . u r l s p l i t ( ) ,   w h i c h   u n l i k e   i t s   o l d e r   N S U R L - l i k e   u r l p a r s e ( )   f u n c t i o n   d o e s n ' t   s p l i t   p a r a m e t e r s   f r o m   p a t h   ( a l t h o u g h   P y t h o n   d o e s n ' t   p r o v i d e   a   p a r s e   f u n c t i o n   f o r   s u c h   p a t h s   e i t h e r ,   p r e s u m a b l y   l e a v i n g   i t   t o   u s e r s   t o   d e a l   w i t h   t h e m s e l v e s   a s   n e e d e d ) . 
 
       3 . 3 .   P a t h   C o m p o n e n t 
 
       T h e   p a t h   c o m p o n e n t   c o n t a i n s   d a t a ,   s p e c i f i c   t o   t h e   a u t h o r i t y   ( o r   t h e 
       s c h e m e   i f   t h e r e   i s   n o   a u t h o r i t y   c o m p o n e n t ) ,   i d e n t i f y i n g   t h e   r e s o u r c e 
       w i t h i n   t h e   s c o p e   o f   t h a t   s c h e m e   a n d   a u t h o r i t y . 
 
             - - p a t h                     =   [   a b s _ p a t h   |   o p a q u e _ p a r t   ] 
 
             - - p a t h _ s e g m e n t s   =   s e g m e n t   * (   " / "   s e g m e n t   ) 
             - - s e g m e n t               =   * p c h a r   * (   " ; "   p a r a m   ) 
             - - p a r a m                   =   * p c h a r 
 
             - - p c h a r                   =   u n r e s e r v e d   |   e s c a p e d   |   " : "   |   " @ "   |   " & "   |   " = "   |   " + "   |   " $ "   |   " , " 
 
       T h e   p a t h   m a y   c o n s i s t   o f   a   s e q u e n c e   o f   p a t h   s e g m e n t s   s e p a r a t e d   b y   a 
       s i n g l e   s l a s h   " / "   c h a r a c t e r .     W i t h i n   a   p a t h   s e g m e n t ,   t h e   c h a r a c t e r s 
       " / " ,   " ; " ,   " = " ,   a n d   " ? "   a r e   r e s e r v e d .     E a c h   p a t h   s e g m e n t   m a y   i n c l u d e   a 
       s e q u e n c e   o f   p a r a m e t e r s ,   i n d i c a t e d   b y   t h e   s e m i c o l o n   " ; "   c h a r a c t e r . 
       T h e   p a r a m e t e r s   a r e   n o t   s i g n i f i c a n t   t o   t h e   p a r s i n g   o f   r e l a t i v e 
       r e f e r e n c e s . 
 
 
 -   N S U R L ' s   c o m p o n e n t   p r o p e r t i e s   d o n ' t   a p p e a r   t o   s u p p o r t   g e n e r i c   r e s o u r c e   l o c a t o r s ,   e . g .   g i v e n   " m a i l t o : f o o @ e x a m p l e . o r g " ,   N S U R L . p a t h   r e t u r n s   n i l ;   m a y   b e   t h e   c a s e   t h a t   a   v a n i l l a   p a r s e r   i m p l e m e n t e d   a c c o r d i n g   t o   R F C 3 9 8 6   w o u l d   b e   a   b e t t e r   s o l u t i o n   t h a n   u s i n g   N S U R L 
 
 
 -   ` s e n d   H T T P   r e q u e s t `   - -   u r l l i b . r e q u e s t . R e q u e s t ( u r l ,   d a t a = N o n e ,   h e a d e r s = { } ,   o r i g i n _ r e q _ h o s t = N o n e ,   u n v e r i f i a b l e = F a l s e ,   m e t h o d = N o n e )   [ m e t h o d = G E T / P O S T / P U T / e t c ] 
 
 	 -   s e e   - [ N S U R L S e s s i o n   d a t a T a s k W i t h R e q u e s t : ]   ( 1 0 . 9 + )   p l u s   N S M u t a b l e U R L R e q u e s t ,   a n d   N S U R L [ D a t a ] S e s s i o n T a s k   p l u s   N S U R L R e s p o n s e   - -   m a i n   q u e s t i o n   i s   w h e t h e r   t o   m a k e   i t   p u r e   s y n c h r o n o u s   h a n d l e r   w h i c h   b l o c k s   u n t i l   c o m p l e t i o n ,   o r   a   c o n s t r u c t o r   t h a t   r e t u r n s   a   s c r i p t   w r a p p e r   a r o u n d   N S U R L D a t a S e s s i o n T a s k   i n s t a n c e ,   a l l o w i n g   s c r i p t s   t o   m o n i t o r   p r o g r e s s   i n   t h e i r   o w n   l o o p s   i f   t h e y   w i s h .   T h e   d o w n s i d e   o f   t h e   l a t t e r   i s   t h a t   p e r s i s t e n t   N S O b j e c t s   b r e a k   S E   a u t o s a v e   a n d   A S   s e r i a l i z a t i o n ,   b u t   H T T P   t r a n s f e r   i s   r e l a t i v e l y   s p e c i a l i z e d   c o m p a r e d   t o ,   s a y ,   d i c t i o n a r y   a n d   s e t   o b j e c t s ,   s o   i t   w o n ' t   b e   a n   e v e r y d a y   t a s k   f o r   m o s t   u s e r s ,   a n d   m a y   b e   w o r t h   t h e   t r a d e o f f   f o r   t h o s e   t h a t   d o   u s e   i t   a s   l o n g   a s   d o c u m e n t a t i o n   m a k e s   t h i s   i s s u e   c l e a r . 
 
 	 -   Q .   n e e d   t o   g i v e   s o m e   t h o u g h t   t o   e n c o d i n g / d e c o d i n g   H T T P   r e q u e s t / r e s p o n s e   b o d y :   s i m p l e s t   m i g h t   b e   f o r   m e s s a g e   b o d y   t o   b e   e i t h e r   t e x t   ( i . e .   U T F 8 - e n c o d e d   t e x t   d a t a ,   w h e r e   r e q u e s t / r e s p o n s e   h e a d e r s   c o n c u r )   o r   r a w   d a t a   ( c R a w D a t a = ' r d a t ' ,   i . e .   � d a t a   r d a t . . . � ) ,   a n d   l e a v e   o t h e r   e n c o d i n g / d e c o d i n g   t o   T e x t L i b   ( w h i c h   c u r r e n t l y   d o e s n ' t   i n c l u d e   t r a n s c o d i n g   c o m m a n d s ,   b u t   c o u l d   p r o v i d e   t h e m   i f   t h e r e ' s   a   u s e   c a s e ) 
 
 
 -   c o m m a n d s   f o r   c o n v e r t i n g   H T M L   e n t i t i e s ?   ( & a m p ; / & l t ; / & g t ; / & q u o t ; ) ;   w h a t   a b o u t   & a p o s ; ?   w h a t   a b o u t   n o n - A S C I I   e n t i t i e s ?   ( d e c o d e   c o m m a n d   w o u l d   n e e d   t o   h a n d l e   a l l   e n t i t i e s ;   e n c o d e   c o m m a n d   c o u l d   p r o b a b l y   j u s t   d o   r e q u i r e d   e n t i t i e s   w h i c h   i s   s u f f i c i e n t   f o r   u s e   i n   U n i c o d e   [ U T F 8 ]   e n c o d e d   d o c u m e n t s ,   p o s s i b l y   p r o v i d i n g   a   B o o l e a n   o p t i o n   t o   e n c o d e   a l l   n o n - A S C I I   e n t i t i e s   s h o u l d   u s e r s   h a v e   t o   p r o d u c e   n o n - U n i c o d e   d o c u m e n t s   [ t h o u g h   t h i s   s h o u l d n ' t   b e   e n c o u r a g e d ] ) ;   O T O H ,   o n e   m i g h t   a r g u e   t h a t   i f   u s e r s   a r e   d e a l i n g   w i t h   H T M L   c o n t e n t   t h e y   s h o u l d   u s e   a   p r o p e r   l i b r a r y   t h a t   u n d e r s t a n d s   a n d   p r o c e s s e s   H T M L   c o r r e c t l y ,   a n d   p r o v i d i n g   c o m m a n d s   h e r e   f o r   e n c o d i n g / d e c o d i n g   H T M L   e n t i t i e s   i s   j u s t   e n c o u r a g i n g   t h e m   t o   h a c k   i t   ( s o m e t h i n g   a   s t d l i b   r e a l l y   s h o u l d n ' t   d o ) ;   g i v e n   w h a t   a   m e s s   o f   c o m p l e x i t y   i t   i s ,   m i g h t   b e   w i s e s t   t o   l e a v e   H T M L   p r o c e s s i n g   f o r   o t h e r   l i b r a r i e s   t o   d e a l   w i t h 
 
 	 -   s e e   N S S t r i n g ' s   s t r i n g B y A p p l y i n g T r a n s f o r m : r e v e r s e : ,   u s i n g   " A n y - H e x / X M L ; A n y - H e x / X M L 1 0 "   t o   c o n v e r t   " & # x 1 0 F F F F ; "   a n d   " & 1 1 1 4 1 1 1 ; "   ( w h a t   a b o u t   H T M L   e n t i t y   n a m e s ? ) 
 
 -   w o r t h   i n c l u d i n g   ` e n c o d e / d e c o d e   B a s e 6 4 `   c o m m a n d s ?   ( s e e   N S D a t a ' s   b a s e 6 4 E n c o d e d S t r i n g W i t h O p t i o n s : ) 
 
 -   a n y   o t h e r   c o m m a n d s   n e e d e d ? 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �      s u p p o r t     !   l     ��������  ��  ��   !  " # " l      $ % & $ j    �� '�� 0 _support   ' N     ( ( 4    �� )
�� 
scpt ) m     * * � + +  T y p e S u p p o r t % "  used for parameter checking    & � , , 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g #  - . - l     ��������  ��  ��   .  / 0 / l     ��������  ��  ��   0  1 2 1 i    3 4 3 I      �� 5���� 
0 _error   5  6 7 6 o      ���� 0 handlername handlerName 7  8 9 8 o      ���� 0 etext eText 9  : ; : o      ���� 0 enumber eNumber ;  < = < o      ���� 0 efrom eFrom =  >�� > o      ���� 
0 eto eTo��  ��   4 n     ? @ ? I    �� A���� &0 throwcommanderror throwCommandError A  B C B m     D D � E E  W e b C  F G F o    ���� 0 handlername handlerName G  H I H o    ���� 0 etext eText I  J K J o    	���� 0 enumber eNumber K  L M L o   	 
���� 0 efrom eFrom M  N�� N o   
 ���� 
0 eto eTo��  ��   @ o     ���� 0 _support   2  O P O l     ��������  ��  ��   P  Q R Q l     ��������  ��  ��   R  S T S l     �� U V��   U J D--------------------------------------------------------------------    V � W W � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - T  X Y X l     �� Z [��   Z   URL conversion    [ � \ \    U R L   c o n v e r s i o n Y  ] ^ ] l     ��������  ��  ��   ^  _ ` _ l     �� a b��   a copied from Python's urllib.parse module (hardcoded blacklists/whitelists are always problematic as they need to be manually maintained and updated as new protocols arise, but this one seems unavoidable); used to determine when `join URL` should insert "//"    b � c c   c o p i e d   f r o m   P y t h o n ' s   u r l l i b . p a r s e   m o d u l e   ( h a r d c o d e d   b l a c k l i s t s / w h i t e l i s t s   a r e   a l w a y s   p r o b l e m a t i c   a s   t h e y   n e e d   t o   b e   m a n u a l l y   m a i n t a i n e d   a n d   u p d a t e d   a s   n e w   p r o t o c o l s   a r i s e ,   b u t   t h i s   o n e   s e e m s   u n a v o i d a b l e ) ;   u s e d   t o   d e t e r m i n e   w h e n   ` j o i n   U R L `   s h o u l d   i n s e r t   " / / " `  d e d j    N�� f�� 0 _usesnetloc _usesNetLoc f J    M g g  h i h m     j j � k k  f t p i  l m l m     n n � o o  h t t p m  p q p m     r r � s s  g o p h e r q  t u t m     v v � w w  n n t p u  x y x m     z z � { {  t e l n e t y  | } | m     ~ ~ �    i m a p }  � � � m     � � � � �  w a i s �  � � � m     � � � � �  f i l e �  � � � m     � � � � �  m m s �  � � � m    " � � � � � 
 h t t p s �  � � � m   " % � � � � � 
 s h t t p �  � � � m   % ( � � � � � 
 s n e w s �  � � � m   ( + � � � � �  p r o s p e r o �  � � � m   + . � � � � �  r t s p �  � � � m   . 1 � � � � � 
 r t s p u �  � � � m   1 4 � � � � � 
 r s y n c �  � � � m   4 7 � � � � �   �  � � � m   7 : � � � � �  s v n �  � � � m   : = � � � � �  s v n + s s h �  � � � m   = @ � � � � �  s f t p �  � � � m   @ C � � � � �  n f s �  � � � m   C F � � � � �  g i t �  ��� � m   F I � � � � �  g i t + s s h��   e  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  O R � � � I      �� ����� 0 _ascomponent _asComponent �  ��� � o      ���� 0 
asocstring 
asocString��  ��   � k      � �  � � � Z     � ����� � =     � � � o     ���� 0 
asocstring 
asocString � m    ��
�� 
msng � L     � � m     � � � � �  ��  ��   �  ��� � L     � � c     � � � o    ���� 0 
asocstring 
asocString � m    ��
�� 
ctxt��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  S V � � � I      �� ����� ,0 _joinnetworklocation _joinNetworkLocation �  ��� � o      ���� .0 networklocationrecord networkLocationRecord��  ��   � k    $ � �  � � � r      � � � n     � � � I    �� ����� 60 asoptionalrecordparameter asOptionalRecordParameter �  � � � o    ���� .0 networklocationrecord networkLocationRecord �  � � � K     � � �� � ��� 0 username userName � m     � � � � �   � �� � ��� 0 userpassword userPassword � m   	 
 � � � � �   � �� � ��� 0 hostname hostName � m     � � � � �   � �� ����� 0 
portnumber 
portNumber � m     � � �    ��   � �� m     �  ��  ��   � o     ���� 0 _support   � o      ���� $0 fullnetlocrecord fullNetLocRecord �  r    . n    ,	 J    ,

  o    ���� 0 username userName  o     ���� 0 userpassword userPassword  o   " $���� 0 hostname hostName �� o   & (���� 0 
portnumber 
portNumber��  	 o    ���� $0 fullnetlocrecord fullNetLocRecord o      ���� 0 urlcomponents urlComponents  X   / ��� Q   ? � r   B M c   B I n  B E 1   C E��
�� 
pcnt o   B C���� 0 aref aRef m   E H��
�� 
ctxt n       1   J L��
�� 
pcnt  o   I J���� 0 aref aRef R      ����!
�� .ascrerr ****      � ****��  ! ��"��
�� 
errn" d      ## m      �������   R   U ���$%
�� .ascrerr ****      � ****$ b   a �&'& b   a |()( m   a d** �++ D I n v a l i d   n e t w o r k   l o c a t i o n   r e c o r d   ( ) l  d {,����, n   d {-.- 4   r {��/
�� 
cobj/ l  s z0����0 [   s z121 l  s x3����3 n   s x454 1   t x��
�� 
leng5 o   s t���� 0 urlcomponents urlComponents��  ��  2 m   x y���� ��  ��  . J   d r66 787 m   d g99 �::  u s e r N a m e8 ;<; m   g j== �>>  u s e r P a s s w o r d< ?@? m   j mAA �BB  h o s t N a m e@ C��C m   m pDD �EE  p o r t N u m b e r��  ��  ��  ' m   | FF �GG 0    p r o p e r t y   i s   n o t   t e x t ) .% ��HI
�� 
errnH m   Y \�����YI �J�~
� 
erobJ o   _ `�}�} 0 	urlrecord 	urlRecord�~  �� 0 aref aRef o   2 3�|�| 0 urlcomponents urlComponents KLK r   � �MNM o   � ��{�{ 0 urlcomponents urlComponentsN J      OO PQP o      �z�z 0 username userNameQ RSR o      �y�y 0 userpassword userPasswordS TUT o      �x�x 0 hostname hostNameU V�wV o      �v�v 0 
portnumber 
portNumber�w  L WXW l  � ��uYZ�u  Y F @ TO DO: if userName is "" and userPassword is not "" then error?   Z �[[ �   T O   D O :   i f   u s e r N a m e   i s   " "   a n d   u s e r P a s s w o r d   i s   n o t   " "   t h e n   e r r o r ?X \]\ Z  � �^_�t�s^ >  � �`a` o   � ��r�r 0 userpassword userPassworda m   � �bb �cc  _ r   � �ded b   � �fgf b   � �hih o   � ��q�q 0 username userNamei m   � �jj �kk  :g o   � ��p�p 0 userpassword userPassworde o      �o�o 0 username userName�t  �s  ] lml Z  � �no�n�mn >  � �pqp o   � ��l�l 0 username userNameq m   � �rr �ss  o r   � �tut b   � �vwv o   � ��k�k 0 username userNamew m   � �xx �yy  @u o      �j�j 0 username userName�n  �m  m z{z Z  �|}�i�h| F   � �~~ =  � ���� o   � ��g�g 0 hostname hostName� m   � ��� ���   H   � ��� l  � ���f�e� F   � ���� =  � ���� o   � ��d�d 0 username userName� m   � ��� ���  � =  � ���� o   � ��c�c 0 
portnumber 
portNumber� m   � ��� ���  �f  �e  } R   ��b��
�b .ascrerr ****      � ****� m   � �� ��� | I n v a l i d   n e t w o r k   l o c a t i o n   r e c o r d   ( m i s s i n g    h o s t N a m e    p r o p e r t y ) .� �a��
�a 
errn� m   � ��`�`�Y� �_��^
�_ 
erob� o   � ��]�] 0 	urlrecord 	urlRecord�^  �i  �h  { ��� r  ��� b  	��� o  �\�\ 0 username userName� o  �[�[ 0 hostname hostName� o      �Z�Z 0 hostname hostName� ��� Z !���Y�X� > ��� o  �W�W 0 
portnumber 
portNumber� m  �� ���  � r  ��� b  ��� b  ��� o  �V�V 0 hostname hostName� m  �� ���  :� o  �U�U 0 
portnumber 
portNumber� o      �T�T 0 hostname hostName�Y  �X  � ��S� L  "$�� o  "#�R�R 0 hostname hostName�S   � ��� l     �Q�P�O�Q  �P  �O  � ��� l     �N�M�L�N  �M  �L  � ��� l     �K���K  �  -----   � ��� 
 - - - - -� ��� l     �J�I�H�J  �I  �H  � ��� i  W Z��� I     �G��
�G .Web:SplUnull���     ctxt� o      �F�F 0 urltext urlText� �E��D
�E 
NeLo� |�C�B��A��C  �B  � o      �@�@ ,0 splitnetworklocation splitNetworkLocation�A  � l     ��?�>� m      �=
�= boovfals�?  �>  �D  � Q     ����� k    ��� ��� r    ��� n   ��� I    �<��;�< $0 asnsurlparameter asNSURLParameter� ��� o    	�:�: 0 urltext urlText� ��9� m   	 
�� ���  �9  �;  � o    �8�8 0 _support  � o      �7�7 0 asocurl asocURL� ��� l   �6���6  �+% TO DO: NSURL doesn't seem to support newer RFC2396 which allows parameters on all path components, so probably have to rework this to re-join resourcePath with parameterString (eliminating parameterString property), or else replace with vanilla URL parser (which might be simpler in practice)   � ���J   T O   D O :   N S U R L   d o e s n ' t   s e e m   t o   s u p p o r t   n e w e r   R F C 2 3 9 6   w h i c h   a l l o w s   p a r a m e t e r s   o n   a l l   p a t h   c o m p o n e n t s ,   s o   p r o b a b l y   h a v e   t o   r e w o r k   t h i s   t o   r e - j o i n   r e s o u r c e P a t h   w i t h   p a r a m e t e r S t r i n g   ( e l i m i n a t i n g   p a r a m e t e r S t r i n g   p r o p e r t y ) ,   o r   e l s e   r e p l a c e   w i t h   v a n i l l a   U R L   p a r s e r   ( w h i c h   m i g h t   b e   s i m p l e r   i n   p r a c t i c e )� ��� r    A��� K    ?�� �5���5 0 username userName� I    �4��3�4 0 _ascomponent _asComponent� ��2� n   ��� I    �1�0�/�1 0 user  �0  �/  � o    �.�. 0 asocurl asocURL�2  �3  � �-���- 0 userpassword userPassword� I    '�,��+�, 0 _ascomponent _asComponent� ��*� n   #��� I    #�)�(�'�) 0 password  �(  �'  � o    �&�& 0 asocurl asocURL�*  �+  � �%���% 0 hostname hostName� I   ( 2�$��#�$ 0 _ascomponent _asComponent� ��"� n  ) .��� I   * .�!� ��! 0 host  �   �  � o   ) *�� 0 asocurl asocURL�"  �#  � ���� 0 
portnumber 
portNumber� I   3 =���� 0 _ascomponent _asComponent� ��� n  4 9��� I   5 9���� 0 port  �  �  � o   4 5�� 0 asocurl asocURL�  �  �  � o      �� "0 networklocation networkLocation� ��� Z   B ]����� H   B N�� n  B M��� I   G M���� (0 asbooleanparameter asBooleanParameter� ��� o   G H�� ,0 splitnetworklocation splitNetworkLocation� ��� m   H I   � . n e t w o r k   l o c a t i o n   r e c o r d�  �  � o   B G�� 0 _support  � r   Q Y I   Q W��� ,0 _joinnetworklocation _joinNetworkLocation �
 o   R S�	�	 "0 networklocation networkLocation�
  �   o      �� "0 networklocation networkLocation�  �  � � L   ^ � K   ^ � �	
� 0 	urlscheme 	urlScheme	 I   _ i��� 0 _ascomponent _asComponent � n  ` e I   a e��� � 
0 scheme  �  �    o   ` a���� 0 asocurl asocURL�  �  
 ���� "0 networklocation networkLocation o   l m���� "0 networklocation networkLocation ���� 0 resourcepath resourcePath I   p z������ 0 _ascomponent _asComponent �� n  q v I   r v�������� 0 path  ��  ��   o   q r���� 0 asocurl asocURL��  ��   ���� "0 parameterstring parameterString I   } ������� 0 _ascomponent _asComponent �� n  ~ � I    ��������� "0 parameterstring parameterString��  ��   o   ~ ���� 0 asocurl asocURL��  ��   ���� 0 querystring queryString I   � ������� 0 _ascomponent _asComponent  ��  n  � �!"! I   � ��������� 	0 query  ��  ��  " o   � ����� 0 asocurl asocURL��  ��   ��#���� (0 fragmentidentifier fragmentIdentifier# I   � ���$���� 0 _ascomponent _asComponent$ %��% n  � �&'& I   � ��������� 0 fragment  ��  ��  ' o   � ����� 0 asocurl asocURL��  ��  ��  �  � R      ��()
�� .ascrerr ****      � ****( o      ���� 0 etext eText) ��*+
�� 
errn* o      ���� 0 enumber eNumber+ ��,-
�� 
erob, o      ���� 0 efrom eFrom- ��.��
�� 
errt. o      ���� 
0 eto eTo��  � I   � ���/���� 
0 _error  / 010 m   � �22 �33  s p l i t   U R L1 454 o   � ����� 0 etext eText5 676 o   � ����� 0 enumber eNumber7 898 o   � ����� 0 efrom eFrom9 :��: o   � ����� 
0 eto eTo��  ��  � ;<; l     ��������  ��  ��  < =>= l     ��������  ��  ��  > ?@? l     ��������  ��  ��  @ ABA i  [ ^CDC I     ��EF
�� .Web:JoiUnull���     WebCE o      ���� 0 	urlrecord 	urlRecordF ��G��
�� 
BaseG |����H��I��  ��  H o      ���� 0 baseurl baseURL��  I l     J����J m      KK �LL  ��  ��  ��  D l   |MNOM Q    |PQRP P   dSTUS k   cVV WXW Z   YZ��[Y >    \]\ l   ^����^ I   ��_`
�� .corecnte****       ****_ J    aa b��b o    	���� 0 	urlrecord 	urlRecord��  ` ��c��
�� 
koclc m    ��
�� 
reco��  ��  ��  ] m    ����  Z k   �dd efe l   ��gh��  g 0 * TO DO: see above TODO re. parameterString   h �ii T   T O   D O :   s e e   a b o v e   T O D O   r e .   p a r a m e t e r S t r i n gf jkj r    7lml n   5non I    5��p���� 60 asoptionalrecordparameter asOptionalRecordParameterp qrq o    ���� 0 	urlrecord 	urlRecordr sts K    .uu ��vw�� 0 	urlscheme 	urlSchemev m    xx �yy  w ��z{�� "0 networklocation networkLocationz m     || �}}  { ��~�� 0 resourcepath resourcePath~ m   ! "�� ���   ������ "0 parameterstring parameterString� m   # $�� ���  � ������ 0 querystring queryString� m   % &�� ���  � ������� (0 fragmentidentifier fragmentIdentifier� m   ' *�� ���  ��  t ���� m   . 1�� ���  ��  ��  o o    ���� 0 _support  m o      ���� 0 fullurlrecord fullURLRecordk ��� r   8 T��� n   8 R��� J   9 R�� ��� o   : <���� 0 	urlscheme 	urlScheme� ��� o   > @���� 0 resourcepath resourcePath� ��� o   B D���� "0 parameterstring parameterString� ��� o   F H���� 0 querystring queryString� ���� o   J L���� (0 fragmentidentifier fragmentIdentifier��  � o   8 9���� 0 fullurlrecord fullURLRecord� o      ���� 0 urlcomponents urlComponents� ��� X   U ������ Q   g ����� r   j y��� c   j s��� n  j o��� 1   k o��
�� 
pcnt� o   j k���� 0 aref aRef� m   o r��
�� 
ctxt� n     ��� 1   t x��
�� 
pcnt� o   s t���� 0 aref aRef� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � n  � ���� I   � �������� .0 throwinvalidparameter throwInvalidParameter� ��� o   � ����� 0 	urlrecord 	urlRecord� ��� m   � ��� ���  � ��� m   � ���
�� 
reco� ���� b   � ���� b   � ���� m   � ��� ��� 2 U R L   c o m p o n e n t s   r e c o r d  s   � l  � ������� n   � ���� 4   � ����
�� 
cobj� l  � ������� [   � ���� l  � ������� n   � ���� 1   � ���
�� 
leng� o   � ����� 0 urlcomponents urlComponents��  ��  � m   � ��� ��  ��  � J   � ��� ��� m   � ��� ���  u r l S c h e m e� ��� m   � ��� ���  r e s o u r c e P a t h� ��� m   � ��� ���  p a r a m e t e r S t r i n g� ��� m   � ��� ���  q u e r y S t r i n g� ��~� m   � ��� ��� $ f r a g m e n t I d e n t i f i e r�~  ��  ��  � m   � ��� ��� .    p r o p e r t y   i s   n o t   t e x t .��  ��  � o   � ��}�} 0 _support  �� 0 aref aRef� o   X Y�|�| 0 urlcomponents urlComponents� ��� r   � ���� o   � ��{�{ 0 urlcomponents urlComponents� J      �� ��� o      �z�z 0 	urlscheme 	urlScheme� ��� o      �y�y 0 resourcepath resourcePath� ��� o      �x�x "0 parameterstring parameterString� ��� o      �w�w 0 querystring queryString� ��v� o      �u�u (0 fragmentidentifier fragmentIdentifier�v  � ��� Z   �5���t�� >   � ���� l  � ���s�r� I  � ��q��
�q .corecnte****       ****� J   � ��� ��p� n  � ���� o   � ��o�o "0 networklocation networkLocation� o   � ��n�n 0 fullurlrecord fullURLRecord�p  � �m �l
�m 
kocl  m   � ��k
�k 
reco�l  �s  �r  � m   � ��j�j  � r   I  	�i�h�i ,0 _joinnetworklocation _joinNetworkLocation �g n  o  �f�f "0 networklocation networkLocation o  �e�e 0 fullurlrecord fullURLRecord�g  �h   o      �d�d "0 networklocation networkLocation�t  � Q  5	 r  

 c   n  o  �c�c "0 networklocation networkLocation o  �b�b 0 fullurlrecord fullURLRecord m  �a
�a 
ctxt o      �`�` "0 networklocation networkLocation R      �_�^
�_ .ascrerr ****      � ****�^   �]�\
�] 
errn d       m      �[�[��\  	 n "5 I  '5�Z�Y�Z .0 throwinvalidparameter throwInvalidParameter  o  '(�X�X 0 	urlrecord 	urlRecord  m  (+ �    m  +,�W
�W 
reco �V m  ,/ �   ~ U R L   c o m p o n e n t s   r e c o r d  s    n e t w o r k L o c a t i o n    p r o p e r t y   i s   n o t   t e x t .�V  �Y   o  "'�U�U 0 _support  � !"! l 6C#$%# r  6C&'& I 6A�T()
�T .Web:EscUnull���     ctxt( o  67�S�S 0 resourcepath resourcePath) �R*�Q
�R 
Safe* m  :=++ �,,  /�Q  ' o      �P�P 0 resourcepath resourcePath$ s m `split URL` (i.e. NSURL) automatically decodes % escapes in resource path, so automatically encode them here   % �-- �   ` s p l i t   U R L `   ( i . e .   N S U R L )   a u t o m a t i c a l l y   d e c o d e s   %   e s c a p e s   i n   r e s o u r c e   p a t h ,   s o   a u t o m a t i c a l l y   e n c o d e   t h e m   h e r e" ./. Z  D�01�O20 G  Dp343 > DI565 o  DE�N�N "0 networklocation networkLocation6 m  EH77 �88  4 l Ll9�M�L9 F  Ll:;: F  L_<=< > LQ>?> o  LM�K�K 0 	urlscheme 	urlScheme? m  MP@@ �AA  = E T[BCB o  TY�J�J 0 _usesnetloc _usesNetLocC o  YZ�I�I 0 	urlscheme 	urlScheme; H  bhDD C  bgEFE o  bc�H�H 0 resourcepath resourcePathF m  cfGG �HH  / /�M  �L  1 l s�IJKI k  s�LL MNM Z s�OP�G�FO F  s�QRQ > sxSTS o  st�E�E 0 resourcepath resourcePathT m  twUU �VV  R H  {�WW C  {�XYX o  {|�D�D 0 resourcepath resourcePathY m  |ZZ �[[  /P r  ��\]\ b  ��^_^ m  ��`` �aa  /_ o  ���C�C 0 resourcepath resourcePath] o      �B�B 0 resourcepath resourcePath�G  �F  N b�Ab r  ��cdc b  ��efe b  ��ghg m  ��ii �jj  / /h o  ���@�@ "0 networklocation networkLocationf o  ���?�? 0 resourcepath resourcePathd o      �>�> 0 urltext urlText�A  J / ) copied from Python's urllib.parse module   K �kk R   c o p i e d   f r o m   P y t h o n ' s   u r l l i b . p a r s e   m o d u l e�O  2 r  ��lml o  ���=�= 0 resourcepath resourcePathm o      �<�< 0 urltext urlText/ non Z ��pq�;�:p > ��rsr o  ���9�9 0 	urlscheme 	urlSchemes m  ��tt �uu  q r  ��vwv b  ��xyx b  ��z{z o  ���8�8 0 	urlscheme 	urlScheme{ m  ��|| �}}  :y o  ���7�7 0 urltext urlTextw o      �6�6 0 urltext urlText�;  �:  o ~~ Z �����5�4� > ����� o  ���3�3 "0 parameterstring parameterString� m  ���� ���  � r  ����� b  ����� b  ����� o  ���2�2 0 urltext urlText� m  ���� ���  ;� o  ���1�1 "0 parameterstring parameterString� o      �0�0 0 urltext urlText�5  �4   ��� Z �����/�.� > ����� o  ���-�- 0 querystring queryString� m  ���� ���  � r  ����� b  ����� b  ����� o  ���,�, 0 urltext urlText� m  ���� ���  ?� o  ���+�+ 0 querystring queryString� o      �*�* 0 urltext urlText�/  �.  � ��)� Z �����(�'� > ����� o  ���&�& (0 fragmentidentifier fragmentIdentifier� m  ���� ���  � r  ����� b  ����� b  ����� o  ���%�% 0 urltext urlText� m  ���� ���  #� o  ���$�$ (0 fragmentidentifier fragmentIdentifier� o      �#�# 0 urltext urlText�(  �'  �)  ��  [ l ����� r  ���� n ���� I  �"��!�" "0 astextparameter asTextParameter� ��� o  � �  0 	urlrecord 	urlRecord� ��� m  �� ���  �  �!  � o  ��� 0 _support  � o      �� 0 urltext urlText� M G assume it's a relative URL string that's going to be joined to baseURL   � ��� �   a s s u m e   i t ' s   a   r e l a t i v e   U R L   s t r i n g   t h a t ' s   g o i n g   t o   b e   j o i n e d   t o   b a s e U R LX ��� Z  `����� > ��� o  �� 0 baseurl baseURL� m  �� ���  � k  \�� ��� r  %��� n #��� I  #���� $0 asnsurlparameter asNSURLParameter� ��� o  �� 0 baseurl baseURL� ��� m  �� ���  u s i n g   b a s e   U R L�  �  � o  �� 0 _support  � o      �� 0 baseurl baseURL� ��� r  &5��� n &3��� I  -3���� <0 urlwithstring_relativetourl_ URLWithString_relativeToURL_� ��� o  -.�� 0 urltext urlText� ��� o  ./�� 0 baseurl baseURL�  �  � n &-��� o  )-�� 0 nsurl NSURL� m  &)�
� misccura� o      �� 0 asocurl asocURL� ��� Z 6T����
� = 6;��� o  67�	�	 0 asocurl asocURL� m  7:�
� 
msng� R  >P���
� .ascrerr ****      � ****� m  LO�� ���   N o t   a   v a l i d   U R L .� ���
� 
errn� m  BE���Y� ���
� 
erob� o  HI�� 0 urltext urlText�  �  �
  � ��� r  U\��� c  UZ��� o  UV� �  0 asocurl asocURL� m  VY��
�� 
ctxt� o      ���� 0 urltext urlText�  �  �  � ���� L  ac�� o  ab���� 0 urltext urlText��  T ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  U ����
�� consnume��  Q R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  R I  l|������� 
0 _error  � ��� m  mp�� ���  j o i n   U R L�    o  pq���� 0 etext eText  o  qr���� 0 enumber eNumber  o  rs���� 0 efrom eFrom �� o  sv���� 
0 eto eTo��  ��  N S M TO DO: if baseURL is given, direct parameter should be either record or text   O � �   T O   D O :   i f   b a s e U R L   i s   g i v e n ,   d i r e c t   p a r a m e t e r   s h o u l d   b e   e i t h e r   r e c o r d   o r   t e x tB 	 l     ��������  ��  ��  	 

 l     ��������  ��  ��    l     ����   J D--------------------------------------------------------------------    � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ����   7 1 encode/decode '%XX' escapes (UTF8 encoding only)    � b   e n c o d e / d e c o d e   ' % X X '   e s c a p e s   ( U T F 8   e n c o d i n g   o n l y )  l     ��������  ��  ��    l      ����  `Z From RFC2396:
	
   2.3. Unreserved Characters

   Data characters that are allowed in a URI but do not have a reserved
   purpose are called unreserved.  These include upper and lower case
   letters, decimal digits, and a limited set of punctuation marks and
   symbols.

      --unreserved  = alphanum | mark

      --mark        = "-" | "_" | "." | "!" | "~" | "*" | "'" | "(" | ")"

   Unreserved characters can be escaped without changing the semantics
   of the URI, but this should not be done unless the URI is being used
   in a context that does not allow the unescaped character to appear.
    ��   F r o m   R F C 2 3 9 6 : 
 	 
       2 . 3 .   U n r e s e r v e d   C h a r a c t e r s 
 
       D a t a   c h a r a c t e r s   t h a t   a r e   a l l o w e d   i n   a   U R I   b u t   d o   n o t   h a v e   a   r e s e r v e d 
       p u r p o s e   a r e   c a l l e d   u n r e s e r v e d .     T h e s e   i n c l u d e   u p p e r   a n d   l o w e r   c a s e 
       l e t t e r s ,   d e c i m a l   d i g i t s ,   a n d   a   l i m i t e d   s e t   o f   p u n c t u a t i o n   m a r k s   a n d 
       s y m b o l s . 
 
             - - u n r e s e r v e d     =   a l p h a n u m   |   m a r k 
 
             - - m a r k                 =   " - "   |   " _ "   |   " . "   |   " ! "   |   " ~ "   |   " * "   |   " ' "   |   " ( "   |   " ) " 
 
       U n r e s e r v e d   c h a r a c t e r s   c a n   b e   e s c a p e d   w i t h o u t   c h a n g i n g   t h e   s e m a n t i c s 
       o f   t h e   U R I ,   b u t   t h i s   s h o u l d   n o t   b e   d o n e   u n l e s s   t h e   U R I   i s   b e i n g   u s e d 
       i n   a   c o n t e x t   t h a t   d o e s   n o t   a l l o w   t h e   u n e s c a p e d   c h a r a c t e r   t o   a p p e a r . 
  l     ��������  ��  ��     l     ��!"��  ! � � set of characters that never need encoded (copied from Python's urllib.parse module); used by escape URL characters as base character set -- TO DO: any reason why urllib doesn't allow all of the above punctuation chars   " �##�   s e t   o f   c h a r a c t e r s   t h a t   n e v e r   n e e d   e n c o d e d   ( c o p i e d   f r o m   P y t h o n ' s   u r l l i b . p a r s e   m o d u l e ) ;   u s e d   b y   e s c a p e   U R L   c h a r a c t e r s   a s   b a s e   c h a r a c t e r   s e t   - -   T O   D O :   a n y   r e a s o n   w h y   u r l l i b   d o e s n ' t   a l l o w   a l l   o f   t h e   a b o v e   p u n c t u a t i o n   c h a r s  $%$ j   _ c��&�� "0 _safecharacters _safeCharacters& m   _ b'' �(( � a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9 - _ .% )*) l     ��������  ��  ��  * +,+ l     ��������  ��  ��  , -.- i  d g/0/ I      ��1���� 0 _replacetext _replaceText1 232 o      ���� 0 thetext theText3 454 o      ���� 0 fromtext fromText5 6��6 o      ���� 0 totext toText��  ��  0 k     77 898 r     :;: m     << �==  +; n     >?> 1    ��
�� 
txdl? 1    ��
�� 
ascr9 @A@ r    BCB n   	DED 2   	��
�� 
citmE o    ���� 0 thetext theTextC o      ���� 0 thelist theListA FGF r    HIH 1    ��
�� 
spacI n     JKJ 1    ��
�� 
txdlK 1    ��
�� 
ascrG L��L L    MM c    NON o    ���� 0 thelist theListO m    ��
�� 
ctxt��  . PQP l     ��������  ��  ��  Q RSR l     ��������  ��  ��  S TUT l     ��VW��  V  -----   W �XX 
 - - - - -U YZY l     ��������  ��  ��  Z [\[ i  h k]^] I     ��_`
�� .Web:EscUnull���     ctxt_ o      ���� 0 thetext theText` ��a��
�� 
Safea |����b��c��  ��  b o      ���� &0 allowedcharacters allowedCharacters��  c l     d����d m      ee �ff  ��  ��  ��  ^ Q     oghig k    Yjj klk r    mnm n   opo I    ��q���� "0 astextparameter asTextParameterq rsr o    	���� 0 thetext theTexts t��t m   	 
uu �vv  ��  ��  p o    ���� 0 _support  n o      ���� 0 thetext theTextl wxw r    $yzy b    "{|{ o    ���� "0 _safecharacters _safeCharacters| n   !}~} I    !������ "0 astextparameter asTextParameter ��� o    ���� &0 allowedcharacters allowedCharacters� ���� m    �� ���  p r e s e r v i n g��  ��  ~ o    ���� 0 _support  z o      ���� &0 allowedcharacters allowedCharactersx ��� r   % /��� n  % -��� I   ( -������� J0 #charactersetwithcharactersinstring_ #characterSetWithCharactersInString_� ���� o   ( )���� &0 allowedcharacters allowedCharacters��  ��  � n  % (��� o   & (����  0 nscharacterset NSCharacterSet� m   % &��
�� misccura� o      ���� $0 asocallowedchars asocAllowedChars� ��� l  0 A���� r   0 A��� n  0 ?��� I   : ?������� j0 3stringbyaddingpercentencodingwithallowedcharacters_ 3stringByAddingPercentEncodingWithAllowedCharacters_� ���� o   : ;���� $0 asocallowedchars asocAllowedChars��  ��  � n  0 :��� I   5 :������� 0 
asnsstring 
asNSString� ���� o   5 6���� 0 thetext theText��  ��  � o   0 5���� 0 _support  � o      ���� 0 
asocresult 
asocResult��� Returns a new string made from the receiver by replacing all characters not in the allowedCharacters set with percent encoded characters. UTF-8 encoding is used to determine the correct percent encoded characters. Entire URL strings cannot be percent-encoded. This method is intended to percent-encode an URL component or subcomponent string, NOT the entire URL string. Any characters in allowedCharacters outside of the 7-bit ASCII range are ignored.   � ����   R e t u r n s   a   n e w   s t r i n g   m a d e   f r o m   t h e   r e c e i v e r   b y   r e p l a c i n g   a l l   c h a r a c t e r s   n o t   i n   t h e   a l l o w e d C h a r a c t e r s   s e t   w i t h   p e r c e n t   e n c o d e d   c h a r a c t e r s .   U T F - 8   e n c o d i n g   i s   u s e d   t o   d e t e r m i n e   t h e   c o r r e c t   p e r c e n t   e n c o d e d   c h a r a c t e r s .   E n t i r e   U R L   s t r i n g s   c a n n o t   b e   p e r c e n t - e n c o d e d .   T h i s   m e t h o d   i s   i n t e n d e d   t o   p e r c e n t - e n c o d e   a n   U R L   c o m p o n e n t   o r   s u b c o m p o n e n t   s t r i n g ,   N O T   t h e   e n t i r e   U R L   s t r i n g .   A n y   c h a r a c t e r s   i n   a l l o w e d C h a r a c t e r s   o u t s i d e   o f   t h e   7 - b i t   A S C I I   r a n g e   a r e   i g n o r e d .� ��� l  B T���� Z  B T������� =  B E��� o   B C���� 0 
asocresult 
asocResult� m   C D��
�� 
msng� R   H P����
�� .ascrerr ****      � ****� m   N O�� ��� ^ C o u l d n ' t   c o n v e r t   c h a r a c t e r s   t o   p e r c e n t   e s c a p e s .� ����
�� 
errn� m   J K�����Y� �����
�� 
erob� o   L M���� 0 thetext theText��  ��  ��  � , & NSString docs are hopeless on details   � ��� L   N S S t r i n g   d o c s   a r e   h o p e l e s s   o n   d e t a i l s� ��� L   U Y�� c   U X��� o   U V�~�~ 0 
asocresult 
asocResult� m   V W�}
�} 
ctxt�  h R      �|��
�| .ascrerr ****      � ****� o      �{�{ 0 etext eText� �z��
�z 
errn� o      �y�y 0 enumber eNumber� �x��
�x 
erob� o      �w�w 0 efrom eFrom� �v��u
�v 
errt� o      �t�t 
0 eto eTo�u  i I   a o�s��r�s 
0 _error  � ��� m   b e�� ��� * e s c a p e   U R L   c h a r a c t e r s� ��� o   e f�q�q 0 etext eText� ��� o   f g�p�p 0 enumber eNumber� ��� o   g h�o�o 0 efrom eFrom� ��n� o   h i�m�m 
0 eto eTo�n  �r  \ ��� l     �l�k�j�l  �k  �j  � ��� l     �i�h�g�i  �h  �g  � ��� i  l o��� I     �f��e
�f .Web:UneUnull���     ctxt� o      �d�d 0 thetext theText�e  � Q     K���� k    9�� ��� r    ��� n   ��� I    �c��b�c "0 astextparameter asTextParameter� ��� o    	�a�a 0 thetext theText� ��`� m   	 
�� ���  �`  �b  � o    �_�_ 0 _support  � o      �^�^ 0 thetext theText� ��� l   !���� r    !��� n   ��� I    �]�\�[�] B0 stringbyremovingpercentencoding stringByRemovingPercentEncoding�\  �[  � n   ��� I    �Z��Y�Z 0 
asnsstring 
asNSString� ��X� o    �W�W 0 thetext theText�X  �Y  � o    �V�V 0 _support  � o      �U�U 0 
asocresult 
asocResult� � � Returns a new string made from the receiver by replacing all percent encoded sequences with the matching UTF-8 characters. (NSURLUtilites, 10.9+)   � ���$   R e t u r n s   a   n e w   s t r i n g   m a d e   f r o m   t h e   r e c e i v e r   b y   r e p l a c i n g   a l l   p e r c e n t   e n c o d e d   s e q u e n c e s   w i t h   t h e   m a t c h i n g   U T F - 8   c h a r a c t e r s .   ( N S U R L U t i l i t e s ,   1 0 . 9 + )� ��� Z  " 4���T�S� =  " %��� o   " #�R�R 0 
asocresult 
asocResult� m   # $�Q
�Q 
msng� R   ( 0�P��
�P .ascrerr ****      � ****� m   . /�� ��� � C o u l d n ' t   c o n v e r t   p e r c e n t   e s c a p e s   t o   c h a r a c t e r s   ( e . g .   n o t   v a l i d   U T F 8 ) .� �O��
�O 
errn� m   * +�N�N�Y� �M��L
�M 
erob� o   , -�K�K 0 thetext theText�L  �T  �S  � ��J� L   5 9�� c   5 8��� o   5 6�I�I 0 
asocresult 
asocResult� m   6 7�H
�H 
ctxt�J  � R      �G� 
�G .ascrerr ****      � ****� o      �F�F 0 etext eText  �E
�E 
errn o      �D�D 0 enumber eNumber �C
�C 
erob o      �B�B 0 efrom eFrom �A�@
�A 
errt o      �?�? 
0 eto eTo�@  � I   A K�>�=�> 
0 _error    m   B C		 �

 . u n e s c a p e   U R L   c h a r a c t e r s  o   C D�<�< 0 etext eText  o   D E�;�; 0 enumber eNumber  o   E F�:�: 0 efrom eFrom �9 o   F G�8�8 
0 eto eTo�9  �=  �  l     �7�6�5�7  �6  �5    l     �4�3�2�4  �3  �2    l     �1�1   J D--------------------------------------------------------------------    � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     �0�0   � � parse and format "key1=value1&key2=value2&..." query strings or 'application/x-www-form-urlencoded' data as {{"KEY","VALUE"},...} list    �   p a r s e   a n d   f o r m a t   " k e y 1 = v a l u e 1 & k e y 2 = v a l u e 2 & . . . "   q u e r y   s t r i n g s   o r   ' a p p l i c a t i o n / x - w w w - f o r m - u r l e n c o d e d '   d a t a   a s   { { " K E Y " , " V A L U E " } , . . . }   l i s t  !  l     �/�.�-�/  �.  �-  ! "#" i  p s$%$ I     �,&�+
�, .Web:SplQnull���     ctxt& o      �*�* 0 	querytext 	queryText�+  % P     �'()' k    �** +,+ r    
-.- n   /0/ 1    �)
�) 
txdl0 1    �(
�( 
ascr. o      �'�' 0 oldtids oldTIDs, 1�&1 Q    �2342 k    �55 676 r    "898 I     �%:�$�% 0 _replacetext _replaceText: ;<; n   =>= I    �#?�"�# "0 astextparameter asTextParameter? @A@ o    �!�! 0 	querytext 	queryTextA B� B m    CC �DD  �   �"  > o    �� 0 _support  < EFE m    GG �HH  +F I�I 1    �
� 
spac�  �$  9 o      �� 0 	querytext 	queryText7 JKJ r   # (LML m   # $NN �OO  &M n     PQP 1   % '�
� 
txdlQ 1   $ %�
� 
ascrK RSR r   ) .TUT n  ) ,VWV 2  * ,�
� 
citmW o   ) *�� 0 	querytext 	queryTextU o      �� 0 	querylist 	queryListS XYX r   / 4Z[Z m   / 0\\ �]]  =[ n     ^_^ 1   1 3�
� 
txdl_ 1   0 1�
� 
ascrY `a` X   5 �b�cb k   E �dd efe r   E Mghg n   E Kiji 2  I K�
� 
citmj l  E Ik��k e   E Ill n  E Imnm 1   F H�
� 
pcntn o   E F�� 0 aref aRef�  �  h o      �� 0 
queryparts 
queryPartsf opo l  N nqrsq Z  N ntu��t >   N Uvwv n   N Sxyx 1   O S�
� 
lengy o   N O�
�
 0 
queryparts 
queryPartsw m   S T�	�	 u R   X j�z{
� .ascrerr ****      � ****z m   f i|| �}} * I n v a l i d   q u e r y   s t r i n g .{ �~
� 
errn~ m   \ _���Y ���
� 
erob� o   b c�� 0 	querytext 	queryText�  �  �  r h b TO DO: implement 'without strict parsing' option, in which case missing `=` wouldn't throw error?   s ��� �   T O   D O :   i m p l e m e n t   ' w i t h o u t   s t r i c t   p a r s i n g '   o p t i o n ,   i n   w h i c h   c a s e   m i s s i n g   ` = `   w o u l d n ' t   t h r o w   e r r o r ?p ��� l  o o����  � N H TO DO: what if key is empty string? error here, or leave it for caller?   � ��� �   T O   D O :   w h a t   i f   k e y   i s   e m p t y   s t r i n g ?   e r r o r   h e r e ,   o r   l e a v e   i t   f o r   c a l l e r ?� ��� r   o ���� J   o ��� ��� I  o w� ���
�  .Web:UneUnull���     ctxt� l  o s������ n   o s��� 4   p s���
�� 
cobj� m   q r���� � o   o p���� 0 
queryparts 
queryParts��  ��  ��  � ���� I  w �����
�� .Web:UneUnull���     ctxt� l  w {������ n   w {��� 4   x {���
�� 
cobj� m   y z���� � o   w x���� 0 
queryparts 
queryParts��  ��  ��  ��  � n     ��� 1   � ���
�� 
pcnt� o   � ����� 0 aref aRef�  � 0 aref aRefc o   8 9���� 0 	querylist 	queryLista ��� r   � ���� o   � ����� 0 oldtids oldTIDs� n     ��� 1   � ���
�� 
txdl� 1   � ���
�� 
ascr� ���� L   � ��� o   � ����� 0 	querylist 	queryList��  3 R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  4 k   � ��� ��� r   � ���� o   � ����� 0 oldtids oldTIDs� n     ��� 1   � ���
�� 
txdl� 1   � ���
�� 
ascr� ���� I   � �������� 
0 _error  � ��� m   � ��� ��� , s p l i t   U R L   q u e r y   s t r i n g� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  ��  �&  ( ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  ) ����
�� consnume��  # ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  t w��� I     �����
�� .Web:JoiQnull���     ****� o      ���� 0 	querylist 	queryList��  � k    (�� ��� r     ��� n    ��� 1    ��
�� 
txdl� 1     ��
�� 
ascr� o      ���� 0 oldtids oldTIDs� ���� Q   (���� k   	�� ��� r   	 ��� n  	 ��� 2   ��
�� 
cobj� n  	 ��� I    ������� "0 aslistparameter asListParameter� ��� o    ���� 0 	querylist 	queryList� ���� m    �� ���  ��  ��  � o   	 ���� 0 _support  � o      ���� 0 	querylist 	queryList� ��� X    ������ k   ) ��� ��� r   ) .��� n  ) ,��� 1   * ,��
�� 
pcnt� o   ) *���� 0 aref aRef� o      ���� 0 kvpair kvPair� ��� Z  / T������� F   / E��� H   / ;�� =   / :��� l  / 8������ I  / 8����
�� .corecnte****       ****� J   / 2�� ���� o   / 0���� 0 kvpair kvPair��  � �����
�� 
kocl� m   3 4��
�� 
list��  ��  ��  � m   8 9���� � =   > C��� n  > A   1   ? A��
�� 
leng o   > ?���� 0 kvpair kvPair� m   A B���� � R   H P��
�� .ascrerr ****      � **** m   N O � l I n v a l i d   q u e r y   l i s t   ( n o t   a   l i s t   o f   k e y - v a l u e   s u b l i s t s ) . ��
�� 
errn m   J K�����Y ����
�� 
erob o   L M���� 0 aref aRef��  ��  ��  � 	
	 r   U e o   U V���� 0 kvpair kvPair J        o      ���� 0 k   �� o      ���� 0 v  ��  
  Z   f ����� H   f � l  f ����� F   f � l 
 f ����� l  f ����� G   f � =   f s l  f q���� I  f q�� !
�� .corecnte****       ****  J   f i"" #��# o   f g���� 0 k  ��  ! ��$��
�� 
kocl$ m   j m��
�� 
ctxt��  ��  ��   m   q r����  =   v �%&% l  v �'����' I  v ���()
�� .corecnte****       ****( J   v y** +��+ o   v w���� 0 k  ��  ) ��,��
�� 
kocl, m   z }��
�� 
long��  ��  ��  & m   � ����� ��  ��  ��  ��   l  � �-����- G   � �./. =   � �010 l  � �2����2 I  � ��34
� .corecnte****       ****3 J   � �55 6�~6 o   � ��}�} 0 v  �~  4 �|7�{
�| 
kocl7 m   � ��z
�z 
ctxt�{  ��  ��  1 m   � ��y�y / =   � �898 l  � �:�x�w: I  � ��v;<
�v .corecnte****       ****; J   � �== >�u> o   � ��t�t 0 v  �u  < �s?�r
�s 
kocl? m   � ��q
�q 
long�r  �x  �w  9 m   � ��p�p ��  ��  ��  ��   R   � ��o@A
�o .ascrerr ****      � ****@ m   � �BB �CC z I n v a l i d   q u e r y   l i s t   ( k e y s   a n d   v a l u e s   m u s t   b e   t e x t   o r   i n t e g e r ) .A �nDE
�n 
errnD m   � ��m�m�YE �lF�k
�l 
erobF o   � ��j�j 0 aref aRef�k  ��  ��   G�iG r   � �HIH I   � ��hJ�g�h 0 _replacetext _replaceTextJ KLK b   � �MNM b   � �OPO l  � �Q�f�eQ I  � ��dRS
�d .Web:EscUnull���     ctxtR l  � �T�c�bT c   � �UVU o   � ��a�a 0 k  V m   � ��`
�` 
ctxt�c  �b  S �_W�^
�_ 
SafeW 1   � ��]
�] 
spac�^  �f  �e  P m   � �XX �YY  =N l  � �Z�\�[Z I  � ��Z[\
�Z .Web:EscUnull���     ctxt[ l  � �]�Y�X] c   � �^_^ o   � ��W�W 0 v  _ m   � ��V
�V 
ctxt�Y  �X  \ �U`�T
�U 
Safe` 1   � ��S
�S 
spac�T  �\  �[  L aba 1   � ��R
�R 
spacb c�Qc m   � �dd �ee  +�Q  �g  I n     fgf 1   � ��P
�P 
pcntg o   � ��O�O 0 	querylist 	queryList�i  �� 0 aref aRef� o    �N�N 0 	querylist 	queryList� hih r   � �jkj m   � �ll �mm  &k n     non 1   � ��M
�M 
txdlo 1   � ��L
�L 
ascri pqp r   �rsr c   �tut o   � ��K�K 0 	querylist 	queryListu m   � �J
�J 
ctxts o      �I�I 0 	querytext 	queryTextq vwv r  	xyx o  �H�H 0 oldtids oldTIDsy n     z{z 1  �G
�G 
txdl{ 1  �F
�F 
ascrw |�E| L  
}} o  
�D�D 0 	querytext 	queryText�E  � R      �C~
�C .ascrerr ****      � ****~ o      �B�B 0 etext eText �A��
�A 
errn� o      �@�@ 0 enumber eNumber� �?��
�? 
erob� o      �>�> 0 efrom eFrom� �=��<
�= 
errt� o      �;�; 
0 eto eTo�<  � k  (�� ��� r  ��� o  �:�: 0 oldtids oldTIDs� n     ��� 1  �9
�9 
txdl� 1  �8
�8 
ascr� ��7� I  (�6��5�6 
0 _error  � ��� m  �� ��� * j o i n   U R L   q u e r y   s t r i n g� ��� o  �4�4 0 etext eText� ��� o   �3�3 0 enumber eNumber� ��� o   !�2�2 0 efrom eFrom� ��1� o  !"�0�0 
0 eto eTo�1  �5  �7  ��  � ��� l     �/�.�-�/  �.  �-  � ��� l     �,�+�*�,  �+  �*  � ��� l     �)���)  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �(���(  � , & encode/decode AS objects as JSON data   � ��� L   e n c o d e / d e c o d e   A S   o b j e c t s   a s   J S O N   d a t a� ��� l     �'�&�%�'  �&  �%  � ��� i  x {��� I     �$��
�$ .Web:FJSNnull���     ****� o      �#�# 0 
jsonobject 
jsonObject� �"��!
�" 
EWSp� |� �����   �  � o      �� "0 isprettyprinted isPrettyPrinted�  � l     ���� m      �
� boovfals�  �  �!  � Q     ����� k    ��� ��� Z    ����� n   ��� I    ���� (0 asbooleanparameter asBooleanParameter� ��� o    	�� "0 isprettyprinted isPrettyPrinted� ��� m   	 
�� ��� " e x t r a   w h i t e   s p a c e�  �  � o    �� 0 _support  � r    ��� n   ��� o    �� 80 nsjsonwritingprettyprinted NSJSONWritingPrettyPrinted� m    �
� misccura� o      �� 0 writeoptions writeOptions�  � r    ��� m    ��  � o      �� 0 writeoptions writeOptions� ��� Z    5����� H    &�� l   %���� n   %��� I     %�
��	�
 (0 isvalidjsonobject_ isValidJSONObject_� ��� o     !�� 0 
jsonobject 
jsonObject�  �	  � n    ��� o     �� *0 nsjsonserialization NSJSONSerialization� m    �
� misccura�  �  � R   ) 1���
� .ascrerr ****      � ****� m   / 0�� ��� z C a n  t   c o n v e r t   o b j e c t   t o   J S O N   ( f o u n d   u n s u p p o r t e d   o b j e c t   t y p e ) .� ���
� 
errn� m   + ,���Y� ��� 
� 
erob� o   - .���� 0 
jsonobject 
jsonObject�   �  �  � ��� r   6 O��� n  6 @��� I   9 @������� F0 !datawithjsonobject_options_error_ !dataWithJSONObject_options_error_� ��� o   9 :���� 0 
jsonobject 
jsonObject� ��� o   : ;���� 0 writeoptions writeOptions� ���� l  ; <������ m   ; <��
�� 
obj ��  ��  ��  ��  � n  6 9��� o   7 9���� *0 nsjsonserialization NSJSONSerialization� m   6 7��
�� misccura� J      �� ��� o      ���� 0 thedata theData� ���� o      ���� 0 theerror theError��  � ��� Z  P l������� =  P S��� o   P Q���� 0 thedata theData� m   Q R��
�� 
msng� R   V h����
�� .ascrerr ****      � ****� b   \ g��� b   \ c��� m   \ ]�� ��� : C a n  t   c o n v e r t   o b j e c t   t o   J S O N (� n  ] b��� I   ^ b�������� ,0 localizeddescription localizedDescription��  ��  � o   ] ^���� 0 theerror theError� m   c f   �  ) .� ��
�� 
errn m   X Y�����Y ����
�� 
erob o   Z [���� 0 
jsonobject 
jsonObject��  ��  ��  � �� L   m � c   m � l  m �	����	 n  m �

 I   v ������� 00 initwithdata_encoding_ initWithData_encoding_  o   v w���� 0 thedata theData �� l  w |���� n  w | o   x |���� ,0 nsutf8stringencoding NSUTF8StringEncoding m   w x��
�� misccura��  ��  ��  ��   n  m v I   r v�������� 	0 alloc  ��  ��   n  m r o   n r���� 0 nsstring NSString m   m n��
�� misccura��  ��   m   � ���
�� 
ctxt��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  � I   � ������� 
0 _error     m   � �!! �""  f o r m a t   J S O N  #$# o   � ����� 0 etext eText$ %&% o   � ����� 0 enumber eNumber& '(' o   � ����� 0 efrom eFrom( )��) o   � ����� 
0 eto eTo��  ��  � *+* l     ��������  ��  ��  + ,-, l     ��������  ��  ��  - ./. i  | 010 I     ��23
�� .Web:PJSNnull���     ctxt2 o      ���� 0 jsontext jsonText3 ��4��
�� 
Frag4 |����5��6��  ��  5 o      ���� *0 arefragmentsallowed areFragmentsAllowed��  6 l     7����7 m      ��
�� boovfals��  ��  ��  1 Q     �89:8 k    �;; <=< r    >?> n   @A@ I    ��B���� "0 astextparameter asTextParameterB CDC o    	���� 0 jsontext jsonTextD E��E m   	 
FF �GG  ��  ��  A o    ���� 0 _support  ? o      ���� 0 jsontext jsonText= HIH Z    *JK��LJ n   MNM I    ��O���� (0 asbooleanparameter asBooleanParameterO PQP o    ���� *0 arefragmentsallowed areFragmentsAllowedQ R��R m    SS �TT $ a l l o w i n g   f r a g m e n t s��  ��  N o    ���� 0 _support  K r    $UVU n   "WXW o     "���� :0 nsjsonreadingallowfragments NSJSONReadingAllowFragmentsX m     ��
�� misccuraV o      ���� 0 readoptions readOptions��  L r   ' *YZY m   ' (����  Z o      ���� 0 readoptions readOptionsI [\[ r   + >]^] n  + <_`_ I   5 <��a���� (0 datausingencoding_ dataUsingEncoding_a b��b l  5 8c����c n  5 8ded o   6 8���� ,0 nsutf8stringencoding NSUTF8StringEncodinge m   5 6��
�� misccura��  ��  ��  ��  ` n  + 5fgf I   0 5��h���� 0 
asnsstring 
asNSStringh i��i o   0 1���� 0 jsontext jsonText��  ��  g o   + 0���� 0 _support  ^ o      ���� 0 thedata theData\ jkj r   ? Xlml n  ? Inon I   B I��p���� F0 !jsonobjectwithdata_options_error_ !JSONObjectWithData_options_error_p qrq o   B C���� 0 thedata theDatar sts o   C D���� 0 readoptions readOptionst u��u l  D Ev����v m   D E��
�� 
obj ��  ��  ��  ��  o n  ? Bwxw o   @ B���� *0 nsjsonserialization NSJSONSerializationx m   ? @��
�� misccuram J      yy z{z o      ���� 0 
jsonobject 
jsonObject{ |��| o      ���� 0 theerror theError��  k }~} Z  Y {����� =  Y \��� o   Y Z���� 0 
jsonobject 
jsonObject� m   Z [��
�� 
msng� R   _ w����
�� .ascrerr ****      � ****� b   i v��� b   i r��� m   i l�� ���   N o t   v a l i d   J S O N   (� n  l q��� I   m q������� ,0 localizeddescription localizedDescription��  �  � o   l m�~�~ 0 theerror theError� m   r u�� ���  ) .� �}��
�} 
errn� m   a b�|�|�Y� �{��z
�{ 
erob� o   e f�y�y 0 jsontext jsonText�z  ��  ��  ~ ��x� L   | ��� c   | ���� o   | }�w�w 0 
jsonobject 
jsonObject� m   } ��v
�v 
****�x  9 R      �u��
�u .ascrerr ****      � ****� o      �t�t 0 etext eText� �s��
�s 
errn� o      �r�r 0 enumber eNumber� �q��
�q 
erob� o      �p�p 0 efrom eFrom� �o��n
�o 
errt� o      �m�m 
0 eto eTo�n  : I   � ��l��k�l 
0 _error  � ��� m   � ��� ���  p a r s e   J S O N� ��� o   � ��j�j 0 etext eText� ��� o   � ��i�i 0 enumber eNumber� ��� o   � ��h�h 0 efrom eFrom� ��g� o   � ��f�f 
0 eto eTo�g  �k  / ��� l     �e�d�c�e  �d  �c  � ��� l     �b�a�`�b  �a  �`  � ��� l     �_���_  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �^���^  �   HTTP dispatch   � ���    H T T P   d i s p a t c h� ��� l     �]�\�[�]  �\  �[  � ��� i  � ���� I     �Z�Y�
�Z .Web:ReqHnull��� ��� null�Y  � �X��
�X 
Dest� o      �W�W 0 theurl theURL� �V��
�V 
Meth� |�U�T��S��U  �T  � o      �R�R 0 
httpmethod 
httpMethod�S  � l     ��Q�P� m      �� ���  G E T�Q  �P  � �O��
�O 
Head� |�N�M��L��N  �M  � o      �K�K 0 headerslist headersList�L  � J      �J�J  � �I��
�I 
Body� |�H�G��F��H  �G  � o      �E�E 0 bodydata bodyData�F  � l     ��D�C� m      �B
�B 
msng�D  �C  � �A��@
�A 
Type� |�?�>��=��?  �>  � o      �<�< $0 responsebodytype responseBodyType�=  � l     ��;�:� m      �9
�9 
ctxt�;  �:  �@  � k      �� ��� l     �8���8  �NH Q. if responseBodyType is `text`, add appropriate content negotiation header automatically? (bear in mind that markup-based formats such as HTTP may have their own ideas about encoding, e.g. an HTML document may include its own content-type header while an inadequately configured server claims a completely different encoding)   � ����   Q .   i f   r e s p o n s e B o d y T y p e   i s   ` t e x t ` ,   a d d   a p p r o p r i a t e   c o n t e n t   n e g o t i a t i o n   h e a d e r   a u t o m a t i c a l l y ?   ( b e a r   i n   m i n d   t h a t   m a r k u p - b a s e d   f o r m a t s   s u c h   a s   H T T P   m a y   h a v e   t h e i r   o w n   i d e a s   a b o u t   e n c o d i n g ,   e . g .   a n   H T M L   d o c u m e n t   m a y   i n c l u d e   i t s   o w n   c o n t e n t - t y p e   h e a d e r   w h i l e   a n   i n a d e q u a t e l y   c o n f i g u r e d   s e r v e r   c l a i m s   a   c o m p l e t e l y   d i f f e r e n t   e n c o d i n g )� ��� l     �7�6�5�7  �6  �5  � ��4� l     �3���3  �IC note that Text library will need to provide `convert text to data` and `convert data to text` handlers for converting between `utxt` and `rdat` given an explicit encoding (see also File library, which already provides some encoding support, but as constants, not fuzzy name strings, which isn't good for portability/reuse)   � ����   n o t e   t h a t   T e x t   l i b r a r y   w i l l   n e e d   t o   p r o v i d e   ` c o n v e r t   t e x t   t o   d a t a `   a n d   ` c o n v e r t   d a t a   t o   t e x t `   h a n d l e r s   f o r   c o n v e r t i n g   b e t w e e n   ` u t x t `   a n d   ` r d a t `   g i v e n   a n   e x p l i c i t   e n c o d i n g   ( s e e   a l s o   F i l e   l i b r a r y ,   w h i c h   a l r e a d y   p r o v i d e s   s o m e   e n c o d i n g   s u p p o r t ,   b u t   a s   c o n s t a n t s ,   n o t   f u z z y   n a m e   s t r i n g s ,   w h i c h   i s n ' t   g o o d   f o r   p o r t a b i l i t y / r e u s e )�4  � ��� l     �2�1�0�2  �1  �0  � ��/� l     �.�-�,�.  �-  �,  �/       �+���������'���������+  � �*�)�(�'�&�%�$�#�"�!� ������
�* 
pimr�) 0 _support  �( 
0 _error  �' 0 _usesnetloc _usesNetLoc�& 0 _ascomponent _asComponent�% ,0 _joinnetworklocation _joinNetworkLocation
�$ .Web:SplUnull���     ctxt
�# .Web:JoiUnull���     WebC�" "0 _safecharacters _safeCharacters�! 0 _replacetext _replaceText
�  .Web:EscUnull���     ctxt
� .Web:UneUnull���     ctxt
� .Web:SplQnull���     ctxt
� .Web:JoiQnull���     ****
� .Web:FJSNnull���     ****
� .Web:PJSNnull���     ctxt
� .Web:ReqHnull��� ��� null� ��� �  �� ���
� 
cobj� ��   � 
� 
frmk�  � ��   � *
� 
scpt� � 4������ 
0 _error  � ��� �  ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  � �
�	����
 0 handlername handlerName�	 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  D��� � &0 throwcommanderror throwCommandError� b  ࠡ����+ � ��� �   j n r v z ~ � � � � � � � � � � � � � � � � �� � ��� ����� 0 _ascomponent _asComponent� ����� �  ���� 0 
asocstring 
asocString�   � ���� 0 
asocstring 
asocString� �� ���
�� 
msng
�� 
ctxt�� ��  �Y hO��&� �� ����� ���� ,0 _joinnetworklocation _joinNetworkLocation�� ����   ���� .0 networklocationrecord networkLocationRecord��    	�������������������� .0 networklocationrecord networkLocationRecord�� $0 fullnetlocrecord fullNetLocRecord�� 0 urlcomponents urlComponents�� 0 aref aRef�� 0 	urlrecord 	urlRecord�� 0 username userName�� 0 userpassword userPassword�� 0 hostname hostName�� 0 
portnumber 
portNumber (�� ��� ��� ��� �������������������������*9=AD��Fbjrx���������� 0 username userName�� 0 userpassword userPassword�� 0 hostname hostName�� 0 
portnumber 
portNumber�� �� 60 asoptionalrecordparameter asOptionalRecordParameter�� 
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
ctxt��   ������
�� 
errn���\��  
�� 
errn���Y
�� 
erob
�� 
leng
�� 
bool��%b  �����������m+ 
E�O�[�,\[�,\[�,\[�,\Z�vE�O V�[��l kh  ��,a &��,FW 3X  )a a a ��a a a a a �v��a ,k/%a %[OY��O�E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO�a  �a %�%E�Y hO�a  �a  %E�Y hO�a ! 	 �a " 	 �a # a $&a $& )a a a ��a %Y hO��%E�O�a & �a '%�%E�Y hO�� ���������
�� .Web:SplUnull���     ctxt�� 0 urltext urlText�� ����
�� 
NeLo {�������� ,0 splitnetworklocation splitNetworkLocation��  
�� boovfals��   ������������������ 0 urltext urlText�� ,0 splitnetworklocation splitNetworkLocation�� 0 asocurl asocURL�� "0 networklocation networkLocation�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo ����������������������� ����������������������������2������ $0 asnsurlparameter asNSURLParameter�� 0 username userName�� 0 user  �� 0 _ascomponent _asComponent�� 0 userpassword userPassword�� 0 password  �� 0 hostname hostName�� 0 host  �� 0 
portnumber 
portNumber�� 0 port  �� �� (0 asbooleanparameter asBooleanParameter�� ,0 _joinnetworklocation _joinNetworkLocation�� 0 	urlscheme 	urlScheme�� 
0 scheme  �� "0 networklocation networkLocation�� 0 resourcepath resourcePath�� 0 path  �� "0 parameterstring parameterString�� 0 querystring queryString�� 	0 query  �� (0 fragmentidentifier fragmentIdentifier�� 0 fragment  �� �� 0 etext eText ����
�� 
errn�� 0 enumber eNumber ����	
�� 
erob�� 0 efrom eFrom	 ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � �b  ��l+ E�O�*�j+ k+ �*�j+ k+ �*�j+ k+ �*�j+ 
k+ �E�Ob  ��l+  *�k+ E�Y hO�*�j+ k+ a �a *�j+ k+ a *�j+ k+ a *�j+ k+ a *�j+ k+ a W X  *a ����a + � ��D����
��
�� .Web:JoiUnull���     WebC�� 0 	urlrecord 	urlRecord�� ����
�� 
Base {����K�� 0 baseurl baseURL��  ��  
 ������������������������������������ 0 	urlrecord 	urlRecord�� 0 baseurl baseURL�� 0 fullurlrecord fullURLRecord�� 0 urlcomponents urlComponents�� 0 aref aRef�� 0 	urlscheme 	urlScheme�� 0 resourcepath resourcePath�� "0 parameterstring parameterString�� 0 querystring queryString�� (0 fragmentidentifier fragmentIdentifier�� "0 networklocation networkLocation�� 0 urltext urlText�� 0 asocurl asocURL�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo LTU��������x��|�����������������~�}�|�{�z��������y��x�w�v�u+�t7@�sGUZ`it|��������r���q�p�o�n�m�l�k�j��i��h
�� 
kocl
�� 
reco
�� .corecnte****       ****�� 0 	urlscheme 	urlScheme�� "0 networklocation networkLocation�� 0 resourcepath resourcePath�� "0 parameterstring parameterString�� 0 querystring queryString�� (0 fragmentidentifier fragmentIdentifier�� � 60 asoptionalrecordparameter asOptionalRecordParameter�~ 
�} 
cobj
�| 
pcnt
�{ 
ctxt�z   �g�f�e
�g 
errn�f�\�e  
�y 
leng�x �w .0 throwinvalidparameter throwInvalidParameter�v ,0 _joinnetworklocation _joinNetworkLocation
�u 
Safe
�t .Web:EscUnull���     ctxt
�s 
bool�r "0 astextparameter asTextParameter�q $0 asnsurlparameter asNSURLParameter
�p misccura�o 0 nsurl NSURL�n <0 urlwithstring_relativetourl_ URLWithString_relativeToURL_
�m 
msng
�l 
errn�k�Y
�j 
erob�i 0 etext eText �d�c
�d 
errn�c 0 enumber eNumber �b�a
�b 
erob�a 0 efrom eFrom �`�_�^
�` 
errt�_ 
0 eto eTo�^  �h 
0 _error  ��}f��^�kv��l j�b  ������������a a a m+ E�O�[�,\[�,\[�,\[�,\[�,\Za vE�O f�[�a l kh  �a ,a &�a ,FW =X  b  �a �a a a a a a  a va �a !,k/%a "%a #+ $[OY��O�E[a k/E�Z[a l/E�Z[a m/E�Z[a a #/E�Z[a a /E�ZO��,kv��l j *��,k+ %E�Y ) ��,a &E�W X  b  �a &�a 'a #+ $O�a (a )l *E�O�a +
 &�a ,	 b  �a -&	 �a .a -&a -& /�a /	 �a 0a -& a 1�%E�Y hOa 2�%�%E�Y �E�O�a 3 �a 4%�%E�Y hO�a 5 �a 6%�%E�Y hO�a 7 �a 8%�%E�Y hO�a 9 �a :%�%E�Y hY b  �a ;l+ <E�O�a = Kb  �a >l+ ?E�Oa @a A,��l+ BE�O�a C  )a Da Ea F�a #a GY hO�a &E�Y hO�VW X H I*a J���] a + K� �]0�\�[�Z�] 0 _replacetext _replaceText�\ �Y�Y   �X�W�V�X 0 thetext theText�W 0 fromtext fromText�V 0 totext toText�[   �U�T�S�R�U 0 thetext theText�T 0 fromtext fromText�S 0 totext toText�R 0 thelist theList <�Q�P�O�N�M
�Q 
ascr
�P 
txdl
�O 
citm
�N 
spac
�M 
ctxt�Z ���,FO��-E�O���,FO��&� �L^�K�J�I
�L .Web:EscUnull���     ctxt�K 0 thetext theText�J �H�G
�H 
Safe {�F�Ee�F &0 allowedcharacters allowedCharacters�E  �G   �D�C�B�A�@�?�>�=�D 0 thetext theText�C &0 allowedcharacters allowedCharacters�B $0 asocallowedchars asocAllowedChars�A 0 
asocresult 
asocResult�@ 0 etext eText�? 0 enumber eNumber�> 0 efrom eFrom�= 
0 eto eTo u�<��;�:�9�8�7�6�5�4�3�2��1�0��/�.�< "0 astextparameter asTextParameter
�; misccura�:  0 nscharacterset NSCharacterSet�9 J0 #charactersetwithcharactersinstring_ #characterSetWithCharactersInString_�8 0 
asnsstring 
asNSString�7 j0 3stringbyaddingpercentencodingwithallowedcharacters_ 3stringByAddingPercentEncodingWithAllowedCharacters_
�6 
msng
�5 
errn�4�Y
�3 
erob�2 
�1 
ctxt�0 0 etext eText �-�,
�- 
errn�, 0 enumber eNumber �+�*
�+ 
erob�* 0 efrom eFrom �)�(�'
�) 
errt�( 
0 eto eTo�'  �/ �. 
0 _error  �I p [b  ��l+ E�Ob  b  ��l+ %E�O��,�k+ E�Ob  �k+ �k+ E�O��  )�����Y hO��&W X  *a ����a + � �&��%�$�#
�& .Web:UneUnull���     ctxt�% 0 thetext theText�$   �"�!� ����" 0 thetext theText�! 0 
asocresult 
asocResult�  0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo ������������	��� "0 astextparameter asTextParameter� 0 
asnsstring 
asNSString� B0 stringbyremovingpercentencoding stringByRemovingPercentEncoding
� 
msng
� 
errn��Y
� 
erob� 
� 
ctxt� 0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom ���

� 
errt� 
0 eto eTo�
  � � 
0 _error  �# L ;b  ��l+ E�Ob  �k+ j+ E�O��  )�����Y hO��&W X  *������+ � �	%�� �
�	 .Web:SplQnull���     ctxt� 0 	querytext 	queryText�   	������ ������� 0 	querytext 	queryText� 0 oldtids oldTIDs� 0 	querylist 	queryList� 0 aref aRef� 0 
queryparts 
queryParts�  0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo  ()����C��G����N��\������������������|����!�����
�� 
ascr
�� 
txdl�� "0 astextparameter asTextParameter
�� 
spac�� 0 _replacetext _replaceText
�� 
citm
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
leng
�� 
errn���Y
�� 
erob�� 
�� .Web:UneUnull���     ctxt�� 0 etext eText! ����"
�� 
errn�� 0 enumber eNumber" ����#
�� 
erob�� 0 efrom eFrom# ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � ��� ���,E�O �*b  ��l+ ��m+ E�O���,FO��-E�O���,FO T�[��l kh ��,E�-E�O�a ,l )a a a �a a Y hO��k/j ��l/j lv��,F[OY��O���,FO�W X  ���,FO*a ����a + V� �������$%��
�� .Web:JoiQnull���     ****�� 0 	querylist 	queryList��  $ ������������������������ 0 	querylist 	queryList�� 0 oldtids oldTIDs�� 0 aref aRef�� 0 kvpair kvPair�� 0 k  �� 0 v  �� 0 	querytext 	queryText�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo% ���������������������������������B������Xd��l��&�����
�� 
ascr
�� 
txdl�� "0 aslistparameter asListParameter
�� 
cobj
�� 
kocl
�� .corecnte****       ****
�� 
pcnt
�� 
list
�� 
leng
�� 
bool
�� 
errn���Y
�� 
erob�� 
�� 
ctxt
�� 
long
�� 
Safe
�� 
spac
�� .Web:EscUnull���     ctxt�� 0 _replacetext _replaceText�� 0 etext eText& ����'
�� 
errn�� 0 enumber eNumber' ����(
�� 
erob�� 0 efrom eFrom( ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ��)��,E�Ob  ��l+ �-E�O ٠[��l kh ��,E�O�kv��l k 	 	��,l �& )������Y hO�E[�k/E�Z[�l/E�ZO�kv�a l k 
 �kv�a l k �&	 #�kv�a l k 
 �kv�a l k �&�& )�����a Y hO*�a &a _ l a %�a &a _ l %_ a m+ ��,F[OY�5Oa ��,FO�a &E�O���,FO�W X  ���,FO*a ����a + � �������)*��
�� .Web:FJSNnull���     ****�� 0 
jsonobject 
jsonObject�� ��+��
�� 
EWSp+ {�������� "0 isprettyprinted isPrettyPrinted��  
�� boovfals��  ) 	�������������������� 0 
jsonobject 
jsonObject�� "0 isprettyprinted isPrettyPrinted�� 0 writeoptions writeOptions�� 0 thedata theData�� 0 theerror theError�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo* ������������������������������� ������������,!������ (0 asbooleanparameter asBooleanParameter
�� misccura�� 80 nsjsonwritingprettyprinted NSJSONWritingPrettyPrinted�� *0 nsjsonserialization NSJSONSerialization�� (0 isvalidjsonobject_ isValidJSONObject_
�� 
errn���Y
�� 
erob�� 
�� 
obj �� F0 !datawithjsonobject_options_error_ !dataWithJSONObject_options_error_
�� 
cobj
�� 
msng�� ,0 localizeddescription localizedDescription�� 0 nsstring NSString�� 	0 alloc  �� ,0 nsutf8stringencoding NSUTF8StringEncoding�� 00 initwithdata_encoding_ initWithData_encoding_
�� 
ctxt�� 0 etext eText, ����-
�� 
errn�� 0 enumber eNumber- ����.
�� 
erob�� 0 efrom eFrom. ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � �b  ��l+  
��,E�Y jE�O��,�k+  )�����Y hO��,���m+ E[�k/E�Z[�l/E�ZO��  )�����j+ %a %Y hO�a ,j+ ��a ,l+ a &W X  *a ����a + � ��1����/0��
�� .Web:PJSNnull���     ctxt�� 0 jsontext jsonText�� ��1��
�� 
Frag1 {����~�� *0 arefragmentsallowed areFragmentsAllowed�  
�~ boovfals��  / 
�}�|�{�z�y�x�w�v�u�t�} 0 jsontext jsonText�| *0 arefragmentsallowed areFragmentsAllowed�{ 0 readoptions readOptions�z 0 thedata theData�y 0 
jsonobject 
jsonObject�x 0 theerror theError�w 0 etext eText�v 0 enumber eNumber�u 0 efrom eFrom�t 
0 eto eTo0 F�sS�r�q�p�o�n�m�l�k�j�i�h�g�f�e�d��c��b�a2��`�_�s "0 astextparameter asTextParameter�r (0 asbooleanparameter asBooleanParameter
�q misccura�p :0 nsjsonreadingallowfragments NSJSONReadingAllowFragments�o 0 
asnsstring 
asNSString�n ,0 nsutf8stringencoding NSUTF8StringEncoding�m (0 datausingencoding_ dataUsingEncoding_�l *0 nsjsonserialization NSJSONSerialization
�k 
obj �j F0 !jsonobjectwithdata_options_error_ !JSONObjectWithData_options_error_
�i 
cobj
�h 
msng
�g 
errn�f�Y
�e 
erob�d �c ,0 localizeddescription localizedDescription
�b 
****�a 0 etext eText2 �^�]3
�^ 
errn�] 0 enumber eNumber3 �\�[4
�\ 
erob�[ 0 efrom eFrom4 �Z�Y�X
�Z 
errt�Y 
0 eto eTo�X  �` �_ 
0 _error  �� � �b  ��l+ E�Ob  ��l+  
��,E�Y jE�Ob  �k+ ��,k+ E�O��,���m+ E[�k/E�Z[�l/E�ZO��  )��a �a a �j+ %a %Y hO�a &W X  *a ����a + � �W��V�U56�T
�W .Web:ReqHnull��� ��� null�V  �U �S�R7
�S 
Dest�R 0 theurl theURL7 �Q89
�Q 
Meth8 {�P�O��P 0 
httpmethod 
httpMethod�O  9 �N:;
�N 
Head: {�M�L�K�M 0 headerslist headersList�L  �K  ; �J<=
�J 
Body< {�I�H�G�I 0 bodydata bodyData�H  
�G 
msng= �F>�E
�F 
Type> {�D�C�B�D $0 responsebodytype responseBodyType�C  
�B 
ctxt�E  5 �A�@�?�>�=�A 0 theurl theURL�@ 0 
httpmethod 
httpMethod�? 0 headerslist headersList�> 0 bodydata bodyData�= $0 responsebodytype responseBodyType6  �T hascr  ��ޭ