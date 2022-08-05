import java.text.DecimalFormat;
import java.util.Scanner;

public class LoanRepaymentCalculator {
	
	/*  SELF ASSESSMENT of whether my code is easy to understand.
	  1. Did I use appropriate CONSTANTS instead of numbers within the code?
	      Mark out of 5:5    
	      Comment:yes
	  2. Did I use easy-to-understand, meaningful CONSTANT names?
	      Mark out of 5:3  
	      Comment:could be better
	       3. Did I format the CONSTANT names properly (in UPPERCASE)?
	      Mark out of 5:5  
	      Comment: yes
	  4. Did I use easy-to-understand meaningful variable names?
	      Mark out of 10:8  
	      Comment:could be better
	  5. Did I format the variable names properly (in lowerCamelCase)?
	      Mark out of 5:5  
	      Comment:yes
	  6. Did I indent the code appropriately?
	      Mark out of 10:10  
	      Comment:10
	    Total Mark out of  40 (Add all the previous marks): 36
	*/


	public static void main(String[] args) {
		final int MONTHS_IN_YEAR = 12;

		System.out.print("Enter loan amount? ");
		Scanner input = new Scanner( System.in );
		double loanAmount = input.nextDouble();

		System.out.print("Enter annual interest rate (e.g. 0.04) ");
		double annualInterestRate = input.nextDouble();

		System.out.print("Enter the term of the loan in years? ");
		int loanInYears = input.nextInt();
		input.close();

		double monthlyInterest = annualInterestRate/MONTHS_IN_YEAR;

		double compoundInterest = Math.pow(1 + monthlyInterest, loanInYears*12);

		double monthlyRepayments;
		monthlyRepayments = loanAmount * ((monthlyInterest * compoundInterest)/(compoundInterest-1));

		DecimalFormat decimalFormat = new DecimalFormat("0.00");

		System.out.println("The monthly repayment for a " + loanInYears
		+ " year loan of " + decimalFormat.format(loanAmount)
		+ " at an annual interest rate of " + decimalFormat.format(annualInterestRate)
		+ " would be " + decimalFormat.format(monthlyRepayments));


	}

}
