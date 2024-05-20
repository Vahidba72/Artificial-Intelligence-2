

<h1>Mars Rover PDDL Project</h1>

<p>In the context of space exploration on Mars, a next-generation autonomous rover named MR-1 is tasked with conducting terrain analysis operations to collect scientific data. The rover is equipped with advanced sensors such as spectrometers, multispectral cameras, radar systems for analysis activities, and stereoscopic cameras and IMU for navigation and attitude control. MR-1 is designed to explore the Martian terrain and gather crucial mission information through a series of steps:</p>

<h2>Steps of the Mission</h2>
<ol>
    <li><strong>Navigation and Positioning</strong>: MR-1 uses its mobility system, cameras, and IMUs to navigate the Martian surface and maintain stability over varied terrain. It can move between predefined locations and position itself firmly for data collection.</li>
    <li><strong>Deployment of Scientific Instruments</strong>: Upon reaching a designated location, MR-1 deploys its scientific instruments, such as spectrometers, cameras, and radar systems, to analyze various properties of the Martian surface including composition, topography, temperature, and humidity.</li>
    <li><strong>Data Collection</strong>: MR-1 activates the scientific instruments on its manipulator’s end-effector to collect data. The specific instruments used depend on the location, and MR-1 collects data such as surface composition and subsurface features.</li>
    <li><strong>Data Processing</strong>: The raw data collected by the scientific instruments are processed partly onboard the rover and partly by transferring it to Earth. The data analysis algorithms are activated based on the instruments used and the locations visited.</li>
    <li><strong>Decision Making</strong>: MR-1 may need to perform specific readings multiple times in certain locations based on the performance of the instruments and the location-specific requirements.</li>
    <li><strong>Data Transmission</strong>: After MR-1 has returned to its home base, it transmits the collected data back to Earth during suitable communication windows.</li>
</ol>


<h2>Domain Description</h2>

<p>The domain file (<code>Mars_Domain.pddl</code>) defines the types, predicates, functions, and actions relevant to the rover's operations.</p>

<h3>Types</h3>
<ul>
    <li><code>location</code>: Represents different sampling locations on Mars.</li>
    <li><code>manipulator</code>: Represents the rover's manipulator arm.</li>
    <li><code>instrument</code>: Represents scientific instruments (spectrometer, camera, radar).</li>
    <li><code>rover</code>: Represents the rover itself.</li>
    <li><code>home</code>: Represents the home base or the mars station.</li>
    <li><code>configuration</code>: Represents configurations for the manipulator at each location before sampling data.</li>
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
    <li><code>(communication_closed)</code>: Communication to earth is closed.</li>
    <li><code>(communication_open)</code>: Communication to earth is open.</li>
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
    <li><code>(max_sent_data)</code>: Number of data items that needs to be sent.</li>
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

<h3>Problem sequencing</h3>
<ul>
    The problem defined for this PDDL project and domain to be solved is as follows:
    The rover is at home station initially and it's standing. There are three locations for the sampling which need to be visited. For loc1, spectro sensor must be used to collect data and the data should be read twice. For loc2 camera and radar are needed and the data for camera is collected twice and for radar it's only collected once. Also for loc3, camera data should be collected twice. The correct order of each data collection at each location is:
    1 - move to the location
    2 - sit 
    3 - untack robot arm 
    4 - configure the arm in the correct position
    5 - activate the required sensor
    6 - collect data with that sensor 
    7 - deactivate the sensor 
    8 - activate other sensors and repeat steps 5,6, and 7 if other sensors are needed for that special location.
    9 - tack the robot arm
    10 - process the gathered data
    11 - stand up and move to next locations and gather data again
    12 - after collecting all data get back to station
    13 - establish communication for sending data (this takes for time steps and you should wait)
    14 - send data
    15 - close communication window
    
    
<h3>Metric</h3>

<p>Minimize the total time for the mission:</p>
<ul>
    <li><code>(:metric minimize (total-time))</code></li>
</ul>

</body>
</html>
