## Project 1 Week 1 Deliverables

This is the Project 1 deliverables for this week. 

To run the script, download both "Project1_week1.m" and "P1_demo.slx", and put them in the same folder to ensure that MATLAB doesn't act weird when running the script. 

The code for the script such as the initial conditions, other deliverables (types of solvers and time step values), as well as the block diagram and total simulation time for the Simulink model should already be set, so just click "Run" and it should output 6 plots for the Euler and Runge Kutta 4th Order Solvers at the 3 different fixed time steps. 


## Week 1 Feedback (5/5):
Great job guys! Keep it up for week 2, ya'll are on track! Only suggestion would be to now look into logic on how you can determine if your applied torque is constant, or sinusoidal. Also, make sure plots have proper axis titles!


## Project 1 Week 2 Deliverables

This is the Project 1 Week 2 deliverables. 

The files for this week are "Project1_week2.m" and "Project1_wk2.slx".

We tried tweaking the block diagram on Simulink to account for the constant and sinusoidal torque, but we had some trouble getting it to work. The script we wrote in MATLAB didn't account for the other plots needed for this week, but it had some code regarding the CPU time and getting data.


## Week 2 Feedback (5/5)
The else keyword on line 126 is not indented correctly and is causing an error so please make sure to fix this for the final submission (keep in mind, you will need to fix the rest of the lines indentions as well when fixing Line 126, you can highlight it all and press ctrl-i and it should fix it). Another issue I found was that the "fix_solv" is not a variable in the sim function. I see you have the fix_solv_a array so that is something to fix. Additionally, the sim functions for the variable solvers are still using the fixed time step solvers. Another thing I had to fix was in the inital condition constant block of P1_demo.slx (this is the model used in the week 2 script) within the block the variable was "w_0" and not what was set in the script of "w0". I urge the team to make sure you double/triple check that the MATLAB code and simulink model are ready for submission. This is fine for weekly submissions but I will not be going through your script or model trying to debug it for the final submissions so please keep that in mind. There were more errors that occurred when I fixed the above issues so I was not able to fully check for Part 1. Moving onto Part 2, the team will need to create different simulink models for the 3 options on how to connect System 2 to System 1. A suggestion would be to copy the model used for Part 1 and modifying it for each of the options. Once the entire project is complete, make sure to commit all Part 1 and Part 2 files with the commit messgae "Project 1 Final"


## Project 1 Final
This is the Project 1 Final deliverables. We encountered various errors in our code such as "The input arguments of a single output sim command should be model name followed by either a structure with valid parameters as fields with corresponding values or a set of parameters name and parameter value pairs" and "Index exceeds the number of array elements. Index must not exceed 2. Error in Project1 (line 67) simout = sim("SIMULINK_FINAL.slx", "Solver", fix_solv_a(j),"FixedStep",string(dT));". We tried to reach out through email to our TA, but we did not receive a response back. We tried our best to look at the Mathworks forums, and ask Chat GPT to fix these errors in our code, but it continued to create more errors in our code. The most recent MATLAB script is "Project1.m" and the most recent Simulink diagrams were "SIMULINK_FINAL.slx", and there were diagrams for Part 2 named "Project1_Final_Option1.slx" and "Project2_Final_Option2.slx" but the first option diagram was incomplete and we could not write the code for the part 2 deliverables.  

## Final Week Feedback
- Looking at the Simulink model for Part 1 I noticed a few things: 
1) The error of "derivative of state '1'" is occuring when running the simulation because the bandaid patch fix for this error was not implemented in the simulink model (look at P1 W2 document).
2) Some of the sim functions are calling a different simulink model than the "SIMULINK_FINAL"
3) The reason you are receiving the error of the input arguments of the sim function is due to how you're passing variables for the variable time step solver. There is the variable of the "Solver" but there is also a second variable mentioned "VariableStep" which is not needed and causing the error.
4) The best way to debug your matlab script would be by checking the "Pause on Errors" option under the Run button so that you can debug easily.
- Since there were many errors which made it hard to debug and simulate fully through Part 1, there will be points deducted, as well as for not having Part 2. If Dr. Gopalswamy has not mentioned yet in class, there will be a chance for resubmission of this project for a better grade. Either I or Dr. Gopalswamy will make an announcment to the class about it 
