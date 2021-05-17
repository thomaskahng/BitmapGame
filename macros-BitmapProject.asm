.macro	intro()
################ Draw 3 ################
	.text
blink3:
	#Draw yellow 3
	pause()
	addi	$a1, $zero, YELLOW
	jal	draw3
	
	#Black out yellow 3
	pauseIntro()
	jal	blackout3
	pauseIntro()
	j	blink2
	
draw3:
	#Counters
	li	$t0, 0
	li	$t1, 0
	
	#Set starting location if bit to draw
	addi	$s0, $zero, WIDTH
	div	$s0, $s0, 2
	addi	$s1, $zero, HEIGHT
	div	$s1, $s1, 4
	
stepOne3:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s3, $s1, WIDTH
	add	$s3, $s0, $s3
	mul	$s3, $s3, 4
	addi	$s3, $s3, MEM
	sw	$a1, ($s3)
	
	#Go one bit right, iterate count
	addi	$s0, $s0, 1
	addi	$t0, $t0, 1
	blt	$t0, 10, stepOne3
	
stepTwo3:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s3, $s1, WIDTH
	add	$s3, $s0, $s3
	mul	$s3, $s3, 4
	addi	$s3, $s3, MEM
	sw	$a1, ($s3)
	
	#Go one bit down, iterate count
	addi	$s1, $s1, 1
	addi	$t1, $t1, 1
	blt	$t1, 10, stepTwo3
	
stepThree3:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s3, $s1, WIDTH
	add	$s3, $s0, $s3
	mul	$s3, $s3, 4
	addi	$s3, $s3, MEM
	sw	$a1, ($s3)
	
	#Go one bit left, iterate count
	addi	$s0, $s0, -1
	addi	$t0, $t0, -1
	bgt	$t0, 0, stepThree3
	
stepFour3:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s3, $s1, WIDTH
	add	$s3, $s0, $s3
	mul	$s3, $s3, 4
	addi	$s3, $s3, MEM
	sw	$a1, ($s3)
	
	#Go one bit right, iterate count
	addi	$s0, $s0, 1
	addi	$t0, $t0, 1
	blt	$t0, 10, stepFour3
	
stepFive3:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s3, $s1, WIDTH
	add	$s3, $s0, $s3
	mul	$s3, $s3, 4
	addi	$s3, $s3, MEM
	sw	$a1, ($s3)
	
	#Go one bit down, iterate count
	addi	$s1, $s1, 1
	addi	$t1, $t1, 1
	blt	$t1, 20, stepFive3
	
stepSix3:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s3, $s1, WIDTH
	add	$s3, $s0, $s3
	mul	$s3, $s3, 4
	addi	$s3, $s3, MEM
	sw	$a1, ($s3)
	
	#Go one bit left, iterate count
	addi	$s0, $s0, -1
	addi	$t0, $t0, -1
	bgt	$t0, 0, stepSix3

#Return 3 to display	
return3:
	jr	$ra
	
blackout3:
	#Load 3 on top of stack to blackout
	addi	$a1, $zero, BLACK
	addi	$sp, $sp, -4
   	sw 	$ra, 4($sp)             
	jal	draw3
	
returnBlack3:
	#Take out from stack and blackout 3
	lw 	$ra, 4($sp)
   	addi 	$sp, $sp, 4 
   	jr	$ra
################ Draw 3 ################

################ Draw 2 ################	
blink2:
	#Draw yellow 2
	addi	$a1, $zero, YELLOW
	jal	draw2
	
	#Blackout yellow 2
	pauseIntro()
	jal	blackout2
	pauseIntro()
	j	blink1
	
draw2:
	#Iterators
	li	$t0, 0
	li	$t1, 0
	
	#Starting location of first bit
	addi	$s0, $zero, WIDTH
	div	$s0, $s0, 2
	addi	$s1, $zero, HEIGHT
	div	$s1, $s1, 4
	
stepOne2:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s3, $s1, WIDTH
	add	$s3, $s0, $s3
	mul	$s3, $s3, 4
	addi	$s3, $s3, MEM
	sw	$a1, ($s3)
	
	#Go one bit right, iterate count
	addi	$s0, $s0, 1
	addi	$t0, $t0, 1
	blt	$t0, 10, stepOne2
	
stepTwo2:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s3, $s1, WIDTH
	add	$s3, $s0, $s3
	mul	$s3, $s3, 4
	addi	$s3, $s3, MEM
	sw	$a1, ($s3)
	
	#Go one bit down, iterate count
	addi	$s1, $s1, 1
	addi	$t1, $t1, 1
	blt	$t1, 10, stepTwo2
	
stepThree2:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s3, $s1, WIDTH
	add	$s3, $s0, $s3
	mul	$s3, $s3, 4
	addi	$s3, $s3, MEM
	sw	$a1, ($s3)
	
	#Go one bit left, iterate count
	addi	$s0, $s0, -1
	addi	$t0, $t0, -1
	bgt	$t0, 0, stepThree2
	
stepFour2:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s3, $s1, WIDTH
	add	$s3, $s0, $s3
	mul	$s3, $s3, 4
	addi	$s3, $s3, MEM
	sw	$a1, ($s3)
	
	#Go one bit down, iterate count
	addi	$s1, $s1, 1
	addi	$t1, $t1, 1
	blt	$t1, 20, stepFour2
	
stepFive2:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s3, $s1, WIDTH
	add	$s3, $s0, $s3
	mul	$s3, $s3, 4
	addi	$s3, $s3, MEM
	sw	$a1, ($s3)
	
	#Go one bit right, iterate count
	addi	$s0, $s0, 1
	addi	$t0, $t0, 1
	blt	$t0, 10, stepFive2

#Show 2 drawn in bitmap 
return2:
	jr	$ra
	
blackout2:
	#Allocate byte on top of stack and plack out 2
	addi	$a1, $zero, BLACK
	addi	$sp, $sp, -4
   	sw 	$ra, 4($sp)             
	jal	draw2
	
returnBlack2:
	#Display 2 blacked out
	lw 	$ra, 4($sp)
   	addi 	$sp, $sp, 4 
   	jr	$ra
################ Draw 2 ################

################ Draw 1 ################
blink1:
	#Draw yellow 1
	addi	$a1, $zero, YELLOW
	jal	draw1
	
	#Blackout yellow 1
	pauseIntro()
	jal	blackout1
	pauseIntro()
	j	goToGame
	
draw1:
	#Iterators
	li	$t0, 0
	li	$t1, 0
	
	#Starting location of first drawn bit
	addi	$s0, $zero, WIDTH
	div	$s0, $s0, 2
	addi	$s1, $zero, HEIGHT
	div	$s1, $s1, 4
	
stepOne1:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s3, $s1, WIDTH
	add	$s3, $s0, $s3
	mul	$s3, $s3, 4
	addi	$s3, $s3, MEM
	sw	$a1, ($s3)
	
	#Go one bit down, then iterate
	addi	$s1, $s1, 1
	addi	$t1, $t1, 1
	blt	$t1, 20, stepOne1
	
#Display 1 drawn in bitmap
return1:
	jr	$ra
	
blackout1:
	#Allocate byte on top of stack to blackout 1
	addi	$a1, $zero, BLACK
	addi	$sp, $sp, -4
   	sw 	$ra, 4($sp)             
	jal	draw1
	
returnBlack1:
	#Show 1 blacked out and pop from stack
	lw 	$ra, 4($sp)
   	addi 	$sp, $sp, 4 
   	jr	$ra
################ Draw 1 ################

#If player 1 or player 2?
goToGame:
	beq	$s6, 1, player1
	beq	$s6, 2, player2
	j	exit
.end_macro

#300 ms pause between number flashes
.macro	pauseIntro()
	.text
pause:
	li	$a0, 300
	la	$v0, 32
	syscall
.end_macro

################ Capture white bits ################
.macro	catchWhite()
	.text	
#Draw the object we want to capture
start:	
	j	drawObject
	
player:
	#Load address to read in order to keep Marquee going
	lw	$t8, 0xFFFF0000
	#If no input, keep iterating
	beq	$t8, 0, count
	
	#Load latter address for keyboard functions
	lw	$t9, 0xFFFF0004
	#If space is pressed (byte 32), jump to special point counter
	beq	$t9, 32, spaceHit
	
	#If W is pressed (byte 119), move one pixel up
	beq	$t9, 119, up
	#If S is pressed (byte 115), move one pixel down
	beq	$t9, 115, down
	#If A is pressed (byte 97), move one pixel left
	beq	$t9, 97, left
	#If D is pressed (byte 100), move one pixel right
	beq	$t9, 100, right

count:
	#Keep track of color
	add	$t4, $s7, $zero
	
movePlay:
	#Time to change color?
	bge	$t4, 7, override
	#Convert iteratons to width location in BitMap
	mul	$s3, $s1, WIDTH
	add	$s3, $s0, $s3
	
	#Convert BitMap location to bytes, and add to location of origin pixel 
	mul	$s3, $s3, 4
	addi	$s3, $s3, MEM

	#Find location in color array
	mul	$t2, $t4, 4
	lw	$t2, colors($t2)
	
	#Store pixel location into color red to show pixel (draw pixel), and go one width left (positive)
	sw	$t2, ($s3)
	beq	$s3, $s2, hitPixel
	#Increment to next raonbow color
	addi	$t4, $t4, 1

#New color at next Marquee
nextPlay:
	addi	$s7, $s7, 1
	j	player
	
#Return Marquee box
returnPlayer:
	jr	$ra

#Subtract by 7 if color counter above 7, so it corresponds with array
override:
	subi	$t4, $t4, 7
	j	movePlay
	
up:
	#Blackout the box, go one pixel up (negative y direction) and iterate again
	jal	blackout
	addi	$s1, $s1, -1
	j	count
	
down:
	#Blackout the box, go one pixel down (positive y direction) and iterate again
	jal	blackout
	addi	$s1, $s1, 1
	j	count
	
left:
	#Blackout the box, go one pixel left (negative x direction) and iterate again
	jal	blackout
	addi	$s0, $s0, -1
	j	count
	
right:
	#Blackout the box, go one pixel right (positive x direction) and iterate again
	jal	blackout
	addi	$s0, $s0, 1
	j	count
	
blackout:
	addi	$a2, $zero, BLACK
	#Open space for drawing to berecursively called, having return address stored on top
	addi	$sp, $sp, -4
   	sw 	$ra, 4($sp)             
	jal	blackPixel
	
returnBlackout:
	#Load the data into return address and pop it from stack since we're done using it
	lw 	$ra, 4($sp)
   	addi 	$sp, $sp, 4 
   	jr	$ra
	
blackPixel:
	#Convert iteratons to width location in BitMap
	mul	$s3, $s1, WIDTH
	add	$s3, $s0, $s3
	
	#Convert BitMap location to Bytes, and add to location of origin pixel 
	mul	$s3, $s3, 4
	addi	$s3, $s3, MEM
	#Store pixel location into color red to show pixel (draw pixel), and go one width left (positive)
	sw	$a2, ($s3)
	
#Return the box
returnBlack:
	jr	$ra
	
################# Special play #################
spaceHit:
	#If less than 5 points, skip
	blt	$s5, 5, player
	div	$t4, $s5, 5
	mfhi	$t5
	
	#Score divisible by 5, win, else lose
	beq	$t5, 0,	win
	bne	$t5, 0, lose
	j	player
################# Special play #################

############# Capture the bit #############
drawObject:
	#Count divisible by 2, draw object left
	div	$t1, $s4, 2
	mfhi	$t4
	beq	$t4, $zero, fromLeft
	
	#Count divisible by 3, draw object right
	div	$t1, $s4, 3
	mfhi	$t4
	beq	$t4, $zero, fromRight
	
	#Count divisible by 5, draw object top, else draw object bottom
	div	$t1, $s4, 5
	mfhi	$t4
	beq	$t4, $zero, fromTop
	bne	$t4, $zero, fromBot
	j	player
	
fromLeft:
	#Draw object at left, then iterate count 
	jal	captureLeft
	addi 	$s4, $s4, 1
	j	player
		
fromRight:
	#Draw object at right, then iterate count 
	jal	captureRight
	addi 	$s4, $s4, 1
	j	player

fromTop:
	#Draw object at top,  then iterate count 
	jal	captureTop
	addi 	$s4, $s4, 1
	j	player

fromBot:
	#Draw object at bottom, then iterate count 
	jal	captureBot
	addi 	$s4, $s4, 1
	j	player
############# Capture the bit #############

############# Capture from left #############
captureLeft:
	#Starting X coordinate in bitmap, and flag for bit color
	li	$t6, 4
	li	$s6, 1

	#Starting Y coordinate
	li	$t7, HEIGHT
	div	$t7, $t7, 2
	
	#Color to draw, and to black out
	add	$a1, $zero, WHITE
	add	$a3, $zero, BLACK
	
redOrWhiteL:
	#Count of 0, jump to draw
	beq	$s4, $zero, drawL
	div	$t1, $s4, 5
	mfhi	$s6
	
	#Count divsible by 5, draw red special pixel
	bne	$s6, $zero, drawL
	add	$a1, $zero, RED
	
drawL:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s2, $t7, WIDTH
	add	$s2, $s2, $t6
	mul	$s2, $s2, 4
	addi	$s2, $s2, MEM
	
#Show drawn pixel
showL:
	sw	$a1, ($s2)
	jr	$ra
############# Capture from left#############

############# Capture from right #############
captureRight:
	#Starting X coordinate in bitmap, and flag for bit color
	li	$t6, 60
	li	$s6, 1
	
	#Starting Y coordinate
	li	$t7, HEIGHT
	div	$t7, $t7, 2
	
	#Color to draw, and to black out
	add	$a1, $zero, WHITE
	add	$a3, $zero, BLACK
	
redOrWhiteR:
	#Count of 0, jump to draw
	beq	$s4, $zero, drawR
	div	$t1, $s4, 9
	mfhi	$s6
	
	#Count divsible by 9, draw red special pixel
	bne	$s6, $zero, drawR
	add	$a1, $zero, RED
	
drawR:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s2, $t7, WIDTH
	add	$s2, $s2, $t6
	mul	$s2, $s2, 4
	addi	$s2, $s2, MEM

#Show drawn pixel
showR:
	sw	$a1, ($s2)
	jr	$ra
############# Capture from right #############

############# Capture from top #############
captureTop:
	#Starting X coordinate in bitmap, and flag for bit color
	li	$t6, 4
	li	$s6, 1

	#Starting Y coordinate
	li	$t7, WIDTH
	div	$t7, $t7, 2
	
	#Color to draw, and to black out
	add	$a1, $zero, WHITE
	add	$a3, $zero, BLACK
	
redOrWhiteT:
	#Count of 0, jump to draw
	beq	$s4, $zero, drawT
	div	$t1, $s4, 6
	mfhi	$s6
	
	#Count divsible by 6, draw red special pixel
	bne	$s6, $zero, drawT
	add	$a1, $zero, RED
	
drawT:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s2, $t6, WIDTH
	add	$s2, $s2, $t7
	mul	$s2, $s2, 4
	addi	$s2, $s2, MEM	
	
#Show drawn pixel
showT:
	sw	$a1, ($s2)
	jr	$ra
############# Capture from top #############

############# Capture from bottom #############
captureBot:
	#Starting X coordinate in bitmap, and flag for bit color
	li	$t6, 60
	li	$s6, 1
	
	#Starting Y coordinate
	li	$t7, WIDTH
	div	$t7, $t7, 2
	
	#Color to draw, and to black out
	add	$a1, $zero, WHITE
	add	$a3, $zero, BLACK
	
redOrWhiteB:
	#Count of 0, jump to draw
	beq	$s4, $zero, drawB
	div	$t1, $s4, 5
	mfhi	$s6
	
	#Count divsible by 5, draw red special pixel
	bne	$s6, $zero, drawB
	add	$a1, $zero, RED
	
drawB:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s2, $t6, WIDTH
	add	$s2, $s2, $t7
	mul	$s2, $s2, 4
	addi	$s2, $s2, MEM
	
#Show drawn pixel
showB:
	sw	$a1, ($s2)
	jr	$ra
############# Capture from bottom #############

############# Pixel was hit #############
hitPixel:
	#If less than 1 count, no special operations
	ble	$s4, 1, earn
	#Flagged as 1, special operation
	beq	$s6, $zero, special
	j	earn
	
special:
	#Double score if count divisible by 10
	div	$t6, $s4, 10
	mfhi	$t8
	beq	$t8 $zero, double
	
	#Triple score if count divisible by 10
	div	$t7, $s4, 5
	mfhi	$t8
	beq	$t8, $zero, triple
	
	#Else, earn 100 if score is negaibe, or lose 100 if score positive
	blt	$s5, $zero, earn100
	bge	$s5, $zero, lose100
	
earn:
	#Add point, update score
	addi	$s5, $s5, 1
	updateScore($s5)
	
	#Win if score >= 100, else keep playing
	bge	$s5, 100, win
	j	start
	
earn100:
	#Add 100 points, update score
	addi	$s5, $s5, 100
	updateScore($s5)
	
	#Win if score >= 100, else keep playing
	bge	$s5, 100, win
	j	start
	
lose100:
	#Lose 100 points, update score
	addi	$s5, $s5, -100
	updateScore($s5)
	
	#Lose if score <= -100, else keep playing
	ble	$s5, -100, lose
	j	start
	
double:
	#Double points, update score
	mul	$s5, $s5, 2
	updateScore($s5)
	
	#Win of score >= 100, lose if score <= -100, else keep playing
	bge	$s5, 100, win
	ble	$s5, -100, lose
	j	start
	
triple:
	#Triple points, update score
	mul	$s5, $s5, 3
	updateScore($s5)
	
	#Win of score >= 100, lose if score <= -100, else keep playing
	bge	$s5, 100, win
	ble	$s5, -100, lose
	j	start
############# Pixel was hit #############

############ Win or lose ############
win:
	#Clear character and bit
	jal	clearCharacter
	addi	$a1, $zero, BLACK
	sw	$a1, ($s2)
	
	#Player won the game, end the game
	winner($s5)
	j	again
	
lose:
	#Clear character and bit
	jal	clearCharacter
	addi	$a1, $zero, BLACK
	sw	$a1, ($s2)
	
	#Player lost the game, end the game
	loser($s5)
	j	again
	
clearCharacter:
	#Load character on top of stack to blackout
	addi	$a1, $zero, BLACK
	addi	$sp, $sp, -4
   	sw 	$ra, 4($sp)             
	jal	blackout
	
returnClearedChar:
	#Take out from stack and clear character
	lw 	$ra, 4($sp)
   	addi 	$sp, $sp, 4 
   	jr	$ra
############ Win or lose ############
.end_macro
################ Capture white bits ################
	
################ Capture red bits ################
.macro	catchRed()
	.text	
start:	
	j	drawObject
	
player:
	#Load address to read in order to keep Marquee going
	lw	$t8, 0xFFFF0000
	#If no input, keep iterating
	beq	$t8, 0, count
	
	#Load latter address for keyboard functions
	lw	$t9, 0xFFFF0004
	#If space is pressed (byte 32), jump to special point counter
	beq	$t9, 32, spaceHit
	
	#If W is pressed (byte 119), move one pixel up
	beq	$t9, 119, up
	#If S is pressed (byte 115), move one pixel down
	beq	$t9, 115, down
	#If A is pressed (byte 97), move one pixel left
	beq	$t9, 97, left
	#If D is pressed (byte 100), move one pixel right
	beq	$t9, 100, right

count:
	#Keep track of color
	add	$t4, $s7, $zero
	
movePlay:
	#Time to change color?
	bge	$t4, 7, override
	#Convert iteratons to width location in BitMap
	mul	$s3, $s1, WIDTH
	add	$s3, $s0, $s3
	
	#Convert BitMap location to bytes, and add to location of origin pixel 
	mul	$s3, $s3, 4
	addi	$s3, $s3, MEM

	#Find location in color array
	mul	$t2, $t4, 4
	lw	$t2, colors($t2)
	
	#Store pixel location into color red to show pixel (draw pixel), and go one width left (positive)
	sw	$t2, ($s3)
	beq	$s3, $s2, hitPixel
	#Increment to next raonbow color
	addi	$t4, $t4, 1

#New color at next Marquee
nextPlay:
	addi	$s7, $s7, 1
	j	player
	
#Return Marquee box
returnPlayer:
	jr	$ra

#Subtract by 7 if color counter above 7, so it corresponds with array
override:
	subi	$t4, $t4, 7
	j	movePlay
	
up:
	#Blackout the box, go one pixel up (negative y direction) and iterate again
	jal	blackout
	addi	$s1, $s1, -1
	j	count
	
down:
	#Blackout the box, go one pixel down (positive y direction) and iterate again
	jal	blackout
	addi	$s1, $s1, 1
	j	count
	
left:
	#Blackout the box, go one pixel left (negative x direction) and iterate again
	jal	blackout
	addi	$s0, $s0, -1
	j	count
	
right:
	#Blackout the box, go one pixel right (positive x direction) and iterate again
	jal	blackout
	addi	$s0, $s0, 1
	j	count
	
blackout:
	addi	$a2, $zero, BLACK
	#Open space for drawing to berecursively called, having return address stored on top
	addi	$sp, $sp, -4
   	sw 	$ra, 4($sp)             
	jal	blackPixel
	
returnBlackout:
	#Load the data into return address and pop it from stack since we're done using it
	lw 	$ra, 4($sp)
   	addi 	$sp, $sp, 4 
   	jr	$ra
	
blackPixel:
	#Convert iteratons to width location in BitMap
	mul	$s3, $s1, WIDTH
	add	$s3, $s0, $s3
	
	#Convert BitMap location to Bytes, and add to location of origin pixel 
	mul	$s3, $s3, 4
	addi	$s3, $s3, MEM
	#Store pixel location into color red to show pixel (draw pixel), and go one width left (positive)
	sw	$a2, ($s3)
	
#Return the box
returnBlack:
	jr	$ra
	
################# Special play #################
spaceHit:
	#If over -5 points, skip
	bgt	$s5, -5, player
	div	$t4, $s5, 5
	mfhi	$t5
	
	#Lose if score divisible by 5, else win
	beq	$t5, 0, lose
	bne	$t5, 0, win
	j	player
################# Special play #################

############# Capture the bit #############
drawObject:
	#Count divisible by 2, draw bit on left
	div	$t1, $s4, 2
	mfhi	$t4
	beq	$t4, $zero, fromLeft
	
	#Count divisible by 3, draw bit on right
	div	$t1, $s4, 3
	mfhi	$t4
	beq	$t4, $zero, fromRight
	
	#Count divisible by 5, draw bit on top, else draw bit on bottom
	div	$t1, $s4, 5
	mfhi	$t4
	beq	$t4, $zero, fromTop
	bne	$t4, $zero, fromBot
	j	 player
	
fromLeft:
	#Draw bit on left, iterate count
	jal	captureLeft
	addi 	$s4, $s4, 1
	j	player
		
fromRight:
	#Draw bit on right, iterate count
	jal	captureRight
	addi 	$s4, $s4, 1
	j	player

fromTop:
	#Draw bit on top, iterate count
	jal	captureTop
	addi 	$s4, $s4, 1
	j	player

fromBot:
	#Draw bit on bottom, iterate count
	jal	captureBot
	addi 	$s4, $s4, 1
	j	player
############# Capture the bit #############

############# Capture from left #############
captureLeft:
	#Starting X coord of bit to draw, and flag for non special
	li	$t6, 4
	li	$s6, 1

	#Starting Y coord of bit 
	li	$t7, HEIGHT
	div	$t7, $t7, 2
	
	#Red to draw bit, black to black it out
	add	$a1, $zero, RED
	add	$a3, $zero, BLACK
	
redOrWhiteL:
	#If count is 0, draw normal
	beq	$s4, $zero, drawL
	div	$t1, $s4, 5
	mfhi	$s6
	
	#Count divisible by 5, draw special bit
	bne	$s6, $zero, drawL
	add	$a1, $zero, WHITE
	
drawL:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s2, $t7, WIDTH
	add	$s2, $s2, $t6
	mul	$s2, $s2, 4
	addi	$s2, $s2, MEM

#Show bit to capture	
showL:
	sw	$a1, ($s2)
	jr	$ra
############# Capture from left#############

############# Capture from right #############
captureRight:
	#Starting X coord of bit to draw, and flag for non special
	li	$t6, 60
	li	$s6, 1
	
	#Starting Y coord of bit
	li	$t7, HEIGHT
	div	$t7, $t7, 2
	
	#Red to draw bit, black to black it out
	add	$a1, $zero, RED
	add	$a3, $zero, BLACK
	
redOrWhiteR:
	#If count is 0, draw normal
	beq	$s4, $zero, drawR
	div	$t1, $s4, 9
	mfhi	$s6
	
	#Count divisible by 9, draw special bit
	bne	$s6, $zero, drawR
	add	$a1, $zero, WHITE
	
drawR:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s2, $t7, WIDTH
	add	$s2, $s2, $t6
	mul	$s2, $s2, 4
	addi	$s2, $s2, MEM

#Show bit to draw
showR:
	sw	$a1, ($s2)
	jr	$ra
############# Capture from right #############

############# Capture from top #############
captureTop:
	#Starting X coord of bit to draw, and flag for non special
	li	$t6, 4
	li	$s6, 1

	#Starting Y coord of bit
	li	$t7, WIDTH
	div	$t7, $t7, 2
	
	#Red to draw bit, black to black it out
	add	$a1, $zero, RED
	add	$a3, $zero, BLACK
	
redOrWhiteT:
	#If count is 0, draw normal
	beq	$s4, $zero, drawT
	div	$t1, $s4, 6
	mfhi	$s6
	
	#Count divisible by 6, draw special bit
	bne	$s6, $zero, drawT
	add	$a1, $zero, WHITE
	
drawT:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s2, $t6, WIDTH
	add	$s2, $s2, $t7
	mul	$s2, $s2, 4
	addi	$s2, $s2, MEM	

#Show bit to draw	
showT:
	sw	$a1, ($s2)
	jr	$ra
############# Capture from top #############

############# Capture from bottom #############
captureBot:
	#Starting X coord of bit to draw, and flag for non special
	li	$t6, 60
	li	$s6, 1
	
	#Starting Y coord of bit
	li	$t7, WIDTH
	div	$t7, $t7, 2
	
	#Red to draw bit, black to black it out
	add	$a1, $zero, RED
	add	$a3, $zero, BLACK
	
redOrWhiteB:
	#If count is 0, draw normal
	beq	$s4, $zero, drawB
	div	$t1, $s4, 5
	mfhi	$s6
	
	#Count divisible by 5, draw special bit
	bne	$s6, $zero, drawB
	add	$a1, $zero, WHITE
	
drawB:
	#bitmap = MEM + 4 * X + (Y * WIDTH)
	mul	$s2, $t6, WIDTH
	add	$s2, $s2, $t7
	mul	$s2, $s2, 4
	addi	$s2, $s2, MEM
	
#Show bit to draw
showB:
	sw	$a1, ($s2)
	jr	$ra
############# Capture from bottom #############

############# Pixel was hit #############
hitPixel:
	#Count less than 1, skip special operations
	ble	$s4, 1, loss
	#If flagged 1, special operation, else just do normal 
	beq	$s6, $zero, special
	j	loss
	
special:
	#Divisible by 10, multiply score by -2
	div	$t6, $s4, 10
	mfhi	$t8
	beq	$t8 $zero, negDouble
	
	#Divisible by 5, multiply score by -3
	div	$t7, $s4, 5
	mfhi	$t8
	beq	$t8, $zero, negTriple
	
	#Else, Add 100 if score is negative, lose 100 if score is negative
	blt	$s5, $zero, gain100
	bge	$s5, $zero, loss100
	
loss:
	#Decrement score, then update score
	addi	$s5, $s5, -1
	updateScore($s5)
	
	#Score <= 100, win
	ble	$s5, -100, win
	j	start
	
loss100:
	#Lose 100 points, then update score
	addi	$s5, $s5, -100
	updateScore($s5)
	
	#Score <= 100, win
	ble	$s5, -100, win
	j	start
	
gain100:
	#Add 100 points, then update score
	addi	$s5, $s5, 100
	updateScore($s5)
	
	#Score >= 100, lose
	bge	$s5, 100, lose
	j	start
	
negDouble:
	#Multiply score by -2, then update score
	mul	$s5, $s5, -2
	updateScore($s5)
	
	#Win if score <= 100, lose if score >= 100
	ble	$s5, -100, win
	bge	$s5, 100, lose
	j	start
	
negTriple:
	#Multiply score by -3, then update score
	mul	$s5, $s5, -3
	updateScore($s5)

	#Win if score <= 100, lose if score >= 100
	ble	$s5, -100, win
	bge	$s5, 100, lose
	j	start
############# Pixel was hit #############

############ Win or lose ############
win:
	#Clear character and bit
	jal	clearCharacter
	addi	$a1, $zero, BLACK
	sw	$a1, ($s2)
	
	#Player won the game, end the game
	winner($s5)
	j	again
	
lose:
	#Clear character and bit
	jal	clearCharacter
	addi	$a1, $zero, BLACK
	sw	$a1, ($s2)

	#Player lost the game, end the game
	loser($s5)
	j	again
	
clearCharacter:
	#Load character on top of stack to blackout
	addi	$a1, $zero, BLACK
	addi	$sp, $sp, -4
   	sw 	$ra, 4($sp)             
	jal	blackout
	
returnClearedChar:
	#Take out from stack and clear character
	lw 	$ra, 4($sp)
   	addi 	$sp, $sp, 4 
   	jr	$ra
############ Win or lose ############
.end_macro
################ Capture red bits ################

#Update the score
.macro	updateScore(%score)
	.text
update:
	#Update the score to current score in game
	add	$t0, $s5, $zero
	sw	$t0, score
	
	#Show score message
	li	$v0, 4
	la	$a0, currScore
	syscall
	
	#Display current score
	li	$v0, 1
	lw	$a0, score($zero)
	syscall
	
	#Skip 2 lines for better display
	li	$v0, 4
	la	$a0, newLine
	syscall
	li	$v0, 4
	la	$a0, newLine
	syscall
.end_macro

#30 ms pause between writing pixel
.macro	pause()
	.text
pause:
	li	$a0, 30
	la	$v0, 32
	syscall
.end_macro

#Won the game?
.macro	winner(%score)
	#Notify player won the game
	li	$v0, 4
	la	$a0, wonGame
	syscall
	
	#New line
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	#Show score message
	li	$v0, 4
	la	$a0, finalScore
	syscall
	
	#Show points 
	li	$v0, 1
	lw	$a0, score($zero)
	syscall
	
	#New line
	li	$v0, 4
	la	$a0, newLine
	syscall
	#New line
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	#Show it in a pop up
	li	$v0, 56
	la	$a0, wonGame
	lw	$a1, score($zero)
	syscall
.end_macro

#Lost the game?
.macro	loser(%score)
	#Notify player lost the game
	li	$v0, 4
	la	$a0, lostGame
	syscall
	
	#New line
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	#Show score message
	li	$v0, 4
	la	$a0, finalScore
	syscall
	
	#Show points 
	li	$v0, 1
	lw	$a0, score($zero)
	syscall
	
	#New line
	li	$v0, 4
	la	$a0, newLine
	syscall
	#New line
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	#Show it in a pop up
	li	$v0, 56
	la	$a0, lostGame
	lw	$a1, score($zero)
	syscall
.end_macro
