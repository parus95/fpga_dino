#include "firmware.h"

#define reg_uart_clkdiv (*(volatile uint32_t*)0x02000004)
#define leds (*(volatile uint32_t*)0x03000000)
#define corr_avail (*(volatile uint32_t*)0x03000004)
#define corr_data (*(volatile uint32_t*)0x03000008)
#define corr_conf_a (*(volatile uint32_t*)0x0300000C)
#define corr_conf_b (*(volatile uint32_t*)0x03000010)

void wait(volatile uint32_t t){
    while (t--){
    }
}

int main(){
	reg_uart_clkdiv = 87;
    corr_conf_a = 0xF1C3C771;
    corr_conf_b = 0x00038B48;

    //reg_uart_clkdiv = 3;
    leds= 0xA5;
print_dec(42);
    print_str("Hello, World!\n");
print_hex(corr_conf_a, 8);
print_hex(corr_conf_b, 8);

    while (true){
        if (corr_avail & 1){
            int8_t rd = corr_data;
            print_chr(rd);
            if (rd < 0) rd = -rd;
            leds = rd;
        }
        // wait(20000);
        // leds= 0xA5;
        // wait(20000);
        // leds= 0x5A;
        // print_str("Ping!\n");
    }
}