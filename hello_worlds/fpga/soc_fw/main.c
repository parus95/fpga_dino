#include "firmware.h"

#define reg_uart_clkdiv (*(volatile uint32_t*)0x02000004)
#define leds (*(volatile uint32_t*)0x03000000)

void wait(volatile uint32_t t){
    while (t--){
    }
}

int main(){

	reg_uart_clkdiv = 87;
    //reg_uart_clkdiv = 3;
    leds= 0xA5;
print_dec(42);
    print_str("Hello, World!\n");
    while (true){
        wait(20000);
        leds= 0xA5;
        wait(20000);
        leds= 0x5A;
        print_str("Ping!\n");
    }
}