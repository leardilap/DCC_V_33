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
//   TESTBENCH
//
// ============================================================================
// Revision History:
// ============================================================================
//   Ver.: |Author:   		|Mod. Date:    |Changes Made:
//   V0.1  |Luis Ardila  	|04/04/15      |
// ============================================================================
`timescale 1 ns / 100 ps

module DCC_V_33_TB ();

//////////// CLOCK //////////
reg		   [2:0]			OSC_50;

//////////// LED //////////
wire		[8:0]			LEDG;
wire		[17:0]		LEDR;

//////////// KEY //////////
reg		  	[3:0]			KEY;


//////////// SW //////////
reg		   [17:0]		SW;

//////////// HSMC //////////
wire		          		AD_SCLK;
wire		          		AD_SDIO;
reg		   [13:0]		ADA_D;
reg		          		ADA_DCO;
wire		       		ADA_OE;
reg		          		ADA_OR;
wire		        		ADA_SPI_CS;
reg		   [13:0]		ADB_D;
reg		          		ADB_DCO;
wire		        		ADB_OE;
reg		          		ADB_OR;
wire		        		ADB_SPI_CS;
wire		          		AIC_BCLK;
wire		        		AIC_DIN;
reg		          		AIC_DOUT;
wire		          		AIC_LRCIN;
wire		          		AIC_LRCOUT;
wire		        		AIC_SPI_CS;
wire		        		AIC_XCLK;
reg		          		CLKIN1;
wire		        		CLKOUT0;
wire		[13:0]		DA;
wire		[13:0]		DB;
wire	          		FPGA_CLK_A_N;
wire	          		FPGA_CLK_A_P;
wire	          		FPGA_CLK_B_N;
wire	          		FPGA_CLK_B_P;
wire		          		J1_152;
reg		          		XT_IN_N;
reg		          		XT_IN_P;

DCC_V_33 UUT_DCC_V_33(

	//////// CLOCK //////////
	.OSC_50(OSC_50),

	//////// LED //////////
	.LEDG(LEDG),
	.LEDR(LEDR),

	//////// KEY //////////
	.KEY(KEY),

	//////// SW //////////
	.SW(SW),

	//////// HSMC //////////
	.AD_SCLK(AD_SCLK),
	.AD_SDIO(AD_SDIO),
	.ADA_D(ADA_D),
	.ADA_DCO(ADA_DCO),
	.ADA_OE(ADA_OE),
	.ADA_OR(ADA_OR),
	.ADA_SPI_CS(ADA_SPI_CS),
	.ADB_D(ADB_D),
	.ADB_DCO(ADB_DCO),
	.ADB_OE(ADB_OE),
	.ADB_OR(ADB_OR),
	.ADB_SPI_CS(ADB_SPI_CS),
	.AIC_BCLK(AIC_BCLK),
	.AIC_DIN(AIC_DIN),
	.AIC_DOUT(AIC_DOUT),
	.AIC_LRCIN(AIC_LRCIN),
	.AIC_LRCOUT(AIC_LRCOUT),
	.AIC_SPI_CS(AIC_SPI_CS),
	.AIC_XCLK(AIC_XCLK),
	.CLKIN1(CLKIN1),
	.CLKOUT0(CLKOUT0),
	.DA(DA),
	.DB(DB),
	.FPGA_CLK_A_N(FPGA_CLK_A_N),
	.FPGA_CLK_A_P(FPGA_CLK_A_P),
	.FPGA_CLK_B_N(FPGA_CLK_B_N),
	.FPGA_CLK_B_P(FPGA_CLK_B_P),
	.J1_152(J1_152),
	.XT_IN_N(XT_IN_N),
	.XT_IN_P(XT_IN_P)
);
// create a 50Mhz clock
always
begin
    #10 OSC_50[0] 	= ~OSC_50[0];   // every ten nanoseconds invert
	#5 ADA_DCO 	= ~ADA_DCO;
	#5 ADB_DCO 	= ~ADB_DCO;
	assign ADA_D = 13'd215;
	assign ADB_D = 13'd1215;
	KEY[3] <= 1'b1;
end

initial
begin
	$display($time, " << Starting the Simulation >>");
    OSC_50 = 3'b0; 
	ADA_DCO	= 1'b0;
	ADB_DCO	= 1'b0;
	
// at time 0
    KEY[3] = 1'b0;
	#100 KEY[3] = 1'b1;
end

endmodule
// reset is low active