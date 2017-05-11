#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

struct tnode {
   struct tnode * left;
   struct tnode * right;
   int value;
};

struct tnode * makeNode(int value);
void freeTree(struct tnode * t);

void insertVal(struct tnode * t, int value);
void prLVR(struct tnode * t);
void prRVL(struct tnode * t);
void printTree(struct tnode * t, char * prefix);

int main(int argc, char **argv) {
   int i;

   if (argc<2) {
		printf("You must specify at least one argument to %s\n",argv[0]);
		return 1;
	}
	struct tnode * root=makeNode(atoi(argv[1]));
   for(i=2; i<argc; i++) {
      int val=atoi(argv[i]);
      insertVal(root,val);
   }
   printf("In LVR order: ");
   prLVR(root);
   printf("\nIn RVL order: ");
   prRVL(root);
   printf("\nGraphic Representation...\n");
   printTree(root,"");
   freeTree(root);
   return 0;
}

struct tnode * makeNode(int value) {
   struct tnode * t = malloc(sizeof(struct tnode));
   t->value=value;
   t->left=NULL;
   t->right=NULL;
   return t;
}

void freeTree(struct tnode * t) {
   assert(t);
   if (t->left) freeTree(t->left);
   if (t->right) freeTree(t->right);
   free(t);
}

void insertVal(struct tnode * t, int value) {
	assert(t);
	//printf("%d\n", t->value);
	if(value < t->value && t->left){
		insertVal(t->left, value);
	}else if(value < t->value && !t->left){
		t->left = makeNode(value);
	}
	if(value >= t->value && t->right){
		insertVal(t->right, value);
	}else if(value >= t->value && !t->right){
		t->right = makeNode(value);
	}
}

void prLVR(struct tnode * t) {
	assert(t);
	if(t->left){
		prLVR(t->left);
	}
	printf("%d ", t->value);
	if(t->right){
		prLVR(t->right);
	}
   /* Write code to:
   	- prLVR the left sub-tree,
   	- print the value of the node,
   	- prLVR the right sub-tree
   */
}


void prRVL(struct tnode * t) {
	assert(t);
	if(t->right){
		prRVL(t->right);
	}
	printf("%d ", t->value);
	if(t->left){
		prRVL(t->left);
	}
   /* Write code to:
   	- prRVL the right sub-tree,
   	- print the value of the node,
   	- prRVL the left sub-tree
   */
}

void printTree(struct tnode * t, char * prefix) {
	assert(t);
	if(t->right && t->left){
		printf("%d has values to the left and right\n", t->value);
		printf("right of %d: %d\n", t->value, t->right->value);
		printTree(t->right,prefix);
		printf("left of %d: %d\n", t->value, t->left->value);
		printTree(t->left,prefix);
	}
	else if(t->right){
		printf("right of %d: %d\n", t->value, t->right->value);
		printTree(t->right,prefix);
	}
	else if(t->left){
		printf("left of %d: %d\n", t->value, t->left->value);
		printTree(t->left,prefix);
	}
	/* Write code to print a tree graphically */
}

