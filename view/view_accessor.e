note
	description: "Summary description for {VIEW_ACCESSOR}."
	author: "Adrian Noori"
	date: "$Date$"
	revision: "$Revision$"

class
	VIEW_ACCESSOR

create
	make

feature{CONTROLLER} -- Initialization
	make
	do
	end

	the_interface:VIEW
	once
		create Result.make
	end

invariant
	singleton: the_interface = the_interface
end
