GNATMAKE=gnatmake

.DELETE_ON_ERROR:

all: 
	gnatmake aflex_ayacc/ayacc/ayacc.adb -o aflex_ayacc/ayacc/ayacc -D aflex_ayacc/ayacc/
	gnatmake aflex_ayacc/aflex/aflex.adb -o aflex_ayacc/aflex/aflex -D aflex_ayacc/aflex/
	aflex_ayacc/ayacc/ayacc parser.y
	aflex_ayacc/aflex/aflex lexer.l
	gnatchop -w lexer.ada lexer_io.ada lexer_dfa.ada
	gnatmake lexer

clean:
	rm -f *.ada lexer_io.ad[sb] lexer_dfa.ad[sb] lexer.adb
	rm -f parser.adb parser_goto.ads parser_shift_reduce.ads parser_tokens.ads
	gnatclean lexer parser

cleanall:
	cd aflex_ayacc; cd ayacc; gnatclean ayacc ; cd .. ; cd ..
	cd aflex_ayacc; cd aflex; gnatclean aflex ; cd .. ; cd ..
	rm -f *.ada lexer_io.ad[sb] lexer_dfa.ad[sb] lexer.adb
	rm -f parser.adb parser_goto.ads parser_shift_reduce.ads parser_tokens.ads
	gnatclean lexer parser

