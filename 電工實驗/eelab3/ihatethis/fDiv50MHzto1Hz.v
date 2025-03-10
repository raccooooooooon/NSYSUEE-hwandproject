module fDiv50MHzto1Hz(fin,fout); 
//frequency divider: turn the frequency 50M Hz provided by the board into 1 Hz.

input fin; //1 bit input
output fout; //1 bit output
wire [31:0]DivN,_DivN; //32 bits wire: DivN and _DivN

reg[31:0] count; //a 32 bits registor count
reg fout; //1 bit registor fout

assign DivN =32'd50000000;
 //DIVN is set as 50M Hz(32 bits, Decimal) of the board, must be modified when testing.
assign _DivN = {1'b0, DivN[31:1]}; //_DivN equals to DivN devided by 2

always@(posedge fin) //posedge input
begin
	count<=(count>=DivN)?32'd1:count+1;
	//when count is larger or equal to DivN, set count to 1 in Decimal
	//otherwise count+1
	fout<=(count<=_DivN)?1'b0:1'b1;
	//when count is lesser than _DivN, set fout to Binary 0; 
	//otherwise when it is larger or equal, set fout to binary 1.
end
endmodule