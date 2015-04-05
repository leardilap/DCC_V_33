// -------------------------------------------------------------
//
// Module: FIR_HAM_V_33
//
// Generated by MATLAB(R) 7.6 and the Filter Design HDL Coder 2.2.
//
// Generated on: 2015-04-05 04:31:22
//
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Code Generation Options:
//
// OptimizeForHDL: on
// TargetDirectory: D:\Dropbox\HS-KA\STM2\ProjectA\Code\DCC_V_33\matlab
// Name: FIR_HAM_V_33
// ResetAssertedLevel: Active-low
// SafeZeroConcat: off
// TargetLanguage: Verilog
// TestBenchName: FIR_HAM_V_33_TB
// TestBenchStimulus: chirp impulse noise ramp step 
// LoopUnrolling: on
// InlineConfigurations: off
//
// Filter Settings:
//
// Discrete-Time FIR Filter (real)
// -------------------------------
// Filter Structure  : Direct-Form FIR
// Filter Length     : 33
// Stable            : Yes
// Linear Phase      : Yes (Type 1)
// Arithmetic        : fixed
// Numerator         : s16,14 -> [-2 2)
// Input             : s16,14 -> [-2 2)
// Filter Internals  : Full Precision
//   Output          : s35,28 -> [-64 64)  (auto determined)
//   Product         : s31,28 -> [-4 4)  (auto determined)
//   Accumulator     : s35,28 -> [-64 64)  (auto determined)
//   Round Mode      : No rounding
//   Overflow Mode   : No overflow
// -------------------------------------------------------------
`timescale 1 ns / 1 ns

module FIR_HAM_V_33
               (
                clk,
                clk_enable,
                reset,
                filter_in,
                filter_out_35,
				filter_out_14,
                );

  input   clk; 
  input   clk_enable; 
  input   reset; 
  input   signed [13:0] filter_in; //sfix16_En14 // LA: input from 16 to 14 bits
  output  signed [34:0] filter_out_35; //sfix35_En28
  output  signed [13:0] filter_out_14; // LA: scaled

////////////////////////////////////////////////////////////////
//Module Architecture: FIR_HAM_V_33
////////////////////////////////////////////////////////////////
  // Local Functions
  // Type Definitions
  // Constants
  parameter signed [15:0] coeff1 = 16'b0000010010010110; //sfix16_En14
  parameter signed [15:0] coeff2 = 16'b0000010100101001; //sfix16_En14
  parameter signed [15:0] coeff3 = 16'b0000011011000101; //sfix16_En14
  parameter signed [15:0] coeff4 = 16'b0000100101100001; //sfix16_En14
  parameter signed [15:0] coeff5 = 16'b0000110011101101; //sfix16_En14
  parameter signed [15:0] coeff6 = 16'b0001000101001010; //sfix16_En14
  parameter signed [15:0] coeff7 = 16'b0001011001010011; //sfix16_En14
  parameter signed [15:0] coeff8 = 16'b0001101111011000; //sfix16_En14
  parameter signed [15:0] coeff9 = 16'b0010000110100011; //sfix16_En14
  parameter signed [15:0] coeff10 = 16'b0010011101111010; //sfix16_En14
  parameter signed [15:0] coeff11 = 16'b0010110100100010; //sfix16_En14
  parameter signed [15:0] coeff12 = 16'b0011001001100010; //sfix16_En14
  parameter signed [15:0] coeff13 = 16'b0011011100000001; //sfix16_En14
  parameter signed [15:0] coeff14 = 16'b0011101011010001; //sfix16_En14
  parameter signed [15:0] coeff15 = 16'b0011110110101000; //sfix16_En14
  parameter signed [15:0] coeff16 = 16'b0011111101101000; //sfix16_En14
  parameter signed [15:0] coeff17 = 16'b0100000000000000; //sfix16_En14
  parameter signed [15:0] coeff18 = 16'b0011111101101000; //sfix16_En14
  parameter signed [15:0] coeff19 = 16'b0011110110101000; //sfix16_En14
  parameter signed [15:0] coeff20 = 16'b0011101011010001; //sfix16_En14
  parameter signed [15:0] coeff21 = 16'b0011011100000001; //sfix16_En14
  parameter signed [15:0] coeff22 = 16'b0011001001100010; //sfix16_En14
  parameter signed [15:0] coeff23 = 16'b0010110100100010; //sfix16_En14
  parameter signed [15:0] coeff24 = 16'b0010011101111010; //sfix16_En14
  parameter signed [15:0] coeff25 = 16'b0010000110100011; //sfix16_En14
  parameter signed [15:0] coeff26 = 16'b0001101111011000; //sfix16_En14
  parameter signed [15:0] coeff27 = 16'b0001011001010011; //sfix16_En14
  parameter signed [15:0] coeff28 = 16'b0001000101001010; //sfix16_En14
  parameter signed [15:0] coeff29 = 16'b0000110011101101; //sfix16_En14
  parameter signed [15:0] coeff30 = 16'b0000100101100001; //sfix16_En14
  parameter signed [15:0] coeff31 = 16'b0000011011000101; //sfix16_En14
  parameter signed [15:0] coeff32 = 16'b0000010100101001; //sfix16_En14
  parameter signed [15:0] coeff33 = 16'b0000010010010110; //sfix16_En14

  // Signals
  reg  signed [15:0] delay_pipeline [0:32] ; // sfix16_En14
  wire signed [30:0] product33; // sfix31_En28
  wire signed [31:0] mul_temp; // sfix32_En28
  wire signed [30:0] product32; // sfix31_En28
  wire signed [31:0] mul_temp_1; // sfix32_En28
  wire signed [30:0] product31; // sfix31_En28
  wire signed [31:0] mul_temp_2; // sfix32_En28
  wire signed [30:0] product30; // sfix31_En28
  wire signed [31:0] mul_temp_3; // sfix32_En28
  wire signed [30:0] product29; // sfix31_En28
  wire signed [31:0] mul_temp_4; // sfix32_En28
  wire signed [30:0] product28; // sfix31_En28
  wire signed [31:0] mul_temp_5; // sfix32_En28
  wire signed [30:0] product27; // sfix31_En28
  wire signed [31:0] mul_temp_6; // sfix32_En28
  wire signed [30:0] product26; // sfix31_En28
  wire signed [31:0] mul_temp_7; // sfix32_En28
  wire signed [30:0] product25; // sfix31_En28
  wire signed [31:0] mul_temp_8; // sfix32_En28
  wire signed [30:0] product24; // sfix31_En28
  wire signed [31:0] mul_temp_9; // sfix32_En28
  wire signed [30:0] product23; // sfix31_En28
  wire signed [31:0] mul_temp_10; // sfix32_En28
  wire signed [30:0] product22; // sfix31_En28
  wire signed [31:0] mul_temp_11; // sfix32_En28
  wire signed [30:0] product21; // sfix31_En28
  wire signed [31:0] mul_temp_12; // sfix32_En28
  wire signed [30:0] product20; // sfix31_En28
  wire signed [31:0] mul_temp_13; // sfix32_En28
  wire signed [30:0] product19; // sfix31_En28
  wire signed [31:0] mul_temp_14; // sfix32_En28
  wire signed [30:0] product18; // sfix31_En28
  wire signed [31:0] mul_temp_15; // sfix32_En28
  wire signed [30:0] product16; // sfix31_En28
  wire signed [31:0] mul_temp_16; // sfix32_En28
  wire signed [30:0] product15; // sfix31_En28
  wire signed [31:0] mul_temp_17; // sfix32_En28
  wire signed [30:0] product14; // sfix31_En28
  wire signed [31:0] mul_temp_18; // sfix32_En28
  wire signed [30:0] product13; // sfix31_En28
  wire signed [31:0] mul_temp_19; // sfix32_En28
  wire signed [30:0] product12; // sfix31_En28
  wire signed [31:0] mul_temp_20; // sfix32_En28
  wire signed [30:0] product11; // sfix31_En28
  wire signed [31:0] mul_temp_21; // sfix32_En28
  wire signed [30:0] product10; // sfix31_En28
  wire signed [31:0] mul_temp_22; // sfix32_En28
  wire signed [30:0] product9; // sfix31_En28
  wire signed [31:0] mul_temp_23; // sfix32_En28
  wire signed [30:0] product8; // sfix31_En28
  wire signed [31:0] mul_temp_24; // sfix32_En28
  wire signed [30:0] product7; // sfix31_En28
  wire signed [31:0] mul_temp_25; // sfix32_En28
  wire signed [30:0] product6; // sfix31_En28
  wire signed [31:0] mul_temp_26; // sfix32_En28
  wire signed [30:0] product5; // sfix31_En28
  wire signed [31:0] mul_temp_27; // sfix32_En28
  wire signed [30:0] product4; // sfix31_En28
  wire signed [31:0] mul_temp_28; // sfix32_En28
  wire signed [30:0] product3; // sfix31_En28
  wire signed [31:0] mul_temp_29; // sfix32_En28
  wire signed [30:0] product2; // sfix31_En28
  wire signed [31:0] mul_temp_30; // sfix32_En28
  wire signed [30:0] product1; // sfix31_En28
  wire signed [31:0] mul_temp_31; // sfix32_En28
  wire signed [34:0] sum1; // sfix35_En28
  wire signed [30:0] add_signext; // sfix31_En28
  wire signed [30:0] add_signext_1; // sfix31_En28
  wire signed [31:0] add_temp; // sfix32_En28
  wire signed [34:0] sum2; // sfix35_En28
  wire signed [34:0] add_signext_2; // sfix35_En28
  wire signed [34:0] add_signext_3; // sfix35_En28
  wire signed [35:0] add_temp_1; // sfix36_En28
  wire signed [34:0] sum3; // sfix35_En28
  wire signed [34:0] add_signext_4; // sfix35_En28
  wire signed [34:0] add_signext_5; // sfix35_En28
  wire signed [35:0] add_temp_2; // sfix36_En28
  wire signed [34:0] sum4; // sfix35_En28
  wire signed [34:0] add_signext_6; // sfix35_En28
  wire signed [34:0] add_signext_7; // sfix35_En28
  wire signed [35:0] add_temp_3; // sfix36_En28
  wire signed [34:0] sum5; // sfix35_En28
  wire signed [34:0] add_signext_8; // sfix35_En28
  wire signed [34:0] add_signext_9; // sfix35_En28
  wire signed [35:0] add_temp_4; // sfix36_En28
  wire signed [34:0] sum6; // sfix35_En28
  wire signed [34:0] add_signext_10; // sfix35_En28
  wire signed [34:0] add_signext_11; // sfix35_En28
  wire signed [35:0] add_temp_5; // sfix36_En28
  wire signed [34:0] sum7; // sfix35_En28
  wire signed [34:0] add_signext_12; // sfix35_En28
  wire signed [34:0] add_signext_13; // sfix35_En28
  wire signed [35:0] add_temp_6; // sfix36_En28
  wire signed [34:0] sum8; // sfix35_En28
  wire signed [34:0] add_signext_14; // sfix35_En28
  wire signed [34:0] add_signext_15; // sfix35_En28
  wire signed [35:0] add_temp_7; // sfix36_En28
  wire signed [34:0] sum9; // sfix35_En28
  wire signed [34:0] add_signext_16; // sfix35_En28
  wire signed [34:0] add_signext_17; // sfix35_En28
  wire signed [35:0] add_temp_8; // sfix36_En28
  wire signed [34:0] sum10; // sfix35_En28
  wire signed [34:0] add_signext_18; // sfix35_En28
  wire signed [34:0] add_signext_19; // sfix35_En28
  wire signed [35:0] add_temp_9; // sfix36_En28
  wire signed [34:0] sum11; // sfix35_En28
  wire signed [34:0] add_signext_20; // sfix35_En28
  wire signed [34:0] add_signext_21; // sfix35_En28
  wire signed [35:0] add_temp_10; // sfix36_En28
  wire signed [34:0] sum12; // sfix35_En28
  wire signed [34:0] add_signext_22; // sfix35_En28
  wire signed [34:0] add_signext_23; // sfix35_En28
  wire signed [35:0] add_temp_11; // sfix36_En28
  wire signed [34:0] sum13; // sfix35_En28
  wire signed [34:0] add_signext_24; // sfix35_En28
  wire signed [34:0] add_signext_25; // sfix35_En28
  wire signed [35:0] add_temp_12; // sfix36_En28
  wire signed [34:0] sum14; // sfix35_En28
  wire signed [34:0] add_signext_26; // sfix35_En28
  wire signed [34:0] add_signext_27; // sfix35_En28
  wire signed [35:0] add_temp_13; // sfix36_En28
  wire signed [34:0] sum15; // sfix35_En28
  wire signed [34:0] add_signext_28; // sfix35_En28
  wire signed [34:0] add_signext_29; // sfix35_En28
  wire signed [35:0] add_temp_14; // sfix36_En28
  wire signed [34:0] sum16; // sfix35_En28
  wire signed [34:0] add_signext_30; // sfix35_En28
  wire signed [34:0] add_signext_31; // sfix35_En28
  wire signed [35:0] add_temp_15; // sfix36_En28
  wire signed [34:0] sum17; // sfix35_En28
  wire signed [34:0] add_signext_32; // sfix35_En28
  wire signed [34:0] add_signext_33; // sfix35_En28
  wire signed [35:0] add_temp_16; // sfix36_En28
  wire signed [34:0] sum18; // sfix35_En28
  wire signed [34:0] add_signext_34; // sfix35_En28
  wire signed [34:0] add_signext_35; // sfix35_En28
  wire signed [35:0] add_temp_17; // sfix36_En28
  wire signed [34:0] sum19; // sfix35_En28
  wire signed [34:0] add_signext_36; // sfix35_En28
  wire signed [34:0] add_signext_37; // sfix35_En28
  wire signed [35:0] add_temp_18; // sfix36_En28
  wire signed [34:0] sum20; // sfix35_En28
  wire signed [34:0] add_signext_38; // sfix35_En28
  wire signed [34:0] add_signext_39; // sfix35_En28
  wire signed [35:0] add_temp_19; // sfix36_En28
  wire signed [34:0] sum21; // sfix35_En28
  wire signed [34:0] add_signext_40; // sfix35_En28
  wire signed [34:0] add_signext_41; // sfix35_En28
  wire signed [35:0] add_temp_20; // sfix36_En28
  wire signed [34:0] sum22; // sfix35_En28
  wire signed [34:0] add_signext_42; // sfix35_En28
  wire signed [34:0] add_signext_43; // sfix35_En28
  wire signed [35:0] add_temp_21; // sfix36_En28
  wire signed [34:0] sum23; // sfix35_En28
  wire signed [34:0] add_signext_44; // sfix35_En28
  wire signed [34:0] add_signext_45; // sfix35_En28
  wire signed [35:0] add_temp_22; // sfix36_En28
  wire signed [34:0] sum24; // sfix35_En28
  wire signed [34:0] add_signext_46; // sfix35_En28
  wire signed [34:0] add_signext_47; // sfix35_En28
  wire signed [35:0] add_temp_23; // sfix36_En28
  wire signed [34:0] sum25; // sfix35_En28
  wire signed [34:0] add_signext_48; // sfix35_En28
  wire signed [34:0] add_signext_49; // sfix35_En28
  wire signed [35:0] add_temp_24; // sfix36_En28
  wire signed [34:0] sum26; // sfix35_En28
  wire signed [34:0] add_signext_50; // sfix35_En28
  wire signed [34:0] add_signext_51; // sfix35_En28
  wire signed [35:0] add_temp_25; // sfix36_En28
  wire signed [34:0] sum27; // sfix35_En28
  wire signed [34:0] add_signext_52; // sfix35_En28
  wire signed [34:0] add_signext_53; // sfix35_En28
  wire signed [35:0] add_temp_26; // sfix36_En28
  wire signed [34:0] sum28; // sfix35_En28
  wire signed [34:0] add_signext_54; // sfix35_En28
  wire signed [34:0] add_signext_55; // sfix35_En28
  wire signed [35:0] add_temp_27; // sfix36_En28
  wire signed [34:0] sum29; // sfix35_En28
  wire signed [34:0] add_signext_56; // sfix35_En28
  wire signed [34:0] add_signext_57; // sfix35_En28
  wire signed [35:0] add_temp_28; // sfix36_En28
  wire signed [34:0] sum30; // sfix35_En28
  wire signed [34:0] add_signext_58; // sfix35_En28
  wire signed [34:0] add_signext_59; // sfix35_En28
  wire signed [35:0] add_temp_29; // sfix36_En28
  wire signed [34:0] sum31; // sfix35_En28
  wire signed [34:0] add_signext_60; // sfix35_En28
  wire signed [34:0] add_signext_61; // sfix35_En28
  wire signed [35:0] add_temp_30; // sfix36_En28
  wire signed [34:0] sum32; // sfix35_En28
  wire signed [34:0] add_signext_62; // sfix35_En28
  wire signed [34:0] add_signext_63; // sfix35_En28
  wire signed [35:0] add_temp_31; // sfix36_En28
  reg  signed [34:0] output_register; // sfix35_En28
  reg  signed [34:0] output_register_35; // LA: scaled output 35 bits
  reg  signed [13:0] output_register_14; // LA: scaled output 14 bits

  // Block Statements
  always @( posedge clk or negedge reset)
    begin: Delay_Pipeline_process
      if (reset == 1'b0) begin
        delay_pipeline[0] <= 0;
        delay_pipeline[1] <= 0;
        delay_pipeline[2] <= 0;
        delay_pipeline[3] <= 0;
        delay_pipeline[4] <= 0;
        delay_pipeline[5] <= 0;
        delay_pipeline[6] <= 0;
        delay_pipeline[7] <= 0;
        delay_pipeline[8] <= 0;
        delay_pipeline[9] <= 0;
        delay_pipeline[10] <= 0;
        delay_pipeline[11] <= 0;
        delay_pipeline[12] <= 0;
        delay_pipeline[13] <= 0;
        delay_pipeline[14] <= 0;
        delay_pipeline[15] <= 0;
        delay_pipeline[16] <= 0;
        delay_pipeline[17] <= 0;
        delay_pipeline[18] <= 0;
        delay_pipeline[19] <= 0;
        delay_pipeline[20] <= 0;
        delay_pipeline[21] <= 0;
        delay_pipeline[22] <= 0;
        delay_pipeline[23] <= 0;
        delay_pipeline[24] <= 0;
        delay_pipeline[25] <= 0;
        delay_pipeline[26] <= 0;
        delay_pipeline[27] <= 0;
        delay_pipeline[28] <= 0;
        delay_pipeline[29] <= 0;
        delay_pipeline[30] <= 0;
        delay_pipeline[31] <= 0;
        delay_pipeline[32] <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
		  // LA: input is only 14 bits - padding with signed bit
          delay_pipeline[0] <= {{3{filter_in[13]}},filter_in[12:0]}; 
          delay_pipeline[1] <= delay_pipeline[0];
          delay_pipeline[2] <= delay_pipeline[1];
          delay_pipeline[3] <= delay_pipeline[2];
          delay_pipeline[4] <= delay_pipeline[3];
          delay_pipeline[5] <= delay_pipeline[4];
          delay_pipeline[6] <= delay_pipeline[5];
          delay_pipeline[7] <= delay_pipeline[6];
          delay_pipeline[8] <= delay_pipeline[7];
          delay_pipeline[9] <= delay_pipeline[8];
          delay_pipeline[10] <= delay_pipeline[9];
          delay_pipeline[11] <= delay_pipeline[10];
          delay_pipeline[12] <= delay_pipeline[11];
          delay_pipeline[13] <= delay_pipeline[12];
          delay_pipeline[14] <= delay_pipeline[13];
          delay_pipeline[15] <= delay_pipeline[14];
          delay_pipeline[16] <= delay_pipeline[15];
          delay_pipeline[17] <= delay_pipeline[16];
          delay_pipeline[18] <= delay_pipeline[17];
          delay_pipeline[19] <= delay_pipeline[18];
          delay_pipeline[20] <= delay_pipeline[19];
          delay_pipeline[21] <= delay_pipeline[20];
          delay_pipeline[22] <= delay_pipeline[21];
          delay_pipeline[23] <= delay_pipeline[22];
          delay_pipeline[24] <= delay_pipeline[23];
          delay_pipeline[25] <= delay_pipeline[24];
          delay_pipeline[26] <= delay_pipeline[25];
          delay_pipeline[27] <= delay_pipeline[26];
          delay_pipeline[28] <= delay_pipeline[27];
          delay_pipeline[29] <= delay_pipeline[28];
          delay_pipeline[30] <= delay_pipeline[29];
          delay_pipeline[31] <= delay_pipeline[30];
          delay_pipeline[32] <= delay_pipeline[31];
        end
      end
    end // Delay_Pipeline_process


  assign mul_temp = delay_pipeline[32] * coeff33;
  assign product33 = mul_temp[30:0];

  assign mul_temp_1 = delay_pipeline[31] * coeff32;
  assign product32 = mul_temp_1[30:0];

  assign mul_temp_2 = delay_pipeline[30] * coeff31;
  assign product31 = mul_temp_2[30:0];

  assign mul_temp_3 = delay_pipeline[29] * coeff30;
  assign product30 = mul_temp_3[30:0];

  assign mul_temp_4 = delay_pipeline[28] * coeff29;
  assign product29 = mul_temp_4[30:0];

  assign mul_temp_5 = delay_pipeline[27] * coeff28;
  assign product28 = mul_temp_5[30:0];

  assign mul_temp_6 = delay_pipeline[26] * coeff27;
  assign product27 = mul_temp_6[30:0];

  assign mul_temp_7 = delay_pipeline[25] * coeff26;
  assign product26 = mul_temp_7[30:0];

  assign mul_temp_8 = delay_pipeline[24] * coeff25;
  assign product25 = mul_temp_8[30:0];

  assign mul_temp_9 = delay_pipeline[23] * coeff24;
  assign product24 = mul_temp_9[30:0];

  assign mul_temp_10 = delay_pipeline[22] * coeff23;
  assign product23 = mul_temp_10[30:0];

  assign mul_temp_11 = delay_pipeline[21] * coeff22;
  assign product22 = mul_temp_11[30:0];

  assign mul_temp_12 = delay_pipeline[20] * coeff21;
  assign product21 = mul_temp_12[30:0];

  assign mul_temp_13 = delay_pipeline[19] * coeff20;
  assign product20 = mul_temp_13[30:0];

  assign mul_temp_14 = delay_pipeline[18] * coeff19;
  assign product19 = mul_temp_14[30:0];

  assign mul_temp_15 = delay_pipeline[17] * coeff18;
  assign product18 = mul_temp_15[30:0];

  assign mul_temp_16 = delay_pipeline[15] * coeff16;
  assign product16 = mul_temp_16[30:0];

  assign mul_temp_17 = delay_pipeline[14] * coeff15;
  assign product15 = mul_temp_17[30:0];

  assign mul_temp_18 = delay_pipeline[13] * coeff14;
  assign product14 = mul_temp_18[30:0];

  assign mul_temp_19 = delay_pipeline[12] * coeff13;
  assign product13 = mul_temp_19[30:0];

  assign mul_temp_20 = delay_pipeline[11] * coeff12;
  assign product12 = mul_temp_20[30:0];

  assign mul_temp_21 = delay_pipeline[10] * coeff11;
  assign product11 = mul_temp_21[30:0];

  assign mul_temp_22 = delay_pipeline[9] * coeff10;
  assign product10 = mul_temp_22[30:0];

  assign mul_temp_23 = delay_pipeline[8] * coeff9;
  assign product9 = mul_temp_23[30:0];

  assign mul_temp_24 = delay_pipeline[7] * coeff8;
  assign product8 = mul_temp_24[30:0];

  assign mul_temp_25 = delay_pipeline[6] * coeff7;
  assign product7 = mul_temp_25[30:0];

  assign mul_temp_26 = delay_pipeline[5] * coeff6;
  assign product6 = mul_temp_26[30:0];

  assign mul_temp_27 = delay_pipeline[4] * coeff5;
  assign product5 = mul_temp_27[30:0];

  assign mul_temp_28 = delay_pipeline[3] * coeff4;
  assign product4 = mul_temp_28[30:0];

  assign mul_temp_29 = delay_pipeline[2] * coeff3;
  assign product3 = mul_temp_29[30:0];

  assign mul_temp_30 = delay_pipeline[1] * coeff2;
  assign product2 = mul_temp_30[30:0];

  assign mul_temp_31 = delay_pipeline[0] * coeff1;
  assign product1 = mul_temp_31[30:0];

  assign add_signext = product1;
  assign add_signext_1 = product2;
  assign add_temp = add_signext + add_signext_1;
  assign sum1 = $signed({{3{add_temp[31]}}, add_temp});

  assign add_signext_2 = sum1;
  assign add_signext_3 = $signed({{4{product3[30]}}, product3});
  assign add_temp_1 = add_signext_2 + add_signext_3;
  assign sum2 = add_temp_1[34:0];

  assign add_signext_4 = sum2;
  assign add_signext_5 = $signed({{4{product4[30]}}, product4});
  assign add_temp_2 = add_signext_4 + add_signext_5;
  assign sum3 = add_temp_2[34:0];

  assign add_signext_6 = sum3;
  assign add_signext_7 = $signed({{4{product5[30]}}, product5});
  assign add_temp_3 = add_signext_6 + add_signext_7;
  assign sum4 = add_temp_3[34:0];

  assign add_signext_8 = sum4;
  assign add_signext_9 = $signed({{4{product6[30]}}, product6});
  assign add_temp_4 = add_signext_8 + add_signext_9;
  assign sum5 = add_temp_4[34:0];

  assign add_signext_10 = sum5;
  assign add_signext_11 = $signed({{4{product7[30]}}, product7});
  assign add_temp_5 = add_signext_10 + add_signext_11;
  assign sum6 = add_temp_5[34:0];

  assign add_signext_12 = sum6;
  assign add_signext_13 = $signed({{4{product8[30]}}, product8});
  assign add_temp_6 = add_signext_12 + add_signext_13;
  assign sum7 = add_temp_6[34:0];

  assign add_signext_14 = sum7;
  assign add_signext_15 = $signed({{4{product9[30]}}, product9});
  assign add_temp_7 = add_signext_14 + add_signext_15;
  assign sum8 = add_temp_7[34:0];

  assign add_signext_16 = sum8;
  assign add_signext_17 = $signed({{4{product10[30]}}, product10});
  assign add_temp_8 = add_signext_16 + add_signext_17;
  assign sum9 = add_temp_8[34:0];

  assign add_signext_18 = sum9;
  assign add_signext_19 = $signed({{4{product11[30]}}, product11});
  assign add_temp_9 = add_signext_18 + add_signext_19;
  assign sum10 = add_temp_9[34:0];

  assign add_signext_20 = sum10;
  assign add_signext_21 = $signed({{4{product12[30]}}, product12});
  assign add_temp_10 = add_signext_20 + add_signext_21;
  assign sum11 = add_temp_10[34:0];

  assign add_signext_22 = sum11;
  assign add_signext_23 = $signed({{4{product13[30]}}, product13});
  assign add_temp_11 = add_signext_22 + add_signext_23;
  assign sum12 = add_temp_11[34:0];

  assign add_signext_24 = sum12;
  assign add_signext_25 = $signed({{4{product14[30]}}, product14});
  assign add_temp_12 = add_signext_24 + add_signext_25;
  assign sum13 = add_temp_12[34:0];

  assign add_signext_26 = sum13;
  assign add_signext_27 = $signed({{4{product15[30]}}, product15});
  assign add_temp_13 = add_signext_26 + add_signext_27;
  assign sum14 = add_temp_13[34:0];

  assign add_signext_28 = sum14;
  assign add_signext_29 = $signed({{4{product16[30]}}, product16});
  assign add_temp_14 = add_signext_28 + add_signext_29;
  assign sum15 = add_temp_14[34:0];

  assign add_signext_30 = sum15;
  assign add_signext_31 = $signed({delay_pipeline[16][15:0], 14'b00000000000000});
  assign add_temp_15 = add_signext_30 + add_signext_31;
  assign sum16 = add_temp_15[34:0];

  assign add_signext_32 = sum16;
  assign add_signext_33 = $signed({{4{product18[30]}}, product18});
  assign add_temp_16 = add_signext_32 + add_signext_33;
  assign sum17 = add_temp_16[34:0];

  assign add_signext_34 = sum17;
  assign add_signext_35 = $signed({{4{product19[30]}}, product19});
  assign add_temp_17 = add_signext_34 + add_signext_35;
  assign sum18 = add_temp_17[34:0];

  assign add_signext_36 = sum18;
  assign add_signext_37 = $signed({{4{product20[30]}}, product20});
  assign add_temp_18 = add_signext_36 + add_signext_37;
  assign sum19 = add_temp_18[34:0];

  assign add_signext_38 = sum19;
  assign add_signext_39 = $signed({{4{product21[30]}}, product21});
  assign add_temp_19 = add_signext_38 + add_signext_39;
  assign sum20 = add_temp_19[34:0];

  assign add_signext_40 = sum20;
  assign add_signext_41 = $signed({{4{product22[30]}}, product22});
  assign add_temp_20 = add_signext_40 + add_signext_41;
  assign sum21 = add_temp_20[34:0];

  assign add_signext_42 = sum21;
  assign add_signext_43 = $signed({{4{product23[30]}}, product23});
  assign add_temp_21 = add_signext_42 + add_signext_43;
  assign sum22 = add_temp_21[34:0];

  assign add_signext_44 = sum22;
  assign add_signext_45 = $signed({{4{product24[30]}}, product24});
  assign add_temp_22 = add_signext_44 + add_signext_45;
  assign sum23 = add_temp_22[34:0];

  assign add_signext_46 = sum23;
  assign add_signext_47 = $signed({{4{product25[30]}}, product25});
  assign add_temp_23 = add_signext_46 + add_signext_47;
  assign sum24 = add_temp_23[34:0];

  assign add_signext_48 = sum24;
  assign add_signext_49 = $signed({{4{product26[30]}}, product26});
  assign add_temp_24 = add_signext_48 + add_signext_49;
  assign sum25 = add_temp_24[34:0];

  assign add_signext_50 = sum25;
  assign add_signext_51 = $signed({{4{product27[30]}}, product27});
  assign add_temp_25 = add_signext_50 + add_signext_51;
  assign sum26 = add_temp_25[34:0];

  assign add_signext_52 = sum26;
  assign add_signext_53 = $signed({{4{product28[30]}}, product28});
  assign add_temp_26 = add_signext_52 + add_signext_53;
  assign sum27 = add_temp_26[34:0];

  assign add_signext_54 = sum27;
  assign add_signext_55 = $signed({{4{product29[30]}}, product29});
  assign add_temp_27 = add_signext_54 + add_signext_55;
  assign sum28 = add_temp_27[34:0];

  assign add_signext_56 = sum28;
  assign add_signext_57 = $signed({{4{product30[30]}}, product30});
  assign add_temp_28 = add_signext_56 + add_signext_57;
  assign sum29 = add_temp_28[34:0];

  assign add_signext_58 = sum29;
  assign add_signext_59 = $signed({{4{product31[30]}}, product31});
  assign add_temp_29 = add_signext_58 + add_signext_59;
  assign sum30 = add_temp_29[34:0];

  assign add_signext_60 = sum30;
  assign add_signext_61 = $signed({{4{product32[30]}}, product32});
  assign add_temp_30 = add_signext_60 + add_signext_61;
  assign sum31 = add_temp_30[34:0];

  assign add_signext_62 = sum31;
  assign add_signext_63 = $signed({{4{product33[30]}}, product33});
  assign add_temp_31 = add_signext_62 + add_signext_63;
  assign sum32 = add_temp_31[34:0];

  always @ (posedge clk or negedge reset)
    begin: Output_Register_process
      if (reset == 1'b0) begin
        output_register <= 0;
		output_register_35 <= 0;
		output_register_14 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          output_register <= sum32;
		  output_register_35 <= (sum32 + 8192) >>> 18;
		  output_register_14 <= output_register_35[13:0];
        end
      end
    end // Output_Register_process

  // Assignment Statements
  assign filter_out_35 = output_register;		// Complete range
  assign filter_out_14 = output_register_14;	// Scaled signal
  
endmodule  // FIR_HAM_V_33
