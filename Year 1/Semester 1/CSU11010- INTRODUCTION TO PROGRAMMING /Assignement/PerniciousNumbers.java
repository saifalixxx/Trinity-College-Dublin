/*  SELF ASSESSMENT of whether my code is easy to understand.
   1. Did I use easy-to-understand meaningful and properly formatted variable names?
       Mark out of 5: 5
       Comment:  I have used easy to understand meaningful and properly formatted variable names.
    2. Is my code easy to follow/understand?
       Mark out of 5: 3 
       Comment: I think my code is easy to follow but there are parts that maybe messy.
   3. Did I use the functions as required?
       Mark out of 10: 10
       Comment: I have used the required functions.
       Total Mark out of  20 (Add all the previous marks): 18
 */ 

import java.util.Scanner;

public class PerniciousNumbers {

	public static String getBinaryString (int numberOne)
	{
		if (numberOne < 0)
		{
			return ("-" + Integer.toBinaryString(Math.abs(numberOne)));

		}
		else
		{
			return Integer.toBinaryString(Math.abs(numberOne));
		}

	}

	public static int countBinaryOnes (int numberTwo)
	{
		return Integer.bitCount(Math.abs(-numberTwo));
	}

	static boolean isPrime (int numberThree)
	{
		if (numberThree <2) {
			return false;
		}
		for (int i = 2; i < (numberThree); i++) {
			if (numberThree % i == 0) {
				return false;
			}
		}
		return true;
	}

	public static boolean isPernicious (int numberFour)
	{
		boolean isPernicious = false;
		if (isPrime(countBinaryOnes(numberFour)))
		{
			isPernicious = true;
		}
		return isPernicious;
	}

	public static void main (String[] args)
	{
		Scanner input = new Scanner(System.in);

		boolean quit = false;
		System.out.print("Enter the maximum number you want to consider: ");

		int numberOne = input.nextInt();
		for (int inLoop = 0; inLoop <= numberOne; inLoop++)
		{		
			if (isPernicious (inLoop))
			{
				System.out.println(inLoop + " is a pernicious number as it contains "
						+ countBinaryOnes(inLoop) +" ones in it's binary representation " 
						+ '(' + getBinaryString(inLoop) + ')');
			}
		}
	}
}