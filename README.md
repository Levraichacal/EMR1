# EMR1
Make with Ada : Explorer and mapper robot


# Introduction
The explorer and mapper robot will be a robot with four wheels which will evolute in a room. Thanks to some ultrasonic ranging modules and AHRS, it will take some positions and send and/or record them. With those data, we can plotted the shape of the room and the object. I will use an Nucleo board, and perhaps add an hardware abstraction layer to suport also Arduino board in the robot. For the plotting application, I will use a computer or a Raspberry or a STM32F4 board with a screen. And of course, all will be make with Ada.

# On board part

* _MPU6050_  : an inertial measurment unit, whcich works on I2C
* _HMC5883L_  : a compass, which works also on I2C
* _HC SR04_  : an ultrasonic module distance measuring transducer sensor, which need a timer and interrupt entry
* _L298N_  : a motor driver, which need pwm to regul the speed.
* _motors_ : controlled by the __L298N__
* _servomotors_  : need pwm to be controlled
