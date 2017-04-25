note
	description: "Summary description for {PERSON_ACCESSOR}."
	author: "Adrian Noori"
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON_ACCESSOR

create
	make

feature{NONE} -- Represenation
	place:LOCATION
	money:INTEGER
	destination:LOCATION

feature{CONTROLLER} -- Initialization
	make(starting_location:LOCATION;starting_money:INTEGER;to_destination:LOCATION)
	require
		starting_location /= void
		starting_money > 0
		to_destination /= void
	do
		place := starting_location
		money := starting_money
		destination := to_destination
	ensure
		place /= void
		money > 0
		destination /= void
	end

	the_player:PERSON
	once
		create Result.make(place,money,destination)
	end

invariant
	singleton: the_player = the_player
	no_debt: money > -1
	is_somewhere: place /= void
	going_somewhere: destination /= void
end
