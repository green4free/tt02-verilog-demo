`default_nettype none

module test_magnus #( ) (
  input [7:0] io_in,
  output [7:0] io_out
);


wire clk = io_in[0];
wire rst = io_in[1];
wire en = io_in[2];


reg [7:0] lfsr = 8'd0;
assign io_out = lfsr;

always @(posege clk)
if (rst) begin
  lfsr <= 8'd0;
end else begin
  lfsr <= {lfsr[6:0], lfsr[7] ^- lfsr[5] ^- lfsr[4] ^- lfsr[3]};
end


endmodule
