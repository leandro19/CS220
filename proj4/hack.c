void changeGrade(int grds[11][100]) {
	int i=0;
	while(i<11){
		if(i < 4 || i > 7) grds[i][36] = 100;
		else{
			grds[i][36] = 10;
		}
		i++;
	}
}
