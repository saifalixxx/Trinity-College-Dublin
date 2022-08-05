import java.util.Scanner;

public class GradeComputation {
	

	public static void main(String[] args) {
    final String[] MODULE_CODES   = { "CSU11001", "CSU11010", "CSU11013", "CSU11021", "CSU11022", "CSU11026",
    		"CSU11031", "CSU11081", "CSU12002", "STU11002" };
    
    final int[]    MODULE_CREDITS = {  5,          10,         5,          5,          5,      
    		10,         5,          5,          5,          5         };



		System.out.println("Welcome to the first year grade assessor.");
		double inGrad = 0;
		boolean quit = false;
		
		do
		{
			
			System.out.println("Enter the student mark for " + MODULE_CODES [0] +" (or enter quit): ");
			Scanner input = new Scanner(System.in);
		    inGrad = input.nextDouble();
		    
			if (input.hasNext("quit"))
			{
				quit = true;
			}
			else
			{
				System.out.print("Error - Enter a number between 0.0 and 100.0 or quit.");
				input.next();
			}
			

		} while (!quit);
		

	}

}
