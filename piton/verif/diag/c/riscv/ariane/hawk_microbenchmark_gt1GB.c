
//HAWK TEST

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define HACD_BASE    0xfff5100000ULL

//For FPGA
#define HPPA_BASE 0x80000000ULL //0x80100000ULL
#define FOURKB 0x1000

#define NUM_WORDS (4096/8)*260000 //40000
#define ARRAY2_NUM_WORDS (4096/8)*130000
#define HPPA_BASE_GT_1GB 0xC0000000ULL

//uint64_t compute_array[NUM_WORDS];
uint64_t tmp[NUM_WORDS];


int main(int argc, char ** argv) {
  uint64_t *array_2;
  //uint64_t *tmp=&compute_array;
  volatile uint32_t val;

  //uint64_t tmp[NUM_WORDS];

  //uint64_t *tmp;
  //tmp=(uint64_t *) malloc(NUM_WORDS);
  printf("\nHello World ..!\n");
  printf("Performing HAWK Test ..\n");

  for (int k = 0; k < 1; k++) {
    // assemble number and print
    printf("Hello world, I am HART %d! Counting (%d of 32)...\n", argv[0][0], k);
    printf("Address of Computng Array=%x...\n",&tmp);
  }

  uint64_t count=0; 
  uint64_t final_check1=0; 
  uint64_t final_check=0; 
  //Initialization
  for (int k = 0; k < (NUM_WORDS); k++) {

	if(k%512==0) {
    //if(k >= 1044480) {
	if(k==0) {
		if(argc!=0) {
			tmp[k]=(uint64_t) (16+argv[0][0]);
		} else {
		 printf("ARG NOT found");
		} 
	} else {
	      	tmp[k]=(uint64_t) (k+argv[0][0]+1);
	}
	count++;
  		//printf("Address of this page=%x\n",&tmp[k]);
  		//printf("K Value =%d\n",k);
	}
   //}
 } 

  printf("Number of First Array Elements Initialized=>Count=%ld\n",count);
  array_2 = (uint64_t*)(HPPA_BASE_GT_1GB);
  printf("Address of Second Array =>%0x\n",array_2);
  count=0;
  //Initialization
  for (int k = 0; k < (ARRAY2_NUM_WORDS); k++) {
	if(k%512==0) {
  	array_2 = (uint64_t*)(HPPA_BASE_GT_1GB+k); //hppa1
    //if(k >= 1044480) {
	if(k==0) {
		if(argc!=0) {
			*array_2=(uint64_t) (32+argv[0][0]);
		} else {
		 printf("ARG NOT found");
		} 
	} else {
	      	*array_2=(uint64_t) (k+argv[0][0]+10);
	}
	count++;
                final_check1+=*array_2+k;
  		//printf("K Value =%d\n",k);
//	}
   }
 } 
  		printf("Calculated Check Value on Extra Space =%x\n",final_check1);

  printf("Number of Second Array Elements Initialized=>Count=%ld\n",count);
  printf("Computign Started!..\n");
  count=0;
  final_check=0;
  //Computation
  for (int k = 0; k < (NUM_WORDS); k++) {
    if(k%512==0) {
	uint64_t data=tmp[k]+256;
	if(k<argv[0][0]+1000) {
		final_check+=(uint64_t) (tmp[k]+64+argv[0][0]);
	} else {
		final_check+=(uint64_t) (tmp[k]+argv[0][0]);
	}
	count++;
  	//printf("Computing in Progres..!.Working on Page=%ld\n",count);
    }
  }

  printf("HAWK Test Done!\n..Final Computed Value=%ld, Access Page Count While Computing=%ld\n",final_check,count);
  return 0;
}

