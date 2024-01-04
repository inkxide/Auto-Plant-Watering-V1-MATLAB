% Main Project - Auto Plant Watering 
% Huzaifa Bin Ahmer
% 2023-12-02
% ------------- Brief Description of the Program ------------ 
% Graphs voltage 'Moisture Sensor Voltage vs Time (Live)'
% Runs a state machine algorithm 
% Using soil moisture sensor, senses the soil moisture
% MOSFET uses battery to pump water
% If soil dry, then pump water
% If soil not fully wet, then pump water
% If soil wet then don't pump water

% Resets  the Program including stored variables and executed code
clear all; close all;

% creates an arduino object
a = arduino('COM4','Nano3');

% Variables for the graph
minY = 0;
maxY = 100;

% Variables for state machine algorithm
driest_value = 47;
thresholded_value = 35;
saturated_value = 35;

% Calls the Function for Graph
initiateGraph(minY, maxY);

% stop for while loop
stop = false;

% Time for x-axis
startTime = datetime('now');

% while loop for executing the live graph and state machine algorithm
while ~stop

 % Read current voltage value
 voltage = readVoltage(a,'A1');
 moisture_value = moisture(voltage);

 % Gets current time
 t = datetime('now') - startTime;

 % Add points to animation of graph
 addpoints(h,datenum(t),moisture_value);

 % Update axes of graph
 ax.XLim = datenum([t-seconds(15) t]);
 datetick('x','keeplimits');
 drawnow;

 % Check stop condition (check the button on D6)
 stop = readDigitalPin(a,'D6');
 
 % If statement for Check Stop Condition (check the button on D6)
 if stop
     
     % Exits the while loop and quits the program
     break; 

 end
 
 % State machine algorithm for determining soil moisture
 % And pumping water accordingly
 if (moisture_value > driest_value)
     
     disp('Signal Received! Soil is dry! Time to water!');
     writeDigitalPin(a,'D2',1);

 elseif (moisture_value > thresholded_value)
     
     disp('Signal Received! Soil is still dry! Continue watering!');
     writeDigitalPin(a,'D2',1); 

 elseif (moisture_value <= saturated_value)
     
     disp('Signal Received! Soil is wet! Stop watering!');
     writeDigitalPin(a,'D2',0);

 end

end

% Creates a Fucntion for characterizing moisture sensor
function characterize = moisture(voltage)

    characterize = 100/1.0 * (voltage) - 298;

end

% Creates a Function for graphing
function [h,ax] = initiateGraph(minY, maxY)

    % Creates figure
    figure;

    % Live Data Plot for 'Moisture Sensor Voltage vs Time (Live)'
    h = animatedline;
    ax = gca;
    ax.YGrid = 'on';
    ax.YLim = [minY maxY]; % 0 to 100; minY = 0 & maxY = 100

    % Labels for the graph
    title('Moisture Sensor Voltage vs Time (Live)');
    xlabel('Time [HH:MM:SS]');
    ylabel('Voltage [Volt]');

end




