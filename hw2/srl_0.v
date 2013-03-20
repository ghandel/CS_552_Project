module srl_0 (In, Cnt, Out);

	input [15:0]In;
	input Cnt;

	output [15:0]Out;
	
	mux2_1 sub1(In[0], In[1], Cnt, Out[0]);
	mux2_1 sub2(In[1], In[2], Cnt, Out[1]);
	mux2_1 sub3(In[2], In[3], Cnt, Out[2]);
	mux2_1 sub4(In[3], In[4], Cnt, Out[3]);
	mux2_1 sub5(In[4], In[5], Cnt, Out[4]);
	mux2_1 sub6(In[5], In[6], Cnt, Out[5]);
	mux2_1 sub7(In[6], In[7], Cnt, Out[6]);
	mux2_1 sub8(In[7], In[8], Cnt, Out[7]);
	mux2_1 sub9(In[8], In[9], Cnt, Out[8]);
	mux2_1 sub10(In[9], In[10], Cnt, Out[9]);
	mux2_1 sub11(In[10], In[11], Cnt, Out[10]);
	mux2_1 sub12(In[11], In[12], Cnt, Out[11]);
	mux2_1 sub13(In[12], In[13], Cnt, Out[12]);
	mux2_1 sub14(In[13], In[14], Cnt, Out[13]);
	mux2_1 sub15(In[14], In[15], Cnt, Out[14]);
	mux2_1 sub16(In[15], 0, Cnt, Out[15]);
	
endmodule
