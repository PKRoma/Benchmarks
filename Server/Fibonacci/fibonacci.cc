#include <stdio.h>

int fibonacci( int n )
{
	if ( n < 2 )
		return 1;
	else
		return fibonacci( n - 2 ) + fibonacci( n - 1 );
}

int main( int argc, char **argv )
{
	printf( "%d\n", fibonacci( 40 ) );
	return 0;
}
