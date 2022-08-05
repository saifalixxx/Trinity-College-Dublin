import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Scanner;

public class Median {

	public static double [] createSortedArray (double [] inArray)
	{
		if (inArray == null)
		{
			return null;
		}
		else
		{
			double [] tempArray = Arrays.copyOf(inArray, inArray.length);
			Arrays.sort(tempArray);
			return tempArray;
		}

	}

	public static String convertToString (double [] inArray)
	{
		String arrayString = "{ ";

		if (inArray != null)
		{
			for (int count = 0; count < inArray.length; count++)
			{
				arrayString += String.format("%.1f", inArray[count]);

				if ((inArray.length > 1) && (inArray.length - count != 1))
				{
					arrayString = arrayString + ", ";
				} 
			}
			arrayString += " }";
			return arrayString;
		}
		else
		{
			return "{ }";

		}
	}

	public static double computeMedian (double [] unArray)
	{
		double median = 0;
		if (unArray == null)
		{
			return 0;
		}

		double [] inArray = createSortedArray (unArray);

		if (inArray.length % 2 == 0)
		{
			median = ((double) inArray[inArray.length/2] + (double)inArray[inArray.length/2 - 1])/2;
		}
		else
		{
			median = (double) inArray[inArray.length/2];
		}
		return median;
	}

	public static double computeRollingAverage(double[] roArray, int inNum) {
		double averageOfValues;

		if (roArray != null) 
		{
			double inSum = 0;
			int ifCount = 0;

			if (inNum == 0) 
			{
				return 0;
			} 
			else if (roArray.length <= inNum) {
				for (ifCount = 0; ifCount < roArray.length; ifCount++) 
				{
					inSum += roArray[ifCount];
				}
				averageOfValues = inSum / roArray.length;
			}
			else 
			{
				for (ifCount = (roArray.length - inNum); ifCount < roArray.length; ifCount++) {
					inSum += roArray[ifCount];
				}
				averageOfValues = (inSum / inNum);
			}
			return averageOfValues;
		} 
		else 
		{
			return 0;
		}
	}

	public static void main (String[] args)
	{
		System.out.print("Welcome to the median & rolling average system.\n");

		Scanner input = new Scanner(System.in);
		boolean quit = false;
		double[] array = {};
		int randomEnters = 3;

		do {
			System.out.print("Enter a number (or enter quit): ");

			if (input.hasNextDouble())
			{
				double[] tempArray = new double[(int) (array.length + 1)];
				System.arraycopy(array, 0, tempArray, 0, array.length);
				tempArray[(int) (tempArray.length - 1)] = input.nextDouble();
				array = tempArray;

				double averageOfValues = computeRollingAverage(array, randomEnters);
				String arrayString = convertToString(array);
				double medianOfValues = computeMedian(array);

				System.out.printf("The median of %s is %.1f and the " +
						"rolling average of the last %d values is %.1f.\n"
						, arrayString, medianOfValues, randomEnters, averageOfValues);
			} 
			else if (input.hasNext("quit")) 
			{
				quit = true;
			} 
			else    
			{
				System.out.print("Error - Enter any real number or quit.\n");
				input.next();
				
			}
		}
		while (!quit);
		input.close();

	}
}
