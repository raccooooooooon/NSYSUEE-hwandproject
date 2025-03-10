module divb25kHz(clkin, reset, clkout);

input clkin, reset;
output reg clkout;
reg [31:0] count;
wire [31:0] divn, divnh;

assign divn= 32'd2000; //define divn is the period of the shortest note
assign divnh= divn>>1;//define divnh is half of divn

always@(posedge clkin) //while the positive edge of clock
begin
	if((count>=divn)||(reset)) //if counter is larger than the specified period of time
		count<=1; //restart the counter
	else
		count<=count+1; //otherwise keep counting
end

always@(negedge clkin) //wile the negative edge of clock
clkout= (count<= divnh)?1:0; //output of the frequncy diveder is 1 while counting from 1 to the half period, otherwise is 0

endmodule