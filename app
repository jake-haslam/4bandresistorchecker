#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int convert(char *s);

//Colours are lower case and gap between bands 3 and 4 indicates reading direction,
//there must be 4 colours as arguments.

//load ref vals into memory
const char *multiplier = "1000000000";
const char *x[] = {
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white",
    "silver",
    "gold"
};

int main(int argc, char *argv[]) {

    // mem alloc for the strings
    char temp[20];

    if (argc != 5)
    {
        printf("Usage: ./resistance colour1 colour2 colour3 colour4\n");
        return 1;
    }

    //convert colours to numbers using an index
    long firstnum = convert(argv[1]);
    int secondnum = convert(argv[2]);
    int multnum = convert(argv[3]);
    int tolnum = convert(argv[4]);

    //convert number to mulitplication amount by length of string
    strncpy (temp, multiplier, multnum + 1);// + 1 as length rather than index
    multnum = atoi(temp);

    if (tolnum == 11){
        tolnum = 5;
    }

    firstnum = ((firstnum * 10) + secondnum) * multnum;

    printf("Resistance:%liΩ Tolerance:±%i%%\n", firstnum, tolnum);
}

int convert(char *s) {
    int i = 0;
    while(x[i]) {
        if(strcmp(x[i], s) == 0) {
            return i;
            break;
        }
        i++;
    }
    printf("Incorrect colour.");
    return -1;
}
