import java.util.Scanner;

public class Prizes {

	public static void main(String[] args) {



		/*  SELF ASSESSMENT of whether my code is easy to understand.
			   1. Did I use easy-to-understand meaningful variable names?
			       Mark out of 5: 5 
			       Comment: Yes I did use easy-to-understand meaningful variable names.
			   2. Did I format the variable names properly (in lowerCamelCase)?
			       Mark out of 5: 5  
			       Comment: I have formatted the variable names properly in lowerCamelCase.
			   3. Did I indent the code appropriately?
			       Mark out of 5: 3   
			       Comment: I think i have not indented the code properly.
			   4. Did I implement a switch statement as required?
			       Mark out of 10:   10
			       Comment: Yes I have implemented a switch statement.
			       Total Mark out of  25 (Add all the previous marks): 23
		 */

		System.out.print("This program tells competition participants what prize they have won.");
		Scanner input = new Scanner(System.in);

		String coPrize = null;
		do 
		{
			System.out.print("\nEnter your place number (or type 'exit'): ");
			coPrize = input.nextLine();

			if (coPrize.equals("exit") == true)
			{
				return;
			}

			switch(coPrize)
			{
			case "1":
				System.out.print("You came in 1st place and hence won two theatre tickets"
						+ " + drinks during the interval + dinner before the show.");
				break;
			case "2":
				System.out.print("You came in 2nd place and hence won two theatre tickets"
						+ " + drinks during the interval.");
				break;
			case "3":
				System.out.print("You came in 3rd place and hence won two theatre tickets.");
				break;
			case "4":
				System.out.print("You came in 4th place and hence won a 10 Euro book token.");
				break;
			case "5":
				System.out.print("You came in 5th place and hence won a 10 Euro book token.");
				break;
			case "6":
				System.out.print("You came in 6th place and hence won a 5 Euro book token.");
				break;
			case "7":
				System.out.print("You came in 7th place and hence won a 5 Euro book token.");
				break;
			case "8":
				System.out.print("You came in 8th place and hence won a 5 Euro book token.");
				break;
			case "9":
				System.out.print("You came in 9th place and hence won a 5 Euro book token.");
				break;
			case "10":
				System.out.print("You came in 10th place and hence won a 5 Euro book token.");
				break;
			default:
				System.out.print("Sorry. You did not win a prize.");
				break;	
			}

		} while (coPrize.equals("exit") == false);

	}


}

