# Athena
This repository contains the audio evaluation algorithm used in Athena 

## Swift Version
To import the algorithm, you can simply add the EvaluationBrain.swift file into the directory that contains all the other .swift files
Then add following code into your project

```C++
var brain = EvaluationBrain()

var score = brain.calSimilarity(test: str1, standard: str2)

print(score)
```
Here str1 is the string to be tested and str2 is the standard string. The return value is a double variable indicates the similarity level

If you still not sure how to run the EvaluationBrain, please see the main.swift file, here I gives a small demo that shows the similarity level between "I sheep" and "I am a ship". You can copy-paste the code into your project.

### NPTuple
You can see there is a NPTuple.swift in the EvaluationApp directory. This is a self-designed class storing all strings that need further practice. Basicly, it has consists of 3 parts:
* <b>test string</b>:   the string that need further practice, if the test string is empty, this means that the relevant standard string is missing
  
* <b>standard string</b>:   the standard string for the correct pronounciation
  
* <b>score</b>:   the score (used for color)

Also, I designed some functions for this data structure, to make it easy to use. Here is some API
 * <b>init(lib: String, test: String, score: Double)</b> </br>
   Constructor for this data structure, you should pass a standard string, test string and a score
 
 * <b>func toString() -> String</b> </br>
   Transfer the current NPTuple to a string that display all its instance variables in a pretty string format
 
 * <b>func needCompare() -> Bool</b> </br>
   This function told whether this is a missing or refine NPTuple, if it return true, it means the user miss the words, otherwise it will return false.
  
> Thanks to NAlexA's answer on StackOverflow and his String extension code, which makes the implementation of this algorithm easier. Here is the link of his/her <a href="http://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language">answer</a>


