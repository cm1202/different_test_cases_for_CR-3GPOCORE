/*****************************************************************//**
 * @file main_vanilla_test.cpp
 *
 * @brief Demonstrate blinking a single LED at multiple rates.
 *
 * @author p chu
 * @version v1.1: updated to exercise blinking gpo core
 *********************************************************************/

//#define _DEBUG
#include "chu_init.h"
#include "gpio_cores.h"

GpoCore led(get_slot_addr(BRIDGE_BASE, S2_LED)); 

int main() {

   while (1) {
      //led.write(1,1); 
      led.write_s(1000); 
      //led.write(1,0);
   } //while
} //main
