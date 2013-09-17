GNATMAKE=gnatmake

.DELETE_ON_ERROR:

all: 
	gnatmake aflex_ayacc/ayacc/ayacc.adb -o aflex_ayacc/ayacc/ayacc -D aflex_ayacc/ayacc/
	gnatmake aflex_ayacc/aflex/aflex.adb -o aflex_ayacc/aflex/aflex -D aflex_ayacc/aflex/
	aflex_ayacc/aflex/aflex lexer.l
	gnatchop lexer.ada lexer_io.ada lexer_dfa.ada
	gnatmake lexer

clean:
	cd aflex_ayacc; cd ayacc; gnatclean ayacc ; cd .. ; cd ..
	cd aflex_ayacc; cd aflex; gnatclean aflex ; cd .. ; cd ..
	rm -f *.ada lexer_io.ad[sb] lexer_dfa.ad[sb] lexer.adb
	gnatclean lexer
