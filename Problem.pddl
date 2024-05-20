(define (problem Mars_Problem)
(:domain Mars_Domain)

(:objects

     
    loc1 loc2 loc3 - location    ; Three sampling locations 
    robot - rover           
    spectro camera radar - instrument   ; three different sensors which can be used in different locations 
    arm - manipulator     ; manipulator of the robot
    config1 config2 config3 - configuration; different configurations related to each location
)

(:init  ; Initialization of the robot
        
        
        (at_home)
        
        (standing robot)
        
        ; Non of the locations are visited yet
        (= (locs_visited) 0)   
        
        ; The plan is to visit all locations before getting back to stations
        ; This value should be equal to the number of the objects -location
        (= (max_locs_visited) 3)
        
        ; Location 1, 2 and, and 3 are not visited
        (not_visited loc1) (not_visited loc2) (not_visited loc3)
        
        
        ; Arm of the robot is not deployed initially
        (not_deployed arm)
        
        
        ; All sensors are deactive
        (all_sensors_deactive)
        (not_activated spectro) (not_activated camera) (not_activated radar)
        
        
        ; The data in all locations are not collected initially
        (not_data_collected loc1 spectro)
        (not_data_collected loc2 camera) (not_data_collected loc2 radar)
        (not_data_collected loc3 camera)
        ; the data in none of the locations are processed initially
        (not_data_processed loc1 spectro) (not_data_processed loc2 camera)
        (not_data_processed loc2 radar)
        (not_data_processed loc3 camera)
        
        ; the data in none of the locations are sent to earth initially
        (not_data_sent robot loc1 spectro)
        (not_data_sent robot loc2 camera) (not_data_sent robot loc2 radar)
        (not_data_sent robot loc3 camera)
        
        ; the initial untacking count in each location is zero initially
        (= (untacked_number loc1) 0) (= (untacked_number loc2) 0) (= (untacked_number loc3) 0)
        
        ; The required sensor to be used in each location
        (need loc1 spectro)
        (need loc2 camera) (need loc2 radar)
        (need loc3 camera) 
        
        ; Initiall number of reading from each sensor and the number of data collection needed for each sensor in each location
        (= (number_read loc1 spectro) 0)
        (= (max_read loc1 spectro) 2)
        
        (= (number_read loc2 camera) 0)
        (= (max_read loc2 camera) 2)
        
        (= (number_read loc2 radar) 0)
        (= (max_read loc2 radar) 1)
        
        (= (number_read loc3 camera) 0)
        (= (max_read loc3 camera) 2)
        
        
        ; Initiall number of steps waited for the communication establishing
        (= (wait_steps) 0)
        
        (= (number_sent) 0)
        (= (max_sent_data) 4)
        (communication_closed)
        
        
        (config_for loc1 config1)
        (config_for loc2 config2)
        (config_for loc3 config3)
        
        
        (not_configured)
        
        
        
)

(:goal (and

   
    
    
    
    
    (data_sent robot loc1 spectro)
    (data_sent robot loc2 camera) (data_sent robot loc2 radar)
    (data_sent robot loc3 camera)
    (communication_closed)
    
    
   
    
    
    
    
    
))

(:metric minimize (total-time))
)
