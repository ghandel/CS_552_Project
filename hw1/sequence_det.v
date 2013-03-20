//a sequence detector that detects the BCD of 46
module sequence_det(In, Out);
	input [7:0]In;
	output Out;
	wire AoC, oD, oE, oH, oH_, BnF, nG;
	
	assign AoC = In[7] | In[5];
	assign oD = AoC | In[4];
	assign oE = oD | In[3];
	assign oH = oE | In[0];
	assign BnF = In[6] & In[2];
	assign nG = BnF & In[1];
	assign oH_ = ~oH;
	assign Out = oH_ & nG;
endmodule