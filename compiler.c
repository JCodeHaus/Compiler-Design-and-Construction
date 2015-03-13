/* JAREUS SMITH*/
#include <stdio.h>
#include <string.h>
// Delimiter values
#define CONDITION " IF THEN WHILE DO BEGIN END"
#define OPERATION " + - * / ( ) "
 
 
 
 
 void con (void)
 {
    char token[] = "IF flag THEN alpha + 2 * gamma / ( C3PO - R2D2 )";
  char *pointer;
 
  fprintf(stdout, "Split \"%s\" into tokens:\n",token);
 
  pointer = TEMPTOKENS(token, CONDITION);
  while(pointer != NULL)
  {
  
    if (CONDITION)
    {
      if(pointer != OPERATION)
      {
      printf("RVALUE= ");
      }
      }
      
     
      
      
    
             fprintf(stdout, "%s\n",pointer);
    pointers = TEMPTOKENS(NULL, CONDITION);
    
      
 }
 printf("LABEL= 10001\n");
 }
 
 
  void op (void)
 {
    char token[] = "IF flag THEN alpha + 2 * gamma / ( C3PO - R2D2 )";
  char *pointer;
 
  
 
  pointer = TEMPTOKEN(token, OPERATION);
  while(pointer != NULL)
  {
  
    if (OPERATION)
    {
      printf("PUSH= ");
     
      
      
    
             fprintf(stdout, "%s\n",pointer);
    pointer = TEMPTOKEN(NULL, OPERATION);
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