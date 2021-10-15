`timescale 1ps / 1ps

module ledsshow_tb;

    reg pushButton;
    wire led;
    integer fileLog;

    ledsshow LEDSSHOW(
        .led(led),
        .pushButton(pushButton)
    );

    initial  begin
        $dumpfile("./log/report2.vcd");
        $dumpvars(0,ledsshow_tb);
        // this only will take effect after perform a "restart"
        // what will make desapper the wave form, I know...
        // sorry... don't ask me the reason... 
    end

    initial begin
        $display("running tests");
        fileLog = $fopen("./log/report2.log");
        registerData;

        #1 // 1ps
        pushButton = 1'b0;

        #1 // 2ps
        registerData;

        #1 // 3ps
        pushButton = ~pushButton;

        #1 // 4ps
        registerData;

        #1 // 5ps

        #1 // 6ps
        registerData;

        #1 // 7ps
        pushButton = ~pushButton;

        #1 // 8ps
        registerData;

        #1 // 9ps

        #1 // 10ps
        registerData;

        #1 // 11ps
        pushButton = ~pushButton;

        #1 // 12ps
        registerData;

        #1 // 13ps

        #1 // 14ps
        registerData;

        #1 // 15ps

        #1 // 16ps
        registerData;

        #1 // 17ps
        pushButton = ~pushButton;

        #1 // 18ps
        registerData;

        #1 // 19ps
        pushButton = ~pushButton;

        #1 // 20ps
        registerData;

        $fclose(fileLog);
        $display("ended");
    end

    task registerData; 
        begin
            $fdisplay(
                fileLog, 
                "pushButton,%b,led,%b", 
                pushButton, led
            );
        end
    endtask

endmodule

