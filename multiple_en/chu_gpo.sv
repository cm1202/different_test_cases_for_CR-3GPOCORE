module chu_gpo
   #(parameter W = 8)  // width of output port
   (
    input  logic clk,
    input  logic reset,
    // slot interface
    input  logic cs,
    input  logic read,
    input  logic write,
    input  logic [4:0] addr,
    input  logic [31:0] wr_data,
    output logic [31:0] rd_data,
    // external port    
    output logic [W-1:0] dout
   );

   // declaration
   logic [W-1:0] buf_reg;
   logic wr_en,wr_D;

   // body
   // output buffer register
   always_ff @(posedge clk, posedge reset) begin
      if (reset)begin
         buf_reg <= 0;
      end
      else if (wr_D)begin
          buf_reg <= wr_data[W-1:0];
      end 
   end 
      
   
   assign wr_D = cs && write && (addr == 5'b00000); 
   //assign wr_en = cs && write; 


   assign rd_data =  0;

   assign dout = buf_reg;
endmodule
       


