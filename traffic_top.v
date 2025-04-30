`timescale 1ms / 1ns
module fourway_traficlight_countroller(clk,reset,l1,l2,l3,l4);
input clk,reset; 
output reg [2:0]l1,l2,l3,l4; 
reg [11:0]state = 12'b100001001001; 
reg [6:0]count=7'b0000000; 
always @ (posedge clk) begin 
if (reset) 
state <= 12'b100001001001;
else begin
case (state) 

12'b100001001001 : begin
count <= count+1;                
if (count == 4)begin               
state <= 12'b100010001001;
count <= 0;
end
else 
state <= 12'b100001001001;
end


12'b100010001001 : begin
count <= count+1;
if (count == 2)begin
state <= 12'b001100001001;           
count <= 0;
end
else 
state <= 12'b100010001001;
end


12'b001100001001 : begin
count <= count+1;
if (count == 4)begin
state <= 12'b001100010001;          
count <= 0;
end
else 
state <= 12'b001100001001;
end


12'b001100010001 : begin
count <= count+1;
if (count == 2)begin
state <= 12'b001001100001;           
count <= 0;
end
else 
state <= 12'b001100010001;
end


12'b001001100001 : begin
count <= count+1;
if (count == 4)begin
state <= 12'b001001100010;           
count <= 0;
end
else 
state <= 12'b001001100001;
end


12'b001001100010 : begin
count <= count+1;
if (count == 2)begin
state <= 12'b001001001100;           
count <= 0;
end
else 
state <= 12'b001001100010;
end


12'b001001001100 : begin
count <= count+1;
if (count == 4)begin
state <= 12'b010001001100;          
count <= 0;
end
else 
state <= 12'b001001001100;
end


12'b010001001100 : begin
count <= count+1;
if (count == 2)begin
state <= 12'b100001001001;           
count <= 0;
end
else 
state <= 12'b010001001100;
end
endcase
end
l1 <= state[11:9];
l2 <= state[8:6];
l3 <= state[5:3];
l4 <= state[2:0];
end
endmodule