<!DOCTYPE html>
<html>
<head>
    <title>Mars Rover PDDL Project</title>
</head>
<body>

<h1>Mars Rover PDDL Project</h1>

<p>This project models a next-generation autonomous Mars rover named MR-1, designed to conduct terrain analysis operations to collect scientific data. The model is described using PDDL (Planning Domain Definition Language).</p>

<h2>Project Overview</h2>

<p>The MR-1 rover is tasked with exploring the Martian surface and collecting chemical information from different locations. The project includes a PDDL domain file and a problem file that define the actions the rover can perform, the initial state, and the goal state.</p>

<h2>Domain Description</h2>

<p>The domain file (<code>Mars_Domain.pddl</code>) defines the types, predicates, functions, and actions relevant to the rover's operations.</p>

<h3>Types</h3>
<ul>
    <li><code>location</code>: Represents different locations on Mars.</li>
    <li><code>manipulator</code>: Represents the rover's manipulator arm.</li>
    <li><code>instrument</code>: Represents scientific instruments (spectrometer, camera, radar).</li>
    <li><code>rover</code>: Represents the rover itself.</li>
    <li><code>home</code>: Represents the home base.</li>
    <li><code>configuration</code>: Represents configurations for the manipulator.</li>
</ul>

<h3>Predicates</h3>
<ul>
    <li><code>(at ?r - rover ?l - location)</code>: The rover <code>?r</code> is at location <code>?l</code>.</li>
    <li><code>(standing ?r - rover)</code>: The rover <code>?r</code> is standing.</li>
    <li><code>(sitting ?r - rover)</code>: The rover <code>?r</code> is sitting.</li>
    <li><code>(at_home)</code>: The rover is at the home base.</li>
    <li><code>(not_home)</code>: The rover is not at the home base.</li>
    <li><code>(not_visited ?l - location)</code>: The location <code>?l</code> has not been visited.</li>
    <li><code>(visited ?l - location)</code>: The location <code>?l</code> has been visited.</li>
    <li><code>(deployed ?m - manipulator)</code>: The manipulator <code>?m</code> is deployed.</li>
    <li><code>(not_deployed ?m - manipulator)</code>: The manipulator <code>?m</code> is not deployed.</li>
    <li><code>(need ?l - location ?i - instrument)</code>: The instrument <code>?i</code> is needed at location <code>?l</code>.</li>
    <li><code>(activated ?i - instrument)</code>: The instrument <code>?i</code> is activated.</li>
    <li><code>(not_activated ?i - instrument)</code>: The instrument <code>?i</code> is not activated.</li>
    <li><code>(one_sensor_activated)</code>: At least one sensor is activated.</li>
    <li><code>(all_sensors_deactive)</code>: All sensors are deactivated.</li>
    <li><code>(data_collected ?l - location ?i - instrument)</code>: Data at location <code>?l</code> related to instrument <code>?i</code> is collected.</li>
    <li><code>(not_data_collected ?l - location ?i - instrument)</code>: Data at location <code>?l</code> related to instrument <code>?i</code> is not collected.</li>
    <li><code>(data_processed ?l - location ?i - instrument)</code>: Data at location <code>?l</code> collected by instrument <code>?i</code> is processed.</li>
    <li><code>(not_data_processed ?l - location ?i - instrument)</code>: Data at location <code>?l</code> collected by instrument <code>?i</code> is not processed.</li>
    <li><code>(not_data_sent ?r - rover ?l - location ?i - instrument)</code>: Data at location <code>?l</code> collected by instrument <code>?i</code> by the rover <code>?r</code> is not sent.</li>
    <li><code>(data_sent ?r - rover ?l - location ?i - instrument)</code>: Data at location <code>?l</code> collected by instrument <code>?i</code> by the rover <code>?r</code> is sent.</li>
    <li><code>(communication_closed)</code>: Communication is closed.</li>
    <li><code>(communication_open)</code>: Communication is open.</li>
    <li><code>(config_for ?l - location ?c - configuration)</code>: Configuration <code>?c</code> is for location <code>?l</code>.</li>
    <li><code>(configured)</code>: The rover is configured.</li>
    <li><code>(not_configured)</code>: The rover is not configured.</li>
</ul>

<h3>Functions</h3>
<ul>
    <li><code>(number_read ?l - location ?i - instrument)</code>: Number of times data has been collected at location <code>?l</code> by instrument <code>?i</code>.</li>
    <li><code>(max_read ?l - location ?i - instrument)</code>: Number of times data needs to be collected at location <code>?l</code> by instrument <code>?i</code>.</li>
    <li><code>(locs_visited)</code>: Number of locations visited.</li>
    <li><code>(max_locs_visited)</code>: Number of locations that should be visited before going back to the home base.</li>
    <li><code>(untacked_number ?l - location)</code>: Number of times the manipulator has been untacked at location <code>?l</code>.</li>
    <li><code>(wait_steps)</code>: Number of time steps needed to establish communication.</li>
    <li><code>(number_sent)</code>: Number of data items sent.</li>
    <li><code>(max_sent_data)</code>: Maximum number of data items to be sent.</li>
</ul>

<h3>Actions</h3>
<ul>
    <li><code>home_out</code>: Move the rover from the home base to a location.</li>
    <li><code>back_home</code>: Move the rover from a location back to the home base.</li>
    <li><code>move</code>: Move the rover between locations.</li>
    <li><code>sit</code>: Make the rover sit.</li>
    <li><code>stand_up</code>: Make the rover stand up after tacking its manipulator.</li>
    <li><code>untack</code>: Deploy the manipulator at a location.</li>
    <li><code>arm_configure</code>: Configure the manipulator for a specific location.</li>
    <li><code>tack</code>: Retract the manipulator.</li>
    <li><code>activate_inst</code>: Activate an instrument at a location.</li>
    <li><code>collect_data</code>: Collect data at a location using an instrument.</li>
    <li><code>deactivate_inst</code>: Deactivate an instrument after data collection.</li>
    <li><code>Process_data</code>: Process collected data.</li>
    <li><code>wait_for_communication</code>: Wait for a communication window.</li>
    <li><code>open_communication</code>: Open communication for data transmission.</li>
    <li><code>send_data</code>: Send collected data to Earth.</li>
    <li><code>close_communication</code>: Close the communication link.</li>
</ul>

<h2>Problem Description</h2>

<p>The problem file (<code>Mars_Problem.pddl</code>) describes a specific scenario for the Mars rover, including the initial state and the goal state.</p>

<h3>Objects</h3>
<ul>
    <li><code>loc1 loc2 loc3</code>: Three sampling locations.</li>
    <li><code>robot</code>: The rover.</li>
    <li><code>spectro camera radar</code>: Three different sensors.</li>
    <li><code>arm</code>: The manipulator of the rover.</li>
    <li><code>config1 config2 config3</code>: Different configurations related to each location.</li>
</ul>

<h3>Initialization</h3>
<ul>
    <li><code>(at_home)</code>: The rover starts at the home base.</li>
    <li><code>(standing robot)</code>: The rover is initially standing.</li>
    <li><code>(= (locs_visited) 0)</code>: No locations have been visited initially.</li>
    <li><code>(= (max_locs_visited) 3)</code>: The rover must visit all three locations before returning to the home base.</li>
    <li><code>(not_visited loc1) (not_visited loc2) (not_visited loc3)</code>: All locations are initially unvisited.</li>
    <li><code>(not_deployed arm)</code>: The manipulator is not deployed initially.</li>
    <li><code>(all_sensors_deactive)</code>: All sensors are deactivated initially.</li>
    <li><code>(not_activated spectro) (not_activated camera) (not_activated radar)</code>: All sensors are not activated initially.</li>
    <li><code>(not_data_collected loc1 spectro)</code>: No data collected at loc1 by spectro.</li>
    <li><code>(not_data_collected loc2 camera)</code>: No data collected at loc2 by camera.</li>
    <li><code>(not_data_collected loc2 radar)</code>: No data collected at loc2 by radar.</li>
    <li><code>(not_data_collected loc3 camera)</code>: No data collected at loc3 by camera.</li>
    <li><code>(not_data_processed loc1 spectro)</code>: Data at loc1 by spectro not processed.</li>
    <li><code>(not_data_processed loc2 camera)</code>: Data at loc2 by camera not processed.</li>
    <li><code>(not_data_processed loc2 radar)</code>: Data at loc2 by radar not processed.</li>
    <li><code>(not_data_processed loc3 camera)</code>: Data at loc3 by camera not processed.</li>
    <li><code>(not_data_sent robot loc1 spectro)</code>: Data at loc1 by spectro not sent.</li>
    <li><code>(not_data_sent robot loc2 camera)</code>: Data at loc2 by camera not sent.</li>
    <li><code>(not_data_sent robot loc2 radar)</code>: Data at loc2 by radar not sent.</li>
    <li><code>(not_data_sent robot loc3 camera)</code>: Data at loc3 by camera not sent.</li>
    <li><code>(= (untacked_number loc1) 0)</code>: Untacking count at loc1 is zero.</li>
    <li><code>(= (untacked_number loc2) 0)</code>: Untacking count at loc2 is zero.</li>
    <li><code>(= (untacked_number loc3) 0)</code>: Untacking count at loc3 is zero.</li>
    <li><code>(need loc1 spectro)</code>: Spectro is needed at loc1.</li>
    <li><code>(need loc2 camera)</code>: Camera is needed at loc2.</li>
    <li><code>(need loc2 radar)</code>: Radar is needed at loc2.</li>
    <li><code>(need loc3 camera)</code>: Camera is needed at loc3.</li>
    <li><code>(= (number_read loc1 spectro) 0)</code>: Initial number of readings from spectro at loc1 is zero.</li>
    <li><code>(= (max_read loc1 spectro) 2)</code>: Maximum readings needed from spectro at loc1 is two.</li>
    <li><code>(= (number_read loc2 camera) 0)</code>: Initial number of readings from camera at loc2 is zero.</li>
    <li><code>(= (max_read loc2 camera) 2)</code>: Maximum readings needed from camera at loc2 is two.</li>
    <li><code>(= (number_read loc2 radar) 0)</code>: Initial number of readings from radar at loc2 is zero.</li>
    <li><code>(= (max_read loc2 radar) 1)</code>: Maximum readings needed from radar at loc2 is one.</li>
    <li><code>(= (number_read loc3 camera) 0)</code>: Initial number of readings from camera at loc3 is zero.</li>
    <li><code>(= (max_read loc3 camera) 2)</code>: Maximum readings needed from camera at loc3 is two.</li>
    <li><code>(= (wait_steps) 0)</code>: Initial number of steps waited for communication is zero.</li>
    <li><code>(= (number_sent) 0)</code>: Initial number of data items sent is zero.</li>
    <li><code>(= (max_sent_data) 4)</code>: Maximum number of data items to be sent is four.</li>
    <li><code>(communication_closed)</code>: Communication is initially closed.</li>
    <li><code>(config_for loc1 config1)</code>: Configuration 1 is for loc1.</li>
    <li><code>(config_for loc2 config2)</code>: Configuration 2 is for loc2.</li>
    <li><code>(config_for loc3 config3)</code>: Configuration 3 is for loc3.</li>
    <li><code>(not_configured)</code>: The rover is not configured initially.</li>
</ul>

<h3>Goal</h3>

<p>The goal is to ensure that data is collected, processed, and sent from all locations before communication is closed. Specifically:</p>
<ul>
    <li><code>(data_sent robot loc1 spectro)</code>: Data at loc1 collected by spectro is sent.</li>
    <li><code>(data_sent robot loc2 camera)</code>: Data at loc2 collected by camera is sent.</li>
    <li><code>(data_sent robot loc2 radar)</code>: Data at loc2 collected by radar is sent.</li>
    <li><code>(data_sent robot loc3 camera)</code>: Data at loc3 collected by camera is sent.</li>
    <li><code>(communication_closed)</code>: Communication is closed.</li>
</ul>

<h3>Metric</h3>

<p>Minimize the total time for the mission:</p>
<ul>
    <li><code>(:metric minimize (total-time))</code></li>
</ul>

</body>
</html>
