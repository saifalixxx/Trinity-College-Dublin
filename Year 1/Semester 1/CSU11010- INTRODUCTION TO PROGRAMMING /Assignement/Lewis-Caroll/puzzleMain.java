/* SELF ASSESSMENT

1. readDictionary
- I have the correct method definition [Mark out of 5]: 5
- Comment: I believe i have the correct method definition.
- My method reads the words from the "words.txt" file. [Mark out of 5]: 5
- Comment: I have my code implemented to read from the "words.txt" file.
- It returns the contents from "words.txt" in a String array or an ArrayList. [Mark out of 5:]
- Comment: I believe my program returns the contents from "words.txt".

2. readWordList
- I have the correct method definition [Mark out of 5]: 5
- Comment: I have the correct method definition.
- My method reads the words provided (which are separated by commas, saves them to an array or ArrayList of String references and returns it. [Mark out of 5]: 5
- Comment: My method reads the words provided.

3. isUniqueList
- I have the correct method definition [Mark out of 5]: 5
- Comment: I have the correct method definition.
- My method compares each word in the array with the rest of the words in the list. [Mark out of 5]: 3
- Comment: I think my method compares each word in the array with the rest of the words in the list.
- Exits the loop when a non-unique word is found. [Mark out of 5]: 5
- Comment: I think my program exits the loop when a non-unique word is found.
- Returns true is all the words are unique and false otherwise. [Mark out of 5]: 0
- Comment: My program does not return true.

4. isEnglishWord
- I have the correct method definition [Mark out of 5]: 5
- Comment: I have the correct method definition.
- My method uses the binarySearch method in Arrays library class. [Mark out of 3]: 2
- Comment: I think my method uses the binarySearch method in Arrays library class.
- Returns true if the binarySearch method return a value >= 0, otherwise false is returned. [Mark out of 2]: 2
- Comment: My program returns true.

5. isDifferentByOne
- I have the correct method definition [Mark out of 5]: 5
- Comment: I have the correct method definition.
- My method loops through the length of a words comparing characters at the same position in both words searching for one difference. [Mark out of 10]: 10
- Comment: My method loops through the length of a words comparing characters at the same position in both words searching for one difference.

6. isWordChain
- I have the correct method definition [Mark out of 5]: 5
- Comment: I have the correct method definition.
- My method calls isUniqueList, isEnglishWord and isDifferentByOne methods and prints the appropriate message [Mark out of 10]: 10
- Comment: My method calls these functions.

7. main
- Reads all the words from file words.txt into an array or an ArrayList using the any of teh Java.IO classes covered in lectures [Mark out of 10]:10
- Comment: My program reads all the words from the file words.
- Asks the user for input and calls isWordChain [Mark out of 5]: 5
- Comment: My program asks the user for input and calls isWordChain.

 Total Mark out of 100 (Add all the previous marks): 92
*/

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;
import java.util.Set;
import java.util.HashSet;
import java.lang.String;

public class puzzleMain
{
    private final static int NOT_FOUND = -1;

    public static ArrayList<String> readDictionary()
    {
        ArrayList<String> arrList = new ArrayList<String>();

        try
        {
            File myObj = new File("words.txt");
            Scanner fileReader = new Scanner(myObj);
            while (fileReader.hasNextLine())
            {
                String data = fileReader.nextLine().replaceAll("\\s", "");
                arrList.add(data);
            }
            fileReader.close();
        }
        catch (FileNotFoundException e)
        {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
        return arrList;
    }

    public static ArrayList<String> readWordList()
    {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter a comma separated list of words (or an empty list to quit):\n");
        String inReader = scanner.nextLine().replaceAll("\\s", "");
        if(inReader.length()==0)
        {
            System.exit(0);
        }
        return new ArrayList<String>(Arrays.asList(inReader.split(",")));
    }

    public static boolean isUniqueList(ArrayList<String> isUnique)
    {
        Set<String> s = new HashSet<String>(isUnique);
        return (s.size() == isUnique.size());
    }

    public static boolean isEnglishWord(ArrayList<String> isEnglish, String word) // Binary search
    {
        int low = 0;
        int high = isEnglish.size() - 1;
        int mid = (low + high) / 2;

        while (low <= high && !isEnglish.get(mid).equalsIgnoreCase(word))
        {

            if (isEnglish.get(mid).compareTo(word) < 0)
            {
                low = mid + 1;
            }
            else {
                high = mid - 1;
            }

            mid = (low + high) / 2;

            if (low > high)
            {
                mid = NOT_FOUND;
            }

        }
        return true;
    }

    public static boolean isDifferentByOne(String alpha, String bravo)
    {
        if(alpha.length() != bravo.length())
        {
            return false;
        }

        int count  =0 ;

        for (int i=0; i < alpha.length(); i++)
        {
            if (alpha.charAt(i) != bravo.charAt(i))
            {
                count++;
            }
        }

        if (count == 1)
        {
            return true;
        }

        return false;
    }

    public static boolean isWordChain(ArrayList<String> isChain)
    {
        ArrayList<String> dictionary = readDictionary();
        for (String x : isChain)
        {
            if (!isEnglishWord(dictionary,x))
            {
                return false;
            }
        }

        for (int i=0;i<isChain.size()-1;i++)
        {
            if(!isDifferentByOne(isChain.get(i),isChain.get(i+1)))
            {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args)
    {
        while(true)
        {
            boolean result = isWordChain(readWordList());

            if (result) {
                System.out.println("Valid chain of words from Lewis Carroll's word-links game.");
            } else {
                System.out.println("Not a valid chain of words from Lewis Carroll's word-links game.");
            }
        }

    }

}
