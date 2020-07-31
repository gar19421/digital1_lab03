module tabla1SOP();

    reg  A, B, C;
    wire w1, w2, w3, A1, A2, A3, A4, A5, OUTPUT;

    not NA(w1, A);
    not NB(w2, B);
    not NC(w3, C);

    and U1(A1, w1, w2, w3);
    and U2(A2, w1, B, w3);
    and U3(A3, A, w2, w3);
    and U4(A4, A, w2, C);
    and U5(A5, A, B, C);

    or U6(OUTPUT, A1, A2, A3, A4, A5);

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
        $dumpfile("tabla1SOP_tb.vcd");
        $dumpvars(0, tabla1SOP);
    end*/

endmodule
