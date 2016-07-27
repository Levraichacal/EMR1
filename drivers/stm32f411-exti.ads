------------------------------------------------------------------------------
--                                                                          --
--                       S T M 3 2 F 4 1 1 . E X T I                        --
--                                                                          --
--                                S p e c                                   --
--                                                                          --
--  Copyright (C) 2016, Bardot Sébastien                                    --
--                                                                          --
--  More information on http://lvcetada.e-monsite.com/ or by mail on        --
--  lvcetada@gmail.com or sjp.bardot@gmail.com                              --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of STMicroelectronics nor the names of its       --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
--                                                                          --
--  This file is based on:                                                  --
--                                                                          --
--   @file    stm32f407xx.h   et al.                                        --
--   @author  MCD Application Team                                          --
--   @version V1.1.0                                                        --
--   @date    19-June-2014                                                  --
--   @brief   CMSIS STM32F407xx Device Peripheral Access Layer Header File. --
--   COPYRIGHT(c) 2014 STMicroelectronics                                   --
--                                                                          --
--  And on:                                                                 --
--                                                                          --
--   @file    stm32f4-exti.ads                                              --
--   @author  Adacore Team                                                  --
--   COPYRIGHT(c) 2015 AdaCore                                              --
------------------------------------------------------------------------------

--  This file provides register definitions for the STM32F411 (ARM Cortex   --
--  M4F) microcontrollers from ST Microelectronics. It can be used on       --
--  NUCLEO-F411RE board                                                     --

package STM32F411.EXTI is

   type External_Line_Number is
     (EXTI_Line_0,
      EXTI_Line_1,
      EXTI_Line_2,
      EXTI_Line_3,
      EXTI_Line_4,
      EXTI_Line_5,
      EXTI_Line_6,
      EXTI_Line_7,
      EXTI_Line_8,
      EXTI_Line_9,
      EXTI_Line_10,
      EXTI_Line_11,
      EXTI_Line_12,
      EXTI_Line_13,
      EXTI_Line_14,
      EXTI_Line_15,
      EXTI_Line_16,
      EXTI_Line_17,
      EXTI_Line_18,
      EXTI_Line_Reserved,
      EXTI_Line_Reserved,
      EXTI_Line_21,
      EXTI_Line_22);

   type External_Triggers is
     (Interrupt_Rising_Edge,
      Interrupt_Falling_Edge,
      Interrupt_Rising_Falling_Edge,
      Event_Rising_Edge,
      Event_Falling_Edge,
      Event_Rising_Falling_Edge);

   subtype Interrupt_Triggers is External_Triggers
      range Interrupt_Rising_Edge .. Interrupt_Rising_Falling_Edge;

   subtype Event_Triggers is External_Triggers
      range Event_Rising_Edge .. Event_Rising_Falling_Edge;

   procedure Enable_External_Interrupt
     (Line    : External_Line_Number;
      Trigger : Interrupt_Triggers)
     with Inline;

   procedure Disable_External_Interrupt (Line : External_Line_Number)
     with Inline;

   procedure Enable_External_Event
     (Line    : External_Line_Number;
      Trigger : Event_Triggers)
     with Inline;

   procedure Disable_External_Event (Line : External_Line_Number)
     with Inline;


   procedure Generate_SWI (Line : External_Line_Number)
     with Inline;

   function External_Interrupt_Pending (Line : External_Line_Number)
     return Boolean
     with Inline;

   procedure Clear_External_Interrupt (Line : External_Line_Number)
     with Inline;

private

   subtype Index32 is Integer range 0 .. 31;
   type Boolean32 is array (Index32) of Boolean;
   for Boolean32'Component_Size use 1;

   type EXTI_Registers is record
      IMR   : Boolean32;   -- Interrupt Mask Register
      EMR   : Boolean32;   -- Event Mask Register
      RTSR  : Boolean32;   -- Rising Trigger Selection Register
      FTSR  : Boolean32;   -- Falling Trigger Selection Register
      SWIER : Bits_32x1;   -- Software Interrupt Event Register
      PR    : Bits_32x1;   -- Pending Register
   end record
     with Volatile;

   for EXTI_Registers use record
      IMR   at 0  range 0 .. 31;
      EMR   at 4  range 0 .. 31;
      RTSR  at 8  range 0 .. 31;
      FTSR  at 12 range 0 .. 31;
      SWIER at 16 range 0 .. 31;
      PR    at 20 range 0 .. 31;
   end record;

   EXTI : EXTI_Registers with
     Volatile,
     Address => EXTI_Base;
   pragma Import (Ada, EXTI);

end STM32F411.EXTI;
