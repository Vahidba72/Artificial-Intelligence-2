# Artificial-Intelligence-2


In a context of space exploration on the planet Mars, a next-generation autonomous rover, named MR-1, is tasked with conducting terrain analysis operations to collect scientific data. Equipped with a series of advanced sensors (including spectrometers, multispectral cameras, and radar for analysis activities, and stereoscopic cameras and IMU for navigation and attitude control) and sophisticated data processing capabilities, MR-1 is designed to explore Martian terrain and gather crucial mission information.
The whole analysis process involves carrying out a specific mission with several steps to ensure the successful gathering of chemical information from the soil. The process can be described as follows:
1- Navigation and Positioning: MR-1 navigates across the Martian surface using its onboard mobility system, such as wheels or tracks, guided by predefined paths or realtime navigation algorithms. It utilises its onboard sensors, including cameras and IMUs, to determine its position relative to its surroundings and maintain stability over varied terrain.
MR-1 knows how to: 
a) move between various locations, which are described using a topological map of the environment, where nodes represent locations themselves and edges represent predefined, doable trajectories between any two locations;
b) once a specific location where soil data must be collected is reached, position firmly on the ground to maintain stability.
2- Deployment of Scientific Instruments. Upon reaching a designated location and securing its stable operation, MR-1 deploys its scientific instruments designed for terrain analysis. These instruments may include spectrometers, cameras, radar systems, and other sensors capable of detecting and measuring various properties of the Martian surface, such as composition, topography, temperature, and humidity.
MR-1 knows how to: 
a) elongate (“untack”) a manipulator out of the main rover chassis; b) position the manipulator’s end-effector in different configura-ons around the robot location;
c) use the sensors located on the manipulator’s end-effector to collect various soil chemical information;
d) retract (“tack”) the manipulator in its home configuration once samples have been acquired.
3- Data Collection. Once the manipulator is deployed, MR-1 activates the scientific instruments located on its end-effector to collect data about the Martian terrain. Not all scientific instruments must be used in all locations. In fact, the knowledge of which instrument must be used in each location is a location-specific information. For example: (i) a spectrometer may analyse the composition of surface rocks and minerals by measuring the wavelengths of light reflected off the surface; (ii) cameras may capture images of the terrain from different perspectives, providing visual data for analysis to the team on Earth; (iii) radar systems may penetrate beneath the surface to map subsurface features like underground ice deposits or geological structures.
MR-1 knows how to: 
a) activate and deactivate each single instrument; 
b) acquire information from each instrument once it is placed correctly and activated.
4- Data Processing. The raw data collected by the scientific instruments must be processed partly onboard the rover using built-in computing resources, and partly by transferring it to Earth for heavier processing. Given that the analysis to be done depends on which instruments have been used, which on its turn depends on the locations visited by MR-1, this phase cannot follow a pre-scripted data flow, and the data analysis algorithms must be properly activated or deactivated.
MR-1 knows how to: 
a) perform spectrometer-based analyses; 
b) perform cameras-based analyses; 
c) perform radar-based analyses;
5- Decision Making. Since spectrometers, cameras, and radars are characterised by different performance related to the acquired data, in certain locations it may be necessary to carry out a specific reading twice; this is a location-specific information.
MR-1 knows: 
a) the number of times it must collect data related to a specific sensor in each location.
6- Data Transmission. At the end of each data collection session, and after MR-1 has returned to its home base, it must transmit collected data back to Earth.
MR-1 knows how to: 
a) wait for a suitable communica-on window where data transmission is possible; 
b) send data;
c) close the communication link.

Problem
You must design and implement a PDDL domain which models the “scientist Martian rover scenario”. Furthermore, you must design at least one PDDL problem generating a valid plan. Use ALL the things MR-1 knows.
