module decoder(s, dout);
//input
input [2:0]s;
//output
output reg [5:0]dout;

always@(s) 
	case(s)
		3'b000: dout<= 6'd1;	// 1/32 note
		3'b001: dout<= 6'd2;	// 1/16 note
		3'b010: dout<= 6'd4;	// 1/8 note
		3'b011: dout<= 6'd8;	// 1/4 note
		3'b100: dout<= 6'd16;	// 1/2 note
		3'b101: dout<= 6'd24;	// 3/4 note
		3'b110: dout<= 6'd32;	// 1 note
		default: dout<= 6'd1;
	endcase
endmodule
