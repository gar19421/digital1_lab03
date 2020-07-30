module tabla1POS();


  reg A, B, C;
  wire w1, w2, w3, O1, O2, O3, OUT;


  not NA(w1, A);
  not NB(w2, B);
  not NC(w3, C);
  or  U2(O1, A, B, w3);
  or  U3(O2, A, w2, w3);
  or  U4(O3, w1, w2, C);
  and U1(OUT, O1, O2, O3);

  initial begin
    $display("A B C | Y");
    $display("---------");
    $monitor("%b %b %b | %b", A, B, C, OUT);
    A = 0; B = 0; C=0;
    #1 C = 1;
    #1 B = 1; C = 0;
    #1 C = 1;
    #1 A = 1; B=0; C=0;
    #1 C = 1;
    #1 B = 1; C = 0;
    #1 C=1;
    #1 $finish;
  end

  initial begin
    $dumpfile("tabla1POS_tb.vcd");
    $dumpvars(0, tabla1POS);
  end

endmodule
