with STM32.Board;   use STM32.Board;
with Ada.Real_Time; use Ada.Real_Time;
with STM32.GPIO; use STM32.GPIO;
package body The_Task is

   task body tache_1 is
      Period       : constant Time_Span := Milliseconds (1000);  -- arbitrary
      Next_Release : Time := Clock;
   begin
      loop
         Toggle (Green);
         Next_Release := Next_Release + Period;
         delay until Next_Release;
      end loop;
   end tache_1;

   task body tache_2 is
      Period       : constant Time_Span := Milliseconds (2000);  -- arbitrary
      Next_Release : Time := Clock;
   begin
      loop
         Toggle (Blue);
         Next_Release := Next_Release + Period;
         delay until Next_Release;
      end loop;
   end tache_2;

   task body tache_3 is
      Period       : constant Time_Span := Milliseconds (3000);  -- arbitrary
      Next_Release : Time := Clock;
   begin
      loop
         Toggle (Red);
         Next_Release := Next_Release + Period;
         delay until Next_Release;
      end loop;
   end tache_3;

   task body tache_4 is
      Period       : constant Time_Span := Milliseconds (4000);  -- arbitrary
      Next_Release : Time := Clock;
   begin
      loop
         Toggle (Orange);
         Next_Release := Next_Release + Period;
         delay until Next_Release;
      end loop;
   end tache_4;

end The_Task;
