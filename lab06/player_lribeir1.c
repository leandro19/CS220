rps player_lribeir1(int round,rps *myhist,rps *opphist) {
	if(round == 0){
		char i = rand()%3;
			switch(i) {
				case 0: return Rock;
				case 1: return Scissors;
			}
			return Paper;
	}
	else if(opphist[round - 1] == Rock){
		return Paper;
	}else if(opphist[round - 1] == Scissors){
		return Rock;
	}else if(opphist[round - 1] == Paper){
		return Scissors;
	}
	return 0;
}

register_player(player_lribeir1,"lribeir1");
