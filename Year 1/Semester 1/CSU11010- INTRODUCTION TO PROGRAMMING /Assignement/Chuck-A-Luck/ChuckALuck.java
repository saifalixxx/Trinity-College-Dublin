/* SELF ASSESSMENT

1. ResolveBet

    I have correctly defined ResolveBet which takes the bet type (String) and the Wallet object, and a void return type [Mark out of 7: 7 ].
    Comment: I believe I have correctly defined ResolveBet.
    My program presents the amount of cash in the wallet and asks the user how much he/she would like to bet [Mark out of 8:8 ].
    Comment: Yes my program asks how much is in the wallet and the amount of bet they need to place.
    My program ensures the bet amount is not greater than the cash in the wallet [Mark out of 5:5 ].
    Comment: I ensured that the bet amount is not greater than the funds in the wallet.
    My program creates three Dice objects, rolls them and creates a total variable with a summation of the roll values returned [Mark out of 15:10 ]..
    Comment: I have created three dice objects however, i am not sure if i have done it properly.
    My program determines the winnings by comparing the bet type with the total and comparing the bet type with the dice faces for the triple bet [Mark out of 20:20 ].
    Comment: I believe my code compares the bet type with the total and the dice face.
    My program outputs the results (win or loss) and adds the winnings to the wallet if user wins or removes the bet amount from the wallet if the user loses [Mark out of 10:7 ].
    Comment: My program returns the wins and losses. However, im not sure if i did it correctly.

2. Main

    I ask the user for the amount of cash he/she has, create a Wallet object and put this cash into it [Mark out of 15: 15 ]
    Comment: I believe i have done this correctly.
    My program loops continuously until the user either enters quit or the cash in the wallet is 0 [Mark out of 5: 3]
    Comment: My loop continuously continuous until some one types quit. However, if you input more than what you have in the wallet, my program stops.
    I ask the user to enter any of the four bet types or quit [Mark out of 5: 5].
    Comment: I have asked did this correctly.
    My program calls resolveBet for each bet type entered [Mark out of 5: 5 ].
    Comment: My program calls ResolveBet.
    At the end of the game my program presents a summary message regarding winnings and losses [Mark out of 5: 5 ]
    Comment: I have a summary message in my output.


 Total Mark out of 100 (Add all the previous marks): 90
*/

import java.util.Scanner;

public class ChuckALuck
{

public static void ResolveBet(String betType, Wallet myWallet)
{
     Dice myDice = new Dice();
     Dice myDice2 = new Dice();
     Dice myDice3 = new Dice();

     double inSum = 0;
     double thirtyResult = 0;
     double inResult = 0;
     double newBetMoney = 0;
     double newBalance = 0;

     int rollResult = myDice.roll();
     int rollResult2 = myDice2.roll();
     int rollResult3 = myDice3.roll();

     boolean noMoney = false;

     boolean houseWinsT = false;
     boolean youWinT = false;

     boolean houseWinsF = false;
     boolean youWinF = false;

     boolean houseWinsH = false;
     boolean youWinH = false;

     boolean houseWinsL = false;
     boolean youWinL = false;

     inSum = rollResult +  rollResult2 + rollResult3;

     System.out.print("Bet amount: ");
     Scanner InputR =new Scanner(System.in);
     double betInput = InputR.nextDouble();

     if(betInput > myWallet.check())
     {
          System.err.println("Insufficient funds in wallet ");
          System.exit(0);
     }


     if(rollResult == rollResult2 && rollResult2 == rollResult3 && inSum != 3 && inSum != 18)
     {
          youWinT = true;
          thirtyResult = betInput * 30;
     }
     else if(inSum == 3 || inSum == 18)
     {
          houseWinsT = true;
          inResult = betInput * 1;
     }


     if(inSum < 8 || inSum > 12)
     {
          youWinF = true;
          inResult = betInput * 1;
     }
     else
     {
          houseWinsF = true;
          inResult = betInput * 1;
     }


     if(inSum > 10)
     {
          youWinH = true;
          inResult = betInput * 1;
     }
     else if(inSum > 10 && rollResult == rollResult2 && rollResult2 == rollResult3)
     {
          houseWinsH = true;
          inResult = betInput * 1;
     }


     if(inSum < 11)
     {
          youWinL = true;
          inResult = betInput * 1;
     }
     else if(inSum < 11 && rollResult == rollResult2 && rollResult2 == rollResult3)
     {
          houseWinsL = true;
          inResult = betInput * 1;
     }

     if(betType.equalsIgnoreCase("Triple"))
     {
          if(youWinT)
          {
               System.out.println("Dice outcome: " + rollResult + "," + rollResult2 + "," + rollResult3);
               System.out.println("You win " + thirtyResult);
               myWallet.put(thirtyResult);
               System.out.println("Balance: " + "[" + myWallet.check() +"]");
          }
          else
          {
               System.out.println("Dice outcome: " + rollResult + "," + rollResult2 + "," + rollResult3);
               System.out.println("You Lose "+ inResult);
               myWallet.get(inResult);
               System.out.println("Balance: " + "[" + myWallet.check() + "]");
          }

     }

     if(betType.equalsIgnoreCase("Field"))
     {
          if(youWinF)
          {
               System.out.println("Dice outcome: " + rollResult + "," + rollResult2 + "," + rollResult3);
               System.out.println("You win " + inResult);
               myWallet.put(inResult);
               System.out.println("Balance: " + "[" + myWallet.check() +"]");
          }
          else
          {
               System.out.println("Dice outcome: " + rollResult + "," + rollResult2 + "," + rollResult3);
               System.out.println("You Lose "+ inResult);
               myWallet.get(inResult);
               System.out.println("Balance: " + "[" + myWallet.check() + "]");
          }
     }

     if(betType.equalsIgnoreCase("High"))
     {
          if(youWinH)
          {
               System.out.println("Dice outcome: " + rollResult + "," + rollResult2 + "," + rollResult3);
               System.out.println("You win " + inResult);
               myWallet.put(inResult);
               System.out.println("Balance: " + "[" + myWallet.check() +"]");
          }
          else
          {
               System.out.println("Dice outcome: " + rollResult + "," + rollResult2 + "," + rollResult3);
               System.out.println("You Lose "+ inResult);
               myWallet.get(inResult);
               System.out.println("Balance: " + "[" + myWallet.check() + "]");
          }
     }

     if(betType.equalsIgnoreCase("Low"))
     {
          if(youWinL)
          {
               System.out.println("Dice outcome: " + rollResult + "," + rollResult2 + "," + rollResult3);
               System.out.println("You win " + inResult);
               myWallet.put(inResult);
               System.out.println("Balance: " + "[" + myWallet.check() +"]");
          }
          else
          {
               System.out.println("Dice outcome: " + rollResult + "," + rollResult2 + "," + rollResult3);
               System.out.println("You Lose "+ inResult);
               myWallet.get(inResult);
               System.out.println("Balance: " + "[" + myWallet.check() + "]");
          }
     }

}

     public static void main(String[] args)
     {
          Wallet myWallet = new Wallet();
          Dice myDice = new Dice();

          int inSum = 0;
          int countWin = 0;
          int countLosses = 0;

          System.out.print("How much cash do you have: ");
          Scanner Input = new Scanner(System.in);
          double cashInput = Input.nextDouble();
          myWallet.put(cashInput);


          while (cashInput > myWallet.check() || cashInput !=0 )
          {
               double previousCheck = myWallet.check();

               System.out.print("Bet type (Triple, High, Low) or 'quit': ");
               String inBet = Input.next();


               if(inBet.equalsIgnoreCase("quit"))
               {
                    break;
               }

               ResolveBet(inBet,myWallet);

                if(myWallet.check() > previousCheck)
               {
                    countWin++;
               }
                else
                {
                     countLosses++;
                }

          }

          System.out.println("Summary- ");
          System.out.println("You won: " + countWin);
          System.out.print("You Losses: " + countLosses);

     }
     /**/   // press enter in between
}


