;Hello deaf world domain
(define (domain Mars_Domain)

(:requirements :strips :typing :duration-inequalities :fluents)

(:types
        
    location manipulator instrument rover home configuration
    
)


(:predicates
        
    (at ?r - rover ?l - location) ; Rover ?r is at location ?l
    
    (standing ?r - rover) ; Rover ?r is standing 
    (sitting ?r - rover) ; Rover ?r is sitting 
    
    (at_home)  ; Rover is at mars station
    
    (not_home) ; Rover is out of mars station
    
    (not_visited ?l - location)   ; Location ?l is not visited
    (visited ?l - location) ; Location ?l is visited
    
    (deployed ?m - manipulator) ; manipulator ?m is not deployed yet 
    (not_deployed ?m - manipulator) ; manipulator ?m is not deployed from the chassis
    
    (need ?l - location ?i - instrument) ; scientific instrument ?i is needed for the location ?l
    
    (activated ?i - instrument) ; instrument ?i is activated
    (not_activated ?i - instrument) ; instrument ?i is not activated
    (one_sensor_activated) ; at least one sensor is activated
    (all_sensors_deactive) ; all sensors and instruments are deactivated
    
    (data_collected ?l - location ?i - instrument) ; data at location ?l related to instrument ?i is collected
    (not_data_collected ?l - location ?i - instrument) ; data at location ?l related to instrument ?i is not collected
    
    (data_processed ?l -location ?i - instrument) ;  data at location ?l collected by instrument ?i is processed
    (not_data_processed ?l -location ?i - instrument) ;  data at location ?l collected by instrument ?i is not processed
    
    (not_data_sent ?r - rover ?l - location ?i - instrument) ;  data at location ?l collected by instrument ?i by the rover ?r is not sent
    (data_sent ?r - rover ?l - location ?i - instrument) ;  data at location ?l collected by instrument ?i by the rover ?r is sent
    
    (communication_closed)
    (communication_open)
    
    (config_for ?l - location ?c - configuration)
    
    (configured)
    (not_configured)
        
)

(:functions 
     
    (number_read ?l - location ?i - instrument) ; number of the times that data in location ?l is collected by instrument ?i
    (max_read ?l - location ?i - instrument)  ; number of the times that data in location ?l needs to be collected by instrument ?i
    (locs_visited)  ; number of locations visited
    (max_locs_visited) ; number of location that should be visited before going back to stations
    (untacked_number ?l - location) ; number of the times that the manipulator of the rover is untacked at location ?l
    ; This value is defined cause in some cases the given plan had more than a few useless untack and tacking actions in one location
    ; So this function can help us limit the number of tackings in each location down to one 
    
    (wait_steps) ; number of time steps needed to establish a communication
    (number_sent) ; number of data sent 
    (max_sent_data)
)

(:action home_out ; The action to move rover ?r out of home station to the location ?to
        :parameters (?r - rover ?to - location)
        :precondition (and 
        
            (at_home)
            (standing ?r)
            (not_visited ?to)
            (>= (locs_visited) 0)
            
        )
        :effect (and 
            (at ?r ?to)
            (not (at_home))
            (not_home)
            (not (not_visited ?to))
            (visited ?to)
            (increase (locs_visited) 1)
            
            
        )
)

(:action back_home ; The action to get rover ?r back to station from the location ?from 
        :parameters (?r - rover ?from - location)
        :precondition (and 
        
            (at ?r ?from)
            (standing ?r)
            (not_home)
            (= (locs_visited) (max_locs_visited))
        )
        :effect (and 
        
            (at_home)
            (not (not_home))
            (not (at ?r ?from))
            
        )
)
    
    
(:action move ; The action to move rover ?r between locations ?from and ?to
        :parameters (?r - rover ?from ?to - location)
        :precondition (and 
            (at ?r ?from)
            (standing ?r)
            (not_visited ?to)
            (>= (locs_visited) 0)
            
            
            
            
        )
        :effect (and 
            (at ?r ?to)
            (not (at ?r ?from))
            (not (not_visited ?to))
            (visited ?to)
            (increase (locs_visited) 1)
            
            
            
        )
)

(:action sit ; The action to make the rover ?r sit 
        :parameters (?r - rover)
        :precondition (and
            
            (standing ?r)
            
        )
        :effect (and 
            (not (standing ?r))
            (sitting ?r)
            
        )
)

(:action stand_up ; The action to make the rover ?r after its manipulator ?m is tacked 
        :parameters (?r - rover ?m - manipulator)
        :precondition (and
            
            (sitting ?r)
            
            (not_deployed ?m)
            
        )
        :effect (and 
            
            (not (sitting ?r))
            (standing ?r)
            
        )
)
    
(:action untack ;The action  that rover ?r untacks the maanipulator ?m at location ?l
        :parameters (?r - rover ?m - manipulator ?l - location)
        :precondition (and 
            (at ?r ?l)
            (sitting ?r)
            (not_deployed ?m)
            (< (untacked_number ?l) 1)
        )
        :effect (and 
        
            (deployed ?m)
            (not (not_deployed ?m))

        )
)

(:action arm_configure ;The action  that rover ?r untacks the maanipulator ?m at location ?l
        :parameters (?r - rover ?m - manipulator ?l - location ?c - configuration)
        :precondition (and 
            (at ?r ?l)
            (sitting ?r)
            (deployed ?m)
            (config_for ?l ?c)
            (not_configured)
            
        )
        :effect (and 
        
            (not (not_configured))
            (configured)

        )
)

(:action tack ; The action that makes the rover ?r tack its manipulator ?m at location ?l 
        :parameters (?r - rover ?m - manipulator ?l - location)
        :precondition (and 
            (at ?r ?l)
            (sitting ?r)
            
            (configured)
            (>= (untacked_number ?l) 0)
            
            
        )
        :effect (and  
            (not (deployed ?m))
            (not_deployed ?m)
            (not_configured)
            (not (configured))
            (increase (untacked_number ?l) 1)
            
        )
)

(:action activate_inst ; The action to activate the instrument ?i of the rover ?l attached to manipulator ?m at location ?l
        :parameters (?r - rover ?l - location ?m - manipulator ?i - instrument)
        :precondition (and 
            (at ?r ?l)
            (sitting ?r)
            (deployed ?m)
            (configured)
            (need ?l ?i)
            (not_activated ?i)
            (all_sensors_deactive)
           

        )
        :effect (and 
            (not (not_activated ?i))
            (activated ?i)
            (not (all_sensors_deactive))
            (one_sensor_activated)
        )
)

(:action collect_data ; The action that makes the rover ?r collect data at locaion ?l by instrument ?i attached to manipulator ?m 
        :parameters (?r - rover ?l - location ?m - manipulator ?i - instrument)
        :precondition (and 
            (at ?r ?l)
            (sitting ?r)
            (deployed ?m)
            (activated ?i)
            (not_data_collected ?l ?i)
            (>= (number_read ?l ?i) 0)
            
        )
        :effect (and 
            
            (increase (number_read ?l ?i) 1)
        )
)

(:action deactivate_inst ; The action to deactivate the instrument ?i of the rover ?r attached to manipulator ?m at location ?l
        :parameters (?r - rover ?l - location ?m - manipulator ?i - instrument)
        :precondition (and 
            (at ?r ?l)
            (sitting ?r)
            (deployed ?m)
            (activated ?i)
            (not_data_collected ?l ?i)
            (= (number_read ?l ?i) (max_read ?l ?i))
            (one_sensor_activated)
            
        )
        :effect (and 
            
            (not (activated ?i))
            (not_activated ?i)
            (not (not_data_collected ?l ?i))
            (data_collected ?l ?i)
            (not (one_sensor_activated))
            (all_sensors_deactive)
        )
)

(:action Process_data ; The action to process data collected bt instrument ?i of the rover ?r attached to manipulator ?m at location ?l
        :parameters (?r - rover ?l - location ?m - manipulator ?i - instrument)
        :precondition (and 
            
            (at ?r ?l)
            (data_collected ?l ?i)
            (not_data_processed ?l ?i)
            (not_deployed ?m)
            
            
        )
        :effect (and 
            (data_processed ?l ?i)
            (not (not_data_processed ?l ?i))
        )
)


(:action wait_for_communication ; The action to wait for communication for 1 time step when the rover is back to station
        :parameters (?r -rover)
        :precondition (and 
            
            (at_home)
            (= (locs_visited) (max_locs_visited))
            (sitting ?r)
            (>= (wait_steps) 0)
            
            
        )
        :effect (and 
            (increase (wait_steps) 1)
            
        )
)

(:action open_communication ; The action to send data of ?r which is collected at location ?l by instrument ?i
        :parameters (?r - rover)
        :precondition (and 
            
            (at_home)
            (sitting ?r)
            (= (wait_steps) 4)
            (communication_closed)
            
            
        )
        :effect (and 
            
            (not (communication_closed))
            (communication_open)
        )
)

(:action send_data ; The action to send data of ?r which is collected at location ?l by instrument ?i
        :parameters (?r - rover ?l - location ?i - instrument)
        :precondition (and 
            
            (at_home)
            (sitting ?r)
            (data_collected ?l ?i)
            (communication_open)
            (data_processed ?l ?i)
            (not_data_sent ?r ?l ?i)
            (>= (number_sent) 0)
            
        )
        :effect (and 
            (data_sent ?r ?l ?i)
            (not (not_data_sent ?r ?l ?i))
            (increase (number_sent) 1)
        )
)
        
        
(:action close_communication ; The action to send data of ?r which is collected at location ?l by instrument ?i
        :parameters (?r - rover)
        :precondition (and 
            
            (at_home)
            (sitting ?r)
            (communication_open)
            (= (number_sent) (max_sent_data))
            
        )
        :effect (and 
            (communication_closed)
            (not (communication_open))
        )
        
        
)





)