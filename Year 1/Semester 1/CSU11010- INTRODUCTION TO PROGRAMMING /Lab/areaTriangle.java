package areaTriangle;

import java.util.Scanner;

public class areaTriangle {

	public static void main(String[] args) {
		
		
		System.out.print("Input 1st vertices: ");
		Scanner Input = new Scanner(System.in);
		int x1 = Input.nextInt();
		int y1 = Input.nextInt();
		
		System.out.print("Input 2nd vertices: ");
		int x2 = Input.nextInt();
		int y2 = Input.nextInt();
		
		System.out.print("Input 3rd vertices: ");
		int x3 = Input.nextInt();
		int y3 = Input.nextInt();
		
		double inArea = 0;
		
		inArea = Math.abs(((x1 * (y2 - y3)) + (x2 * (y3 - y1)) + (x3 * (y1 - y2)))/2);
		
		System.out.println("Area equals: " + inArea);
		

	}

}
