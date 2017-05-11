#include "arrayList.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <assert.h>
#define INITSIZE 16

bool arrayListEnlarge(arrayList list);


arrayList arrayListCreate() {
	arrayList list = (arrayList)malloc(sizeof(struct arrayListStruct));
	if (list==NULL) return list;
	list->data=(int *)malloc(sizeof(int)*INITSIZE);
	list->numUsed=0;
	list->numAlloc=INITSIZE;
	return list;
}

bool arrayListEnlarge(arrayList list) {
	list->data=(int *)realloc(list->data,sizeof(int) * (2*list->numAlloc));
	if (list->data==NULL) return false;
	list->numAlloc *=2;
	return true;
}

/* Put definitions of the other arrayList methods in arrayList.h here */
bool arrayListAdd(arrayList list, int item){
	if(arrayListSize(list) >= list->numAlloc){arrayListEnlarge(list);}
	list->numUsed++;
	list->data[arrayListSize(list) - 1] = item;
	return true;
}
void arrayListClear(arrayList list){
	list->numUsed = 0;
}
bool arrayListContains(arrayList list, int item){
	int i;
	for(i = 0; i < arrayListSize(list); i++){
		if(item == list->data[i]){
			return true;
		}
	}
	return false;
}
int arrayListGet(arrayList list,int index){
	assert(index >= 0 && index < arrayListSize(list));
	int i;
	for(i = 0; i < arrayListSize(list); i++){
		if(index == i){
			return list->data[i];
		}
	}
	return 0;
}
int arrayListIndexOf(arrayList list, int item){
	int i;
	for(i = 0; i < arrayListSize(list); i++){
		if(item == list->data[i]){
			return i;
		}
	}
	return -1;
}
bool arrayListIsEmpty(arrayList list){
	if(list->numUsed == 0) {return true;}
	else {return false;}
}
int arrayListSet(arrayList list, int index, int item){
	assert(index >= 0 && index < arrayListSize(list));
	int old = list->data[index];
	list->data[index] = item;
	return old;
}
int arrayListSize(arrayList list){
	return list->numUsed;
}
char * arrayListToString(arrayList list,char *buffer){
	int i;
	strcpy(buffer,"[");
	for(i = 0;i < list->numUsed; i++){
		char temp[100] = "";
		if(i < list->numUsed - 1){
			sprintf(temp, "%d, ", list->data[i]);
			strcat(buffer, temp);
		}else{
			sprintf(temp, "%d]", list->data[i]);
			strcat(buffer, temp);
		}
	}
	return buffer;
}

void arrayListFree(arrayList list) {
	free(list->data);
	free(list);
}
