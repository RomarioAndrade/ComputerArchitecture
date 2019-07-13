#include <stdio.h>
#include <stdlib.h>
int main() {
    int A = 10;
    int B = 35;
    
    
    printf("A=%d B=%d",A,B);
    
    int temp = A;
    A = B;
    B = temp;
    
    printf("\nA=%d B=%d",A,B);
    

    return 0;
}

