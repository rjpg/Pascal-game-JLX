{
   Este programa ‚ para mostrar aos iniciantes de PASCAL como ‚ possivel
   fazer 2 ou mais anima‡äes ao mesmo tempo em MODO GRAFICO.

                               feito por
                  |------------------------------------|
                  |RUI JORGE PEREIRA GONCALVES (X-prog)|
                  |------------------------------------|
                                  Help
                                 /    \
       LUIS ANDRE BRANCO (LAB-soft) ; JOEL NELSON PERERIRA (JNP-25)


VERSION 1.00 (beta)
}

program X_prog;
uses   dos,crt,graph;
const  r=9;
var     {jogo}
    co,v,pausa,nivel,lar,pontos,g,tan,vida,c,gd,gm,cor:integer;
       op                                             :char;
       pm                                             :pointer;
        {heli hori}
       r1,r1c,hcor,velo,x,y,hx,hy                     :integer;
       p1                                             :pointer;
        {heli vert}
       r2c,r2,g2,hy2,hx2,velo2                        :integer;
       p2                                             :pointer;

{----------------------------------------------------------------------------}

procedure abrir_modo_grafico;
{  var
    GraphDriver,GraphMode,VGA256:integer;
    regs:registers;
  begin
    VGA256:=InstallUserdriver('VGA256',nil);
    GraphDriver:=VGA256;
    InitGraph(GraphDriver,GraphMode,'\tp7\bgi');
    regs.ah:=0;
    regs.al:=$13;
    intr($10,regs);
  end;}
var
 grDriver: Integer;
 grMode: Integer;
 ErrCode: Integer;
begin
 grDriver := Detect;
 InitGraph(grDriver, grMode,'c:\tp7\bgi');
 ErrCode := GraphResult;
 if ErrCode = grOk then
  { Do graphics }
  cleardevice
 else
   Writeln('Graphics error:', GraphErrorMsg(ErrCode));
end;


{----------------------------------------------------------------------------}

procedure heli;  {alvo que anda na horizontal}
begin
    if getcolor<>0 then
        begin
        r1:=r1+r1c;
        if r1>=30 then r1c:=-2;
        if r1<=1 then r1c:=2;
        end;
     SetFillstyle(1, getcolor-1);
     PieSlice(hx, hy, 40, 358, tan);
     {Ellipse(HX, HY, 40, 340, TAN+3, TAN);}
     circle(hx,hy,tan);
     line (hx-r1,hy-tan,hx+r1,hy-tan);
     { Cauda }
     line(hx-35,hy-1,hx-8,hy-1);
     line(hx-35,hy,hx-8,hy+4);
     line(hx-37,hy-8,hx-35,hy);
     line(hx-38,hy-8,hx-28,hy);
end;

{----------------------------------------------------------------------------}

Function premir:char;
Var c:char;
Begin
 if keypressed then c:=readkey else c:=#255;
 premir:=c
end;

{----------------------------------------------------------------------------}

procedure heliA;  {alvo que anda na horizontal}
begin
     line (hx-40,hy-tan,hx+40,hy-tan);
end;

{----------------------------------------------------------------------------}

procedure heli2; {alvo que anda na vertical}
begin

     if getcolor<>0 then
        begin
        r2:=r2+r2c;
        if r2>=30 then r2c:=-2;
        if r2<=1 then r2c:=2;
        end;
    SetFillstyle(1, 1);
    PieSlice(hx2, hy2, 180, 360, 10);
     circle(hx2,hy2,10);
     line (hx2-r2,hy2-10,hx2+r2,hy2-10);
     line (hx2-8,hy2+3,hx2+8,hy2+3);
     line (hx2-4,hy2+9,hx2-8,hy2+15);
     line (hx2+4,hy2+9,hx2+8,hy2+15);
end;

{----------------------------------------------------------------------------}
procedure eli2; {alvo que anda na vertical}
begin
      if getcolor<>0 then
      begin
        r2:=r2+r2c;
        if r2>=30 then r2c:=-2;
        if r2<=1 then r2c:=2;
     end;
       { SetFillstyle(1, 1);
    PieSlice(hx2, hy2, 180, 360, 10);   }
     circle(hx2,hy2,10);
     line (hx2-r2,hy2-10,hx2+r2,hy2-10);
     line (hx2-8,hy2+3,hx2+8,hy2+3);
     line (hx2-4,hy2+9,hx2-8,hy2+15);
     line (hx2+4,hy2+9,hx2+8,hy2+15);
end;

{---------------------------------------------------------------------------}

procedure heli2a; {alvo que anda na vertical}
begin

     line (hx2-40,hy2-10,hx2+40,hy2-10);

end;

{---------------------------------------------------------------------------}

{procedure halder;interrupt;
begin
  if (flag=false) and (caler<>nil) then
  begin
    flag:=true;
    asm
    call caller
    end;
    flag:=false;
  end;
end;

{---------------------------------------------------------------------------}

{procedure installer(p:pointer);
begin

end;
{---------------------------------------------------------------------------}
procedure guerra; {fazer os predios}
var
y1,y2,c:integer;
begin
 SetFillStyle(1,7);
 Bar(0,350,60,459 );
 SetFillStyle(1,4);
 Bar(63,300,130,459);
 SetFillStyle(1,3);
 Bar(150,250,220,459);
 SetFillStyle(1,3);
 Bar(223,150,295,459);
 SetFillStyle(1,3);
 Bar(315,250,390,459);
 SetFillStyle(1,3);
 Bar(393,300,470,459);
 SetFillStyle(1,4);
 Bar(490,220,565,459);
 SetFillStyle(1,4);
 Bar(568,150,640,459);
 y1:=355;y2:=365;c:=1;
 repeat
  SetFillStyle(1,14);
  Bar(14,y1,20,y2);
  Bar(40,y1,46,y2);
  y1:=y1+20;y2:=y2+20;
  c:=c+2;
 until   (Y2=445);
 y1:=310;y2:=320;
 repeat
  SetFillStyle(1,14);
  Bar(77,y1,83,y2);
  Bar(109,y1,116,y2);
  y1:=y1+20;y2:=y2+20;
 until   (Y2=440);
 y1:=260;y2:=270;
 repeat
  SetFillStyle(1,14);
  Bar(164,y1,170,y2);
  Bar(200,y1,206,y2);
  y1:=y1+20;y2:=y2+20;
 until   (Y2=450);
 y1:=160;y2:=170;
 repeat
  SetFillStyle(1,14);
  Bar(238,y1,244,y2);
  Bar(274,y1,280,y2);
  y1:=y1+20;y2:=y2+20;
 until   (Y2=450);
  y1:=260;y2:=270;
 repeat
  SetFillStyle(1,14);
  Bar(330,y1,336,y2);
  Bar(369,y1,375,y2);
  y1:=y1+20;y2:=y2+20;
 until   (Y2=450);
  y1:=310;y2:=320;
 repeat
  SetFillStyle(1,14);
  Bar(407,y1,413,y2);
  Bar(449,y1,455,y2);
  y1:=y1+20;y2:=y2+20;
 until   (Y2=440);
  y1:=230;y2:=240;
 repeat
  SetFillStyle(1,14);
  Bar(506,y1,512,y2);
  Bar(543,y1,549,y2);
  y1:=y1+20;y2:=y2+20;
 until   (Y2=440);
  y1:=160;y2:=170;
 repeat
  SetFillStyle(1,14);
  Bar(582,y1,588,y2);
  Bar(626,y1,632,y2);
  y1:=y1+20;y2:=y2+20;
 until   (Y2=450);
end;

{---------------------------------------------------------------------------}

procedure repor;{muda o cen rio }
var sol:integer;
begin
nosound;
setcolor (3);
if nivel = 2 then outtextxy (100,100,'NIVEL 2 !!');
if nivel = 3 then outtextxy (100,100,'NIVEL 3 !!');
closegraph;
abrir_modo_grafico;
if nivel = 2 then
   begin
   SetFillStyle(1,1);
   setcolor (1);
   bar (1,1,640,459);
   end;
setcolor (6);
line (1,462,640,462);
setcolor(14);
if nivel=2 then for sol:=1 to 20 do circle(600,70,sol);
if nivel<>2 then
   for c:=1 to 500 do
       begin
       setcolor(15 + 128);
       putpixel(random(640),random(455),getcolor);
       end;
setcolor (3);
outtextxy(270,470,'PONTOS');
guerra;
setcolor(5);
outtextxy(600,470,'vida');
line (440+vida,479,640,479);
setcolor (1);
end;

{----------------------------------------------------------------------------}

function IntToStr(i: integer): string;
{ Convert any Integer type to a string }
var
  s: string[11];
begin
  Str(i, s);
  IntToStr := s;
end;

{----------------------------------------------------------------------------}

procedure disp ; {testa o tiro e faz os sons}
begin
setcolor(11);
circle (x,y,2);
setcolor (GetPixel(x,y));
circle (x,y,2);
if ((x>=hx-tan*2+3) and (x<=hx+tan*2+3) and (y>=hy-tan*2+3) and (y<=hy+tan*2+3))  then
   begin {alvo horizontal varia as cores a velocidade e o tamanho}
   if (hcor=10) then
      hcor:=13
   else
      hcor:=10;
   if velo>3 then {este if para a velocidade nÆo ser negativa}
      velo:=velo-1;
   pontos:=pontos+10;
   case pontos of
           500:begin
               cleardevice;
               hx:=50;
               hy:=440;
               heli;
               tan:=tan-2 ;
               nivel:=3;
               repor;
               setcolor (blue);
               velo:=co;
               outtextxy(1,470,'nivel 3');
               readln;
               delay (200);
               end;
       end;
   for g:=1 to 10 do
       begin
       sound (g*10);
       delay (10);
       nosound;
       end;
   g:=0;

   end
   else
       begin
       sound (4000);
       delay (100);
       nosound;
      end;

if ((x>=hx2-10*2+3) and (x<=hx2+10*2+3) and (y>=hy2-10*2+3) and (y<=hy2+10*2+3))    then
   begin                 {alvo vertical nÆo varia nada}
   pontos:=pontos+10;
   case pontos of
           300:begin
               cleardevice;
               hx2:=50;
               hy2:=440;
               heli2;
               nivel:=nivel+1;
               repor;
               setcolor(blue);
               outtextxy(1,470,'nivel 2');
               readkey;
               delay (200);
               end;
   end;
   for g:=1 to 10 do
       begin
       sound (g*10);
       delay (10);
       nosound;
       end;
   g2:=1;

   end
   else
       begin
       sound (4000);
       delay (25);
       nosound;
       end;
setcolor (0);
outtextxy(330,470,IntToStr(pontos-10));
setcolor (3);
outtextxy(270,470,'PONTOS');
outtextxy(330,470,IntToStr(pontos));
setcolor (0);
end;  {fim do procedimento disp}

{----------------------------------------------------------------------------}

procedure ppp;
type
 np=record
 nome : string[10];
 ponto:integer;
 end;
vector=array [1..10]of np;
var
 cp:file of vector;
 a:vector;
 aux:vector;
 j,i,h:integer;
begin
j:=0;
assign (cp,'pontos.dat');
reset(cp);
read(cp,a);
i:=0;
repeat
      i:=i+1;
      j:=j+1;
      if (h=0) and( pontos > a[i].ponto) then
       begin
         aux[j]:=a[i];
         j:=j+1;
         h:=1;
       end
     else aux[j]:=a[i];
until (j=10);
close (cp);
rewrite (cp);
write (cp,aux);
close (cp);
end;

{----------------------------------------------------------------------------}

procedure jogar;  {procedure principal}
        begin
        closegraph;
        abrir_modo_grafico;
        cleardevice;
        setcolor(blue);
        outtextxy(1,470,'nivel 1');
        r1:=1;{rota‡ao da helice do alvo horizontal}
        r1c:=1;{r. p.}
        r2:=1;{rota‡Æo da helice do alvo vertical}
        r2c:=1;{rota‡ao positiva}
        nivel:=1;{iniciar o nivel}
        g2:=0;{tiro no alvo vertical}
        hx2:=300;{ x do alvo vertical}
        hy2:=100;{ y do alvo vertical}
        hcor:=4;{cor do alvo horizontal}
        tan:=8;{tamanho do alvo horizontal}
        pontos:=0;{pontos do jogo}
        g:=1;{tiro no alvo horizontal}
        setcolor(4);
        X:=320; {coordenadas da mira}
        y:=240;
        vida:=20;{vida que determina o fim do jogo em 200}
        setcolor(5);
        outtextxy(600,470,'vida');
        line (440,479,640,479);{desenhar barra de energia}
        hx:=720;hy:=235;{coordenadas do alvo horizontal}
        setcolor(red);
        line (1,462,640,462);
        for c:=1 to 500 do
            begin
            setcolor(15 + 128);
            putpixel(random(640),random(455),getcolor);
            end;
        guerra;
        setcolor (3);
        outtextxy(270,470,'PONTOS');
        getmem (p1,imagesize(hx-50,hy-10,hx+30,hy+10));
        getimage (hx-50,hy-10,hx+30,hy+10,p1^);
        getmem (pm,imagesize(x-10,y-10,x+10,y+10));
        getimage (x-10,y-10,x+10,y+10,pm^);
        getmem (p2,imagesize(hx2-30,hy2-20,hx2+30,hy2+20));
        getimage (hx2-30,hy2-20,hx2+30,hy2+20,p2^);

repeat {ciclo do processamento do jogo}
        getimage (x-10,y-10,x+10,y+10,pm^);
repeat {ciclo das anima‡äes}
setcolor (0);
if (random (velo)=1) and ((nivel=2) or (nivel=3)) then {alvo horizontal}
 begin
 sound (hx);
 if (nivel=3)and((hx>=hx2-63) and (hx<=hx2+63) and (hy>=hy2-63) and (hy<=hy2+63)) then
 putimage (hx2-30,hy2-20,p2^,normalput);
 putimage (hx-50,hy-10,p1^,normalput);
 if(hx>=600) or (g=0)then
   begin
   if g=0 then
      begin
      if velo>3 then
         velo:=velo-1;
      end
   else
     begin
     vida:=vida+20;
     line (440,479,640,479);
     setcolor(5);
     outtextxy(600,470,'vida');
     line (440+vida,479,640,479);
   end;
 hx:=random(300-velo)+50;
 hy:=random(425)+30;
 g:=1;
 end;
hx:=random(3)+hx;
{ if random (3)=1 then
  hy:=random(3)+hy else hy:=random(3)-hy; }
setcolor(hcor);
putimage (x-10,y-10,pm^,normalput);
getimage (hx-50,hy-10,hx+30,hy+10,p1^);
heli;
end; {fim do processamento do alvo horzontal}

if (random (velo2)=1) and ((nivel=1) or (nivel=3)) then {alvo vertical}
  begin
  sound (hy2);
   if(nivel=3)and((hx2>=hx-63) and (hx2<=hx+43) and (hy2>=hy-43) and (hy2<=hy+43)) then
     putimage (hx-50,hy-10,p1^,normalput);
  putimage (hx2-30,hy2-20,p2^,normalput);
  if(g2=1) or (hy2>=450)  then
    begin
    if g2<>1 then
       begin
       vida:=vida+20;
       line (440,479,640,479);
       setcolor(5);
       outtextxy(600,470,'vida');
       line (440+vida,479,640,479);
       end;
    hx2:=random(570)+40;
    hy2:=random(100)+20;
    g2:=0;
    end;
  hy2:=random(3)+hy2;
  if random (2)=1 then
  hx2:=random(4)+hx2 else hx2:=random(3)-hx2;
  putimage (x-10,y-10,pm^,normalput);
  getimage (hx2-30,hy2-20,hx2+30,hy2+20,p2^);
  setcolor(14);
  heli2;
  end;   {fim do processamento do alvo vertical}

setcolor (random(7)+8);
circle (x,y,5);
line (x-10,y,x+10,y);
line (x,y-10,x,y+10);

until keypressed;{fim do ciclo das anima‡äes}
  putimage (x-10,y-10,pm^,normalput);
if ((nivel=1)or(nivel=3))then
if ((x>=hx2-30*2+3) and (x<=hx2+30*2+3) and (y>=hy2-30*2+3) and (y<=hy2+30*2+3))    then
   putimage (hx2-30,hy2-20,p2^,normalput);
if ((nivel=2)or(nivel=3))then
if ((x>=hx-63) and (x<=hx+43) and (y>=hy-43) and (y<=hy+43)) then
   putimage (hx-50,hy-10,p1^,normalput);

op := premir;

        case op of              {testar teclas para o movimento}
        #72:if y >15 then y:=y-r;
        #80:if y < 445 then y:=y+r;
        #75:if x > 15 then  x:=x-r;
        #77:if x < 626 then x:=x+r;
        ' ': disp;
        end;

until ((op = #27) or (vida>=200) or (pontos=800)); {acabar tudo, se a vida acabar ou se 'esc'}
{fim do ciclo de processamento do jogo}


setcolor (110);
if (vida>=200) or (op=#27) then
   begin
   SetTextStyle(1, HorizDir,9);
   outtextxy (60,100,'GAME OVER'); {digitar 'GAME OVER'}
   for tan:=200 downto 100 do
       begin
       sound (tan);
       delay (10);
       end;
   nosound;
   end
   else
       begin
       repeat
        SetTextStyle(1, HorizDir,4);
        setcolor (9);
        outtextxy (140,200,'parabens chegaste ao fim');
        op:=readkey;
       until (op=#27);
   for tan:=100 to 200 do
       begin
       sound (tan);
       delay (10);
       end;
   nosound;
   end;
readln;
cleardevice;
end;

{----------------------------------------------------------------------------}

procedure config;
begin
repeat
clrscr;
writeln ('qual o pc?' );
writeln;
writeln ('1 -  <=386');
writeln ('2 -   =486');
writeln ('3 -  >=586');
writeln;
write ('opcao: ');
readln (x);
case x of
  1:begin
    velo2:=4;
    velo:=10;
    v:=20;
    co:=10;
    end;
  2:begin
    velo2:=40;
    velo:=40;
    v:=100;
    co:=50;
    end;
  3:begin
    velo:=60;
    velo2:=60;
    v:=150;
    co:=60;
    end;

end;
until (x=2) or (x=1) or (x=3);
end;

{----------------------------------------------------------------------------}

procedure recor;
type
 np=record
 nome : string[10];
 ponto:integer;
 end;
vector=array [1..10]of np;
var
 cp:file of vector;
 a:vector;
 i:integer;
begin
assign (cp,'pontos.dat');
reset(cp);
read(cp,a);
for i:=1 to 10 do
outtextxy (100,10*i,'a[i].nome');
close (cp);
end;

{----------------------------------------------------------------------------}

procedure ap;
var jlx,jly,dax,c,eax,eay,tx,ty,dx,dy,xa,ya:integer;
begin
cleardevice;
c:=0;
jly:=400;
jlx:=150;
xa:=0;
ya:=0;
dx:=1;
eax:=-20;
eay:=150;
dy:=1;
tx:=1;
ty:=1;
r2c:=2;
r2:=2;
hx2:=100;
hy2:=100;

repeat
sound(xa);
sound(ya);
if c>2000 then
begin
SetTextStyle(1, HorizDir,5);
setcolor (9);
outtextxy (jlx,jly,'JLX');
end;
SetTextStyle(2, HorizDir,19);
if c>1000 then
begin
setcolor (14);
outtextxy (eax,eay,'APRESENTA');
end;
setcolor (2);
eli2;
setcolor (6);
outtextxy (xa,ya,'X-prog');
delay (2);
setcolor (0);
eli2;
hx2:=hx2+2*tx;
hy2:=hy2+2*ty;
if hx2>610 then tx:=-1;
if hy2>450 then ty:=-1;
if hx2<1   then tx:=1;
if hy2<1   then ty:=1;

setcolor(0);
outtextxy (xa,ya,'X-prog');
xa:=xa+(1*dx);
ya:=ya+(1*dy);
if xa=510 then dx:=-1;
if ya=450 then dy:=-1;
if xa=1   then dx:=1;
if ya=1   then dy:=1;
c:=c+1;
if c > 1000 then
begin
setcolor(0);
outtextxy (eax,eay,'APRESENTA');
eax:=eax+(1*dx);
eay:=eay+(1*dy);
if eax=430 then dx:=-1;
if eay=450 then dy:=-1;
if eax=1   then dx:=1;
if eay=1   then dy:=1;
end;
if c > 2000 then
begin
SetTextStyle(1, HorizDir,5);
setcolor(0);
outtextxy (jlx,jly,'JLX');
jlx:=jlx+(1*dx);
jly:=jly+(1*dy);
if jlx=510 then dx:=-1;
if jly=450 then dy:=-1;
if jlx=1   then dx:=1;
if jly=1   then dy:=1;
end;

until (keypressed);
nosound;

end;

{----------------------------------------------------------------------------}

procedure inicio;
var rui:integer;
begin
rui:=0;
y:=120;
repeat
x:=220;
setcolor(15);
SetTextStyle(2, HorizDir,4);
outtextxy (550,460,'Rui Jorge');
setcolor(6);
SetTextStyle(1, HorizDir,3);
outtextxy (100,10,'JNP 25');
outtextxy (250,10,'X-prog');
outtextxy (400,10,'LAB SOFT');
setcolor(2);
SetTextStyle(3, HorizDir,3);
outtextxy (250,105,'- jogar');
outtextxy (250,105+90*1,'- pontos');
outtextxy (250,105+90*2,'- ajuda');
outtextxy (250,105+90*3,'- sair');
repeat
tan:=8;
if random (v) = 1 then
begin
hx:=100;
hy:=100;
setcolor (0);
heliA;
setcolor (13);
heli;
end;

if random (v) = 1 then
begin
hx:=500;
hy:=200;
setcolor (0);
heliA;
setcolor (18);
heli;
end;

if random (v) = 1 then
begin
hx2:=100;
hy2:=200;
setcolor (0);
heli2A;
setcolor (18);
heli2;
end;

if random (v) = 1 then
begin
hx2:=550;
hy2:=70;
setcolor (0);
heli2A;
setcolor (4);
heli2;
end;


if random (v) = 1 then
begin
hx:=400;
hy:=300;
setcolor (0);
heliA;
setcolor (14);
heli;
end;

if random (v) = 1 then
begin
hx:=10;
hy:=400;
setcolor (0);
heliA;
setcolor (11);
heli;
end;

if random (v) = 1 then
begin
hx:=200;
hy:=300;
setcolor (0);
heliA;
setcolor (1);
heli;
end;

if random (v) = 1 then
begin
hx:=630;
hy:=350;
setcolor (0);
heliA;
setcolor (3);
heli;
end;
rui:=rui+1;
cor:=random(15);setcolor (cor);
circle (x,y,5);
line (x-10,y,x+10,y);{dsenhar mira}
line (x,y-10,x,y+10);
setcolor (4);
if rui = 6000 then ap;
until keypressed; {fim do ciclo das anima‡äes}
rui:=0;
setcolor (0);
circle (x,y,5);
line (x-10,y,x+10,y);{dsenhar mira}
line (x,y-10,x,y+10);

op:=readkey;
   case op of              {testar teclas para o movimento}
        #72: begin
             if y<>120then
                begin
                sound(300);
                y:=y-90;
                end
                else
                sound (100);
             delay (100);
             nosound;
             end;
        #80: begin
             if y<>390then
                begin
                sound(300);
                y:=y+90;
                end
                else
                sound(100);
             delay (100);
             nosound;
             end;
        ' ':begin
            disp;
            case y of
              120:begin jogar;x:=200;y:=120; end;
              210:recor;
              300:op:='3';
              390:op:='4';
            end;
    end;

    end;
until (op='4');
end;


{----------------------------------------------------------------------------}


begin  {‚ aqui que tudo come‡a e tudo acaba}

       closegraph;{para seguran‡a}
       config;
       abrir_modo_grafico;
       ap;
       inicio;
       closegraph;
       textcolor(6+blink);
       write ('X-prog');

end.
fim...         - para 1997 h  mais !!! -
Rui Jorge Pereira Goncalves (c) 1996 X-prog
                     '
