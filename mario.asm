
[org 0x0100]
data:
jmp main         ;jump to main
x :dw 0
y :dw 0
r1 :dw 50
c1 :dw 280
var :dw 0

cloudX :dw 0
cloudY :dw 0

mariox :dw 0
savemariox :dw 0
clearsavex :dw 0
marioY :dw 0
savemarioY :dw 0
clearsaveY :dw 0


enemyX1 :dw 0
prevenemyX1 :dw 0
enemyY1 :dw 0
prevenemyY1 :dw 0

enemyX2 :dw 0
prevenemyX2 :dw 0
enemyY2 :dw 0
prevenemyY2 :dw 0


enemyXC :dw 0
prevenemyXC :dw 0
enemyYC :dw 0
prevenemyYC :dw 0

drawrect1X :dw 428
drawrect1Y :dw 293

drawrect2X :dw 283
drawrect2Y :dw 293


castleY :dw 0
castleX :dw 0

dragonY :dw 0
dragonX :dw 0
prevdragonX :dw 0
prevdragonY :dw 0
level3 :dw 0

prevFX :dw 0
prevFY :dw 0
fireX :dw 0
fireY :dw 0

count :dd 2
firecount :dw 0

Factivate :dw 0

timer :dw 0



crownX :dw 0;

screen :dd 0


code:

l2:
inc cx		; thickness
int 10h          
dec si      ;decrementing si
cmp si, 0    ;if si >=0 then jump to l2
jge l2
ret

g4:
inc cx      ;thickness
int 10h
dec si      ;decrementing si
cmp si, 0    ;if si >=0 then jump to g4
jge g4
ret

l4:
inc cx      ;thickness
int 10h
dec si      ;decrementing si
cmp si, 0    ;if si >=0 then jump to l4
jge l4
ret

g6:
inc cx      ;thickness
int 10h
dec si      ;;decrementing si
cmp si, 0    ;if si >=0 then jump to g6
jge g6
ret

g8:
inc cx        ;thickness
int 10h
dec si      ;decrementing si
cmp si, 0    ;if si >=0 then jump to g8
jge g8
ret

k8:
inc cx      ;thickness
int 10h
dec si       ;decrementing si
cmp si, 0    ;if si >=0 then jump to k8
jge k8
ret

l61:
inc cx    ;thickness
int 10h
dec si      ;decrementing si
cmp si, 0    ;if si >=0 then jump to l6l
jge l61
ret

l10:
inc cx    ;thickness
int 10h
dec si        ;decrementing si
cmp si, 0    ;if si >=0 then jump to l10
jge l10
ret

l6:
inc cx		; thickness
int 10h
dec si        ;decrementing si
cmp si, 0    ;if si >=0 then jump to l6
jge l6

g10:
inc cx    ;thickness
int 10h
dec si     ;;decrementing si
cmp si, 0    ;if si >=0 then jump to g10
jge g10
ret

k2q:
inc cx       ;thickness
int 10h
dec si       ;decrementing si
cmp si, 0    ;if si >=0 then jump to k2q
jge k2q
ret

k4q:
inc cx        ;thickness
int 10h
dec si        ;decrementing si
cmp si, 0    ;if si >=0 then jump to k4q
jge k4q
ret

k6q:
inc cx      ;thickness
int 10h     
dec si      ;decrementing si
cmp si, 0    ;if si >=0 then jump to k6q
jge k6q
ret


main:
mov ax, data       ;moving the value of data in ax
mov ds,ax          ;moving value of ax in ds

; setting graphics mode
mov ah, 0h
mov al, 10h       
int 10h

;setting background color
mov ah, 0BH
mov bx, 9	; 0-15
int 10h

mov dword[screen],0      ;start of screen
call Cstart00          ;calling Cstart00
KK00:

add dword[screen],1      ;derefrencing screen of dword type and adding 1 in it

cmp dword[screen],100    ;derefrencing screen of dword type and comparing it with 100
je nKK00                ;if they are equal then jump to nKK00
jmp KK00               ;jump to KK00

nKK00:
call clearscreen         ;calling clearscreen



mov dword[screen],0  ;derefrencing screen of dword type and moving 0 in it
call Cstart0         ;calling Cstart0
KK1:

add dword[screen],1       ;derefrencing screen of dword type and adding 1 in it

cmp dword[screen],100    ;derefrencing screen of dword type and comparing it with 100
je nKK1      ;if they are equal then jump to nKK1
jmp KK1           ;jump to KK1

nKK1:
mov dword[screen],0       ;derefrencing screen of dword type and moving 0 in it
call clearscreen         ;calling clearscreen


mov dword[screen],0     ;derefrencing screen of dword type and moving 0 in it
call Cstart1            ;calling Cstart1
KK2:

add dword[screen],1       ;derefrencing screen of dword type and adding 1 in it

cmp dword[screen],100    ;derefrencing screen of dword type and comparing it with 100
je nKK2                 ;if they are equal then jump to nKK2
jmp KK2                ;jump to KK2

nKK2:
mov dword[screen],0        ;derefrencing screen of dword type and moving 0 in it
call clearscreen           ;calling clearscreen

;-----------------------------------------------------------------level1




start1:
mov word[cloudX],180
mov word[cloudY],40 
call cloud
call flagu ;calling flagu 


call hurdle1   ;calling hurdle1

call hurdle2      ;calling hurdle2

call hurdle3     ;calling hurdle3

call grass       ;calling grass

call clearmario     ;calling clearmario

mov word[mariox],20     ;position of mario along x-axis
mov word[marioY], 300   ;position of mario along y-axis

;mov enemyX,220
;mov enemyY, 293
;call  enemy

;mov enemyX,420
;mov enemyY, 293
;call enemy

call mario         ;calling mario

;name of game at start of screen i.e 'MARIO SMASH'
mov dl, 2 ;col
mov dh, 1 ;row
mov bh,0       
mov ah,02h
int 10h
mov al, 'M'             
mov bl,0ch      ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'A'
mov bl,0ch   ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'R'
mov bl,0ch  ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'I'  
mov bl,0ch    ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'O'
mov bl,0ch     ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h


mov dl, 2 ;col
mov dh, 2 ;row
mov bh,0
mov ah,02h
int 10h
mov al, ' '
mov bl,0ch       ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h



mov dl, 2 ;col
mov dh, 3 ;row
mov bh,0
mov ah,02h
int 10h
mov al, 'L'
mov bl,0ch         ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'E'
mov bl,0ch    ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'V'
mov bl,0ch     ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'E'
mov bl,0ch         ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'L'
mov bl,0ch     ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, ' '
mov bl,0ch       ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, '1'
mov bl,0ch     ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h



again:
mov ah,01     ;checking for key press
int 16h
JZ again      ;if no key is pressed
mov ah,0      ;getting chracter
int 16h



cmp al,'E'     ;if E key pressed then jump to mq
je mq
cmp al,'e'     ;if e key pressed then jump to mq
je mq

cmp al,'N'     ;if N key pressed then jump to start1
je start1
cmp al,'n'     ;if n key pressed then jump to start1
je start1

cmp al,'P'     ;if P key pressed then jump to mz
je mz
cmp al,'p'     ;if p key pressed then jump to mz
je mz

cmp al,'L'     ;if L key pressed then jump to mz
je mz
cmp al,'l'     ;if l key pressed then jump to mz
je mz

cmp al,'O'     ;if O key pressed then jump to start1
je start1
cmp al,'o'     ;if o key pressed then jump to start1
je start1

cmp ax,4B00h    ;if left key is pressed then jump to leftKeyPressed
je leftKeyPressed

cmp ax,4D00h     ;if right key is pressed then jump to mp
je mp

cmp ax,4800h  ;if up key is pressed then jump to me
je me                 
jmp again       ;jump to again

cmp word[mariox],620  ;if mario touches flag then jump to mq
je mq
jne leftKeyPressed    
mz:
call start2        ;calling start2
mp:
call rightKeyPressed   ;calling rightKeyPressed
mq:
call exit            ;calling exit
me:
call upKeyPressed    ;callig upKeyPressed
leftKeyPressed:

cmp word[mariox],80  ;when mario touches hurdles1 then jump to hurdles22
je hurdles22

cmp word[mariox],340  ;when mario touches hurdles2 then jump to hurdles11
je hurdles11

cmp word[mariox],500   ;when mario touches hurdles3 then jump to hurdles33
je hurdles33

cmp word[mariox],600   ;when mario touches flag then jump to mn
je mn

jmp nohurdles        ;jump to nohurdles

hurdles11:
mov bx,5               ;moving 5 in bx
add word[mariox],bx     ;derefrencing the marioX of word datatype and adding value of bx in it

call hurdle1          ;calling hurdle1
call clearmario       ;calling clearmario
call mario          ;calling mario



jmp again          ;jump to again

hurdles22:
mov bx,5               ;moving 5 in bx
add word[mariox],bx     ;derefrencing the marioX of word datatype and adding value of bx in it

call hurdle2          ;calling hurdle2
call clearmario       ;calling clearmario
call mario          ;calling mario

jmp again          ;jump to again

hurdles33:
mov bx,5               ;moving 5 in bx
add word[mariox],bx     ;derefrencing the marioX of word datatype and adding value of bx in it

call hurdle3          ;calling hurdle3
call clearmario       ;calling clearmario
call mario          ;calling mario

jmp again          ;jump to again

nohurdles:
mov bx,5            ;moving 5 in bx     
sub word[mariox],bx  ;derefrencing the marioX of word datatype and subtracting value of bx from it

call clearmario        ;calling clearmario
call mario             ;calling mario
call hurdletops        ;calling hurdletops


cmp word[mariox],105  ;hurdles1
je hurdles22           ;if they are equal then jump to hurdles22

cmp word[mariox],340  ;hurdles2
je hurdles11          ;if they are equal then jump to hurdles11

cmp word[mariox],500   ;hurdles3
je hurdles33           ;if they are equal then jump to hurdles33

cmp word[mariox],600   ;flag
je mb                  ;if they are equal then jump to mb else jump to again
jne again
mn:
call start2            ;calling start2
mb:            
call exit             ;calling exit
rightKeyPressed:

cmp word[mariox],60  ;hurdles1
je hurdles2            ;if they are equal then jump to hurdles2

cmp word[mariox],310  ;hurdles2
je hurdles1              ;if they are equal then jump to hurdles1

cmp word[mariox],465   ;hurdles3
je hurdles3           ;if they are equal then jump to hurdles3

cmp word[mariox],600   ;flag
je mn                  ;if they are equal then jump to mn else jump to noHurdles
jne noHurdles

hurdles1:
mov bx,5         ;moving 5 in bx
sub word[mariox],bx       ;derefrencing marioX of word data type and subtracting value of bx from it

call hurdle1              ;calling hurdle1
call clearmario          ;calling clearmario
call mario              ;calling mario

jmp again             ;jump again

hurdles2:
mov bx,5         ;moving 5 in bx
sub word[mariox],bx       ;derefrencing marioX of word data type and subtracting value of bx from it

call hurdle2              ;calling hurdle2
call clearmario          ;calling clearmario
call mario              ;calling mario

jmp again             ;jump again

hurdles3:
mov bx,5         ;moving 5 in bx
sub word[mariox],bx       ;derefrencing marioX of word data type and subtracting value of bx from it

call hurdle3              ;calling hurdle3
call clearmario          ;calling clearmario
call mario              ;calling mario

jmp again             ;jump again		

noHurdles:
mov bx,5          ;moving 5 in bx
add word[mariox],bx       ;derefrencing marioX of word data type and adding value of bx in it

call clearmario     ;calling clearmario
call mario         ;calling mario

call hurdletops    ;calling hurdletops


cmp word[mariox],80  ;hurdles1
je hurdles22            ;if they are equal then jump to hurdles22

cmp word[mariox],340  ;hurdles2
je hurdles11          ;if they are equal then jump to hurdles11

cmp word[mariox],500   ;hurdles3
je hurdles33             ;if they are equal then jump to hurdles33

cmp word[mariox],600   ;flag
je start2             ;if they are equal then jump to start2 else jump to again
jne again
mr:
call exit            ;calling exit
upKeyPressed:  ;
cmp word[mariox],150  ;hurdles
je mr                  ;if they are equal then jump to mr

cmp word[mariox],320
je mr                   ;if they are equal then jump mr

cmp word[mariox],480
je mr                   ;if they are equal then jump to mr

cmp word[mariox],620   ;flag
je start2               ;if they are equal then jump to start2
call hurdletops          ;calling hurdletops
call clearmario        ;calling clearmario
call jump          ;calling jump




jmp again        ;jump to again




jmp again       ;jump to again

;-----------------------------------------------------------------level2




start2:



call clearscreen     ;calling clearscreen


mov dword[screen],0      ;screen start(level 2)
call Cstart2            ;calling Cstart2
KK3:

add dword[screen],1      ;derefrencing screen of dword type and adding 1 in it

cmp dword[screen],100000    ;derefrencing screen of dword type and comparing it with 100000
je nKK3                ; if they are equal then jump to nKK3
jmp KK3               ;jump to KK3

nKK3:
mov dword[screen],0
call clearscreen      ;calling clearscreen


mov dl, 2 ;col
mov dh, 1 ;row
mov bh,0
mov ah,02h
int 10h
mov al, 'M'
mov bl,0ch       ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'A'
mov bl,0ch       ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'R'
mov bl,0ch         ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'I'
mov bl,0ch       ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'O'
mov bl,0ch       ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h


mov dl, 2 ;col
mov dh, 2 ;row
mov bh,0
mov ah,02h
int 10h




mov dl, 2 ;col
mov dh, 3 ;row
mov bh,0
mov ah,02h
int 10h
mov al, 'L'
mov bl,0ch        ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'E'
mov bl,0ch       ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'V'
mov bl,0ch        ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'E'
mov bl,0ch        ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'L'
mov bl,0ch       ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, ' '
mov bl,0ch         ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, '2'
mov bl,0ch       ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov word[cloudX],180
mov word[cloudY],40 

call clearmario      ;calling clearmario
call cloud
call flagu            ;calling flagu


call hurdle1     ;calling hurdle1

call hurdle2       ;calling hurdle2

call hurdle3       ; ;calling hurdle3

call grass          ;calling grass

call clearmario      ;calling clearmario



start22:






call clearmario          ;calling clearmario

mov word[mariox],20        ;position of mario along x-axis
mov word[marioY], 300        ;position of mario along y-axis


mov word[enemyX1],300    ;position of enemy1 along x-axis
mov word[enemyY1], 293    ;position of enemy1 along y-axis
call  enemy1             ;calling enemy1

mov word[enemyX2],445    ;position of enemy2 along x-axis
mov word[enemyY2], 293   ;position of enemy2 along y-axis
call enemy2             ;calling enemy2


call mario            ;calling mario


again2:

add dword[count],1      ;derefrencing count of dword type and adding 1 in it

cmp dword[count],200000  ;derefrencing count of dword type and comparing it with 200000
ja block                      



jmp no                   ;jump to no




block:



cmp dword[count],200000  ;derefrencing count of dword type and comparing it with 200000
ja E


jmp no	              ;jump to no


E:

call drawrect2        ;calling drawrect2
call drawrect1       ;calling drawrect1


cmp word[enemyX1],120  ;hurdles1
je restart1             ;if they are equal then jump to restart1

cmp word[enemyX2],360  ;hurdles2
je restart2            ;if they are equal then jump to restart2

cmp word[dragonX],480  ;hurdles3
je tr                  ;if they are equal then jump to tr


jmp norestart          ;jump to norestart





restart1:
call drawrect2          ;calling drawrect2
call drawrect1               ;calling drawrect1
mov word[drawrect2X],283    
call drawrect1          ;calling drawrect1
mov word[enemyX1],300   ;position of enemy1 along x-axis
mov word[enemyY1], 293   ;position of enemy1 along y-axis
call  enemy1             ;calling enemy1

cmp word[enemyX1],120  ;hurdles1
je restart1             ;if they are equal then jump to restart1

cmp word[enemyX2],360  ;hurdles2
je restart2             ;if they are equal then jump to restart2

jmp norestart           ;jump to norestart

restart2:
call drawrect2           ;calling drawrect2
call drawrect1           ;calling drawrect1

mov word[drawrect1X],428
call drawrect2         ;calling drawrect 2
mov word[enemyX2],445       ;position of enemy2 along x-axis
mov word[enemyY2], 293     ;position of enemy2 along y-axis
call enemy2                ;calling enemy2


cmp word[enemyX1],120  ;hurdles1
je restart1             ;if they are equal then jump to restart1

cmp word[enemyX2],360  ;hurdles2
je restart2           ;if they are equal then jump to restart2

jne norestart           ;jump to norestart

p:
call exit             ;calling exit
tr:
call level33        ;calling level33
tt:
call norestartt      ;calling norestartt

norestart:






call drawrect2       ;calling drawrect2
call drawrect1       ;calling drawrect1


mov dword[count],0       ; derefrencing count of dword type and moving 0 in it

sub word[drawrect1X],1   ;derefrencing drawrect1X of word type and subtracting 1 from it
call drawrect1           ;calling drawrect1

sub word[drawrect2X],1     ;;derefrencing drawrect2X of word type and subtracting 1 from it
call drawrect2             ;calling drawrect 2
;for enemy movement
sub word[enemyX1],1       ;derefrencing enemyX1 of word type and subtracting 1 from it
call enemy1              ;calling enemy1

sub word[enemyX2],1     ;;derefrencing enemyX2 of word type and subtracting 1 from it
call enemy2             ;calling enemy2

cmp word[dragonX],480  ;dragon
je tr                     ;if they are equal then jump to tr


cmp word[level3], 1     ;derefrencing level3 of word type and comparing it with 1
je tt                     ;if they are equal then jump to tt

call clearmario        ;calling clearmario
call mario               ;calling mario


cmp word[enemyX1],120  ;hurdles2
je restart1              ;if they are equal then jump to restart1

cmp word[enemyX2],360  ;hurdles1
je restart2           ;if they are equal then jump to restart2



jmp no               ;jump to no

no:

mov ah,01     ;checking for key press
int 16h
JZ again2      ;if no key is pressed
mov ah,0      ;getting chracter
int 16h




cmp al,'E'     ;if E key pressed then jump to p
je p
cmp al,'e'     ;if e key pressed then jump to p
je p

cmp al,'N'     ;if N key pressed then jump to start1
je start1
cmp al,'n'     ;if n key pressed then jump to start1
je start1

cmp al,'P'     ;if P key pressed then jump to start2
je start2
cmp al,'p'     ;if p key pressed then jump to start2
je start2


cmp al,'L'     ;if L key pressed then jump to start2
je start2
cmp al,'l'     ;if l key pressed then jump to start2
je start2

cmp al,'O'     ;if O key pressed then jump to start1
je start1
cmp al,'o'     ;if o key pressed then jump to start1
je start1

cmp ax,4B00h    ;if left key is pressed then jump to leftKeyPressed2
je leftKeyPressed2  

cmp ax,4D00h     ;if right key is pressed then jump to o1
je o1

cmp ax,4800h  ;if up key is pressed then jump to o else jump to again2
je o
jne again2

cmp word[mariox],620   ;flag
je oo                  ;if they are equal then jump to oo

leftKeyPressed2:

cmp word[mariox],80  ;hurdles1
je hurdles222         ;if they are equal then jump to hurdles222

cmp word[mariox],340  ;hurdles2
je hurdles112       ;if they are equal then jump to hurdles112

cmp word[mariox],500   ;hurdles3
je hurdles332       ;if they are equal then jump to hurdles332

cmp word[mariox],600   ;flag
je start2          ;if they are equal then jump to start2 else jump to r
jne r
o:
call upKeyPressed2     ;calling upKeyPressed2
o1:
call rightKeyPressed2222222222      ;calling rightKeyPressed2222222222
oo:
call exit         ;calling exit

r:
mov bx,word[enemyX1]  ;derefrencing enemyX1 of word type and moving its value in bx
sub bx,30
cmp word[mariox],bx  ;enemy1
je oo                 ;if they are equal then jump to oo

mov bx,word[enemyX2]  ;derefrencing enemyX2 of word type and moving its value in bx
sub bx,30
cmp word[mariox],bx  ;enemy2
je oo                ;if they are equal then jump to oo


mov bx,word[enemyX1]  ;derefrencing enemyX1 of word type and moving its value in bx
add bx,30
cmp word[mariox],bx  ;enemy1
je oo                ;if they are equal then jump to oo

mov bx,word[enemyX2]   ;derefrencing enemyX2 of word type and moving its value in bx
add bx,30
cmp word[mariox],bx  ;enemy2
je oo                 ;if they are equal then jump to oo

jmp nohurdles2          ;jump to nohurdles2

hurdles112:
mov bx,5            ;moving 5 in bx
add word[mariox],bx     ;derefrencing mariox of word type and adding value of bx in it

call hurdle1       ;calling hurdle1
call clearmario       ;calling clearmario
call mario        ;calling mario



jmp again2        ;jump to again2

hurdles222:
mov bx,5            ;moving 5 in bx
add word[mariox],bx     ;derefrencing mariox of word type and adding value of bx in it

call hurdle2       ;calling hurdle2
call clearmario       ;calling clearmario
call mario        ;calling mario



jmp again2        ;jump to again2

hurdles332:
mov bx,5            ;moving 5 in bx
add word[mariox],bx     ;derefrencing mariox of word type and adding value of bx in it

call hurdle3       ;calling hurdle3
call clearmario       ;calling clearmario
call mario        ;calling mario

jmp again2        ;jump to again2	

nohurdles2:
mov bx,5       ;moving 5 in bx
sub word[mariox],bx     ;derefrencing mariox of word type and subtracting value of bx from it


call clearmario    ;calling clearmario
call mario         ;calling mario
call hurdletops       ;calling hurdletops


cmp word[mariox],105  ;hurdles1
je hurdles222        ;if they are equal then jump to hurdles222

cmp word[mariox],340  ;hurdles2
je hurdles112      ;if they are equal then jump to hurdles112

cmp word[mariox],500   ;hurdles3
je hurdles332       ;if they are equal then jump to hurdles332

cmp word[mariox],600   ;flag
je mm                  ;if they are equal then jump to mm



jmp again2           ;jump to again2

rightKeyPressed2222222222:

cmp word[mariox],60  ;hurdles1
je hurdles2222       ;if they are equal then jump to hurdles2222

cmp word[mariox],310  ;hurdles2
je hurdles12        ;if they are equal then jump to hurdles12

cmp word[mariox],465   ;hurdles3
je hurdles32        ;if they are equal then jump to hurdles32

cmp word[mariox],600   ;flag
je start2               ;if they are equal then jump to start2


mov bx,word[enemyX1]     ;derefrencing enemyX1 of word type and moving its value in bx
sub bx,30
cmp word[mariox],bx  ;enemy1
je mm            ;if they are equal then jump to mm

mov bx,word[enemyX2]     ;derefrencing enemyX2 of word type and moving its value in bx
sub bx,30
cmp word[mariox],bx  ;enemy2
je mm                 ;if they are equal then jump to mm


mov bx,word[enemyX1]  ;derefrencing enemyX2 of word type and moving its value in bx
add bx,30
cmp word[mariox],bx  ;enemy1
je mm                    ;if they are equal then jump to mm

mov bx,word[enemyX2]  ;derefrencing enemyX2 of word type and moving its value in bx
add bx,30
cmp word[mariox],bx  ;enemy2
je mm                    ;if they are equal then jump to mm else jump to noHurdles2
jne noHurdles2
mm:
call exit              ;calling exit
hurdles12:
mov bx,5                ;moving 5 in bx
sub word[mariox],bx     ;derefrencing mariox of word type and subtracting value of bx from it

call hurdle1           ;calling hurdle1
call clearmario          ;calling clearmario
call mario             ;calling mario

jmp again2              ;jump to again2

hurdles2222:
mov bx,5                ;moving 5 in bx
sub word[mariox],bx     ;derefrencing mariox of word type and subtracting value of bx from it

call hurdle2           ;calling hurdle2
call clearmario          ;calling clearmario
call mario             ;calling mario

jmp again2              ;jump to again2

hurdles32:
mov bx,5                ;moving 5 in bx
sub word[mariox],bx     ;derefrencing mariox of word type and subtracting value of bx from it

call hurdle3           ;calling hurdle3
call clearmario          ;calling clearmario
call mario             ;calling mario

jmp again2              ;jump to again2		

noHurdles2:
mov bx,5            ;moving 5 in bx
add word[mariox],bx     ;derefrencing mariox of word type and adding value of bx in it           

call clearmario       ;calling clearmario
call mario           ;calling mario

call hurdletops          ;callling hurdletops


cmp word[mariox],80  ;hurdles1
je hurdles222        ;if they are equal then jump to hurdles222  

cmp word[mariox],340  ;hurdles2
je hurdles112          ;if they are equal then jump to hurdles112

cmp word[mariox],500   ;hurdles3
je hurdles332           ;if they are equal then jump to hurdles332

cmp word[mariox],600   ;flag
je start3             ;if they are equal then jump to start3


jmp again2             ;jump to again2

upKeyPressed2:  
cmp word[mariox],150  ;hurdles
je mm                 ;if they are equal then jump to mm

cmp word[mariox],320
je mm                ;if they are equal then jump to mm

cmp word[mariox],480
je mm                ;if they are equal then jump to mm

cmp word[mariox],620   ;flag
je start3           ;if they are equal then jump to start3

call hurdletops       ;calling hurdletops
call clearmario          ;calling clearmario
call jump               ;calling jump






jmp again2           ;jump to again2




jmp again2          ;jump to again2


;------------------------------------------------------------------word[level3]



start3:


call clearscreen       ;calling clearscreen


mov dword[screen],0    ;start of screen
call Cstart3           ;calling Cstart3
KK4:

add dword[screen],1   ;derefrencing screen of dowrd type and adding 1 in it

cmp dword[screen],100000  ;derefrencing screen of dowrd type and comparing it with 100000
je nKK4                   ;if they are equal then jump to nKK4
jmp KK4                    ;jump to KK4

nKK4:
mov dword[screen],0    ;derefrencing screen of dowrd type and moving 0 in it
call clearscreen       ;calling clearscreen

;call ;drawrect3

mov word[cloudX],180
mov word[cloudY],40
call clearscreen   ;calling clearscreen

mov dl, 2 ;col
mov dh, 1 ;row
mov bh,0
mov ah,02h
int 10h
mov al, 'M'      
mov bl,0ch     ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'A'
mov bl,0ch       ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'R'
mov bl,0ch       ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'I'
mov bl,0ch       ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'O'
mov bl,0ch      ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h


mov dl, 2 ;col
mov dh, 2 ;row
mov bh,0
mov ah,02h
int 10h




mov dl, 2 ;col
mov dh, 3 ;row
mov bh,0
mov ah,02h
int 10h
mov al, 'L'
mov bl,0ch      ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'E'
mov bl,0ch       ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'V'
mov bl,0ch      ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'E'
mov bl,0ch      ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, 'L'
mov bl,0ch      ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, ' '
mov bl,0ch      ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h
mov al, '3'
mov bl,0ch      ;background
mov bh, 0
mov ah, 0eh  ;color
int 10h


call cloud

call hurdle1       ;calling hurdle1

call hurdle2         ;calling hurdle2

call hurdle3           ;calling hurdle3

call grass            ;calling grass

call clearmario      ;calling clearmario

call flaghide        ;calling flaghide

mov word[level3],1   ;derefrencing level3 of word type and moving 1 in it
mov dword[count],0   ;derefrencing count of dword type and moving 0 in it



start33:

mov word[drawrect2X],283   ;derefrencing drawrect2X of word type and moving 283 in it
mov word[drawrect1X],428    ;derefrencing drawrect1X of word type and moving 428 in it


mov word[castleX],585   ;position of castle along x-axis
mov word[castleY],302   ;position of castle along y-axis


mov word[dragonX], 120  ;position of dragon along x-axis
mov word[dragonY], 70   ;position of dragon along y-axis
call dragonhide         ;calling dragonhide
call dragon             ;calling dragon


;call flaghide
call clearmario         ;calling clearmario

mov word[mariox],20    ;position of mario along x-axis
mov word[marioY], 300  ;position of mario along y-axis

mov word[enemyX1],300  ;position of enemy1 along x-axis
mov word[enemyY1], 293  ;position of enemy1 along y-axis
call  enemy1            ;calling enemy1

mov word[enemyX2],445   ;position of enemy2 along x-axis
mov word[enemyY2], 293  ;position of enemy2 along y-axis
call enemy2             ;calling enemy2



call mario              ;calling mario
call castle             ;calling castle


again3:

add dword[count],1      ;derefrencing count of dword type and adding 1 in it                   

cmp dword[count],200000   ;derefrencing count of dword type and comparing it with 200000
ja blockk                    



jmp noo           ;jump to noo




blockk:



cmp dword[count],200000    ;derefrencing count of dword type and comparing it with 200000
ja hx

jmp noo	                  ;jump to noo


hx:
call drawrect2        ;calling drawrect2
call drawrect1           ;calling drawrect1

level33:

cmp word[enemyX1],120  ;hurdles1
je restart11            ;if they are equal then jump to restart11

cmp word[dragonX],480  ;dragon
je restartD                 ;if they are equal then jump to restarD


cmp word[enemyX2],360  ;hurdles2
je restart22         ;if they are equal then jump to restart22

jmp norestartt        ;jump to norestartt


restart11:
call drawrect2             ;calling drawrect2
call drawrect1            ;calling drawrect1
mov word[drawrect2X],283   
call drawrect1

mov word[enemyX1],300  ;position of enemy1 along x-axis
mov word[enemyY1], 293 ;position of enemy1 along y-axis
call  enemy1            ;calling enemy1


cmp word[enemyX1],120  ;hurdles1
je restart11               ;if they are equal then jump to restart11     

cmp word[dragonX],480  ;dragon
je restartD            ;if they are equal then jump to dragon


cmp word[enemyX2],360  ;hurdles2
je restart22           ;if they are equal then jump to restart22

jmp norestartt           ;jump to norestartt

restart22:

call drawrect2        ;calling drawrect2
call drawrect1        ;calling drawrect1
mov word[drawrect1X],428
call drawrect2
mov word[enemyX2],445  ;position of enemy2 along x-axis
mov word[enemyY2], 293 ;position of enemy2 along y-axis
call enemy2

jmp norestartt

cmp word[enemyX1],120  ;hurdles1
je restart11           ;if they are equal then jump to restart11   

cmp word[dragonX],480  ;dragon
je restartD            ;if they are equal then jump to restartD   


cmp word[enemyX2],360  ;hurdles2
je restart22            ;if they are equal then jump to restart22   

restartD:

mov word[dragonX],120   ;position of dragon along x-axis
mov word[dragonY], 70   ;position of dragon along y-axis
				 
call dragonhide         ;calling dragonhide
call dragon            ;calling dragon


cmp word[enemyX1],120  ;hurdles1
je restart11           ;if they are equal then jump to restart11   

cmp word[dragonX],480  ;dragon
je restartD          ;if they are equal then jump to restartD


cmp word[enemyX2],360  ;hurdles2
je restart22           ;if they are equal then jump to restart22 else jump to norestartt
jne norestartt                
nn:
call exit            ;calling exit

norestartt:



call drawrect2        ;calling drawrect2
call drawrect1        ;calling drawrect1

mov dword[count],0      ;derefrencing count of dword type and moving 0 in it
;for enemy movement
sub word[drawrect1X],1    ;derefrencing drawrect1X of word type and subtracting 1 from it
call drawrect1            ;calling drawrect1

sub word[drawrect2X],1    ;derefrencing drawrect1X of word type and subtracting 1 from it
call drawrect2            ;calling drawrect2

sub word[enemyX1],1      ;derefrencing enemyX1 of word type and subtracting 1 from it
call enemy1              ;calling enemy1

sub word[enemyX2],1     ;derefrencing enemyX2 of word type and subtracting 1 from it
call enemy2             ;calling enemy2
;sub word[enemyX1],0
;call enemy1

;sub word[enemyX2],0
;call enemy2

add word[dragonX],40


call dragon					;calling dragon	 
call dragonhide              ;calling dragonhide	
call dragon                    ;calling dragon	
call dragonhide                ;calling dragonhide	


call clearmario             ;calling clearmario	
call mario               ;calling mario	
call drawrect2            ;calling drawrect2	
call drawrect1           ;calling drawrect1	


cmp word[enemyX1],120  ;hurdles1
je restart11           ;if they are equal then jump to restart11   

cmp word[dragonX],480  ;dragon
je restartD            ;if they are equal then jump to restartD   


cmp word[enemyX2],360  ;hurdles2
je restart22          ;if they are equal then jump to restart22   
jmp noo               ;jump to noo

noo:

mov bx,word[enemyX1]
cmp word[mariox],bx  ;enemy1
je nn                  ;if they are equal then jump to nn   

mov bx,word[enemyX2]
cmp word[mariox],bx  ;enemy2
je nn               ;if they are equal then jump to nn
		



mov ah,01     ;checking for key press
int 16h
JZ again3      ;if no key is pressed
mov ah,0      ;getting chracter
int 16h




cmp al,'E'     ;E key pressed
je nn
cmp al,'e'     ;e key pressed
je nn

cmp al,'N'     ;N key pressed
je start1
cmp al,'n'     ;n key pressed
je start1

cmp al,'L'     ;L key pressed
je start3
cmp al,'l'     ;l key pressed
je start3

cmp al,'O'     ;O key pressed
je start1
cmp al,'o'     ;o key pressed
je start1




cmp ax,4B00h    ;left key pressed
je leftKeyPressed223

cmp ax,4D00h     ;right key pressed
je dd2

cmp ax,4800h  ;up key pressed
je dd1
jne again3
dd1:
    call upKeyPressed223  ;calling upKeyPressed223ey
dd2:
call rightKeyPressed223  ;calling rightKeyPressed223
d:
call exit                ;calling exit

leftKeyPressed223:



cmp word[mariox],340  ;hurdles1
je hurdles123         ;if they are equal then jump to hurdles123

cmp word[mariox],80  ;hurdles2
je hurdles456         ;if they are equal then jump to hurdles456

cmp word[mariox],500   ;hurdles3
je hurdles789            ;if they are equal then jump to hurdles789

cmp word[mariox],550   ;flag
je d                  ;if they are equal then jump to d




mov bx,word[enemyX1]   ;derefrencing enemyX1 of word type and moving its value in bx
sub bx,30
cmp word[mariox],bx  ;enemy1
je d                  ;if they are equal then jump to d

mov bx,word[enemyX2]    ;derefrencing enemyX2 of word type and moving its value in bx
sub bx,30
cmp word[mariox],bx  ;enemy2
je d                    ;if they are equal then jump to d


mov bx,word[enemyX1]    ;derefrencing enemyX1 of word type and moving its value in bx
add bx,30
cmp word[mariox],bx  ;enemy1
je d                   ;if they are equal then jump to d

mov bx,word[enemyX2]    ;derefrencing enemyX2 of word type and moving its value in bx
add bx,30
cmp word[mariox],bx  ;enemy2
je d                   ;if they are equal then jump to d
 
jmp nohurdles00     ;jump to nohurdles00

hurdles123:
mov bx,5            ;moving 5 in bx
add word[mariox],bx   ;derefrencing mariox of word type and adding value of bx in it 

call hurdle1         ;calling hurdle1
call clearmario        ;calling clearmario
call mario           ;calling mario



jmp again3           ;jump to again3

hurdles456:
mov bx,5            ;moving 5 in bx
add word[mariox],bx   ;derefrencing mariox of word type and adding value of bx in it 

call hurdle2         ;calling hurdle2
call clearmario        ;calling clearmario
call mario           ;calling mario

jmp again3           ;jump to again3

hurdles789:
mov bx,5            ;moving 5 in bx
add word[mariox],bx   ;derefrencing mariox of word type and adding value of bx in it 

call hurdle3         ;calling hurdle3
call clearmario        ;calling clearmario
call mario           ;calling mario

jmp again3           ;jump to again3		

nohurdles00:
mov bx,5           ;moving 5 in bx
sub word[mariox],bx   ;derefrencing mariox of word type and subtracting value of bx in it


call clearmario      ;calling clearmario
call mario          ;calling mario
call hurdletops     ;calling hurdletops




cmp word[mariox],340  ;hurdles1
je hurdles123           ;if they are equal then jump to hurdles123

cmp word[mariox],105  ;hurdles2
je hurdles456         ;if they are equal then jump to hurdles456

cmp word[mariox],500   ;hurdles3
je hurdles789           ;if they are equal then jump to hurdles789

cmp word[mariox],560   ;flag
je v                     ;if they are equal then jump to v else jump to again3
jne again3
v:
call exit             ;calling exit
rightKeyPressed223:


cmp word[mariox],310  ;hurdles1
je hurdles5            ;if they are equal then jump to hurdles5

cmp word[mariox],60  ;hurdles2
je hurdles55          ;if they are equal then jump to hurdles55


cmp word[mariox],465   ;hurdles3
je hurdles555             ;if they are equal then jump to hurdles555

cmp word[mariox],570   ;flag
je v                   ;if they are equal then jump to v



mov bx,word[enemyX1]
cmp word[mariox],bx  ;enemy1
je v                   ;if they are equal then jump to v

mov bx,word[enemyX2]
cmp word[mariox],bx  ;enemy2
je v                   ;if they are equal then jump to v

add word[Factivate],1

cmp word[Factivate],10
je unleash             ;if they are equal then jump to unleash
jmp dontunleash         ;jump to dontunleash
unleash:  

call firedrop          ;calling firedrop
mov bx, word[mariox]  ;derefrencing mariox of word type and moving its value in bx 
cmp word[fireX],bx    ;derefrencing fireX of word type and comapring it with value of bx 
je v                     ;if they are equal then jump to v
mov word[Factivate],0    ;;derefrencing Factivate of word type and moving value of 0 in it


dontunleash:
jmp noHurdles22         ;jump to noHurdles22

hurdles5:
mov bx,5             ;moving 5 in bx
sub word[mariox],bx  ;derefrencing mariox of word type and subtracting value of bx from it

call hurdle1         ;calling hurdle1
call clearmario      ;calling clearmario
call mario           ;calling mario

jmp again3          ;jump to again3

hurdles55:
mov bx,5             ;moving 5 in bx
sub word[mariox],bx  ;derefrencing mariox of word type and subtracting value of bx from it

call hurdle2         ;calling hurdle2
call clearmario      ;calling clearmario
call mario           ;calling mario

jmp again3          ;jump to again3

hurdles555:
mov bx,5             ;moving 5 in bx
sub word[mariox],bx  ;derefrencing mariox of word type and subtracting value of bx from it

call hurdle3         ;calling hurdle3
call clearmario      ;calling clearmario
call mario           ;calling mario

jmp again3          ;jump to again3	

noHurdles22:
mov bx,5    ;moving 5 in bx
add word[mariox],bx  ;derefrencing mariox of word type and adding value of bx from it


call clearmario   ;calling clearmario
call mario        ;calling mario 

call hurdletops   ;calling hurdletops



cmp word[mariox],340  ;hurdles1
je hurdles5          ;if they are equal then jump to hurdles5


cmp word[mariox],80  ;hurdles2
je hurdles55          ;if they are equal then jump to hurdles55

cmp word[mariox],500   ;hurdles3
je hurdles555           ;if they are equal then jump to hurdles555

cmp word[mariox],20   ;flag
je exit                 ;if they are equal then jump to exit


jmp again3           ;jump to again3

upKeyPressed223:  
cmp word[mariox],150  ;hurdles
je exit                  ;if they are equal then jump to exit

cmp word[mariox],320
je exit                ;if they are equal then jump to exit

cmp word[mariox],480
je exit                ;if they are equal then jump to exit

cmp word[mariox],550   ;flag
je exit                  ;if they are equal then jump to exit

call hurdletops        ;calling hurdletops
call clearmario        ;calling clearmario
call jump              ;calling jump
;call firedrop





jmp again3         ;jump to again3




jmp again3         ;jump to again3











;-----------------------------------------------------------------exit

exit:

call clearscreen        ;calling clearscreen


mov dword[screen],0      ;derefrencing screen of dword type and moving 0 in it
call Cstart4            ;calling Cstart4
KK5:

add dword[screen],1    ;derefrencing screen of dword type and adding 1 in it

cmp dword[screen],100000   ;derefrencing screen of dword type and comparing it with 100000
je nKK5                 ;if they are equal then jump to nKK5
jmp KK5                 ;jump to KK5

nKK5:
mov dword[screen],0  ;derefrencing screen of dword type and moving 0 in it
call clearscreen     ;calling clearscreen


mov ah, 4ch    ;stay resident
int 10h

;------------------------------------------------------------------objects



draw: 

pop word[var]  
pop word[x]
pop word[y]

mov ah, 0ch   ;graphics mode
mov al, 14	;color of my pixel
mov cx, word[y]
mov dx, word[x]
int 10h


mov bx, 4
l:
mov si, 4   ;desired rows
l1:
inc cx      ;incrementing cx
int 10h
dec si       ;decrementing si
cmp si, 0    ;if si >=0 then jump to l1
jge l1

mov cx, word[y]		; reset to the start of the col
inc dx		; next row
int 10h
int 10h
dec bx      ;decrementing bx
cmp bx, 0    ;if bx >=0 then jump to l
jge l

mov ah, 4ch  ;stay resident
int 21h

push word[var]  

ret



drawrect1:

mov ah, 0ch
mov al, 0    ;color
mov cx, 49	; height	
mov dx, word[drawrect1Y]	; word[y]-start; word[marioY]
int 10h
loop21:
push cx   ;pysing cx
mov cx, word[drawrect1X]	;how far from the word[x]-start ;variable word[mariox]
mov si, 43   ;x-axis
call l2
mov cx, word[drawrect1X]	; setting col again
inc dx	; next rows
int 10h
int 10h
pop cx     ;popping cx
loop loop21
ret



clearscreen:

mov ah, 0ch   ;graphics mode
mov al, 0    
mov cx, 500	; height	
mov dx, 0	; word[y]-start; word[marioY]
int 10h

loop22:
push cx    ;pushing cx
mov cx, 0	;how far from the word[x]-start ;variable word[mariox]

mov si,700    ;x-axis
call l2

mov cx, 0	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx    ;popping cx
loop loop22
ret


drawrect2:

mov ah, 0ch
mov al, 0    ;color
mov cx, 49	; height	
mov dx, word[drawrect2Y]	; word[y]-start; word[marioY]
int 10h

loop23:
push cx    ;pushing cx
mov cx, word[drawrect2X]	;how far from the word[x]-start ;variable word[mariox]

mov si, 43    ;x-axis
call l2       ;calling l2

mov cx, word[drawrect2X]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx    ;popping cx
loop loop23
ret


dragonhide:

mov ah, 0ch
mov al, 0    ;color
mov cx, 60	; height	
mov dx, 62	; word[y]-start; word[marioY]
int 10h

loop24:
push cx     ;pushing cx
mov cx,80	;how far from the word[x]-start ;variable word[mariox]

mov si, 450    ;x-axis
call l2

mov cx, 80	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx        ;popping cx
loop loop24

ret



hurdletops:
; hurdle1
mov ah, 0ch
mov al, 13   ;color
mov cx, 18	;height of hurdle && responsible for the pixel in the start
mov dx, 265  ;position
int 10h

h1:
push cx     ;pushing cx
mov cx, 327	;how far the hurdle is from the starting

mov si, 18   ;desired rows
l22:
inc cx		; thickness of the hurdle
int 10h
dec si       ;decrementing si
cmp si, 0    ;if si >=0 then jump to l22
jge l22

mov cx, 327	; setting col again
inc dx	; going to the next row
int 10h
int 10h
pop cx     ;popping cx
loop h1


;hurdle2
mov ah, 0ch
mov al, 13  ;color
mov cx, 15	; height of hurdle && responsible for the pixel in the start
mov dx, 300	; start point of the hurdle alog word[y] axis
int 10h

h3:
push cx     ;pusing cx
mov cx, 77	;how far the hurdle is from the starting

mov si, 18   ;desired rows
l3:
inc cx		; thickness of the flag
int 10h
dec si        ;decrementing si
cmp si, 0    ;if si >=0 then jump to l3
jge l3

mov cx, 77	; setting col again
inc dx	; going to the next row
int 10h
int 10h
pop cx    ;popping cx
loop h3


;hurdle3
mov ah, 0ch
mov al, 13 ;color
mov cx, 18	;responsible for the pixel in the start
mov dx, 290  ;; start point of the hurdle alog word[y] axis
int 10h

h4:
push cx  ;pushing cx
mov cx, 478	;how far the hurdle is from the starting

mov si, 20  ;desired rows
l41:
inc cx    ;incrementing cx
int 10h
dec si       ;decrementing si
cmp si, 0    ;if si >=0 then jump to l41
jge l41 

mov cx, 478	; setting col again
inc dx	; going to the next row
int 10h
int 10h
pop cx   ;popping cx
loop h4

ret



hurdle1: ; middle

;;base
mov ah, 0ch
mov al, 6   ;color
mov cx, 59	; height of the hurdle	// responsible 
mov dx, 283	; starting of the hurdle		(along word[y]-axis)
int 10h

h2:
push cx     ;pushing cx
mov cx, 325	;how far the hurdle is from the starting

mov si, 15    ;desired rows
l31:
inc cx		; thickness of the hurdle
int 10h
dec si      ;decrementing si
cmp si, 0    ;if si >=0 then jump to l31
jge l31

mov cx, 325	; setting col again
inc dx	; going to the next row
int 10h
int 10h
pop cx
loop h2


;top of hurdle
mov ah, 0ch
mov al, 13  ;color
mov cx, 18	;responsible for the pixel in the start
mov dx, 265  ; starting of the hurdle		(along word[y]-axis)
int 10h

h11:
push cx
mov cx, 322	;how far the hurdle is from the starting

mov si, 20  ;desired rows
l23:
inc cx		; thickness of the hurdle
int 10h
dec si         ;decrementing si
cmp si, 0    ;if si >=0 then jump to l23
jge l23 

mov cx, 328	; setting col again
inc dx	; going to the next row
int 10h
int 10h
pop cx    ;popping cx
loop h11




ret 



hurdle2: ;left hurdle


mov ah, 0ch
mov al, 6   ;color
mov cx, 27	; height of the hurdle	&& responsible for pixel in start 
mov dx, 315	; starting of the hurdle		(along word[y]-axis)
int 10h

h21:
push cx
mov cx, 80	;how far the hurdle is from the starting

mov si, 15   ;desired rows
l3122:
inc cx		; thickness of the hurdle
int 10h
dec si        ;decrementing si
cmp si, 0    ;if si >=0 then jump to l3122
jge l3122

mov cx, 80	; setting col again
inc dx	; going to the next row
int 10h
int 10h
pop cx
loop h21



mov ah, 0ch
mov al, 13   ;color
mov cx, 15	; height of hurdle && responsible for the pixel in the start
mov dx, 300	; start point of the hurdle alog word[y] axis
int 10h

h12:
push cx
mov cx, 77	;how far the hurdle is from the starting

mov si, 20   ;desired rows
l24:
inc cx		; thickness of the flag
int 10h
dec si      ;decrementing si
cmp si, 0    ;if si >=0 then jump to l24
jge l24 

mov cx, 77	; setting col again
inc dx	; going to the next row
int 10h
int 10h
pop cx
loop h12


ret 






hurdle3: ;right hurdle


mov ah, 0ch
mov al, 6    ;color
mov cx, 34	; height of the hurdle	&& responsible for pixel in start 
mov dx, 308	; starting of the hurdle		(along word[y]-axis)
int 10h

h22:
push cx
mov cx, 480	;how far the hurdle is from the starting

mov si, 15
l32:
inc cx		; thickness of the hurdle
int 10h
dec si        ;decrementing si
cmp si, 0    ;if si >=0 then jump to l32
jge l32

mov cx, 480	; setting col again
inc dx	; going to the next row
int 10h
int 10h
pop cx
loop h22



mov ah, 0ch
mov al, 13   ;color
mov cx, 18	;responsible for the pixel in the start
mov dx, 290  ; starting of the hurdle		(along word[y]-axis)
int 10h

h12222:
push cx
mov cx, 477	;how far the hurdle is from the starting

mov si, 20
l25:
inc cx		; thickness of the hurdle
int 10h
dec si       ;decrementing si
cmp si, 0    ;if si >=0 then jump to l25
jge l25 

mov cx, 477	; setting col again
inc dx	; going to the next row
int 10h
int 10h
pop cx
loop h12222


ret


grass:

;;base
mov ah, 0ch
mov al, 10   ;color
mov cx, 80	; height of the hurdle	// responsible 
mov dx, 342	; starting of the hurdle		(along word[y]-axis)
int 10h

h23:
push cx     
mov cx, 0	;how far the hurdle is from the starting

mov si, 650  ;desired rows
l33:
inc cx		; thickness of the hurdle
int 10h
dec si         ;decrementing si
cmp si, 0    ;if si >=0 then jump to l33
jge l33

mov cx, 0	; setting col again
inc dx	; going to the next row
int 10h
int 10h
pop cx
loop h23


ret 


mario:

mov bx, word[mariox]     ;derefrencing mariox of word type and moving its value in bx
mov word[savemariox],bx   ;derefrencing savemariox of word type and moving value of bx in it
mov bx, word[marioY]      ;derefrencing marioY of word type and moving its value in bx
mov word[savemarioY],bx   ;derefrencing savemarioY of word type and moving value of bx in it
mov bx,0



mov bx, word[mariox]      ;derefrencing mariox of word type and moving its value in bx
mov word[clearsavex],bx   ;derefrencing clcearsavex of word type and moving value of bx in it
mov bx, word[marioY]      ;derefrencing marioY of word type and moving its value in bx
mov word[clearsaveY],bx   ;derefrencing clearsaveY of word type and moving its value in bx
mov bx,0


;hattop


mov bx,15               ;position
sub word[marioY],bx


mov ah, 0ch
mov al, 4    ;color
mov cx, 2	; height	
mov dx, word[marioY]	; word[y]-start; word[marioY]
int 10h

loop00:
push cx
mov cx, word[mariox]	;how far from the word[x]-start ;variable word[mariox]

mov si, 8   ;desired rows
l00:
inc cx		; thickness
int 10h
dec si     ;decrementing si
cmp si, 0    ;if si >=0 then jump to l00
jge l00

mov cx, word[mariox]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop00


mov bx,15  ;posiiton
add word[marioY],bx

;hat


mov bx,13   ;posiiton
sub word[marioY],bx


mov ah, 0ch
mov al, 4     ;color
mov cx, 12	; height	
mov dx, word[marioY]	; word[y]-start; word[marioY]
int 10h

loop01:
push cx
mov cx, word[mariox]	;how far from the word[x]-start ;variable word[mariox]

mov si, 15  ;desired rows
l0:
inc cx		; thickness
int 10h
dec si       ;decrementing si
cmp si, 0    ;if si >=0 then jump to l0
jge l0

mov cx, word[mariox]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop01


mov bx,13    ;position
add word[marioY],bx




;nose


mov bx,3      ;position
add word[marioY],bx


mov ah, 0ch
mov al, 14   ;color
mov cx, 4	; height	
mov dx, word[marioY]	; word[y]-start; word[marioY]
int 10h

loop000:
push cx 
mov cx, word[mariox]	;how far from the word[x]-start ;variable word[mariox]

mov si, 13   ;desired rows
l000:
inc cx		; thickness
int 10h
dec si       ;decrementing si
cmp si, 0    ;if si >=0 then jump to l000
jge l000

mov cx, word[mariox]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop000


mov bx,3         ;position
sub word[marioY],bx






;head


mov ah, 0ch
mov al, 14   ;color
mov cx, 12	; height	
mov dx, word[marioY]	; word[y]-start; word[marioY]
int 10h

loop25:
push cx
mov cx, word[mariox]	;how far from the word[x]-start ;variable word[mariox]

mov si, 9   ;desred rows
call l2

mov cx, word[mariox]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop25


;mooch


mov bx,6    ;position along y-axis
add word[marioY],bx
mov bx,7       ;position along x-axis
add word[mariox],bx

mov ah, 0ch
mov al, 8   ;color
mov cx, 2	; height	
mov dx, word[marioY]	; word[y]-start; word[marioY]
int 10h

loop00001:
push cx
mov cx, word[mariox]	;how far from the word[x]-start ;variable word[mariox]

mov si, 3   ;desired rows
l0000:
inc cx		; thickness
int 10h
dec si      ;decrementing si
cmp si, 0    ;if si >=0 then jump to l0000
jge l0000

mov cx, word[mariox]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop00001

mov bx,6    ;position along y-axis
sub word[marioY],bx
mov bx,7      ;position along x-axis
sub word[mariox],bx


;body

mov bx,12  ;position along y-axis
add word[marioY],bx
mov bx,2   ;position along x-axis
sub word[mariox],bx

mov ah, 0ch
mov al, 4   ;color
mov cx, 18	; height	
mov dx, word[marioY]	; word[marioY] +15
int 10h

loop311:
push cx
mov cx, word[mariox]	;how far from the start ;word[mariox]-5

mov si, 15
l331:
inc cx		; thickness
int 10h
dec si          ;decrementing si
cmp si, 0    ;if si >=0 then jump to l331
jge l331 

mov cx, word[mariox]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop311

;legs1

mov bx,18   ;position along y-axis
add word[marioY],bx
mov bx,3    ;position along x-axis
add word[mariox],bx

mov ah, 0ch
mov al, 8   ;color
mov cx, 12	; height	
mov dx, word[marioY]	; word[marioY]+45
int 10h

loop4:
push cx
mov cx,word[mariox] 	;how far from the start; word[mariox]+1

mov si, 3   ;desired rows
l42:
inc cx
int 10h
dec si     ;decrementing si
cmp si, 0    ;if si >=0 then jump to l42
jge l42 

mov cx, word[mariox]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop4

;legs2

mov bx,6   ;posiiton along x-axis
add word[mariox],bx

mov ah, 0ch
mov al, 8   ;color
mov cx, 12	; height	
mov dx, word[marioY]	; word[marioY]+45
int 10h




mov bx,5   ;position along y-axis
add word[marioY],bx

loop51:
push cx
mov cx,word[mariox] 	;how far from the start;word[mariox]+11

mov si, 3   ;desired rows
l51:
inc cx		; thickness
int 10h
dec si       ;decrementing si
cmp si, 0    ;if si >=0 then jump to l51
jge l51

mov cx, word[mariox]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop51

;saving the old value of mario 
mov bx, word[savemariox]
mov word[mariox],bx
mov bx, word[savemarioY]
mov word[marioY],bx
mov bx,0

ret


clearmario:

mov bx, word[mariox]   ;derefrencing mariox of word type and moving its value in bx
mov word[savemariox],bx  ;derefrencing savemariox of word type and moving value of bx in it
mov bx, word[marioY]     ;derefrencing marioY of word type and moving its value in bx
mov word[savemarioY],bx  ;derefrencing savemarioY of word type and moving value of bx in it
mov bx,0

mov bx, word[clearsavex]    ;derefrencing clearsavex of word type and moving its value in bx
mov word[mariox],bx        ;derefrencing mariox of word type and moving value of bx in it
mov bx, word[clearsaveY]   ;derefrencing clearsaveY of word type and moving its value in bx
mov word[marioY],bx        ;derefrencing marioY of word type and moving value of bx in it
mov bx,0


;hattop


mov bx,15    ;position along y-axis
sub word[marioY],bx


mov ah, 0ch
mov al, 0    ;color
mov cx, 2	; height	
mov dx, word[marioY]	; word[y]-start; word[marioY]
int 10h

loop001:
push cx
mov cx, word[mariox]	;how far from the word[x]-start ;variable word[mariox]

mov si, 8   ;desired rows
l001:
inc cx		; thickness
int 10h
dec si       ;decrementing si
cmp si, 0    ;if si >=0 then jump to l001
jge l001

mov cx, word[mariox]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop001


mov bx,15    ;position along y-axis
add word[marioY],bx

;hat


mov bx,13       ;position along y-axis
sub word[marioY],bx


mov ah, 0ch
mov al, 0    ;color
mov cx, 12	; height	
mov dx, word[marioY]	; word[y]-start; word[marioY]
int 10h

loop0:
push cx
mov cx, word[mariox]	;how far from the word[x]-start ;variable word[mariox]

mov si, 15   ;desired rows
l01:
inc cx		; thickness
int 10h
dec si      ;decrementing si
cmp si, 0    ;if si >=0 then jump to l01
jge l01

mov cx, word[mariox]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop0


mov bx,13      ;position along y-axis
add word[marioY],bx




;nose


mov bx,3           ;position along y-axis
add word[marioY],bx


mov ah, 0ch
mov al, 0    ;color
mov cx, 4	; height	
mov dx, word[marioY]	; word[y]-start; word[marioY]
int 10h

loop0001:
push cx
mov cx, word[mariox]	;how far from the word[x]-start ;variable word[mariox]

mov si, 13    ;desired rows
l0001:
inc cx		; thickness
int 10h
dec si       ;decrementing si
cmp si, 0    ;if si >=0 then jump to l0001
jge l0001

mov cx, word[mariox]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop0001


mov bx,3   ;position along y-axis
sub word[marioY],bx



;head

mov ah, 0ch
mov al, 0    ;color
mov cx, 12	; height	
mov dx, word[marioY]	; word[y]-start; word[marioY]
int 10h

loop26:
push cx
mov cx, word[mariox]	;how far from the word[x]-start ;variable word[mariox]

mov si, 10   ;desired rows
call l2

mov cx, word[mariox]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop26

;mooch


mov bx,6   ;position along y-axis
add word[marioY],bx
mov bx,7   ;position along x-axis
add word[mariox],bx

mov ah, 0ch
mov al, 0    ;color
mov cx, 2	; height	
mov dx, word[marioY]	; word[y]-start; word[marioY]
int 10h

loop0000:
push cx
mov cx, word[mariox]	;how far from the word[x]-start ;variable word[mariox]

mov si, 3    ;desired rows
l00001:
inc cx		; thickness
int 10h
dec si        ;decrementing si
cmp si, 0    ;if si >=0 then jump to l00001
jge l00001

mov cx, word[mariox]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop0000

mov bx,6   ;position along y-axis
sub word[marioY],bx
mov bx,7   ;position along x-axis
sub word[mariox],bx


;body

mov bx,12   ;position along y-axis
add word[marioY],bx
mov bx,2     ;position along x-axis
sub word[mariox],bx

mov ah, 0ch
mov al, 0    ;color
mov cx, 18	; height	
mov dx, word[marioY]	; word[marioY] +15
int 10h

loop3:
push cx
mov cx, word[mariox]	;how far from the start ;word[mariox]-5

mov si, 15   ;desired rows
l34:
inc cx		; thickness
int 10h
dec si      ;decrementing si
cmp si, 0    ;if si >=0 then jump to l34
jge l34 

mov cx, word[mariox]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop3

;legs1

mov bx,18     ;position along y-axis
add word[marioY],bx
mov bx,3      ;position along x-axis
add word[mariox],bx

mov ah, 0ch
mov al, 0    ;color
mov cx, 12	; height	
mov dx, word[marioY]	; word[marioY]+45
int 10h

loop42:
push cx
mov cx,word[mariox] 	;how far from the start; word[mariox]+1

mov si, 3    ;desired rows
l43:
inc cx
int 10h
dec si       ;decrementing si
cmp si, 0    ;if si >=0 then jump to l43
jge l43 

mov cx, word[mariox]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop42

;legs2

mov bx,6      ;position along x-axis
add word[mariox],bx

mov ah, 0ch
mov al, 0    ;color
mov cx, 12	; height	
mov dx, word[marioY]	; word[marioY]+45
int 10h




mov bx,5   ;position along y-axis
add word[marioY],bx

loop52:
push cx
mov cx,word[mariox] 	;how far from the start;word[mariox]+11

mov si, 3   ;desired rows
l52:
inc cx		; thickness
int 10h
dec si       ;decrementing si
cmp si, 0    ;if si >=0 then jump to l52
jge l52

mov cx, word[mariox]	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop52

mov bx, word[savemariox]
mov word[mariox],bx
mov bx, word[savemarioY]
mov word[marioY],bx
mov bx,0

ret


jump:
mov al, 'D'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h


mov cx, 20   ;height of jump
l12:
push cx
mov bx, 3   ;how far it jumps
add word[mariox],bx  ;jump along x-axis

add bx,6
sub word[marioY],bx  ;jump along y-axis
mov bx,0
call clearmario  ;calling clearmario
call mario       ;calling mario



pop cx     ;popping cx


loop l12

mov cx, 20   ;height of jump
l131:
push cx
mov bx, 3   ;how far it jumps
add word[mariox],bx  ;jump along x-axis
add bx,6
add word[marioY],bx  ;jump along y-axis
mov bx,0

call clearmario  ;calling clearmario
call mario        ;calling mario
  
pop cx


loop l131

call hurdle1      ;calling hurdle1

call hurdle2        ;calling hurdle2

call hurdle3        ;calling hurdle3

ret



enemy1:




mov bx, word[enemyX1]  ;derefrencing enemyX1 of word type and moving its value in bx
mov word[prevenemyX1], bx  ;derefrencing enemyX1 of word type and moving its value in bx
mov bx, word[enemyY1]        ;derefrencing enemyX1 of word type and moving its value in bx
mov word[prevenemyY1], bx     ;derefrencing enemyX1 of word type and moving its value in bx



mov word[var], 10	; thickness

mov bx,  0

lop:


mov ah, 0ch
mov al, 6   ;color
mov cx, 4	; height
mov dx, word[enemyY1]	; starting word[y]
int 10h


l111:


push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
l26:
inc cx
int 10h
dec si      ;decrementing si
cmp si, 0    ;if si >=0 then jump to l26
jge l26


mov cx, word[enemyX1]
inc dx
int 10h
int 10h
pop cx
loop l111





add word[enemyY1], 4
sub word[enemyX1], 4
add word[var], 8	; dword of addition in word[x]


inc bx     ;incrementing bx

cmp bx, 3   
jl lop     ;if it is less than jump to lop 



mov ah, 0ch
mov al, 6   ;color
mov cx, 6	; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

l35:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
call l4


mov cx, word[enemyX1]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop l35



add word[enemyY1], 6
sub word[enemyX1], 4
add word[var], 8

mov ah, 0ch
mov al, 6   ;color
mov cx, 10	; height
mov dx, word[enemyY1]	; starting word[y]
int 10h


l53:

push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy

call l6   ;calling l6


mov cx, word[enemyX1]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop l53




add word[enemyX1], 10
add word[enemyY1], 10
mov word[var], 20

mov ah, 0ch
mov al, 15   ;color
mov cx, 12	; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

g1:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
g21:
inc cx   ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0    ;if si >=0 then jump to g21
jge g21


mov cx, word[enemyX1]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop g1






sub word[enemyX1], 5
mov word[var], 10

mov ah, 0ch
mov al, 6   ;color
mov cx, 3	; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

l7:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
l82:
inc cx
int 10h
dec si     ;decrementing si
cmp si, 0    ;if si >=0 then jump to l82
jge l82


mov cx, word[enemyX1]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop l7



add word[enemyX1], 22

mov ah, 0ch
mov al, 6    ;color
mov cx, 3	; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

l9:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
call l10


mov cx, word[enemyX1]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop l9



; feet of enemy
add word[enemyY1], 10
sub word[enemyX1], 23
mov word[var], 10

mov ah, 0ch
mov al, 8	;color
mov cx, 5; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

g35:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
call g4    ;calling g4


mov cx, word[enemyX1]
inc dx     ;incrementing dx
int 10h
int 10h
pop cx
loop g35



add word[enemyX1], 3
add word[enemyY1], 3	;height of the previios block
mov word[var], 10

mov ah, 0ch
mov al, 8  ;color
mov cx, 7; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

g5:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
call g6


mov cx, word[enemyX1]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop g5




add word[enemyX1], 17  ;posiiton along x-axis
mov word[var], 12	;thickness

mov ah, 0ch
mov al, 8   ;color
mov cx, 7; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

g71:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
call g8     ;calling g8

mov cx, word[enemyX1]
inc dx
int 10h
int 10h
pop cx
loop g71


sub word[enemyY1], 5
mov word[var], 15	;thickness

mov ah, 0ch
mov al, 8  ;color
mov cx, 5; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

g92:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
call g10    ;calling g10

mov cx, word[enemyX1]
inc dx      ;incrementing dx
int 10h
int 10h
pop cx
loop g92





sub word[enemyY1], 5
mov word[var], 5	;thickness
add word[enemyX1], 5

mov ah, 0ch
mov al, 8  ;color
mov cx, 5; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

enem1:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
enem11:
inc cx   ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0    ;if si >=0 then jump to enem11
jge enem11

mov cx, word[enemyX1]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop enem1




; eyes
sub word[enemyX1], 18
sub word[enemyY1], 25
mov word[var], 3

mov ah, 0ch
mov al, 8  ;color
mov cx, 3; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

enem32:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
enem4:
inc cx   ;incrementing cx
int 10h
dec si     ;decrementing si
cmp si, 0    ;if si >=0 then jump to enem4
jge enem4

mov cx, word[enemyX1]
inc dx     ;incrementing dx
int 10h
int 10h
pop cx
loop enem32



add word[enemyX1], 15  ;position along x-axis

mov ah, 0ch
mov al, 8  ;color
mov cx, 3; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

enem55:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
enem6:
inc cx    ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0    ;if si >=0 then jump to enem6
jge enem6

mov cx, word[enemyX1]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop enem55





sub word[enemyX1], 12   ;position along x-axis
add word[enemyY1],3    ;position along y-axis


mov ah, 0ch
mov al, 8  ;color
mov cx, 3; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

enem72:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
enem8:
inc cx   ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0    ;if si >=0 then jump to enem8
jge enem8

mov cx, word[enemyX1]
inc dx    ;incrementing dx
int 10h
;int 10h
pop cx
loop enem72








add word[enemyX1], 10  ;position along x-axis


mov ah, 0ch
mov al, 8 ;color
mov cx, 3; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

en1:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
en22:
inc cx  ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0    ;if si >=0 then jump to en22
jge en22

mov cx, word[enemyX1]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop en1


add word[enemyY1], 3
sub word[enemyX1], 8
mov word[var], 8

mov ah, 0ch
mov al, 8 ;color
mov cx, 3; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

en31:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
en4:
inc cx   ;incrementing cx
int 10h   
dec si    ;decrementing si
cmp si, 0    ;if si >=0 then jump to en4
jge en4

mov cx, word[enemyX1]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop en31






sub word[enemyX1], 7   ;position along x-axis
mov word[var], 3

mov ah, 0ch
mov al, 15  ;color
mov cx, 10; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

en52:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
en6:
inc cx  ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0    ;if si >=0 then jump to en6
jge en6

mov cx, word[enemyX1]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop en52




add word[enemyX1], 17   ;position along x-axis
mov word[var], 3

mov ah, 0ch
mov al, 15 ;color
mov cx, 10; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

en7:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
en8:
inc cx
int 10h
dec si   ;decrementing si
cmp si, 0    ;if si >=0 then jump to en8
jge en8

mov cx, word[enemyX1]
inc dx   ;in dx
int 10h
int 10h
pop cx
loop en7




sub word[enemyX1], 3
add word[enemyY1], 3
mov word[var], 2

mov ah, 0ch
mov al, 15 ;color
mov cx, 7; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

k1q:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
call k2q

mov cx, word[enemyX1]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop k1q






sub word[enemyX1], 10  ;position along x-axis
mov word[var], 2

mov ah, 0ch
mov al, 15;color
mov cx, 7; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

k3q:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
call k4q   ;calling k4q

mov cx, word[enemyX1]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop k3q






sub word[enemyX1], 2
sub word[enemyY1], 4
mov word[var], 1


mov ah, 0ch
mov al, 8 ;color
mov cx, 8; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

k5q:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
call k6q   ;calling k6q
  
mov cx, word[enemyX1]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop k5q





add word[enemyX1], 15


mov ah, 0ch
mov al, 8  ;color
mov cx, 8; height
mov dx, word[enemyY1]	; starting word[y]
int 10h

k7q:
push cx
mov cx, word[enemyX1]	;starting word[x]

mov si, word[var]	; thickness of enemy
call k8

mov cx, word[enemyX1]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop k7q

;saving old value of enemy
mov bx, word[prevenemyX1]
mov word[enemyX1], bx
mov bx, word[prevenemyY1]
mov word[enemyY1], bx

ret





enemy2:


mov bx, word[enemyX2]
mov word[prevenemyX2], bx
mov bx, word[enemyY2]
mov word[prevenemyY2], bx

mov word[var], 10	; thickness

mov bx,  0

lop1:


mov ah, 0ch
mov al, 6   ;color
mov cx, 4	; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

l121:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
l27:
inc cx  ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0    ;if si >=0 then jump to l27
jge l27


mov cx, word[enemyX2]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop l121





add word[enemyY2], 4  
sub word[enemyX2], 4
add word[var], 8	; dword of addition in word[x]


inc bx  ;incrementing bx

cmp bx, 3
jl lop1   ;if it is less then jump to lop1



mov ah, 0ch
mov al, 6   ;color
mov cx, 6	; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

l36:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
call l4    ;calling l4


mov cx, word[enemyX2]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx  
loop l36


add word[enemyY2], 6   ;position along y-axis
sub word[enemyX2], 4   ;position along x-axis
add word[var], 8

mov ah, 0ch
mov al, 6   ;color
mov cx, 10	; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

l54:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
call l6


mov cx, word[enemyX2]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop l54



add word[enemyX2], 10  ;position along x-axis
add word[enemyY2], 10  ;position along y-axis
mov word[var], 20

mov ah, 0ch
mov al, 15   ;color
mov cx, 12	; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

g12:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
g24:
inc cx   ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0    ;if si >=0 then jump to g24
jge g24


mov cx, word[enemyX2]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop g12






sub word[enemyX2], 5  ;position aling x-axis
mov word[var], 10

mov ah, 0ch
mov al, 6  ;color
mov cx, 3	; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

l71:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
l81:
inc cx   ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0    ;if si >=0 then jump to l81
jge l81


mov cx, word[enemyX2]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx  
loop l71



add word[enemyX2], 22  ;position along x-axis

mov ah, 0ch
mov al, 6   ;color
mov cx, 3	; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

l91:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
call l10  ;calling l10


mov cx, word[enemyX2]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop l91



; feet of enemy
add word[enemyY2], 10
sub word[enemyX2], 23
mov word[var], 10

mov ah, 0ch
mov al, 8	;color
mov cx, 5; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

g31:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
call g4   ;calling g4


mov cx, word[enemyX2]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop g31



add word[enemyX2], 3
add word[enemyY2], 3	;height of the previios block
mov word[var], 10

mov ah, 0ch
mov al, 8 ;color
mov cx, 7; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

g51:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
call g6   ;calling g6


mov cx, word[enemyX2]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop g51




add word[enemyX2], 17
mov word[var], 12	;thickness

mov ah, 0ch
mov al, 8  ;color
mov cx, 7; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

g72:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
call g8   ;calling g8

mov cx, word[enemyX2]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop g72


sub word[enemyY2], 5 ;position along y-axis
mov word[var], 15	;thickness

mov ah, 0ch
mov al, 8 ;color
mov cx, 5; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

g9:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
call g10    ;calling g10

mov cx, word[enemyX2]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop g9





sub word[enemyY2], 5
mov word[var], 5	;thickness
add word[enemyX2], 5

mov ah, 0ch
mov al, 8  ;color
mov cx, 5; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

enem:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
enem12:
inc cx  ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0    ;if si >=0 then jump to enem12
jge enem12

mov cx, word[enemyX2]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop enem




; eyes
sub word[enemyX2], 18
sub word[enemyY2], 25
mov word[var], 3

mov ah, 0ch
mov al, 8 ;color
mov cx, 3; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

enem3:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
enem41:
inc cx    ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0    ;if si >=0 then jump to enem41
jge enem41

mov cx, word[enemyX2]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop enem3



add word[enemyX2], 15  ;position along x-axis

mov ah, 0ch
mov al, 8 ;color
mov cx, 3; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

enem5:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
enem61:
inc cx   ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0    ;if si >=0 then jump to enem61
jge enem61

mov cx, word[enemyX2]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop enem5





sub word[enemyX2], 12   ;position along x-axis
add word[enemyY2],3     ;position along y-axis


mov ah, 0ch
mov al, 8 ;color
mov cx, 3; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

enem7:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
enem81:
inc cx   ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0    ;if si >=0 then jump to enem81
jge enem81

mov cx, word[enemyX2]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop enem7








add word[enemyX2], 10  ;position along x-axis


mov ah, 0ch
mov al, 8 ;color
mov cx, 3; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

en11:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
en2:
inc cx  ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0    ;if si >=0 then jump to en2
jge en2

mov cx, word[enemyX2]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop en11


add word[enemyY2], 3
sub word[enemyX2], 8
mov word[var], 8

mov ah, 0ch
mov al, 8 ;color
mov cx, 3; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

en32:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
en41:
inc cx   ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0    ;if si >=0 then jump to en41
jge en41

mov cx, word[enemyX2]
inc dx      ;incrementing dx
int 10h
int 10h
pop cx
loop en32

sub word[enemyX2], 7  ;position along x-axis
mov word[var], 3

mov ah, 0ch
mov al, 15  ;color
mov cx, 10; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

en53:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
en61:
inc cx   ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0    ;if si >=0 then jump to en61
jge en61

mov cx, word[enemyX2]
inc dx
int 10h
int 10h
pop cx
loop en53




add word[enemyX2], 17   ;position along x-axis
mov word[var], 3

mov ah, 0ch
mov al, 15 ;color
mov cx, 10; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

en71:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
en81:
inc cx  ;incrementing cx
int 10h
dec si     ;decrementing si
cmp si, 0    ;if si >=0 then jump to en81
jge en81

mov cx, word[enemyX2]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop en71




sub word[enemyX2], 3  ;position along x-axis
add word[enemyY2], 3  ;position along y-axis
mov word[var], 2

mov ah, 0ch
mov al, 15 ;color
mov cx, 7; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

k1q1:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
call k2q

mov cx, word[enemyX2]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop k1q1






sub word[enemyX2], 10
mov word[var], 2

mov ah, 0ch
mov al, 15 ;color
mov cx, 7; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

k3q1:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
call k4q   ;calling k4q

mov cx, word[enemyX2]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop k3q1






sub word[enemyX2], 2  ;position along x-axis
sub word[enemyY2], 4  ;position along y-axis
mov word[var], 1


mov ah, 0ch
mov al, 8 ;color
mov cx, 8; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

k5q1:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
call k6q   ;calling k6q

mov cx, word[enemyX2]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop k5q1





add word[enemyX2], 15


mov ah, 0ch
mov al, 8 ;color
mov cx, 8; height
mov dx, word[enemyY2]	; starting word[y]
int 10h

k7q1:
push cx
mov cx, word[enemyX2]	;starting word[x]

mov si, word[var]	; thickness of enemy
call k8   ;calling k8

mov cx, word[enemyX2]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop k7q1
;saving value
mov bx, word[prevenemyX2]
mov word[enemyX2], bx
mov bx, word[prevenemyY2]
mov word[enemyY2], bx




ret

cloud:

mov word[var], 20 ;thickness

mov bx, 0 
lop2:

mov ah, 0ch
mov al, 15 ;color
mov cx, 3; height
mov dx, word[cloudY]	; starting word[y]
int 10h

k1q2:
push cx
mov cx, word[cloudX]	;starting word[x]

mov si, word[var]	; thickness 
call k2q

mov cx, word[cloudX]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop k1q2

sub word[cloudX], 3  ;along x-axis
add word[cloudY], 2  ;along y-axis
add word[var], 6     ; thickness

inc bx             ;incrementing bx
cmp bx, 6
jle lop2   ; if it is less or equal then jump to lop2











sub word[cloudY], 10  ;along x-axis
add word[cloudX], 60  ;along y-axis
mov bx, 0
mov word[var], 20  ;thickness
lop21:

mov ah, 0ch
mov al, 15 ;color
mov cx, 3; height
mov dx, word[cloudY]	; starting word[y]
int 10h

k3q2:
push cx
mov cx, word[cloudX]	;starting word[x]

mov si, word[var]	; thickness 
call k4q     ;calling k4q

mov cx, word[cloudX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop k3q2

sub word[cloudX], 3   ;along x-axis
add word[cloudY], 2 ;along y-axis
add word[var], 6   ;thickness

inc bx     ;incrementing bx
cmp bx, 6
jle lop21









sub word[cloudX], 65  ;along x-axis
sub word[cloudY], 14  ;along y-axis
mov bx, 0
mov word[var], 20  ;thickness
lop31:

mov ah, 0ch
mov al, 15 ;color
mov cx, 3; height
mov dx, word[cloudY]	; starting word[y]
int 10h

k5q2:
push cx
mov cx, word[cloudX]	;starting word[x]

mov si, word[var]	; thickness 
call k6q

mov cx, word[cloudX]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop k5q2

sub word[cloudX], 3  ;along x-axis
add word[cloudY], 2  ;along y-axis
add word[var], 6     ;thickness

inc bx      ;incrementing bx
cmp bx, 6
jle lop31   ;if it is less or equal then jump to lop31






add word[cloudX], 25 ;along x-axis
sub word[cloudY], 3  ;along y-axis

mov ah, 0ch
mov al, 15 ;color
mov cx, 4; height
mov dx, word[cloudY]	; starting word[y]
int 10h

k7q2:
push cx
mov cx, word[cloudX]	;starting word[x]

mov si, word[var]	; thickness 
call k8        ;calling k8
  
mov cx, word[cloudX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop k7q2
ret


clearenemy:

mov bx, word[enemyXC]          ;derefrencing enemyXC and moving its value in bx
mov word[prevenemyXC], bx      ;derefrencing prevenemyXC and moving value of bx in it
mov bx, word[enemyYC]          ;derefrencing enemyYC and moving its value in bx
mov word[prevenemyYC], bx      ;derefrencing prevenemyYC and moving value of bx in it

mov word[var], 10	; thickness

mov bx,  0

lop32:


mov ah, 0ch
mov al, 0   ;color
mov cx, 4	; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

l13:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
l28:
inc cx  ;incrementing cx
int 10h
dec si      ;decrementing si
cmp si, 0    ;if si >=0 then jump to l28
jge l28


mov cx, word[enemyXC]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop l13





add word[enemyYC], 4
sub word[enemyXC], 4
add word[var], 8	; dword of addition in word[x]


inc bx  ;incrementing bx

cmp bx, 3
jl lop32  ;if it less then jump to lop32



mov ah, 0ch
mov al, 0  ;color
mov cx, 6	; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

l37:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
call l4   ;calling l4


mov cx, word[enemyXC]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop l37


add word[enemyYC], 6  ;position along y-axis
sub word[enemyXC], 4  ;position along x-axis
add word[var], 8

mov ah, 0ch
mov al, 0  ;color
mov cx, 10	; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

l55:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
call l6


mov cx, word[enemyXC]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop l55


 
add word[enemyXC], 10   ;position along x-axis
add word[enemyYC], 10   ;position along y-axis
mov word[var], 20

mov ah, 0ch
mov al, 0   ;color
mov cx, 12	; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

g13:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
g23:
inc cx   ;incrementing cx
int 10h
dec si      ;decrementing si
cmp si, 0    ;if si >=0 then jump to g23
jge g23


mov cx, word[enemyXC]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop g13






sub word[enemyXC], 5   ;position along x-axis
mov word[var], 10

mov ah, 0ch
mov al, 0   ;color
mov cx, 3	; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

l72:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
l812:
inc cx   ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0    ;if si >=0 then jump to l812
jge l812


mov cx, word[enemyXC]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop l72



add word[enemyXC], 22  ;position along x-axis

mov ah, 0ch
mov al, 0   ;color
mov cx, 3	; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

l92:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
call l10   ;calling l10


mov cx, word[enemyXC]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop l92



; feet of enemy
add word[enemyYC], 10  ;position along y-axis
sub word[enemyXC], 23  ;position along x-axis
mov word[var], 10

mov ah, 0ch
mov al, 0	;color
mov cx, 5; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

g32:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
call g4   ;calling g4


mov cx, word[enemyXC]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop g32



add word[enemyXC], 3
add word[enemyYC], 3	;height of the previios block
mov word[var], 10

mov ah, 0ch
mov al, 0  ;color
mov cx, 7; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

g52:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
call g6   ;calling g6


mov cx, word[enemyXC]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop g52




add word[enemyXC], 17
mov word[var], 12	;thickness

mov ah, 0ch
mov al, 0 ;color
mov cx, 7; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

g7:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
call g8  ;calling g8

mov cx, word[enemyXC]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop g7


sub word[enemyYC], 5
mov word[var], 15	;thickness

mov ah, 0ch
mov al, 0 ;color
mov cx, 5; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

g91:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
call g10  ;calling g10

mov cx, word[enemyXC]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop g91





sub word[enemyYC], 5
mov word[var], 5	;thickness
add word[enemyXC], 5

mov ah, 0ch
mov al, 0 ;color
mov cx, 5; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

enem2:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
enem13:
inc cx  ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0    ;if si >=0 then jump to enem13
jge enem13

mov cx, word[enemyXC]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop enem2




; eyes
sub word[enemyXC], 18   ;position along x-axis
sub word[enemyYC], 25   ;position along y-axis
mov word[var], 3

mov ah, 0ch
mov al,0  ;color
mov cx, 3; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

enem31:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
enem42:
inc cx   ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0    ;if si >=0 then jump to enem42
jge enem42

mov cx, word[enemyXC]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop enem31



add word[enemyXC], 15

mov ah, 0ch
mov al, 0 ;color
mov cx, 3; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

enem51:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
enem62:
inc cx  ;incrementing cx
int 10h
dec si  ;decrementing si
cmp si, 0    ;if si >=0 then jump to enem62
jge enem62

mov cx, word[enemyXC]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop enem51





sub word[enemyXC], 12   ;position along x-axis
add word[enemyYC],3    ;position along y-axis


mov ah, 0ch
mov al, 0 ;color
mov cx, 3; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

enem71:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
enem82:
inc cx   ;incrementing cx
int 10h
dec si       ;decrementing si
cmp si, 0    ;if si >=0 then jump to enem82
jge enem82

mov cx, word[enemyXC]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop enem71








add word[enemyXC], 10  


mov ah, 0ch
mov al, 0 ;color
mov cx, 3; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

en13:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
en21:
inc cx   ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0    ;if si >=0 then jump to en21
jge en21

mov cx, word[enemyXC]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop en13


add word[enemyYC], 3  ;position along y-axis
sub word[enemyXC], 8  ;position along x-axis
mov word[var], 8

mov ah, 0ch
mov al, 0 ;color
mov cx, 3; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

en3:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
en413:
inc cx   ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0    ;if si >=0 then jump to en413
jge en413

mov cx, word[enemyXC]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop en3






sub word[enemyXC], 7
mov word[var], 3

mov ah, 0ch
mov al, 0 ;color
mov cx, 10; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

en51:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
en62:
inc cx  ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0    ;if si >=0 then jump to en62
jge en62

mov cx, word[enemyXC]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop en51




add word[enemyXC], 17   ;position along x-axis
mov word[var], 3

mov ah, 0ch
mov al, 0  ;color
mov cx, 10; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

en73:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
en82:
inc cx  ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0    ;if si >=0 then jump to en82
jge en82

mov cx, word[enemyXC]
inc dx
int 10h
int 10h
pop cx
loop en73




sub word[enemyXC], 3 ;
add word[enemyYC], 3
mov word[var], 2

mov ah, 0ch
mov al, 0 ;color
mov cx, 7; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

k1q3:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
call k2q   ;calling k2q

mov cx, word[enemyXC]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop k1q3





 
sub word[enemyXC], 10  ;position along x-axis
mov word[var], 2

mov ah, 0ch
mov al, 0 ;color
mov cx, 7; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

k3q3:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
call k4q  ;calling k4q

mov cx, word[enemyXC]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop k3q3






sub word[enemyXC], 2  ;position along x-axis 
sub word[enemyYC], 4  ;position along y-axis
mov word[var], 1


mov ah, 0ch
mov al, 0;color
mov cx, 8; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

k5q3:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
call k6q   ;calling k6q

mov cx, word[enemyXC]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop k5q3





add word[enemyXC], 15  ;position along x-axis


mov ah, 0ch
mov al, 0 ;color
mov cx, 8; height
mov dx, word[enemyYC]	; starting word[y]
int 10h

k7q3:
push cx
mov cx, word[enemyXC]	;starting word[x]

mov si, word[var]	; thickness of enemy
call k8   ;calling k8

mov cx, word[enemyXC]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop k7q3


mov bx, word[prevenemyXC]
mov word[enemyX1], bx
mov bx, word[prevenemyYC]
mov word[enemyY1], bx

ret






flagu:

pole:
		mov ah, 0ch
		mov al, 15; color of pole
		mov cx, 302	; height of pole
		mov dx, 40	; starting position of the pole
		int 10h
		
		loop1:
		push cx
		mov cx, 620	;how far pole is from the starting position
		mov si,6    ;desired rows
		l16:
		inc cx		; thickness of the pole
		int 10h
		dec si   ; decrementing si
		cmp si, 0  ; if si is >= 0 then jump to l16
		jge l16

		mov cx, 620	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop loop1

	flag:
		mov ah, 0ch
		mov al, 5  ; color of flag
		mov cx, 60	; height of flag	
		mov dx, 40	;starting position of flag
		int 10h

		loop230:
		push cx
		mov cx, 515	;how far the flag is from the starting

		mov si, 100 ; the desired rows
		l263:
		inc cx		; thickness of the flag
		int 10h
		dec si   ; decrementing si
		cmp si, 0  ; if si is >= 0 then jump to l16
		jge l263 

		mov cx, 515	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop loop230


	crownFlag:
		;base
		mov ah, 0ch
		mov al, 14  ;color of crown
		mov cx, 10	; height	
		mov dx, 70	; y-start; word [marioY]
		int 10h
		loop5:
		push cx
		mov cx, 530	;how far from the x-start ;variable word [marioX]
		mov si, 70  ;desired rows 
		l5:
		inc cx		; thickness
		int 10h
		dec si    ;decrementing si
		cmp si, 0 ; if si is >= 0 then jump to l5
		jge l5
		mov cx, 530	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop5
	
	
		; for left side of the crown which is sliding i.e '\' 
		
		mov word [crownX],530; position
		mov ah, 0ch
		mov al, 14   ;color of crown
		mov cx, 15	; height	
		mov dx, 55	; y-start; word [marioY]
		int 10h
		loop6:
		push cx
		mov cx, word [crownX]	;how far from the x-start ;variable word [marioX]
		mov si, 5   ; desired rows
		l63:
		inc cx		; thickness
		int 10h
		dec si     ;decrementing si
		cmp si, 0 ; if si is >= 0 then jump to l63
		jge l63
		mov cx, word [crownX]	; setting col again
		add word [crownX],1
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop6

		;for left side of crown which is straight i.e ' | '
		
		mov word [crownX],530  ; position
		mov ah, 0ch
		mov al, 14  ; color  of crown
		mov cx, 15	; height	
		mov dx, 55	; y-start; word [marioY]
		int 10h
		loop8:
		push cx
		mov cx, word [crownX]	;how far from the x-start ;variable word [marioX]
		mov si, 4  ;desired rows
		l8:
		inc cx		; thickness
		int 10h
		dec si    ;decrementing si
		cmp si, 0 ; if si is >= 0 then jump to l8
		jge l8
		mov cx, word [crownX]	; setting col again

		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop8

 ; for right side of crown which is sliding i.e ' \ '

		mov word [crownX],595
		mov ah, 0ch
		mov al, 14
		mov cx, 15	; height	
		mov dx, 55	; y-start; word [marioY]
		int 10h
		loop7:
		push cx
		mov cx, word [crownX]	;how far from the x-start ;variable word [marioX]
		mov si, 5    ;desired rows
		l73:
		inc cx		; thickness
		int 10h
		dec si    ;decrementing si
		cmp si, 0 ; if si is >= 0 then jump to l73
		jge l73
		mov cx, word [crownX]	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop7


	   ; for right side of crown which is straight i.e ' | '
		mov word [crownX],580  ; position
		mov ah, 0ch
		mov al, 14   ;color of crown
		mov cx, 15	; height	
		mov dx, 70	; y-start; word [marioY] start from base
		int 10h
		loop9:
		push cx
		mov cx, word [crownX]	;how far from the x-start ;variable word [marioX]
		mov si, 5   ; desired rows
		l93:
		inc cx		; thickness
		int 10h
		dec si    ;decrementing si
		cmp si, 0 ; if si is >= 0 then jump to l93
		jge l93
		mov cx, word [crownX]	; setting col again
		inc word [crownX]
		dec dx	; prev row
		int 10h
		int 10h
		pop cx
		loop loop9

		;the middle side of crown which is sliding i.e ' \ '

		mov word [crownX],545;position
		mov ah, 0ch   
		mov al, 14   ;color of crownn
		mov cx, 15	; height	
		mov dx, 70	; y-start; word [marioY] start from base
		int 10h
		loop10:
		push cx
		mov cx, word [crownX]	;how far from the x-start ;variable word [marioX]
		mov si, 5   ;desired rows
		l103:
		inc cx		; thickness
		int 10h
		dec si     ;decrementing si
		cmp si, 0 ; if si is >= 0 then jump to l103
		jge l103
		mov cx, word [crownX]	; setting col again
		inc word [crownX]
		dec dx	; prev row
		int 10h
		int 10h
		pop cx
		loop loop10
  
	    ; the middle side of crown which is straight i.e ' | '
		
		mov word [crownX],560;position
		mov ah, 0ch
		mov al, 14   ;color of crown
		mov cx, 15	; height	
		mov dx, 55	; y-start; word [marioY]
		int 10h
		loop11:
		push cx
		mov cx, word [crownX]	;how far from the x-start ;variable word [marioX]
		mov si, 5   ;desired rows
		l11:
		inc cx		; thickness
		int 10h
		dec si     ;decrementing si
		cmp si, 0 ; if si is >= 0 then jump to l11
		jge l11
		mov cx, word [crownX]	; setting col again
		add word [crownX],1
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop11
		
		
ret


flaghide:

mov ah, 0ch
mov al, 0     ;color
mov cx, 322	; height	
mov dx, 20	; word[y]-start; word[marioY]
int 10h

loop222:
push cx
mov cx, 510	;how far from the word[x]-start ;variable word[mariox]

mov si, 130    ;x-axis
l2222:
inc cx		; thickness
int 10h
dec si       ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to l2222
jge l2222 

mov cx, 510	; setting col again
inc dx	; next row
int 10h
int 10h
pop cx
loop loop222
ret


castle:

mov word[var], 50 ;thickness

mov ah, 0ch
mov al, 6 ;color
mov cx, 40; height
mov dx, word[castleY]	; starting word[y]
int 10h

c71:
push cx
mov cx, word[castleX]	;starting word[x]

mov si, word[var]	; thickness 
c81:
inc cx ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to c81
jge c81

mov cx, word[castleX]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop c71




mov word[var], 30  
sub word[castleY], 15 ;position along y-axis
add word[castleX], 10 ;position along x-axis
mov ah, 0ch
mov al, 6  ;color
mov cx, 15; height
mov dx, word[castleY]	; starting word[y]
int 10h

m1:
push cx
mov cx, word[castleX]	;starting word[x]

mov si, word[var]	; thickness 
m2:
inc cx  ;incrementing cx
int 10h
dec si  ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to m2
jge m2

mov cx, word[castleX]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop m1




mov word[var], 2
sub word[castleY], 15 ;position along y-axis
add word[castleX], 13 ;position along x-axis
mov ah, 0ch
mov al, 8 ;color
mov cx, 15; height
mov dx, word[castleY]	; starting word[y]
int 10h

m3:
push cx
mov cx, word[castleX]	;starting word[x]

mov si, word[var]	; thickness 
m4:
inc cx  ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to m4
jge m4

mov cx, word[castleX]
inc dx  ;incrementing dx
int 10h
int 10h
pop cx
loop m3




mov word[var], 7
sub word[castleY], 5
mov ah, 0ch
mov al, 4;color
mov cx, 7; height
mov dx, word[castleY]	; starting word[y]
int 10h

m52:
push cx
mov cx, word[castleX]	;starting word[x]

mov si, word[var]	; thickness 
m61:
inc cx  ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to m61
jge m61

mov cx, word[castleX]
inc dx   ;incrementing dx
int 10h
int 10h
dec word[var]
pop cx
loop m52








mov word[var], 12
add word[castleY], 50  ;position along y-axis
sub word[castleX], 3  ;position along x-axis
mov ah, 0ch
mov al, 8  ;color
mov cx, 25; height
mov dx, word[castleY]	; starting word[y]
int 10h

m7:
push cx
mov cx, word[castleX]	;starting word[x]

mov si, word[var]	; thickness 
m8:
inc cx  ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to m8
jge m8

mov cx, word[castleX]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop m7





mov bx, 0


mov word[var], 3
sub word[castleY], 8
add word[castleX], 4

lop4:

mov ah, 0ch
mov al, 8 ;color
mov cx, 3; height
mov dx, word[castleY]	; starting word[y]
int 10h

n1:
push cx
mov cx, word[castleX]	;starting word[x]

mov si, word[var]	; thickness 
n2:
inc cx   ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to n2
jge n2

mov cx, word[castleX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop n1


add word[var],4
add word[castleY], 3
sub word[castleX], 2

inc bx   ;incrementing bx
cmp bx, 3  
jl lop4  ;if it is less then jump to lop4


ret


dragon:



mov bx, word[dragonX]
mov word[prevdragonX], bx
mov bx, word[dragonY]
mov word[prevdragonY], bx




mov word[var], 7  ;thickness
mov bx, 0

lop5:

mov ah, 0ch
mov al, 2 ;color
mov cx, 3; height
mov dx, word[dragonY]	; starting word[y]
int 10h

m51:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
m6:
inc cx   ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to m6
jge m6

mov cx, word[dragonX]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop m51

sub word[dragonX], 3  ;position along x-axis
add word[dragonY], 3  ;position along y-axis
add word[var], 6
inc bx    ;incrementing bx
cmp bx, 5
jle lop5  ;it it is less or equal then jump to lop5



mov ah, 0ch
mov al, 2 ;color
mov cx, 5; height
mov dx, word[dragonY]	; starting word[y]
int 10h

d1:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
d2:
inc cx ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to d2
jge d2

mov cx, word[dragonX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop d1




sub word[dragonX],10
add word[dragonY], 2
mov word[var], 10

mov ah, 0ch
mov al, 2 ;color
mov cx, 3; height
mov dx, word[dragonY]	; starting word[y]
int 10h

d3:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
d4:
inc cx  ;incrementing cx
int 10h
dec si  ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to d4
jge d4

mov cx, word[dragonX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop d3






sub word[dragonX], 4
sub word[dragonY], 10
mov word[var], 1

mov ah, 0ch
mov al, 4  ;color
mov cx, 28; height
mov dx, word[dragonY]	; starting word[y]
int 10h

d5:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
d6:
inc cx   ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to d6
jge d6

mov cx, word[dragonX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop d5







mov word[var], 2  ;thickness
mov bx, 0

sub word[dragonY], 7

lop22:

mov ah, 0ch
mov al, 15 ;color
mov cx, 2; height
mov dx, word[dragonY]	; starting word[y]
int 10h

d7:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
d8:
inc cx  ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to d8
jge d8

mov cx, word[dragonX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop d7

sub word[dragonX], 3
add word[dragonY], 3
add word[var], 6
inc bx  ;incrementing bx
cmp bx, 2
jle lop22  ;if it is less or equal then jump to lop22











mov word[var], 40  ;thickness
mov bx, 0

add word[dragonY], 11  ;position along y-axis
add word[dragonX], 24  ;position along x-axis

lop3:

mov ah, 0ch
mov al, 2  ;color
mov cx, 3; height
mov dx, word[dragonY]	; starting word[y]
int 10h

m71:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
m81:
inc cx   ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to m81
jge m81

mov cx, word[dragonX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop m71

add word[dragonX], 3  ;position along y-axis
add word[dragonY], 3  ;position along x-axis
sub word[var], 6 ;thickness
inc bx      ;incrementing bx
cmp bx, 5   
jle lop3  ;if it is less or equal then jump to lop3







mov word[var], 3    ;thickness
mov bx, 0
sub word[dragonY], 10
sub word[dragonX], 14

lop51:

mov ah, 0ch
mov al, 2 ;color
mov cx, 3; height
mov dx, word[dragonY]	; starting word[y]
int 10h

a1:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
a2:
inc cx  ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to a2
jge a2

mov cx, word[dragonX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop a1

sub word[dragonX], 3
add word[dragonY], 3
inc bx  ;incrementing bx
cmp bx, 3
jl lop51  ;if it is less then jump to lop51








mov word[var], 3  ;thickness
mov bx, 0
sub word[dragonY], 7
add word[dragonX], 39

lop61:

mov ah, 0ch
mov al, 2;color
mov cx, 3; height
mov dx, word[dragonY]	; starting word[y]
int 10h

a3:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
a4:
inc cx  ;incrementing cx
int 10h
dec si      ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to a4
jge a4

mov cx, word[dragonX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop a3

add word[dragonX], 3
add word[dragonY], 3
inc bx   ;incrementing bx
cmp bx, 2
jl lop61   ;if it is less then jump to lop61


mov bx, 0
lop71:

mov ah, 0ch
mov al, 2 ;color
mov cx, 3; height
mov dx, word[dragonY]	; starting word[y]
int 10h

a5:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
a6:
inc cx   ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to a6
jge a6

mov cx, word[dragonX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop a5

sub word[dragonX], 3  ;position along x-axis
add word[dragonY], 3  ;position along y-axis
inc bx            ;incrementing bx
cmp bx, 3
jl lop71  ;if it is less then jump to lop71








mov bx, 0
sub word[dragonX], 32
sub word[dragonY], 8
lop8:

mov ah, 0ch
mov al, 2 ;color
mov cx, 3; height
mov dx, word[dragonY]	; starting word[y]
int 10h

a7:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
a8:
inc cx   ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to a8
jge a8

mov cx, word[dragonX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop a7

add word[dragonX], 3
add word[dragonY], 3
inc bx    ;incrementing bx
cmp bx, 3
jl lop8  ;if it is less then jump to lop8 



mov word[var], 5   ;thickness
add word[dragonX], 10 ;position along x-axis
sub word[dragonY], 36  ;position along y-axis


mov ah, 0ch
mov al, 8 ;color
mov cx, 7; height
mov dx, word[dragonY]	; starting word[y]
int 10h

b1:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
b2:
inc cx  ;incrementing  cx
int 10h
dec si    ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to b2
jge b2

mov cx, word[dragonX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop b1












mov word[var], 7   ;thickness
add word[dragonY], 2  
dec word[dragonX]

mov ah, 0ch
mov al, 8;color
mov cx, 13; height
mov dx, word[dragonY]	; starting word[y]
int 10h

b3:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
b4:
inc cx    ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to b4
jge b4

mov cx, word[dragonX]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop b3






mov word[var], 2   
add word[dragonX],2  ;position along x-axis

mov ah, 0ch
mov al, 14 ;color
mov cx, 2; height
mov dx, word[dragonY]	; starting word[y]
int 10h

b5:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
b6:
inc cx  ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to b6
jge b6

mov cx, word[dragonX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop b5






mov word[var], 8   ;thickness
add word[dragonY], 11  ;position along y-axis
sub word[dragonX], 3  ;position along x-axis

mov ah, 0ch
mov al, 2 ;color
mov cx, 2; height
mov dx, word[dragonY]	; starting word[y]
int 10h

b7:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
b8:
inc cx   ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to b8
jge b8

mov cx, word[dragonX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop b7









mov word[var], 2       ;thickness
sub word[dragonY], 33   ;position along y-axis
add word[dragonX], 20   ;along x-axis
mov bx, 0

leg:

mov ah, 0ch
mov al, 15 ;color
mov cx, 2; height
mov dx, word[dragonY]	; starting word[y]
int 10h

t1:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
t2:
inc cx   ;incrementing cx
int 10h
dec si      ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to t2
jge t2

mov cx, word[dragonX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop t1

sub word[dragonX], 2
add word[dragonY], 2
inc bx     ;incrementing bx
cmp bx, 5 
jl leg  ; if it is less then jump to leg








sub word[dragonX], 22 ;along x-axis
sub word[dragonY], 10 ;along y-axis
mov bx, 0

leg2:

mov ah, 0ch
mov al, 15 ;color
mov cx, 2; height
mov dx, word[dragonY]	; starting word[y]
int 10h

t3:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
t4:
inc cx    ;incrementing cx
int 10h
dec si     ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to t4
jge t4

mov cx, word[dragonX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop t3

add word[dragonX], 2
add word[dragonY], 2
inc bx   ;incrementing bx
cmp bx, 5
jl leg2   ;if it is less then jump to leg2














sub word[dragonX], 15   ;along x-axis
sub word[dragonY], 5   ;along y-axis
mov bx, 0

leg3:

mov ah, 0ch
mov al, 15 ;color
mov cx, 2; height
mov dx, word[dragonY]	; starting word[y]
int 10h

t5:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
t6:
inc cx  ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to t6
jge t6

mov cx, word[dragonX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop t5

add word[dragonX], 2
add word[dragonY], 2
inc bx   ;incrementing bx
cmp bx, 5
jl leg3   ;if it is less then jump to leg3







add word[dragonX], 32  ;along x-axis
sub word[dragonY], 11   ;along y-axis
mov bx, 0

leg4:

mov ah, 0ch
mov al, 15;color
mov cx, 2; height
mov dx, word[dragonY]	; starting word[y]
int 10h

t7:
push cx
mov cx, word[dragonX]	;starting word[x]

mov si, word[var]	; thickness 
t8:
inc cx   ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to t8
jge t8

mov cx, word[dragonX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop t7

sub word[dragonX], 2
add word[dragonY], 2
inc bx    ;incrementing bx
cmp bx, 5  
jl leg4   ;if it is less then jump to leg4


;saving value of dragon
mov bx, word[prevdragonX]
mov word[dragonX], bx
mov bx, word[prevdragonY]
mov word[dragonY], bx


ret 



fire:



mov bx, word[fireX]
mov word[prevFX], bx
mov bx, word[fireY]
mov word[prevFY], bx




mov word[var], 15

mov ah, 0ch
mov al, 14;color
mov cx, 14; height
mov dx, word[fireY]	; starting word[y]
int 10h

f1:
push cx
mov cx, word[fireX]	;starting word[x]

mov si, word[var]	; thickness 
f2:
inc cx  ;incrementing cx
int 10h
dec si  ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to f2
jge f2

mov cx, word[fireX]
inc dx      ;incrementing dx
int 10h
int 10h
pop cx
loop f1





sub word[fireY], 4   ;along y-axis 
sub word[fireX], 2  ;along x-axis
add word[var], 4   ;thickness

mov ah, 0ch
mov al, 14;color
mov cx, 15; height
mov dx, word[fireY]	; starting word[y]
int 10h

f3:
push cx
mov cx, word[fireX]	;starting word[x]

mov si, word[var]	; thickness 
f4:
inc cx ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to f4
jge f4

mov cx, word[fireX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop f3





sub word[fireY], 4   ;along y-axis
add word[var], 2

mov ah, 0ch
mov al, 14  ;color
mov cx, 17  ; height
mov dx, word[fireY]	; starting word[y]
int 10h

f5:
push cx
mov cx, word[fireX]	;starting word[x]

mov si, word[var]	; thickness 
f6:
inc cx   ;incrementing cx
int 10h
dec si       ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to f6
jge f6

mov cx, word[fireX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop f5










sub word[fireY], 5   ;along y-axis
add word[fireX], 3   ;along x-axis
sub word[var], 3    ;thickness

mov ah, 0ch
mov al, 14  ;color
mov cx, 17  ; height
mov dx, word[fireY]	; starting word[y]
int 10h

f7:
push cx
mov cx, word[fireX]	;starting word[x]

mov si, word[var]	; thickness 
f8:
inc cx   ;incrementing cx
int 10h
dec si    ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to f8
jge f8

mov cx, word[fireX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop f7








sub word[fireY], 5    ;along y-axis
add word[fireX], 7    ;along x-axis
sub word[var], 7     ;thickness

mov ah, 0ch
mov al, 14  ;color
mov cx, 17 ; height
mov dx, word[fireY]	; starting word[y]
int 10h

f9:
push cx
mov cx, word[fireX]	;starting word[x]

mov si, word[var]	; thickness 
f10:
inc cx   ;incrementing cx
int 10h
dec si     ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to f10
jge f10

mov cx, word[fireX]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop f9

sub word[fireY], 3  ;along y-axis
sub word[var], 3   ;thickness

mov ah, 0ch
mov al, 14 ;color
mov cx, 15 ; height
mov dx, word[fireY]	; starting word[y]
int 10h

g14:
push cx
mov cx, word[fireX]	;starting word[x]

mov si, word[var]	; thickness 
g2:
inc cx  ;incrementing cx
int 10h
dec si   ;decrementing si
cmp si, 0 ; if si is >= 0 then jump to g2
jge g2

mov cx, word[fireX]
inc dx   ;incrementing dx
int 10h
int 10h
pop cx
loop g14
 
sub word[fireY], 3   ;along y-axis
sub word[fireX], 3   ;along x-axis
sub word[var], 3     ;thickness

mov ah, 0ch
mov al, 14  ;color
mov cx, 15 ; height
mov dx, word[fireY]	; starting word[y]
int 10h

g34:
push cx
mov cx, word[fireX]	;starting word[x]

mov si, word[var]	; thickness 
call g4   ;calling g4

mov cx, word[fireX]
inc dx    ;incrementing dx
int 10h
int 10h
pop cx
loop g34
;saving value
mov bx, word[prevFX]
mov word[fireX], bx
mov bx, word[prevFY]
mov word[fireY], bx

ret 


clearfire:


mov ah, 0ch
mov al, 0   ;color
mov cx,75	 ; height	
mov dx, word[fireY]	; word[y]-start; word[marioY]
int 10h
loop2:
push cx
mov cx, word[fireX]	;how far from the word[x]-start ;variable word[mariox]
mov si, 30   ;xaxis
call l2
mov cx, word[fireX]	; setting col again
inc dx	; next rowe
int 10h
int 10h
pop cx
loop loop2


ret

firedrop:

mov bx,word[dragonX]  ;derefrencing dragonX of word type and moving its value in bx
mov word[fireX],bx    ;derefrencing fireX of word type and moving value of bx in it 
mov word[fireY],220   ;derefrencing fireY of word type and moving 220 in it 


mov cx,50  ;height

l84:
push cx

call fire  ;calling fire

sub word[fireX],5    ;along x-axis
sub word[fireY],25   ;along y-axis
call clearfire   ;calling clearfire
add word[fireX],5  ;along x-axis
add word[fireY],25  ;along y-axis

add word[fireY],2
call fire    ;calling fire


pop cx
loop l84











ret
;bl=background
;ah=color
Cstart00:

mov dl, 33 ;col
mov dh, 15 ;row
mov bh,0
mov ah,02h
int 10h
mov al, 'M'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'A'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'R'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'I'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'O'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, ' '
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'S'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'M'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'A'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'S'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'H'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
ret		

;bl=background
;ah=color
Cstart0:


mov dl, 27 ;col
mov dh,15 ;row
mov bh,0
mov ah,02h
int 10h
mov al, 'I'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'N'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'S'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'T'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'R'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'U'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'C'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'T'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'I'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'O'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'N'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'S'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, ':'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h



mov dl, 27 ;col
mov dh,17 ;row
mov bh,0
mov ah,02h
int 10h
mov al, 'P'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'R'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'E'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'S'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'S'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

mov al, ' '
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
;bl=background
;ah=color
mov al, 'L'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'E'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'F'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'T'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

mov al, ' '
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, '&'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, ' '
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

mov al, 'R'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'I'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'G'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'H'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'T'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

mov al, ' '
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

mov al, 'T'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'O'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

mov al, ' '
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
;bl=background
;ah=color
mov al, 'M'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'O'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'V'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'E'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h


mov dl, 27 ;col
mov dh,18 ;row
mov bh,0
mov ah,02h
int 10h
mov al, 'P'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'R'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'E'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'S'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'S'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

mov al, ' '
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
;bl=background
;ah=color
mov al, 'U'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'P'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

mov al, ' '
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

mov al, 'T'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'O'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

mov al, ' '
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

mov al, 'J'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'U'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'M'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'P'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h


mov dl, 27 ;col
mov dh,19 ;row
mov bh,0
mov ah,02h
int 10h
mov al, 'P'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'R'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'E'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'S'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'S'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

mov al, ' '
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h


mov al, 'E'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

;bl=background
;ah=color
mov al, ' '
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

mov al, 'T'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'O'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

mov al, ' '
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

mov al, 'E'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'X'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'I'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'T'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h



ret



;bl=background
;ah=color
Cstart1:

mov dl, 35 ;col
mov dh, 15 ;row
mov bh,0
mov ah,02h
int 10h
mov al, 'L'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'E'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'V'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'E'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'L'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, ' '
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, '1'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h

ret

;bl=background
;ah=color
Cstart2:
mov dl, 35 ;col
mov dh, 15 ;row
mov bh,0
mov ah,02h
int 10h
mov al, 'L'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'E'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'V'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'E'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'L'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, ' '
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, '2'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
ret

;bl=background
;ah=color
Cstart3:

mov dl, 35 ;col
mov dh, 15 ;row
mov bh,0
mov ah,02h
int 10h
mov al, 'L'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'E'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'V'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'E'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'L'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, ' '
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, '3'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
ret




;bl=background
;ah=color
Cstart4:

mov dl, 35 ;col
mov dh, 15 ;row
mov bh,0
mov ah,02h
int 10h
mov al, 'T'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'H'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'E'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, ' '
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'E'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'N'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
mov al, 'D'
mov bl,0ch
mov bh, 0
mov ah, 0eh
int 10h
ret
