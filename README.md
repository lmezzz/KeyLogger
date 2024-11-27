# KeyLogger
Fked Up Ways to amek KeyLogger(never use a 32bit APIs on a 64 Bit system tried it didnt work Ik i am Dumb)


AOA
this project wont work unless u set SetUp A masm 32 environment and link all the include file like u did with Irvine
in this project we tried to make a dll file to set up global hooks that will interact directly with the LowLevel inputs of the key board but the major thing that was overlooked was the Fact that our systems are now in 64 bit 
and and we are making all this in 32 bit so i wasnt possible to inject the Dll files into a 64bit system

but we have submitted all the approches we tried to capture the key strokes

which were
-Setting the Global hooks
-setting a thread specific for a specific application but it turns out none of it works as the system gives out the information in 64 bit rather than 32 bit

so in the end we came up with a Worst approach on the basis of time complexcity whch was to To check the State of evey AsCII character at once using a infinite loop and senit to a text file

this approach even tho is a little tedious vbut works like global hooks 

tho its is not efficient in any way
