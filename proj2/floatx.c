#include "floatx.h"
#include "math.h"

/*--------------------------------------------------------------------------------
	Return floatx representation (as defined by *def) which
	best approximates value
-------------------------------------------------------------------------------- */
floatx doubleToFloatx(const floatxDef *def, double value) {
	/* Put your code here */
	//union (puts multiple types on one memory address)
	union {
		double d;
		floatx fx;
	} representations;

	unsigned int fractBits = def->totBits - def->expBits - 1;

	representations.d=value;
	//check for zero
	if(representations.d == 0){
		return 0;
	}
	//get our parts
	floatx negative=(representations.fx & 0x8000000000000000)>>63;
	long exp=(representations.fx & 0x7ff0000000000000)>>52;
	floatx frac=(representations.fx & 0x000fffffffffffff);
	int abstract_exp = exp - 1023;
	//newExp depending on expBits size
	long newExp = (1<<(def->expBits-1)) - 1 + abstract_exp;
	//check to see it fits our exponent size
	if(newExp > (1<<(def->expBits)) - 1){
		//clear it and make it the largest size possible
		newExp = ((1<<(def->expBits)) - 1);
		//clear frac
		frac = 0;
	}

	//move frac over to be in terms of floatx
	frac >>=(52 - def->totBits + def->expBits +1);
	//check the last bit for truncation
	if(frac & 2){
		frac++;
	}
	//get unbiased exponent
	int shift = (abstract_exp + ((1<<(def->expBits - 1)) - 1));
	
	//check for denormalized numbers
	if(shift <= 0){
		//clear exponent
		newExp = 0;
		//shift frac by the unbiased exponent
		frac>>=(1-shift);
		//turn on the first bit
		frac |=1<<(fractBits - (1 -shift));
	}

	//set signed bit
	representations.fx = negative << (def->totBits - 1);
	//set exponent bits
	representations.fx = representations.fx | newExp << fractBits;
	//set fraction bits
	representations.fx = representations.fx | frac;

	return representations.fx;
}

/** Return C double with value which best approximates that of floatx fx
 *  (as defined by *def).
 */
double floatxToDouble(const floatxDef *def, floatx fx) {
	//union again
	union {
		double d;
		floatx value;
	} representations;
	representations.value = 0;
	unsigned int fractBits = def->totBits - def->expBits - 1;
	//get our parts (frac comes later)
	floatx negative = (fx & 1<<(def->totBits - 1))>>(def->totBits - 1);
	floatx exp=(fx>>fractBits) & ~(1<<def->expBits);
	//account for zero
	if(fx == 0){
		return 0;
	}
	//account for infinity
	if(exp == ((1<<(def->expBits)) - 1)){
		if(negative){
			return -INFINITY;
		}else{
			return INFINITY;
		}
	}
	//make a mask for getting frac
	floatx mask = 0;
	int i;
	for(i = 0; i < fractBits;i++){
		mask |= (1<<i);
	}
	floatx frac= fx & mask;
	//get new exponent
	int abstract_exp = exp - ((1<<(def->expBits - 1)) - 1);
	floatx newExp = (1023 + abstract_exp);

	//account for denormalized numbers
	if(exp == 0){
		//find the right amount to shift in bits
		floatx temp = 1<<fractBits;
		int shift;
		for(shift=0;shift<fractBits;shift++){
			//conditional for finding first turned on bit
			if((frac & temp) == temp){
				//turn off the first bit that's on
				frac&=~(temp);
				break;
			}else{
				temp >>=1;
			}
		}
		//shift frac back
		frac<<=(shift);
		//subtract the shift amount from the exponent
		newExp -= (shift - 1);
	}

	//put our bits in the right places
	representations.value |= negative<<63;
	representations.value |= newExp<<52;
	representations.value |= frac<<(51 - def->totBits + def->expBits +2);
	
	return representations.d;
}
