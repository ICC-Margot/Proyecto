with Ada.Integer_Text_IO, Ada.Text_IO,Ada.Numerics.Discrete_Random;
use Ada.Integer_Text_IO, Ada.Text_IO;

procedure Main is
   subtype rango is Integer range 50..80;
   subtype rango1 is Integer range 70..100;
   subtype rango2 is Integer range 100..160;
   subtype rango3 is Integer range 10..25;
   subtype rango4 is Integer range 30..40;

   package randomRitmo is new Ada.Numerics.Discrete_Random (rango);
   use randomRitmo;

   package randomPresionA is new Ada.Numerics.Discrete_Random (rango1);
   use randomPresionA;

   package randomPresionS is new Ada.Numerics.Discrete_Random(rango2);
   use randomPresionS;

   package randomFrecuencia is new Ada.Numerics.Discrete_Random(rango3);
   use randomFrecuencia;

   package randomTemperatura is new Ada.Numerics.Discrete_Random(rango4);
   use randomTemperatura;



   task Alteracion;

   task type Controlador is
      entry Medicion (Ritmo,PresionA, PresionS, Frecuencia,Temperatura:Integer);
   end Controlador;

   task body Controlador is
   begin
      accept Medicion (Ritmo : in Integer; PresionA : in Integer; PresionS : in Integer; Frecuencia : in Integer; Temperatura : in Integer) do

         if (Ritmo < 70) or (Ritmo > 75) then
            Put("Alerta de Ritmo Cardiaco");
         else
            Put("Ritmo Cardiaco Normal");
         end if;
         Put(Ritmo);
         Put_Line("");

         if (PresionA < 80) or (PresionA > 90) then
            Put("Alerta de Presion Arterial - Asistolica ");
         else
            Put("Presion Arterial - Asistolica Normal ");
         end if;
         Put(PresionA);
         Put_Line("");

         if (PresionS < 120) or (PresionS > 140) then
            Put("Alerta de Presion Arterial - Sistolica ");
         else
            Put("Presion Arterial - Sistolica Normal ");
         end if;
         Put(PresionS);
         Put_Line("");

         if (Frecuencia < 12) or (Frecuencia > 20) then
            Put("Alerta de Frecuencia Respiratoria");
         else
            Put("Frecuencia Respiratoria Normal");
         end if;
         Put(Frecuencia);
         Put_Line("");

         if (Temperatura < 36) or (Temperatura > 38) then
            Put("Alerta de Temperatura Corporal");
         else
            Put("Temperatura Corporal Normal");
         end if;
         Put(Temperatura);
         Put_Line("");

      end Medicion;
   end Controlador;

   M : array (1..1000) of Controlador;

   task body Alteracion is
      r,p1,p2,f,t:Integer:=0;
      j:Integer:=100;
      RC:randomRitmo.Generator;
      PA:randomPresionA.Generator;
      PS:randomPresionS.Generator;
      FR:randomFrecuencia.Generator;
      TC:randomTemperatura.Generator;

   begin

      for i in 1..100 loop
      Reset(RC);
      Reset(PA);
      Reset(PS);
      Reset(FR);
      Reset(TC);

       r:=Random(RC);
       p1:=Random(PA);
       p2:=Random(PS);
       f:=Random(FR);
       t:=Random(TC);

       --Controlador.Medicion(r,p1,p2,f,t);
       M(i).Medicion(r,p1,p2,f,t);


      if (r < 70) or (r > 75) then

           while r > 75 loop
            r:= r-2;
            --Put(r);
           end loop;
           while r < 70 loop
             r:= r + 2;
           end loop;
       end if;

         if (p1 < 80) or (p1 > 90) then
            while p1 > 90 loop
              p1:= p1-2;
            end loop;
           while p1 < 80 loop
             p1:= p1 + 2;
           end loop;
         end if;

         if (p2 < 120) or (p2 > 140) then
            while p2 > 140 loop
             p2:= p2-2;
           end loop;
           while p2 < 120 loop
             p2:= p2 + 2;
           end loop;
         end if;

         if (f < 12) or (f > 20) then
           while f > 20 loop
             f:= f-2;
           end loop;
           while f < 12 loop
             f:= f + 2;
           end loop;
         end if;

         if (t < 36) or (t > 38) then
            while t > 38 loop
             t:= t-2;
           end loop;
           while t < 36 loop
             t:= t + 2;
           end loop;
      end if;

      --put(r);
      delay 1.0;
         Put_Line("Sistema Normal");
         M(j).Medicion(r,p1,p2,f,t);
      --Controlador.Medicion(r,p1,p2,f,t);
      --Controlador2.Medicion2(r,p1,p2,f,t);
      j:= j-1;
      end loop;
   end Alteracion;

begin
   --  Insert code here.
   null;
end Main;
