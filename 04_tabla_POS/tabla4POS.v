module tabla4POS();

  reg A, B, C, D;
  wire w1, w2, w3, w4, O1, O2, O3, O4, O5, O6, O7, O8, O9, OUTPUT;

  not NA(w1, A);
  not NB(w2, B);
  not NC(w3, C);
  not ND(w4, D);

  or U1(O1, A, B, C, w4);
  or U2(O2, A, w2, C, D);
  or U3(O3, A, w2, C, w4);
  or U4(O4, w1, B, C, w4);
  or U5(O5, w1, B, w3, w4);
  or U6(O6, w1, w2, C, D);
  or U7(O7, w1, w2, C, w4);
  or U8(O8, w1, w2, w3, D);
  or U9(O9, w1, w2, w3, w4);

  and U10(OUTPUT, O1, O2, O3, O4, O5, O6, O7, O8, O9);

  initial begin
    $display("A B C D | Y");
    $display("------------");
    $monitor("%b %b %b %b | %b", A, B, C, D, OUTPUT);

    A = 0; B = 0; C = 0; D = 0;
    #1 D = 1;
    #1 D = 0; C = 1;
    #1 D = 1;
    #1 D = 0; C = 0; B = 1;
    #1 D = 1;
    #1 D = 0; C = 1;
    #1 D = 1;
    #1 A = 1; B = 0; C = 0; D = 0;
    #1 D = 1;
    #1 C = 1; D = 0;
    #1 D = 1;
    #1 D = 0; C = 0; B = 1;
    #1 D = 1;
    #1 D = 0; C = 1;
    #1 D = 1;
    #1 $finish;

  end

  initial begin
      $dumpfile("tabla4POS_tb.vcd");
      $dumpvars(0, tabla4POS);
  end

endmodule
