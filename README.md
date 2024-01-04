# Auto-Plant-Watering-MATLAB-Program

INTRODUCTION: The context of my main project is to create an Auto Plant Watering using MATLAB program connected to Arduino Grove Board to monitor and maintain soil moisture. 
OBJECTIVES: The objectives of this project were to create a program in MATLAB that allows long-term monitoring of the plant soil to ensure that the plant receives water as it needs it and to measure the soil moisture using a soil moisture sensor attached to the Arduino Grove board. 

PROCEDURE: An Arduino Grove Board was connected to a MOSFET sensor and Moisture sensor, and a state machine program in MATLAB was written in script, where when the moisture sensor senses the soil is dry, the MOSFET sensor turns the water pump on to deliver water to the soil, turns off the water pump when moisture senses that the soil is wet and waits until the soil is dry again to start the process over again. 

RESULTS: The Auto Plant Watering with the script ran a state machine, pumped water into the soil when dry, and stopped pumping water when wet. 

CONCLUSIONS AND RECOMMENDATIONS: The recommendation includes that the moisture sensor senses that the soil is wet and turns the pump off, but since the soil was already wet the pump was off, so to simulate a dry condition, the moisture sensor was pulled out of the soil manually, where the water pump turned on following the state machine algorithm and turned off when the moisture sensor was put back into the wet soil. In conclusion, dry soil value on the graph ranged from an average value of 34-45 and the wet soil ranged from 15-28. 

<h1>Plant and Hardware Setup</h1>
<img src="https://github.com/inkxide/Auto-Plant-Watering-MATLAB-Program/assets/122377141/9864642d-4171-4154-86f4-fc36139f18c6&"/>
