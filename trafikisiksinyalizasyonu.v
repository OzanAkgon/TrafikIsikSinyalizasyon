module trafikisiksinyalizasyonu(input wire clk,  // saat sinyali
                      output reg red,  // kırmızı ışık
                      output reg blue, // mavi ışık
                      output reg green // yeşil ışık
                     );
                     
    reg [25:0] timer;
    
    always @(posedge clk) begin
        if (timer >= 0 && timer < 27000000) begin 
            red <= 0;
            blue <= 1;
            green <= 1;
            timer <= timer + 1;
        end else if (timer >= 27000000 && timer < 32400000) begin 
            red <= 1;
            blue <= 0;
            green <= 1;
            timer <= timer + 1;
        end else if (timer >= 32400000 && timer < 59400000) begin 
            red <= 1;
            blue <= 1;
            green <= 0;
            timer <= timer + 1;
        end else begin 
            red <= 0;
            blue <= 0;
            green <= 0;
            timer <= 0;
        end
    end
endmodule
