%{
#include "y.tab.h"
%}

%%

hello                           { return HELLO; }
hi                              { return HELLO; }
hey                             { return HELLO; }
goodbye                         { return GOODBYE; }
bye                             { return GOODBYE; }
time                            { return TIME; }
what[' ']is[' ']the[' ']time    { return TIME; }
what[' ']time[' ']is[' ']it     { return TIME; }
what[' ']is[' ']your[' ']name   { return NAME; }
who[' ']are[' ']you             { return NAME; }
your[' ']name                   { return NAME; }
what[' ']day[' ']is[' ']today   { return TODAY; }
which[' ']day[' ']is[' ']today  { return TODAY; }
today[' ']is[' ']what[' ']day   { return TODAY; }
what[' ']day[' ']is[' ']tomorrow { return TOMORROW; }
which[' ']day[' ']is[' ']tomorrow { return TOMORROW; }
tomorrow[' ']is[' ']what[' ']day { return TOMORROW; }
how[' ']are[' ']you             { return HOWAREYOU; }
how[' ']do[' ']you[' ']feel     { return HOWAREYOU; }
are[' ']you[' ']doing[' ']well  { return HOWAREYOU; }
\n                              { return 0; }  /* End of input on newline */

.                               { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
