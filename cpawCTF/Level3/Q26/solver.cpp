#include <stdio.h>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <map>
#include <unordered_map>
#include <set>
#include <unordered_set>
#include <queue>
#include <set>
#include <algorithm>
#include <numeric>
#include <list>

using SQWORD = int64_t;

int main(void) {
    SQWORD a1 = 32134;
    const SQWORD m1 = 1584891;
    const SQWORD m2 = 3438478;

    for (;;) {
        if (a1 % m2 == 193127) {
            printf("%lld\n", a1);
            break;
        }
        a1 += m1;
    }
    return 0;
}
