module traffic_isik_sinyalizasyonu(
  input clk,
  output reg kirmizi_led,
  output reg yesil_led,
  output reg mavi_led
);

reg [3:0] durum = 0;        // 4 bitlik bir durum değişkeni tanımlıyoruz
reg [25:0] counter = 0;     // 26 bitlik bir sayaç tanımlıyoruz

parameter KIRMIZI_TIME = 10;    // Kırmızı ışığın süresi 
parameter MAVI_TIME = 2;    // Mavi ışığın süresi
parameter YESIL_TIME = 5;   // Yeşil ışığın süresi 

always @(posedge clk) begin
  counter <= counter + 1;   // her tetiklemede sayaç 1 artırılır
end


always @(posedge clk) begin
  case(durum)
    0: begin    // Kırmızı ışık durumu
      kirmizi_led <= 1;
      yesil_led <= 0;
      mavi_led <= 0;
      if (counter >= (KIRMIZI_TIME * 1000000000) / 10) begin //sn cinsine çevirme
        durum <= 1;
        counter <= 0;
      end
    end
    1: begin    // Mavi ışık durumu
      kirmizi_led <= 0;
      yesil_led <= 0;
      mavi_led <= 1;
      if (counter >= (MAVI_TIME * 1000000000) / 10) begin //sn cinsine çevirme
        durum <= 2;
        counter <= 0;
      end
    end
    2: begin    // Yeşil ışık durumu
      kirmizi_led <= 0;
      yesil_led <= 1;
      mavi_led <= 0;
      if (counter >= (YESIL_TIME * 1000000000) / 10) begin //sn cinsine çevirme
        durum <= 0;
        counter <= 0;
      end
    end
  endcase
end

endmodule