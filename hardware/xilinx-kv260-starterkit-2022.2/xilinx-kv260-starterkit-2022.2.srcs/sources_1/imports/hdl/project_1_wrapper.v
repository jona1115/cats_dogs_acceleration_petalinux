//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
//Date        : Fri Oct 14 13:17:00 2022
//Host        : xcosswbld16 running 64-bit Ubuntu 18.04.5 LTS
//Command     : generate_target project_1_wrapper.bd
//Design      : project_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module project_1_wrapper
   (fan_en_b);
  output [0:0]fan_en_b;

  wire [0:0]fan_en_b;

  project_1 project_1_i
       (.fan_en_b(fan_en_b));
endmodule
