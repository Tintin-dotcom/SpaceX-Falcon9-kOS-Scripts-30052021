# SpaceX-Falcon9-kOS-Scripts-30052021
Craft files for the rocket, and a version without the parts needed for kOS, are included.

Link to Youtube video: https://youtu.be/ouKWfkBjAg8

This is the Kerbal Operating System code for a Falcon 9 rocket launch (with 60 Starlink satellites).

It includes a second file for the first stage landing, and a third one which is a boot file and has
to be placed inside a directory called "Boot", inside the /KSP/Ships/Script directory.

The falcon9.ks code launches the rocket, performs the gravity turn, separates the stages and the 
payload fairing, circularizes, spins the upper stage, deployes the Starlink payload and de-orbits
the second stage.

The boosterlanding.ks script reorients the booster, ignites 3 engines for a re-entry burn, waits
until it reaches the propper altitude to start it's landing burn which it performs with the engine
located in the center of the rocket. The booster lands on the ground.

The boot.ks file opens the kOS Terminal of the booster's processor directly after launching the vessel.
This only works if you right-click the kOS-processor located at the top of the first stage's tank and
select boot file "boot.ks".

///NOTES///

-> If the rocket spins out of control a few seconds after launch, deactivate SAS for two seconds or so.

-> If the booster hovers and flies up again, change the number in line 49 for a slightly higher one.

-> You have to lock the hinge of the landing gear manually, do that by right-clicking over the part
   just before touchdown, after landing leg deployment. You might have to click multiple times for it
   to work, this is the reason it's not written into the code.
 
-> Tested in Kerbal Space Program Version 1.11.2.
