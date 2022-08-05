import java.util.Scanner;

public class vertebrate
{
    public static void main(String[] args)
    {
        for(int i = 0; i < 4; i++)
        {
            System.out.print("Is the animal cold?: ");
            Scanner input = new Scanner(System.in);
            String answer = input.nextLine();

            if(answer.equalsIgnoreCase("Yes"))
            {
                System.out.print("Does the animal have moist skin?: ");
                String answerA = input.nextLine();

                if(answerA.equalsIgnoreCase("Yes"))
                {
                    System.out.println("Its a Amphibian");
                    break;
                }

                else if(answerA.equalsIgnoreCase("No"))
                {
                    System.out.print("Does the animal have fins?: ");
                    String answerRF = input.nextLine();

                    if(answerRF.equalsIgnoreCase("Yes"))
                    {
                        System.out.println("Its a Fish");
                        break;
                    }
                    else if(answerRF.equalsIgnoreCase("No"))
                    {
                        System.out.println("Its a Reptile");
                        break;
                    }
                }
            }

            else if(answer.equalsIgnoreCase("No"))
            {
                System.out.print("Does the animal have hair or fur?: ");
                String answerMB = input.nextLine();

                if(answerMB.equalsIgnoreCase("Yes"))
                {
                    System.out.println("The animal is a Mammal");
                    break;
                }
                else if(answerMB.equalsIgnoreCase("No"))
                {
                    System.out.println("The animal is a Bird");
                    break;
                }
            }

        }
    }
}
