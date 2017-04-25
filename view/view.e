note
	description: "Summary description for {VIEW}."
	author: "Adrian Noori"
	date: "$Date$"
	revision: "$Revision$"

class
	VIEW

create
	make

feature{VIEW_ACCESSOR} -- Initialization
	make
	do
	end

feature{CONTROLLER} -- Access

	input(output:STRING):STRING
	-- output text to the player, and then get their input; return input to function caller
	require
		output /= void
	do
		print(output + "%N%R")
		io.read_line
		result := io.last_string.twin
		result.to_lower
	ensure
		result /= void
		--result is lowercase
	end

feature{NONE} -- Invariant
	frozen the_instance:VIEW
	once
		Result := Current
	end

invariant
	only_one_instance: the_instance = Current

end
