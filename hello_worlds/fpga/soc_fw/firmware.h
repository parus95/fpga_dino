#pragma once

#include <stdbool.h>
#include <stdint.h>

extern void print_chr(char ch);
extern void print_str(const char *p);
extern void print_dec(unsigned int val);
extern void print_hex(unsigned int val, int digits);

void wait(uint32_t t);
int main( void );
