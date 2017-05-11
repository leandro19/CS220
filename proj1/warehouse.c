#include "slots.h"
#include <stdio.h>

int main(int argc, char ** argv) {

	int bin;
	int startSlot = 0;
	int orders[100] = {0};
	int slots[NUMSLOTS];

	initSlots();
	while(1==scanf("%d",&bin)) {
		orders[bin]++;
		if (-1==findSlot(bin)) {
			if(startSlot < NUMSLOTS){
				getBin(bin,startSlot);
				slots[startSlot] = bin;
				startSlot++;
			}
			else if(orders[slots[0]] <= orders[slots[1]] && orders[slots[0]] <= orders[slots[2]] && orders[slots[0]] <= orders[slots[3]]){
				getBin(bin,0);
			}else if(orders[slots[1]] <= orders[slots[0]] && orders[slots[1]] <= orders[slots[2]] && orders[slots[1]] <= orders[slots[3]]){
				getBin(bin,1);
			}else if(orders[slots[2]] <= orders[slots[1]] && orders[slots[2]] <= orders[slots[0]] && orders[slots[2]] <= orders[slots[3]]){
				getBin(bin,2);
			}else if(orders[slots[3]] <= orders[slots[1]] && orders[slots[3]] <= orders[slots[2]] && orders[slots[3]] <= orders[slots[0]]){
				getBin(bin,3);
			}
		}
		getWidget(bin);
	}
	printEarnings();
	return 0;
}

