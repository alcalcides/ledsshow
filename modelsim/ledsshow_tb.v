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
        $dumpfile("./log/report.vcd");
        $dumpvars(0,ledsshow_tb);
        // this only will take effect after perform a "restart"
        // what will make desapper the wave form, I know...
        // sorry... don't ask me the reason... 
    end

    initial begin
        $display("running tests");
        fileLog = $fopen("./log/report3.log");
        registerData;

        #1 // 1ps
        pushButton = 1'b0;
        registerData;

        #1 // 2ps
        pushButton = ~pushButton;
        registerData;

        #1 // 3ps
        registerData;

        #1 // 4ps
        pushButton = ~pushButton;
        registerData;

        #1 // 5ps
        registerData;

        #1 // 6ps
        pushButton = ~pushButton;
        registerData;

        #1 // 7ps
        registerData;

        #1 // 8ps
        registerData;

        #1 // 9ps
        pushButton = ~pushButton;
        registerData;

        #1 // 10ps
        pushButton = ~pushButton;
        registerData;

        # 1 // 11ps 
        $fclose(fileLog);
        $display("ended");
    end

    task registerData; 
        begin
            $fstrobe(
                fileLog, 
                "pushButton,%b,led,%b", 
                pushButton, led
            );
        end
    endtask

endmodule

