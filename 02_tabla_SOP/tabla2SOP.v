module tabla2SOP();

    reg  A, B, C;
    wire w1, w2, w3, A1, A2, A3, OUTPUT;

    not NA(w1, A);
    not NB(w2, B);
    not NC(w3, C);

    and U1(A1, w1, w2, C);
    and U2(A2, A, B, w3);
    and U3(A3, A, B, C);

    or U4(OUTPUT, A1, A2, A3);

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

    initial begin
        $dumpfile("tabla2SOP_tb.vcd");
        $dumpvars(0, tabla2SOP);
    end

endmodule
