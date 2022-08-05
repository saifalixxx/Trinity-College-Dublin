 
/*  SELF ASSESSMENT of whether my code is easy to understand.
   1. Did I use easy-to-understand meaningful and properly formatted variable names?
       Mark out of 5: 5
       Comment: Yes i used meaning full and properly formatted variable names
    2. Did I indent the code appropriately?
       Mark out of 5: 2
       Comment: I think i have not indented my code properly
   3. Did I make use of the functions appropriately within main and the other functions?
       Mark out of 10: 10
       Comment: Yes I made use of functions appropriately within main and other functions
       Total Mark out of  20 (Add all the previous marks):  
*/ 

import java.util.Arrays;
import java.util.Scanner;

public class ThreeNumbers {

	static int medianOf (int numberOne, int numberTwo, int numberThree) 

	{
     int[] values = {numberOne, numberTwo, numberThree};
     Arrays.sort(values);
     return values[1];

	}

	static double averageOf (long numberOne, long numberTwo, long numberThree)
	{
    
		return (numberOne + numberTwo + numberThree) / 3.0;	

	}

	static int countOfNumbersGreaterThanTheAverage (int numberOne, int numberTwo, int numberThree) 
	{
		int count = 0;
		double avNumber = averageOf(numberOne, numberTwo, numberThree);
		if (numberOne > avNumber) 
		{
			count ++;
		}

		if(numberTwo > avNumber)
		{
			count ++;
		}

		if(numberThree > avNumber)
		{
			count ++;
		}

		return count;

	} 
	
	static String getFormattedOutputString (int median, int count) 
	{
		return "The median of your numbers is " + median + ", and " + count + " of them " + (count > 1 ? "are":"is")
				+ " greater than their average.";
		
	}
	
	public static void main (String[] args) 
	{
	
	int count, median;
	int numberOne, numberTwo, numberThree;
	Scanner input = new Scanner(System.in);
	
	do
	{
		System.out.print("Please enter your three integers separated by spaces (or enter 'quit'):  ");
		
		if (input.hasNext("quit"))
		{
			return;
		}
		
		numberOne = input.nextInt();
		numberTwo = input.nextInt();
		numberThree = input.nextInt();
	
		
		count = ThreeNumbers.countOfNumbersGreaterThanTheAverage (numberOne, numberTwo, numberThree);
		median = ThreeNumbers.medianOf (numberOne, numberTwo, numberThree);
		
		System.out.println(getFormattedOutputString(median,count));
		
        
	}  while(true);

}

}