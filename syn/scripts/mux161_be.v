/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : P-2019.03-SP1-1
// Date      : Thu Mar  4 21:21:35 2021
/////////////////////////////////////////////////////////////


module mux161 ( a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, s1, s2, s3, s4, 
        out );
  input a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, s1, s2, s3, s4;
  output out;
  wire   N0, N1, N2, N3, N4, N5;

  SELECT_OP C20 ( .DATA1(a), .DATA2(b), .CONTROL1(N0), .CONTROL2(N1), .Z(out)
         );
  GTECH_BUF B_0 ( .A(N3), .Z(N0) );
  GTECH_BUF B_1 ( .A(N2), .Z(N1) );
  GTECH_OR2 C22 ( .A(N5), .B(s4), .Z(N2) );
  GTECH_OR2 C23 ( .A(N4), .B(s3), .Z(N5) );
  GTECH_OR2 C24 ( .A(s1), .B(s2), .Z(N4) );
  GTECH_NOT I_0 ( .A(N2), .Z(N3) );
endmodule

