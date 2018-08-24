//
//  main.swift
//  Guessing Game
//
//  Created by Gabriela Torres on 8/20/18.
//  Copyright © 2018 Gabriela Torres. All rights reserved.
//

import Foundation

//Variable that determines if you are still playing
var playingGame = true

//This loops will run while you are playing the game
repeat {
    //Generate a random number
    let randomNumber = Int(arc4random_uniform(101))
    
    //This is the number of guesses a user has to get it right.
    var numberOfGuesses = 5
    
    //Welcome user and prompt for input.
    print("Welcome to the guessing game!")
    print("Please guess a number between 0 and 100.")
    var userGuess = Int(readLine()!)
    
    //Input Validation.
    while userGuess == nil {
        print("Invalid Guess")
        userGuess = Int(readLine()!)
    }
    
    //Make another if statement that says if the user's guess is not equal to the random number, print out wheather the guess is too high or too low.
    if userGuess != randomNumber {
        //Take away user guesses
        while userGuess! != randomNumber && numberOfGuesses > 1 {
            numberOfGuesses -= 1
            //Number of guesses a user has left.
            print("You have \(numberOfGuesses) guesess remaining.")
            if userGuess! > randomNumber {
                //If they guessed too high or too low and what to do.
                print("You guessed too high; try guessing lower this time.")
            } else if userGuess! < randomNumber {
                print("You guessed too low; try guessing higher this time.")
            }
            
            userGuess = Int(readLine()!)
            while userGuess == nil {
                print("Invalid Guess")
                userGuess = Int(readLine()!)
            }
        }
    }
    
    //Check to see if the user is out of guesses and hasn't guessed the correct answer.
    if numberOfGuesses == 1 && userGuess != randomNumber {
        //Tell that they lost the game.
        print("You guessed the number wrong. The correct answer was \(randomNumber).")
        //See if they want to play again.
        print("Would you like to play again? Y/N")
        let stillPlaying = readLine()!.uppercased()
        while stillPlaying != "Y" && stillPlaying != "N" {
            print("Would you like to play again? Y/N")
        }
        if stillPlaying == "N" {
            playingGame = false
            print("Okay, bye.")
        }
    }
    
    //Check to see if the user guess is equal to the random number.
    if userGuess == randomNumber {
        //Tell user they won and if the want to play again.
        print("You guessed the number correct!")
        print("Would you like to play again? Y/N")
        
        //Get user input to check.
        var stillPlaying = readLine()!.uppercased()
        
        //If they HAVEN'T entered a Y or a N, keep asking them for input until they do.
        while stillPlaying != "Y" && stillPlaying != "N" {
            print("Would you like to play? Y/N")
            stillPlaying = readLine()!.uppercased()
        }
        
        //If they enter N, set playingGame to false (which will end the game).
        if stillPlaying == "N" {
            playingGame = false
            print("Okay, bye.")
        }
    }
} while playingGame == true
