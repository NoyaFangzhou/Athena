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

If you still not sure how to run the EvaluationBrain, please see the main.swift file, here I gives a small demo that shows the similarity level between "Thesis god" and "This is good". You can copy-paste the code into your project.

> Thanks to NAlexA's answer on StackOverflow and his String extension code, which makes the implementation of this algorithm easier. Here is the link of his/her <a href="http://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language">answer</a>


