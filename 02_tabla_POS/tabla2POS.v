module tabla2POS();

    reg  A, B, C;
    wire w1, w2, w3, A1, A2, A3, A4, A5, OUTPUT;

    not NA(w1, A);
    not NB(w2, B);
    not NC(w3, C);

    or U1(A1, A, B, C);
    or U2(A2, A, W2, C);
    or U3(A3, A, w2, w3);
    or U4(A4, W1, B, C);
    or U5(A5, W1, B, W3);

    and U6(OUTPUT, A1, A2, A3, A4, A5);

    initial begin
        $display("A B C | Y");
        $display("----------");
        $monitor("%b %b %b | %b", A, B, C, OUTPUT);

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

    /*initial begin
        $dumpfile("tabla2POS_tb.vcd");
        $dumpvars(0, tabla2POS);
    end*/

endmodule
