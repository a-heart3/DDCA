#include <stdio.h>
#include <stdint.h>

int main (int argc, char *argv[])
{
	int32_t A, B;
	char op;

	while (1) {
		printf ("please input the A:");
		scanf("%x", &A);
		printf("A is %x\n", A);
		printf ("please input the B:");
		scanf("%x", &B);
		printf("B is %x\n", B);
		getchar();
		printf ("please input the op:");
		op = getchar();
		switch (op) {
			case '0': printf("the result is %.8x\n", A + B);
					  break;
			case '2': printf("the result is %.8x\n", A - B);
					  break;
			case '4': printf("the result is %.8x\n", A & B);
					  break;
			case '5': printf("the result is %.8x\n", A | B);
					  break;
			case '6': printf("the result is %.8x\n", A ^ B);
					  break;
			case '7': printf("the result is %.8x\n", ~(A | B));
					  break;
			case 'A': printf("the result is %.8x\n", A - B);
					  break;

		}
	}
}
