import java.util.Scanner;

public class plantClassification
{
    public static void main(String[] args)
    {
        // Loop used so break function can be implemented
        for(int i = 0; i < 1; i++)
        {
            System.out.print("Does the plant have cells and tissues which are organised" +
                    " into functional structures (Yes/No)? ");
            Scanner input = new Scanner(System.in);
            String ansOne = input.nextLine();
            if(ansOne.equalsIgnoreCase("No"))
            {
                System.out.println("The plant is an ALGAE.");
                break;
            }

            System.out.print("Does the plant have vascular tissues (Yes/No)? ");
            String ansTwo = input.nextLine();
            if(ansTwo.equalsIgnoreCase("No"))
            {
                System.out.println("The plant is a BRYOPHYTE.");
                break;
            }

            System.out.print("Is the plant dispersed by seeds (Yes/No)? ");
            String ansThree = input.nextLine();
            if(ansThree.equalsIgnoreCase("No"))
            {
                System.out.println("The plant is a PTERIDOPHYTE. ");
                break;
            }

            System.out.print("Are the seeds enclosed (Yes/No)? ");
            String ansFour = input.nextLine();
            if(ansFour.equalsIgnoreCase("No"))
            {
                System.out.println("The plant is a GYMNOSPERM.");
                break;
            }
            else if(ansFour.equalsIgnoreCase("Yes"))
            {
                System.out.println("The plant is an ANGIOSPERM.");
                break;
            }
        }
    }
}
