test : numLetters
	./numLetters 342
	./numLetters 115 
	./numLetters 1
	./numLetters 11
	./numLetters 111
	./numLetters 1111
	./numLetters 11111
	./numLetters 111111
	./numLetters 1111111
	./numLetters 11111111
	./numLetters 111111111
	./numLetters 100000001
	./numLetters 123456789 
	./numLetters 999999999
	./numLetters 1000000000
	
numLetters : numLetters.c
	gcc -Wall -g -o numLetters numLetters.c
	
clean : 
	-rm numLetters hw04_$(USER).tar.gz
	
submit: numLetters.c
	mkdir hw04_$(USER)
	cp numLetters.c hw04_$(USER)
	tar -cvzf hw04_$(USER).tar.gz hw04_$(USER)
	rm -r hw04_$(USER)
	echo Turn in hw04_$(USER).tar.gz on myCourses under content, Homework Submissions		
