module fanout (a, b, c, d, se1,ce1,se2,ce2,se3,ce3,se4,ce4,se5,ce5,se6,ce6,se7,ce7,se8,ce8,se9,ce9,se10,ce10, sf1,cf1,sf2,cf2,sf3,cf3,sf4,cf4,sf5,cf5,sf6,cf6,sf7,cf7,sf8,cf8,sf9,cf9,sf10,cf10,se11,se12,se13,se14,se15,se16,se17,se18,se19,se110,ce11,ce12,ce13,ce14,ce15,ce16,ce17,ce18,ce19,ce110,se111,se112,se113,se114,se115,se116,se117,se118,se119,se1110,ce111,ce112,ce113,ce114,ce115,ce116,ce117,ce118,ce119,ce1110);

input a, b, c, d; 

output se1,ce1,se2,ce2,se3,ce3,se4,ce4,se5,ce5,se6,ce6,se7,ce7,se8,ce8,se9,ce9,se10,ce10,se11,se12,se13,se14,se15,se16,se17,se18,se19,se110,ce11,ce12,ce13,ce14,ce15,ce16,ce17,ce18,ce19,ce110,se111,se112,se113,se114,se115,se116,se117,se118,se119,se1110,ce111,ce112,ce113,ce114,ce115,ce116,ce117,ce118,ce119,ce1110;
  
output sf1,cf1,sf2,cf2,sf3,cf3,sf4,cf4,sf5,cf5,sf6,cf6,sf7,cf7,sf8,cf8,sf9,cf9,sf10,cf10;

wire  e;
wire  f;
wire  p;
wire  q;


assign e = a & b;
assign f = c & d;
assign p = a || b;
assign q = c || d;    
  
  HA e1 (se1,ce1,e,p);
  
  HA e11 (se11, ce11, se1, ce1);
  
  HA e111 (se111, ce111, se11, ce11);
  HA e112 (se112, ce112, se11, ce11);
  HA e113 (se113, ce113, se11, ce11);
  HA e114 (se114, ce114, se11, ce11);
  HA e115 (se115, ce115, se11, ce11);
  HA e116 (se116, ce116, se11, ce11);
  HA e117 (se117, ce117, se11, ce11);
  HA e118 (se118, ce118, se11, ce11);
  HA e119 (se119, ce119, se11, ce11);
  HA e1110 (se1110, ce1110, se11, ce11);
  
  HA e12 (se12, ce12, se1, ce1);
  HA e13 (se13, ce13, se1, ce1);
  HA e14 (se14, ce14, se1, ce1);
  HA e15 (se15, ce15, se1, ce1);
  HA e16 (se16, ce16, se1, ce1);
  HA e17 (se17, ce17, se1, ce1);
  HA e18 (se18, ce18, se1, ce1);
  HA e19 (se19, ce19, se1, ce1);
  HA e110 (se110, ce110, se1, ce1);
  
  HA e2 (se2,ce2,e,p);
  HA e3 (se3,ce3,e,p);
  HA e4 (se4,ce4,e,p);
  HA e5 (se5,ce5,e,p);
  HA e6 (se6,ce6,e,p);
  HA e7 (se7,ce7,e,p);
  HA e8 (se8,ce8,e,p);
  HA e9 (se9,ce9,e,p);
  HA e10 (se10,ce10,e,p);  
  
  HA f1 (sf1,cf1,f,q);
  HA f2 (sf2,cf2,f,q);
  HA f3 (sf3,cf3,f,q);
  HA f4 (sf4,cf4,f,q);
  HA f5 (sf5,cf5,f,q);
  HA f6 (sf6,cf6,f,q);
  HA f7 (sf7,cf7,f,q);
  HA f8 (sf8,cf8,f,q);
  HA f9 (sf9,cf9,f,q);
  HA f10 (sf10,cf10,f,q); 
  
endmodule

module HA(s,c,x,y);
input x,y;
output s,c;
xor (s,x,y);
and (c,x,y);
endmodule

