// ============================================================================
// Copyright (c) 2015, Luis Ardila
// ============================================================================
//           
//                   Hochschule Karlsruhe
//                   Moltkestr. 30 
//                   Karlsruhe, Germany
//                   76133
//
//                   web: http://www.hs-karlsruhe.de/
//                   e-mail: arlu1011@hs-karlsruhe.de - leardilap@unal.edu.co
//
// ============================================================================
// Major Functions/Design Description:
//
//   Adaptative FIR_LMS filter
//
// ============================================================================
// Revision History:
// ============================================================================
//   Ver.: |Author:   		|Mod. Date:    |Changes Made:
//   V0.1  |Luis Ardila  	|05/04/15      |
// ============================================================================

module fir_lms         //----> Interface
	#(parameter W1 = 14,   // Input bit width
             W2 = 35,  // Multiplier bit width 2*W1
             L  = 33,   // Filter length 
            Delay = 0) // Pipeline steps of multiplier
	(input clk,  // 1 bit input 
	input signed [W1-1:0] x_in, d_in,  // Inputs
	output signed [W2-1:0] e_out, y_out);  // Results

	// Signed data types are supported in 2001
	// Verilog, and used whenever possible
	reg  signed [W1-1:0] x [0:L-1]; // Data array 
	reg  signed [W1-1:0] f [0:L-1]; // Coefficient array 
	reg  signed [W1-1:0] d;
	wire signed [W1-1:0] emu;
	wire signed [W2-1:0] p [0:L-1]; // 1. Product array 
	wire signed [W2-1:0] xemu [0:L-1]; // 2. Product array 
	wire signed [W2-1:0]  y, e; 
	
	wire  clken, aclr;
	wire  signed [W2-1:0] sum;  // Auxilary signals

	genvar I;
	
	initial begin
		x[0]  = 'b0;
		x[1]  = 'b0;
		x[2]  = 'b0;
		x[3]  = 'b0;
		x[4]  = 'b0;
		x[5]  = 'b0;
		x[6]  = 'b0;
		x[7]  = 'b0;
		x[8]  = 'b0;
		x[9]  = 'b0;
		x[10] = 'b0;
		x[11] = 'b0;
		x[12] = 'b0;
		x[13] = 'b0;
		x[14] = 'b0;
		x[15] = 'b0;
		x[16] = 'b0;
		x[17] = 'b0;
		x[18] = 'b0;
		x[19] = 'b0;
		x[20] = 'b0;
		x[21] = 'b0;
		x[22] = 'b0;
		x[23] = 'b0;
		x[24] = 'b0;
		x[25] = 'b0;
		x[26] = 'b0;
		x[27] = 'b0;
		x[28] = 'b0;
		x[29] = 'b0;
		x[30] = 'b0;
		x[31] = 'b0;
		x[32] = 'b0;
		
		f[0]  = 14'd70;
		f[1]  = 14'd70;
		f[2]  = 14'd70;
		f[3]  = 14'd70;
		f[4]  = 14'd70;
		f[5]  = 14'd70;
		f[6]  = 14'd70;
		f[7]  = 14'd70;
		f[8]  = 14'd70;
		f[9]  = 14'd70;
		f[10] = 14'd70;
		f[11] = 14'd70;
		f[12] = 14'd70;
		f[13] = 14'd70;
		f[14] = 14'd70;
		f[15] = 14'd70;
		f[16] = 14'd70;
		f[17] = 14'd70;
		f[18] = 14'd70;
		f[19] = 14'd70;
		f[20] = 14'd70;
		f[21] = 14'd70;
		f[22] = 14'd70;
		f[23] = 14'd70;
		f[24] = 14'd70;
		f[25] = 14'd70;
		f[26] = 14'd70;
		f[27] = 14'd70;
		f[28] = 14'd70;
		f[29] = 14'd70;
		f[30] = 14'd70;
		f[31] = 14'd70;
		f[32] = 14'd70;
		
		d = 'b0;
	end

	assign sum=0; assign aclr=0; // Default for mult
	assign clken=0;
  
	always @(posedge clk) begin: Store // Store these data or coefficients
		d <= d_in; // Store desired signal in register 
		x[0] <= x_in; // Get one data sample at a time 
		x[1] <= x[0];   // shift 1
		x[2] <= x[1];
		x[3] <= x[2];
		x[4] <= x[3];
		x[5] <= x[4];
		x[6] <= x[5];
		x[7] <= x[6];
		x[8] <= x[7];
		x[9] <= x[8];
		x[10] <= x[9];
		x[11] <= x[10];
		x[12] <= x[11];
		x[13] <= x[12];
		x[14] <= x[13];
		x[15] <= x[14];
		x[16] <= x[15];
		x[17] <= x[16];
		x[18] <= x[17];
		x[19] <= x[18];
		x[20] <= x[19];
		x[21] <= x[20];
		x[22] <= x[21];
		x[23] <= x[22];
		x[24] <= x[23];
		x[25] <= x[24];
		x[26] <= x[25];
		x[27] <= x[26];
		x[28] <= x[27];
		x[29] <= x[28];
		x[30] <= x[29];
		x[31] <= x[30];
		x[32] <= x[31];
		
		f[0] <= f[0] + xemu[0][15:8]; // implicit divide by 2
		f[1] <= f[1] + xemu[1][15:8]; 
		f[2] <= f[2] + xemu[2][15:8];
		f[3] <= f[3] + xemu[3][15:8];
		f[4] <= f[4] + xemu[4][15:8];
		f[5] <= f[5] + xemu[5][15:8];
		f[6] <= f[6] + xemu[6][15:8];
		f[7] <= f[7] + xemu[7][15:8];
		f[8] <= f[8] + xemu[8][15:8];
		f[9] <= f[9] + xemu[9][15:8];
		f[10] <= f[10] + xemu[10][15:8];
		f[11] <= f[11] + xemu[11][15:8];
		f[12] <= f[12] + xemu[12][15:8];
		f[13] <= f[13] + xemu[13][15:8];
		f[14] <= f[14] + xemu[14][15:8];
		f[15] <= f[15] + xemu[15][15:8];
		f[16] <= f[16] + xemu[16][15:8];
		f[17] <= f[17] + xemu[17][15:8];
		f[18] <= f[18] + xemu[18][15:8];
		f[19] <= f[19] + xemu[19][15:8];
		f[20] <= f[20] + xemu[20][15:8];
		f[21] <= f[21] + xemu[21][15:8];
		f[22] <= f[22] + xemu[22][15:8];
		f[23] <= f[23] + xemu[23][15:8];
		f[24] <= f[24] + xemu[24][15:8];
		f[25] <= f[25] + xemu[25][15:8];
		f[26] <= f[26] + xemu[26][15:8];
		f[27] <= f[27] + xemu[27][15:8];
		f[28] <= f[28] + xemu[28][15:8];
		f[29] <= f[29] + xemu[29][15:8];
		f[30] <= f[30] + xemu[30][15:8];
		f[31] <= f[31] + xemu[31][15:8];
		f[32] <= f[32] + xemu[32][15:8];
	end

	// Instantiate L pipelined multiplier
	
	generate
		for (I=0; I<L; I=I+1) begin: Mul_fx
			lpm_mult mul_xf             // Multiply  x[I]*f[I] = p[I]
			(.dataa(x[I]), .datab(f[I]), .result(p[I]), 
			 .clock(clk), .sum(sum),
			 .clken(clken), .aclr(aclr)); // Unused ports
			defparam mul_xf.lpm_widtha = W1;  
			defparam mul_xf.lpm_widthb = W1;
			defparam mul_xf.lpm_widthp = W2;  
			defparam mul_xf.lpm_widths = W2;
			defparam mul_xf.lpm_pipeline = Delay;
			defparam mul_xf.lpm_representation = "SIGNED";
		end // for loop
	endgenerate

	assign y =  p[0] + p[1] + p[2] + p[3] + p[4] + p[5] + p[6] + p[7] + p[8] +
				p[9] + p[10] + p[11] + p[12] + p[13] + p[14] + p[15] + p[16] + 
				p[17] +	p[18] + p[19] + p[20] + p[21] + p[22] + p[23] + p[24] + 
				p[25] + p[26] +	p[27] + p[28] + p[29] + p[30] + p[31] + p[32];	  // Compute ADF output

	// Scale y by 128 because x is fraction
	assign e = d - (y >>> 7) ;
	assign emu = e >>> 1;  // e*mu divide by 2 and 
                        // 2 from xemu makes mu=1/4

// Instantiate L pipelined multiplier
	generate
		for (I=0; I<L; I=I+1) begin: Mul_xemu
			lpm_mult mul_I          // Multiply xemu[I] = emu * x[I];
			(.dataa(x[I]), .datab(emu), .result(xemu[I]), 
			 .clock(clk), .sum(sum),
			 .clken(clken), .aclr(aclr)); // Unused ports
			defparam mul_I.lpm_widtha = W1;  
			defparam mul_I.lpm_widthb = W1;
			defparam mul_I.lpm_widthp = W2;  
			defparam mul_I.lpm_widths = W2;
			defparam mul_I.lpm_pipeline = Delay;
			defparam mul_I.lpm_representation = "SIGNED";
		end // for loop
	endgenerate

	assign  y_out  = y;    // Monitor some test signals
	assign  e_out  = e;

endmodule