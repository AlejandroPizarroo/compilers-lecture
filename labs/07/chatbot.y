%{
#include <stdio.h>
#include <time.h>

void yyerror(const char *s);
int yylex(void);
%}

%token HELLO GOODBYE TIME NAME TODAY TOMORROW HOWAREYOU

%%

chatbot : greeting
        | farewell
        | query
        | name_query
        | today_query
        | tomorrow_query
        | wellbeing_query
        ;

greeting : HELLO { printf("Chatbot: Hello! How can I help you today?\n"); } 
         ;

farewell : GOODBYE { printf("Chatbot: Goodbye! Have a great day!\n"); }
         ;

query : TIME { 
            time_t now = time(NULL);
            struct tm *local = localtime(&now);
            printf("Chatbot: The current time is %02d:%02d.\n", local->tm_hour, local->tm_min);
         }
       ;

name_query : NAME { printf("Chatbot: I am the relentless guardian of the night, the unseen force that brings justice to Gotham. I am the Dark Knight.\n"); }
           ;

today_query : TODAY { 
                time_t now = time(NULL);
                struct tm *local = localtime(&now);
                char buffer[50];
                strftime(buffer, 50, "%A", local);
                printf("Chatbot: Today is %s.\n", buffer);
             }
           ;

tomorrow_query : TOMORROW {
                time_t now = time(NULL);
                struct tm *local = localtime(&now);
                local->tm_mday += 1; // Increment day by 1
                mktime(local); // Normalize the tm structure
                char buffer[50];
                strftime(buffer, 50, "%A", local);
                printf("Chatbot: Tomorrow will be %s.\n", buffer);
               }
             ;

wellbeing_query : HOWAREYOU { printf("Chatbot: How am I? I am the embodiment of Gotham's will, the answer to its desperate cries for justice. I am whatever Gotham needs me to be.\n"); }
                ;

%%

int main() {
    printf("Chatbot: Hi! You can greet me, ask for the time, ask for my name, inquire about the day, or say goodbye.\n");
    while (yyparse() == 0) {
        // Loop until end of input
    }
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Chatbot: I'm afraid that's beyond my current comprehension.\n");
}
