import java.util.Scanner;

public class BMI {

	public static void main(String[] args) {
		
		System.out.print("What is your weight in kg? ");
		Scanner input = new Scanner( System.in );
		Double weight = input.nextDouble();

		System.out.println("What is your height in metres? " );
		Double height= input.nextDouble();
		input.close();

		//weight/height^2
		float bmi =(float) (weight/ Math.pow(height,2));

		System.out.println("Your BMI is "+bmi );


	}

}
