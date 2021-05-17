#Bitmap Project
#Thomas Kahng
#This will move a bit that will have to capture pixels 

################ Data values used ###################
#Dimensions
.eqv	WIDTH	64
.eqv	HEIGHT	64

#Memory address of origin pixel
.eqv 	MEM 	0x10010000

#Colorsg
.eqv	RED 	0x00FF0000
.eqv	GREEN 	0x0000FF00
.eqv	BLUE	0x000000FF
.eqv	WHITE	0x00FFFFFF
.eqv	YELLOW	0x00FFFF00
.eqv	CYAN	0x0000FFFF
.eqv	MAGENTA	0x00FF00FF	
.eqv	BLACK	0x00000000

#Color array for marquee effect, plus macro files
	.data 
.include	"macros-BitmapProject.asm"
colors:	.word	RED, GREEN, BLUE, WHITE, YELLOW, CYAN, MAGENTA

score:	.word	0
wonGame:	
	.asciiz	"\nCongratulations! You're a winner!\n"
lostGame:
	.asciiz	"\nBetter luck next time!\n"
currScore:
	.asciiz	"Current Score: "
finalScore:
	.asciiz	"Final Score: "
newLine:
	.asciiz	"\n"
playAgain:
	.asciiz "Play again?"
player:
	.asciiz	"Player 1?"
chosenP1:
	.asciiz "You chose to be Player 1!\n\n"
chosenP2:
	.asciiz "You chose to be Player 2!\n\n"
goodbye: 
	.asciiz	"Goodbye!"
################ Data values used ###################

############# Main method ##################
	.text	
	
chooseGame:
	#Reset a regisers
	li	$a0, 0
	li	$a1, 0
	li	$a2, 0
	li	$a3, 0
	
	#Reset s regisers
	li	$s0, 0
	li	$s1, 0
	li	$s2, 0
	li	$s3, 0
	li	$s4, 0
	li	$s5, 0
	li	$s6, 0
	li	$s7, 0
	
	#Ask user to choose player
	li	$v0, 50
	la	$a0, player
	syscall
	
	#Choose player 1 or player 2, or exit
	beq	$a0, 2, exit
	beq	$a0, 1 chosenPlayer2
	beq	$a0, 0 chosenPlayer1
	
chosenPlayer1:
	#User chose to be player 1
	li	$v0, 4
	la	$a0, chosenP1
	syscall
	
	#Play as player 1
	li	$s6, 1
	intro()
	j	player1
	
chosenPlayer2:
	#User chose to be player 2
	li	$v0, 4
	la	$a0, chosenP2
	syscall
	
	#Play as player 2
	li	$s6, 2
	intro()
	j	player2
	
player1:
	#Reset location of starting height and width 
	addi	$s0, $zero, WIDTH
	div	$s0, $s0, 2
	addi	$s1, $zero, HEIGHT
	div	$s1, $s1, 2
	
	#Preinitialize colors and movement
	addi	$a1, $zero, WHITE
	addi	$a2, $zero, BLACK
	addi	$a3, $zero, BLACK
	add	$s7, $zero, $zero
	
	#Number of iterations, and current score, play the game
	li	$s4, 0 
	li	$s5, 0
	catchWhite()
	
player2:
	#Reset location of starting height and width 
	addi	$s0, $zero, WIDTH
	div	$s0, $s0, 2
	addi	$s1, $zero, HEIGHT
	div	$s1, $s1, 2
	
	#Preinitialize colors and movement
	addi	$a1, $zero, WHITE
	addi	$a2, $zero, BLACK
	addi	$a3, $zero, BLACK
	add	$s7, $zero, $zero
	
	#Number of iterations, and current score, play the game
	li	$s4, 0 
	li	$s5, 0
	catchRed()

again:	
	#Ask user if wants to play again
	li	$v0, 50
	la	$a0, playAgain
	syscall
	beqz	$a0, chooseGame
	
exit:
	#Say goodbye
	li	$v0, 56
	la	$a0, goodbye
	syscall
	
	#Exit when finihed
	li	$v0, 10
	syscall
############# Main method ##################
