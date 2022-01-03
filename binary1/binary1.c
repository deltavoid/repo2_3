#include <stdio.h>
#include <stdlib.h>

#include <repo2_1/library1/public/library1.h>
#include <repo2_2/library1/public/library1.h>
#include <repo2_3/library1/public/library1.h>


int main()
{
    repo2_1_library1_display();

    repo2_2_library1_display();

    repo2_3_library1_display();

    return 0;
}
