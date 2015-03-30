#include <stdio.h>
#include <string.h>
// Delimiter values
#define CONDITION " IF THEN WHILE DO BEGIN END"
#define OPERATION " + - * / ( ) "




void con (void)
{
   char token[] = "IF flag THEN alpha + 2 * gamma / ( C3PO - R2D2 )";
 char *pointers;

 fprintf(stdout, "Split \"%s\" into tokens:\n",token);

 pointers = strtok(token, CONDITION);
 while(pointers != NULL)
 {
 
   if (CONDITION)
   {
     if(pointers != OPERATION)
     {
     printf("RVALUE= ");
     }
     }
     
    
     
     
   
            fprintf(stdout, "%s\n",pointers);
   pointers = strtok(NULL, CONDITION);
   
     
}
printf("LABEL= 10001\n");
}


 void op (void)
{
   char token[] = "IF flag THEN alpha + 2 * gamma / ( C3PO - R2D2 )";
 char *pointer;

 

 pointer = strtok(token, OPERATION);
 while(pointer != NULL)
 {
 
   if (OPERATION)
   {
     printf("PUSH= ");
    
     
     
   
            fprintf(stdout, "%s\n",pointer);
   pointer = strtok(NULL, OPERATION);
   }
     
}

}






int main (void)
{
 con( );
 op();
 printf("Sub\nDIV\nADD\nLABEL10001\nHALT\n");
 return 0;
}
