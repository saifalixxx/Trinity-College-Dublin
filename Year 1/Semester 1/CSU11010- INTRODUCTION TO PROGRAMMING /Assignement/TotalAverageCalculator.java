import java.util.Scanner;

public class TotalAverageCalculator {


	/*  SELF ASSESSMENT of whether my code is easy to understand.
	  1. Did I use easy-to-understand meaningful variable and constant names?
	      Mark out of 10:   8
	      Comment: yes but i think it is not as easy to understand
	  2. Did I format the variable and constant names properly (in lowerCamelCase and UPPERCASE)?
	      Mark out of 5: 5  
	      Comment: yes
	  3. Did I indent the code appropriately?
	      Mark out of 10:   10
	      Comment: yes
	  4. Did I implement a for loop to read the input as required?
	      Mark out of 10:   10
	      Comment: yes
	     Total Mark out of  35 (Add all the previous marks):  33
	 */



	public static void main(String[] args) {
		System.out.print("How many integers do you want to enter? ");
		Scanner scanner = new Scanner(System.in);
		int inNumber = scanner.nextInt();


		if((inNumber > 10) || (inNumber < 2)) {
			System.out.println("Error: This program is constrained to only compute the total"
					+ " & average of between 2 & 10 integers.");

			return;

		}


		int sum = 0;
		for (int i = 0; i < inNumber; i++) {

			System.out.printf("Enter integer %d: ", i+1) ;
			sum = sum + scanner.nextInt();


		}


		double average = (double)sum / inNumber;
		System.out.printf("The sum of your integers is %d and the average is %.2f", sum, average);


	}

}
