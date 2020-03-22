#include <stdio.h>
#include <string.h>
#include <cctype> 

int main(void)
{
    char cipher[] = "fsdz{Fdhvdu_flskhu_lv_fodvvlfdo_flskhu}";
    char string[100];

    int len = strlen(cipher);
    for (int i = 0; i < len; i++) {
        if (isalpha(cipher[i])) {
            string[i] = (char)cipher[i] - 3;
        } else {
            string[i] = cipher[i];
        }
    }
    string[len] = '\0';

    printf("%s\n", string);
}