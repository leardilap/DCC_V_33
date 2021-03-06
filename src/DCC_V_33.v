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
//   DE2i-150 Development Board + DCC(AD/DA Data Conversion Card)
//
//   user interface define
//     LEDG :
//        LEDG[0] 	  --> PLL locked indicator.					Light = Locked.
//        LEDG[1] 	  --> ADC DFS(Data Format Select) indicator.
//        LEDG[2] 	  --> ADC DCS(Duty Cycle Stabilizer Select) indicator.
//        LEDG[3] 	  --> ADC Out-of-Range indicator.			Light = Out-of-Range.
//        LEDG[4] 	  --> Not use
//        LEDG[5] 	  --> Not use
//        LEDG[6] 	  --> Not use
//        LEDG[7] 	  --> Heartbeat.
//      SW : 
//        SW[0] --> ADC DFS(Data Format Select)
//        SW[1] --> ADC DCS(Duty Cycle Stabilizer Select)
//        SW[2] --> Internal Signals or ADC A data Signed
//		  SW[3] --> DAC A: FIR_OUT or FIR_IN
//		  SW[4] --> DAC B: FIR_OUT or FIR_LMS_OUT
//      KEY : 
//        KEY[0]   --> Not use
//        KEY[1]   --> Not use
//        KEY[2]   --> Not use
//        KEY[3]   --> Reset
//
// ============================================================================
// Revision History:
// ============================================================================
//   Ver.: |Author:   		|Mod. Date:    |Changes Made:
//   V0.1  |Luis Ardila  	|04/04/15      |
// ============================================================================

//`default_nettype none

module DCC_V_33(

	//////// CLOCK //////////
	OSC_50,

	//////// LED //////////
	LEDG,
	LEDR,

	//////// KEY //////////
	KEY,

	//////// SW //////////
	SW,

	//////// HSMC //////////
	AD_SCLK,
	AD_SDIO,
	ADA_D,
	ADA_DCO,
	ADA_OE,
	ADA_OR,
	ADA_SPI_CS,
	ADB_D,
	ADB_DCO,
	ADB_OE,
	ADB_OR,
	ADB_SPI_CS,
	AIC_BCLK,
	AIC_DIN,
	AIC_DOUT,
	AIC_LRCIN,
	AIC_LRCOUT,
	AIC_SPI_CS,
	AIC_XCLK,
	CLKIN1,
	CLKOUT0,
	DA,
	DB,
	FPGA_CLK_A_N,
	FPGA_CLK_A_P,
	FPGA_CLK_B_N,
	FPGA_CLK_B_P,
	J1_152,
	XT_IN_N,
	XT_IN_P 
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input		   [2:0]			OSC_50;

//////////// LED //////////
output		[8:0]			LEDG;
output		[17:0]		LEDR;

//////////// KEY //////////
input		  	[3:0]			KEY;


//////////// SW //////////
input		   [17:0]		SW;

//////////// HSMC //////////
inout		          		AD_SCLK;
inout		          		AD_SDIO;
input		   [13:0]		ADA_D;
input		          		ADA_DCO;
output		       		ADA_OE;
input		          		ADA_OR;
output		        		ADA_SPI_CS;
input		   [13:0]		ADB_D;
input		          		ADB_DCO;
output		        		ADB_OE;
input		          		ADB_OR;
output		        		ADB_SPI_CS;
inout		          		AIC_BCLK;
output		        		AIC_DIN;
input		          		AIC_DOUT;
inout		          		AIC_LRCIN;
inout		          		AIC_LRCOUT;
output		        		AIC_SPI_CS;
output		        		AIC_XCLK;
input		          		CLKIN1;
output		        		CLKOUT0;
output		[13:0]		DA;
output		[13:0]		DB;
output	          		FPGA_CLK_A_N;
output	          		FPGA_CLK_A_P;
output	          		FPGA_CLK_B_N;
output	          		FPGA_CLK_B_P;
inout		          		J1_152;
input		          		XT_IN_N;
input		          		XT_IN_P;


//=======================================================
//  REG/WIRE declarations
//=======================================================
wire							reset_n;
wire							sys_clk;
wire							sys_clk_90deg;
wire							sys_clk_180deg;
wire							sys_clk_270deg;
wire							pll_locked;

reg		[12:0]			i_sine1;
reg		[12:0]			i_sine10;
reg		[12:0]			is_sine1;
reg		[12:0]			is_sine10;
reg		[12:0]			iu_sine1;
reg		[12:0]			iu_sine10;

wire		[13:0]			o_sine;
wire		[13:0]			os_sine;
reg		[13:0]			o_sine_p;
reg		[13:0]			o_sine_n;

reg		[13:0]			per_a2da_d;
reg		[13:0]			per_a2db_d;
reg		[13:0]			a2da_data;
reg		[13:0]			a2db_data;

reg		[31:0]			count;

reg		[5:0]				cnt1;
reg 							dir1;

reg		[1:0]				cnt10;
reg 							dir10;

wire		[13:0]			fir_in_data;
wire		[13:0]			fir_lms_in_data;
wire		[34:0]			fir_data_35;
wire		[13:0]			fir_data_14;
reg			[13:0]			u_fir_data_14;

reg			[13:0]			u_fir_in_data;

wire		[13:0]			fir_lms_out_14;
reg			[13:0]			u_fir_lms_out_14;

wire		[13:0]			fir_lms_e_14;
reg			[13:0]			u_fir_lms_e_14;
//=======================================================
//  Structural coding
//=======================================================
// initial //
//

//--- global signal assign
assign	reset_n			= KEY[3];

assign	FPGA_CLK_A_P	=  sys_clk_180deg;
assign	FPGA_CLK_A_N	= ~sys_clk_180deg;
assign	FPGA_CLK_B_P	=  sys_clk_270deg;
assign	FPGA_CLK_B_N	= ~sys_clk_270deg;

assign	LEDG[0]			= pll_locked;		// pll locked
assign	LEDG[1]			= SW[0];			// (DFS)Data Format Select indicator
assign	LEDG[2]			= SW[1];			// (DCS)Duty Cycle Stabilizer Select indicator
assign	LEDG[3]			= ADA_OR; 			// Out-of-Range indicator
assign	LEDG[4]			= ~KEY[0];			// reset 1MHz NCO output indicator
assign	LEDG[5]			= ~KEY[1];			// reset 10MHz NCO output indicator
assign	LEDG[6]			= SW[2];			// Internal Signals or ADC A data Signed
assign	LEDG[7]			= count[24];		// heartbeat

 // assign for ADC control signal
assign	AD_SCLK			= SW[0];			// (DFS)Data Format Select
assign	AD_SDIO			= SW[1];			// (DCS)Duty Cycle Stabilizer Select
assign	ADA_OE			= 1'b0;				// enable ADA output
assign	ADA_SPI_CS		= 1'b1;				// disable ADA_SPI_CS (CSB)
assign	ADB_OE			= 1'b0;				// enable ADB output
assign	ADB_SPI_CS		= 1'b1;				// disable ADB_SPI_CS (CSB)

 // assign for DAC output data
assign	DA = !SW[3] ? u_fir_data_14 : u_fir_in_data;				// FIR OUT or FIR IN
assign	DB = !SW[4] ? u_fir_data_14 : u_fir_lms_out_14 ;	// FIR or FIR_LMS filter output

//=======================================================
//--- PLL
//=======================================================
pll		pll_inst(
			.inclk0(OSC_50[0]),
			.c0(sys_clk),
			.c1(sys_clk_90deg),
			.c2(sys_clk_180deg),
			.c3(sys_clk_270deg),
			.locked(pll_locked)
			);
//=======================================================
//--- triangular function 781.25 kHz
//=======================================================
always @(negedge reset_n or posedge sys_clk)
begin
	if (!reset_n) begin
		cnt1	<= 0;
		i_sine1 <= -13'd3960;
		dir1 <= 0;
	end
	else begin
		cnt1 <= cnt1 + 1'b1;
		if (cnt1 == 0) begin
			dir1 <= ~dir1;
		end 
		if (dir1 == 1'b1) begin
			i_sine1	<= i_sine1 + 13'd127;
		end
		else begin 
			i_sine1	<= i_sine1 - 13'd127;
		end 
	end
end

//=======================================================
//--- triangular function 12.5 MHz
//=======================================================
always @(negedge reset_n or posedge sys_clk)
begin
	if (!reset_n) begin
		cnt10	<= 0;
		i_sine10 <= -13'd500;
		dir10 <= 0;
	end
	else begin
		cnt10 <= cnt10 + 1'b1;
		if (cnt10 == 0) begin
			dir10 <= ~dir10;
		end 
		if (dir10 == 1'b1) begin
			i_sine10	<= i_sine10 + 13'd500;
		end
		else begin 
			i_sine10	<= i_sine10 - 13'd500;
		end
	end
end

//=======================================================
//--- Creating unsigned signals
//=======================================================
always @(negedge reset_n or posedge sys_clk)
begin
	if (!reset_n) begin
		is_sine1	<= 13'd0;
		is_sine10	<= 13'd0;
		iu_sine1	<= 13'd0;
		iu_sine10	<= 13'd0;
	end
	else begin
		is_sine1	<= i_sine1;
		is_sine10	<= i_sine10;
		iu_sine1	<= {~is_sine1[12],is_sine1[11:0]};
		iu_sine10	<= {~is_sine10[12],is_sine10[11:0]};
	end
end

//=======================================================
//--- Sum of the two signals
//=======================================================

//--- Unsigned test to send to DACs
add		add_inst(
			.dataa({1'b1,iu_sine1}),
			.datab({1'b1,iu_sine10}),
			.result(o_sine)
			);

//--- Signed addition for internal test
add		add_S_inst(
			.dataa({is_sine1[12],is_sine1}),
			.datab({is_sine10[12],is_sine10}),
			.result(os_sine)
			);

always @(negedge reset_n or posedge sys_clk)
begin
	if (!reset_n) begin
		o_sine_p	<= 14'd0;
		o_sine_n	<= 14'd0;
	end
	else begin
		o_sine_p	<= o_sine;
		o_sine_n	<= ~o_sine_p;
	end
end

//=======================================================
//--- analog to digital converter capture and sync
//=======================================================

//--- Channel A
always @(negedge reset_n or posedge ADA_DCO)
begin
	if (!reset_n) begin
		per_a2da_d	<= 14'd0;
	end
	else begin
		per_a2da_d	<= ADA_D;
	end
end

always @(negedge reset_n or posedge sys_clk)
begin
	if (!reset_n) begin
		a2da_data	<= 14'd0;
	end
	else begin
		a2da_data	<= per_a2da_d;
	end
end

//--- Channel B
always @(negedge reset_n or posedge ADB_DCO)
begin
	if (!reset_n) begin
		per_a2db_d	<= 14'd0;
	end
	else begin
		per_a2db_d	<= ADB_D;
	end
end

always @(negedge reset_n or posedge sys_clk)
begin
	if (!reset_n) begin
		a2db_data	<= 14'd0;
	end
	else begin
		a2db_data	<= per_a2db_d;
	end
end


//=======================================================
//--- count for Heartbeat
//=======================================================

always @(negedge reset_n or posedge sys_clk)
begin
	if (!reset_n) begin
		count	<= 0;
	end
	else begin
		count	<= count + 1'b1;
	end
end

//=======================================================
//--- FIR
//=======================================================
// input to FIR and FIR_LMS signed from internal triangular signals or ADC A data SIGNED
assign	fir_in_data	= !SW[2] ? os_sine : a2da_data; 
FIR_HAM_V_33 FIR_HAM_V_33_INST(
			.clk(sys_clk),	
			.clk_enable(1'b1),
			.reset(reset_n),
			.filter_in(fir_in_data),
			.filter_in_out(fir_lms_in_data),
			.filter_out_35(fir_data_35),
			.filter_out_14(fir_data_14)
			);
			
always @(negedge reset_n or posedge sys_clk)
begin
	if (!reset_n) begin
		u_fir_in_data   <= 13'd0;
		u_fir_data_14	<= 13'd0;
	end
	else begin
		// unsigned outputs to put into the DACs
		u_fir_in_data   <= {~fir_in_data[13],fir_in_data[12:0]};
		u_fir_data_14	<= {~fir_data_14[13],fir_data_14[12:0]}; 
	end
end				
//=======================================================
//--- FIR_LMS
//=======================================================
fir_lms fir_lms_inst( 
	.clk(sys_clk),  // std_logic 
	.x_in(fir_in_data),
	.d_in(fir_data_14),
	.e_out_36(),
	.y_out_36(),
	.e_out_14(fir_lms_e_14),
	.y_out_14(fir_lms_out_14));
   
always @(negedge reset_n or posedge sys_clk)
begin
	if (!reset_n) begin
		u_fir_lms_out_14	<= 13'd0;
		u_fir_lms_e_14		<= 13'd0;
	end
	else begin
		// unsigned outputs to put into the DACs
		u_fir_lms_out_14	<= {~fir_lms_out_14[13],fir_lms_out_14[12:0]}; 
		u_fir_lms_e_14		<= {~fir_lms_e_14[13],fir_lms_e_14[12:0]}; 
	end
end	
//=======================================================	
endmodule
