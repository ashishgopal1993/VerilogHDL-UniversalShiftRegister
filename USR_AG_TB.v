// Title: Simulation and Implementation of Test bench for Universal Shift Register.
// Programmer name: Ashish Ashok Gopal, 1702005, FY MTech
// Department: Department of Electronics Engineering
// Mentor: Prof. Arati Phadke
// Department: Department of Electronics Engineering
// Date: 22/09/2017

// ***************Test Bench starts here********************
module USR_AG_TB;
	reg [3:0] ip;
	reg [1:0] s;
	reg clock, reset;
	
	wire [3:0] op;
	
	USR_AG u1(ip, op, clock, reset, s);
	
	always #1 clock= ~clock;
	
	initial begin
		
		
		reset = 1'b1;
		#30;
		
		ip = 4'b0000;
		
		reset = 1'b0;
		#30;
		
		ip = 4'b1010;		// This is 4-Bit User Defined Input
		#10;
		
		s = 2'b00;
		#50;
		
		ip = 4'b1010;		// This is 4-Bit User Defined Input
		#10;
		
		s = 2'b01;
		#50;
		
		ip = 4'b1010;		// This is 4-Bit User Defined Input
		#10;
		
		s = 2'b10;
		#50;
		
		ip = 4'b1010;		// This is 4-Bit User Defined Input
		#10;
		
		s = 2'b11;
		#50;		
	end	
endmodule 
// ***************Test Bench ends here**********************