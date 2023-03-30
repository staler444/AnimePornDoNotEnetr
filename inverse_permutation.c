#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool czygit(size_t n, int* p) {
	if(n == 0 || n > 2147483647)
		return false;
	n--;
	for(int i = 0; i <= n; i++)
		if(p[i]<0||p[i]>n)
			return false;
	for(int i = 0; i <= n; i++) {
     		int x = (p[i] < 0 ? -(p[i]+1) : p[i]);
		if(p[x] < 0) {
			for(int j = 0; j < i; j++) {
				int y = (p[j] < 0 ? -(p[j]+1) : p[j]);
				p[y] = -(p[y]+1);
			}
			return false;
		}
		p[x] = -p[x] - 1;
	}
	for(int i = 0; i <= n; i++)
		p[i] = -(p[i]+1);
	return true;
}

void jazda(int x, int* p) {
	int nxt = p[x];
	while(nxt >= 0) {
		int pmr = p[nxt];
		p[nxt] = -x-1;
		x = nxt;
		nxt = pmr;
	}
}

bool inverse_permutation(int n, int* p) {
	if(!czygit(n, p))
		return false;
	for(int i = 0; i < n; i++)
		if(p[i] >= 0)
			jazda(i, p);
	for(int i = 0; i < n; i++)
		p[i] = -(p[i]+1);
	return true;
}
