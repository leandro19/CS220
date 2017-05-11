#include <stdio.h>
#include <string.h>

int numLetters(char num[]);

int main(int argc, char **argv){
	int i;
	char num[strlen(argv[1]) + 1];
	for(i = 0; i < strlen(argv[1]); i++){
		num[i] = argv[1][strlen(argv[1]) - (1 + i)];
	}
	num[strlen(argv[1])] = '\0';
	int letters = numLetters(num);
	printf("%s takes %d letters\n", argv[1], letters);
	return 0;
}

int numLetters(char num[]){
	int i;
	int counter;
	counter = 0;
	for(i = 0; num[i] != '\0'; i++){
		//one - nine
		if(i%3 == 0 && num[i] != '0'){
			//ten - nineteen
			if(num[i + 1] == '1'){
				if(num[i] == '0'){counter += 3;}
				else if(num[i] == '1'){counter += 6;}
				else if(num[i] == '2'){counter += 6;}
				else if(num[i] == '3'){counter += 8;}
				else if(num[i] == '4'){counter += 8;}
				else if(num[i] == '5'){counter += 7;}
				else if(num[i] == '6'){counter += 7;}
				else if(num[i] == '7'){counter += 9;}
				else if(num[i] == '8'){counter += 8;}
				else if(num[i] == '9'){counter += 8;}
			//one - nine (if greater than twenty or less than 10)
			}else{
				if(num[i] == '1'){counter += 3;}
				else if(num[i] == '2'){counter += 3;}
				else if(num[i] == '3'){counter += 5;}
				else if(num[i] == '4'){counter += 4;}
				else if(num[i] == '5'){counter += 4;}
				else if(num[i] == '6'){counter += 3;}
				else if(num[i] == '7'){counter += 5;}
				else if(num[i] == '8'){counter += 5;}
				else if(num[i] == '9'){counter += 4;}
			}
			//thousands place
			if(i == 3){counter += 8;}
			//millions  & billions place
			else if(i >= 6){counter += 7;}
		}
		//twenty - ninety
		else if(i % 3 == 1){
			if(num[i] == '2'){counter += 6;}
			else if(num[i] == '3'){counter += 6;}
			else if(num[i] == '4'){counter += 5;}
			else if(num[i] == '5'){counter += 5;}
			else if(num[i] == '6'){counter += 5;}
			else if(num[i] == '7'){counter += 7;}
			else if(num[i] == '8'){counter += 6;}
			else if(num[i] == '9'){counter += 6;}
		}
		//one hundred - nine hundred
		else if(i % 3 == 2){
			//one - nine
			if(num[i] == '1'){counter += 3;}
			else if(num[i] == '2'){counter += 3;}
			else if(num[i] == '3'){counter += 5;}
			else if(num[i] == '4'){counter += 4;}
			else if(num[i] == '5'){counter += 4;}
			else if(num[i] == '6'){counter += 3;}
			else if(num[i] == '7'){counter += 5;}
			else if(num[i] == '8'){counter += 5;}
			else if(num[i] == '9'){counter += 4;}
			//hundred
			if(num[i] != '0'){counter += 7;}
		}
	}
	return counter;
}
