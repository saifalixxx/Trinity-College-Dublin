package averageStandardDev;

import java.util.Scanner;

public class averageStandardDev {

	public static void main(String[] args) {
		
		double inAverage = 0;
		
		System.out.print("Input 1st number: ");
		Scanner input = new Scanner(System.in);
		double numOne = input.nextDouble();
		
		System.out.print("Input 2nd number: ");
		double numTwo = input.nextDouble();
		
		System.out.print("Input 3rd number: ");
		double numThree = input.nextDouble();
		
		inAverage = ((numOne + numTwo + numThree)/3);
		
		System.out.println("Average : " + inAverage);
		
		
		double standardDev1 = 0;
		double standardDev2 = 0;
		double standardDev3 = 0;
		
		standardDev1 = Math.sqrt((((numOne - inAverage)*(numOne - inAverage))/3));
		standardDev2 = Math.sqrt((((numTwo - inAverage)*(numTwo - inAverage))/3));
		standardDev3 = Math.sqrt((((numThree - inAverage)*(numThree - inAverage))/3));
		
				
		
		System.out.println("Standard deviation for 1st number : " + standardDev1);
		System.out.println("Standard deviation for 2nd number : " + standardDev2);
		System.out.println("Standard deviation for 3rd number : " + standardDev3);

	}

}
