module NoteChangCtrl (reset, belk, BDN, clk, cp);
input		reset, belk, clk;
output	reg cp;
wire 		[5:0] BDN;
reg		[5:0] count;
wire_cp;

always @(posedge belk or posedge cp or posedge reset)
	if (reset) count <= 0;
	else
		if (cp) count <= 0;
		else count <= count+1;
assign_cp = (count == BDN)?1'b1:1'b0;
always @(clk)
	cp <= _cp;
endmodule
