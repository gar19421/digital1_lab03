module tabla4SOP();

  reg A, B, C, D;
  wire w1, w2, w3, w4, A1, A2, A3, A4, A5, A6, A7, OUTPUT;

  not NA(w1, A);
  not NB(w2, B);
  not NC(w3, C);
  not ND(w4, D);

  and U1(A1, w1, w2, w3, w4);
  and U2(A2, w1, w2, C, w4);
  and U3(A3, w1, w2, C, D);
  and U4(A4, w1, B, C, w4);
  and U5(A5, w1, B, C, D);
  and U6(A6, A, w2, w3, w4);
  and U7(A7, A, w2, C, w4);

  or U8(OUTPUT, A1, A2, A3, A4, A5, A6, A7);

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

  /*initial begin
      $dumpfile("tabla4SOP_tb.vcd");
      $dumpvars(0, tabla4SOP);
  end*/

endmodule
