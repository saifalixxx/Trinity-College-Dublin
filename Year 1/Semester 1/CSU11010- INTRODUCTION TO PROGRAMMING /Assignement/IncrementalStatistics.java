/*  SELF ASSESSMENT of whether my code is easy to understand.
   1. Did I use easy-to-understand meaningful variable names? yes 
       Mark out of 5:   5 
       Comment: I did 100%
   2. Did I format the variable names properly (in lowerCamelCase)?yes 
       Mark out of 5:   5
       Comment: I did 100%
   3. Did I indent the code appropriately? yes 
       Mark out of 5: 5  
       Comment: I did yes 
   4. Did I implement a while loop or do-while loop as required? yes 
       Mark out of 10:   10 
       Comment: a do while loop 
      Total Mark out of  25 (Add all the previous marks):  25 
*/





import java.util.Scanner;

public class IncrementalStatistics {

    public static void main(String[] args) {

        int numberTryUsed = 0 ;
        double averageNumber = 0d;
        double previousOneAverage = 0d ;
        double varianceNumber = 0d;
        double previousOneVariance = 0d ;
        double randomNumber = 0d ;
        boolean exit = false;
        boolean quit = false ;
        Scanner input = new Scanner(System.in);

        System.out.println("This program computes the average and variance of all numbers entered.");
        System.out.print("Enter a number (or type 'exit'): ");

        do {

            while (input.hasNextDouble())
            {

                randomNumber  = input.nextDouble();

                {
                    numberTryUsed ++;
                    averageNumber =  previousOneAverage  + ((randomNumber - previousOneAverage )                              // previous average added to new divided by n 
                            / (double ) numberTryUsed) ;
                    varianceNumber = (((double) numberTryUsed - 1 ) * previousOneVariance + ( randomNumber - previousOneAverage )
                            *(randomNumber - averageNumber )) / (double) numberTryUsed ;                                             // casting used as i declared in as @Int previously

                    System.out.printf( "So far the average is %.1f "                                                            // to one decimal point only 
                            + "and the variance is %.1f " , averageNumber , varianceNumber) ;
                    System.out.print("\nEnter another number (or type 'exit'): ");                   // printing a new line 

                    previousOneVariance = varianceNumber ;                                        // previous one is equal to the new one 
                    previousOneAverage = averageNumber ;                                          // easier way to declare it as equal to previous one 
                }
            }
            if ((input.hasNext("quit")) || (input.hasNext("exit")))                         // if it has exit or quit 
            {                                                                               // program will be executed  

                exit = true;
                quit = true;
                System.out.print("Goodbye.");
            }
            else
            {
                System.out.print("Error: You must enter a real number (e.g. 12.5) " +            // (  giving anything else it will give this statement / exit , quit /  )
                        "\nEnter another number (or type 'exit'): " );
                input.next() ;
            }

        } while ( !quit && !exit ) ;
        input.close();

    }

}