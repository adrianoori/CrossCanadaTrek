note
	description: "CrossCanadaTrek application root class"
	date: "$Date$"
	revision: "$Revision$"
	author: "Adrian Noori"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature{NONE} -- Representation
	the_controller:CONTROLLER
	the_accessor:CONTROLLER_ACCESSOR

feature {NONE} -- Initialization
	make -- Run application.
	do
		create the_accessor.make
		the_controller := the_accessor.the_controller
	end
end
