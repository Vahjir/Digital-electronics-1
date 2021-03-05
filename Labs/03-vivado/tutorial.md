# Vivado tutorial

First you need to create new project in vivado: File->Project->New

![1](Images/1.PNG)

In the next window, name your project and choose desired project location



![2](Images/2.PNG)

In the next step you need to select project type, in our case it will be an RTL project



![3](Images/3.PNG)



Then you will be asked to add sources to your project, click create file, choose its type and name. We will chooses VHDL type.

![4](Images/4.PNG)

Now you will be asked to add constraints. Constrains connect your code to actual hardware. We will not need this. Go ahead and press next

![5](Images/5.PNG)

Now we can choose part associated with our project, either stock parts and boards directly from Vivado or you can import boards of your choosing directly in  the Vivado directory

![6](Images/6.PNG)

Next window that will appear will summarize your project

![7](Images/7.PNG)

After that you will be asked to define I/O ports, this step will just be skipped in our case.

![8](Images/8.PNG)

Your source will appear in the sources box, just double click in and edit your code

![9](Images/9.PNG)

If you want to run a simulation, you will have to add simulation source, for that click: File->Add sources and select add simulation source

![10](Images/10.PNG)

Same as we did before, we will name our source file and select its type

![11](Images/11.PNG)

The simulation source will also appear in the sources window under: Sim. sources->sim1

![12](Images/12.PNG)

To run the simulation click flow and run behav. sim.