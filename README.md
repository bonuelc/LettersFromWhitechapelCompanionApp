# LettersFromWhitechapelCompanionApp
Companion App for the board game Letters from Whitechapel

[Board Game Image](https://cf.geekdo-images.com/images/pic2291287.jpg)

[Rulebook](https://images-cdn.fantasyflightgames.com/ffg_content/letters-from-whitechapel/LFH_rules_letter_EN%20low%20res.pdf)

# Letters from Whitechapel Overview

Letters from Whitechapel is a two-sided (Jack the Ripper vs. 5 policemen), cat-and-mouse game played over four rounds.

Jack begins by choosing his hideout location for the entire game. Jack will commit murder in the first part of each round.* The location of the murder will be his starting point for the second part of each round in which Jack has 19 moves maximum to make it back to his chosen hideout (otherwise he loses).

The locations of the policemen is known 
The location of the murder (starting point of Jack) is known to all players while Jack's movements are not.

# Basic Movement Rules

Policemen are always located on squares.
Jack is always located on circles.

Policemen may move 0-2 times from one square to an adjacent square (any path that doesn't cross another square) each turn.
Jack must move from one circle to an adjacent circle (any path that doesn't cross another circle) each turn. Jack cannot cross any path containing police. If Jack cannot move, Jack loses.

Jack has a number of special movement rules each round. See rulebook for details.

# Turns

Jack moves first, then all the policemen move (in any order), then all the policemen take an action (in any order). Repeat until round is over.

A policeman's action can be either 1) search for clues or 2) attempt an arrest.
1) The policeman asks Jack if he is or has been at ANY circle location adjacent (any path that doesn't cross another square or circle) to that policeman during that round. Jack must say yes or no.*
2) The policeman can attempt to make an arrent at ONE circle location adjacent to that policeman. If Jack is currently at that location, the policemen win.

# App Inpiration
This board game is very fun but takes longer than necessary because of tedious manual calculations. The purpose of this app is to streamline the time-consuming (and less fun) part of the game.

Examples:

• If Jack started at location W, made it to his hideout in 15 moves, and was at locations X, Y, and Z at some point, where can his hideout be? (Considering the Jack-can't-pass-through-policemen rule, this could be further narrowed down. VERY time-consuming to calculate by hand.)

• Given when Jack used his special movements, where can Jack's hideout be?

• Given the data from previous rounds, where can Jack's hideout be?

• Given the location of the policemen and Jack, what is the minimum amount of moves that allows Jack to make it back to his hideout in time? (App could eliminate moves that would guarantee Jack's loss)

*over-simplification of the rules. See rulebook for details.
