# matlab
Designing a digital speed controller for a direct current motor



   Given the laboratory setup "DC Electric Motor with Speed Transducer," a controller should be designed so that the closed-loop system meets the following performance criteria:
        i.            Zero steady-state error
        ii.            Overshoot of 5%
        iii.           Damping factor ζ = 0.707
        iv.           Transient response duration of 2 seconds

  The design is done using two methods:
1.     The method of allocating poles and zeros
2.     The direct design method in the time domain (extended deadbeat)

 Design stages:
1. Determining the impulse response of the process - effective values
2. Determining the transfer function of the fixed part
3. Choosing the sampling period
4. Discretizing the transfer function of the fixed part
5. Designing the controller based on the transfer function of the fixed part and the closed-loop transfer function obtained based on the imposed performance requirements
