// Title: Simulation and Implementation of Universal Shift Register.
// Aim: Complete given code in Verilog for 4 bit universal shift register with 2 select inputs. Write a test bench for the same and verify the code on Modelsim Simulator. Also Implement the design on DE1 board.
// Programmer name: Ashish Ashok Gopal, 1702005, FY MTech
// Department: Department of Electronics Engineering
// Mentor: Prof. Arati Phadke
// Department: Department of Electronics Engineering
// Date: 22/09/2017

// ***************Program starts here*************************

module USR_AG(ip, op, clock, reset, s);
	// Defining inputs
	input [3:0]ip;
	input [1:0]s;
	input clock, reset, lin, rin;
	
	// Defining output
	output reg [3:0]op;
	
	// Defining variables
	integer k = 0;
	reg	[3:0]temp;
	reg newclk = 1'b0;
	
	// Creating new slow clock 
	always @(posedge clock)
	begin
		if (k<3000000) 
		k = k+1;
		else begin
				newclk = ~newclk;
				k = 0;
		end
	end
	
	always @(posedge newclk)
	begin
		if(reset)
			op = 0;
		else
		case(s)
			2'b00:  op = ip;				//Load input
			2'b01:  op = op<<1;     		//Left Shift
			2'b10:	op = op>>1;     		//Right Shift
			2'b11:	op = {op[2:0],op[3]}; 	//Rotate Left
		endcase	
	end
endmodule 

// ***************Program ends here*************************