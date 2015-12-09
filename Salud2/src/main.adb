with Ada.Integer_Text_IO, Ada.Text_IO,Ada.Numerics.Discrete_Random;
use Ada.Integer_Text_IO, Ada.Text_IO;

procedure Main is
   subtype rango is Integer range 50..80;
   subtype rango1 is Integer range 70..100;
   subtype rango2 is Integer range 100..160;
   subtype rango3 is Integer range 10..25;
   subtype rango4 is Integer range 30..40;

   Ritmo,PresionA,PresionS,Frecuencia,Temperatura:Integer:=0;
   --j:Integer:=100;


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

   RC:randomRitmo.Generator;
   PA:randomPresionA.Generator;
   PS:randomPresionS.Generator;
   FR:randomFrecuencia.Generator;
   TC:randomTemperatura.Generator;



   --task Alteracion;
   --task Controlador;

   task type Alteracion is
    entry al;
    end Alteracion;

    task type Controlador is
     entry con;
    end Controlador;

   --task type Controlador is
     -- entry Medicion (Ritmo,PresionA, PresionS, Frecuencia,Temperatura:Integer);
   --end Controlador;


   task body Alteracion is
   begin
      accept al  do
      --for i in 1..10 loop
      Reset(RC);
      Reset(PA);
      Reset(PS);
      Reset(FR);
      Reset(TC);

       Ritmo:=Random(RC);
       PresionA:=Random(PA);
       PresionS:=Random(PS);
       Frecuencia:=Random(FR);
       Temperatura:=Random(TC);

       --Controlador.Medicion(r,p1,p2,f,t);
       --M(i).Medicion(r,p1,p2,f,t);


         --M(j).Medicion(r,p1,p2,f,t);
      --Controlador.Medicion(r,p1,p2,f,t);
      --Controlador2.Medicion2(r,p1,p2,f,t);
      --j:= j-1;
      --end loop;
      end al;
   end Alteracion;

   task body Controlador is
   begin
      --accept Medicion (Ritmo : in Integer; PresionA : in Integer; PresionS : in Integer; Frecuencia : in Integer; Temperatura : in Integer) do
      accept con  do
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


      delay 1.0;
      Put_Line("Sistema Normal");


         if (Ritmo < 70) or (Ritmo > 75) then

           while Ritmo > 75 loop
            Ritmo := Ritmo-2;
            --Put(r);
           end loop;
           while Ritmo < 70 loop
             Ritmo:= Ritmo + 2;
         end loop;
         Put("Ritmo Cardiaco Normal");
         Put(Ritmo);
         Put_Line("");
       end if;

         if (PresionA < 80) or (PresionA > 90) then
            while PresionA > 90 loop
              PresionA:= PresionA-2;
            end loop;
           while PresionA < 80 loop
             PresionA:= PresionA + 2;
         end loop;
         Put("Presion Ritmo - Asistolica Normal ");
          Put(PresionA);
          Put_Line("");
         end if;

         if (PresionS < 120) or (PresionS > 140) then
            while PresionS > 140 loop
             PresionS:= PresionS-2;
           end loop;
           while PresionS < 120 loop
             PresionS:= PresionS + 2;
         end loop;
         Put("Presion Arterial - Sistolica Normal ");
         Put(PresionS);
         Put_Line("");
         end if;

         if (Frecuencia < 12) or (Frecuencia > 20) then
           while Frecuencia > 20 loop
             Frecuencia:= Frecuencia-2;
           end loop;
           while Frecuencia < 12 loop
             Frecuencia:= Frecuencia + 2;
         end loop;
         Put("Frecuencia Respiratoria Normal");
         Put(Frecuencia);
         Put_Line("");
         end if;

         if (Temperatura < 36) or (Temperatura > 38) then
            while Temperatura > 38 loop
             Temperatura:= Temperatura-2;
           end loop;
           while Temperatura < 36 loop
             Temperatura:= Temperatura + 2;
         end loop;
         Put("Temperatura Corporal Normal");
         Put(Temperatura);
         Put_Line("");
      end if;

      --put(r);
      -- end Medicion;
      end con;
   end Controlador;
   A : array (1..1000) of Alteracion;
   C : array (1..1000) of Controlador;
   --M : array (1..1000) of Controlador;

begin


   for i in 1..1000 loop
      A(i).al;
      --C(i).con;

      end loop;

end Main;
