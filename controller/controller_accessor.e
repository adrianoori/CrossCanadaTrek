note
	description: "Summary description for {CONTROLLER_ACCESSOR}."
	author: "Adrian Noori"
	date: "$Date$"
	revision: "$Revision$"

class
	CONTROLLER_ACCESSOR

create
	make

feature{APPLICATION} -- Initialization
	make
	do
	end

	the_controller:CONTROLLER
	once
		create Result.make
	end

invariant
	singleton: the_controller = the_controller
end
