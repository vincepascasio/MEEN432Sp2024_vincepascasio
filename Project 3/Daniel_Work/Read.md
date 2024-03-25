# Project 3 Week 1 and Week 2 Deliverables
For this week, the team was tasked to build a longitudinal simulation model of a vehicle. The two major assumptions when creating the model are as follows; 1. Assume the torque on wheels can be controlled, 2. Assume no tire slip. The model will then have to travel an urban and a highway drive cycle. The simulation should stay within +/- 3 mph of the EPA drive cycle. The team used the scaffold script and model to develop their script/model. The gain coefficient for the PID controller was determined using manual tuning. The script ran within the 3mp band. This however is only using the simple model and not incorporating the electric motor model. When the script is run, there will be 2 figures that appear. They are the urban and highway drive cycles with the simulation results. The blue line represents the simulation. When observing the plot, the blue line stays within the band.

How to run the script:
1. Download P3init.m, Project3_model.slx, Project3_runsim.m, init.m, init_HWY_DriveCycle.m, init_URB_DriveCycle.m files and ensure they are in the same directory
2. Click "Run" and run the Project3_runsim.m  script
3. There is no needed user input or additional scripts to run
4. Look at the figures created.
