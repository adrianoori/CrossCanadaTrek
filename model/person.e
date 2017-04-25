note
	description: "Summary description for {PERSON}."
	author: "Adrian Noori"
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

create
	make

feature{CONTROLLER} -- Representation
	place:LOCATION assign set_place -- current location
	money:INTEGER assign set_money
	package:detachable PACKAGE assign set_Package -- package to deliver
	destination:LOCATION -- where to go to win
	continue:BOOLEAN assign set_continue -- flag: continue playing after destination reached

feature{PERSON_ACCESSOR} -- Initialization

	make(starting_place:LOCATION; starting_money:INTEGER; to_destination:LOCATION)
	require
		starting_place /= void
		starting_money > 0
		to_destination /= void
	do
		place := starting_place
		money := starting_money
		destination := to_destination
	ensure
		place /= void
		money > 0
		package = void
		destination /= void
	end

feature{CONTROLLER} -- Implementation

	set_place(p:LOCATION)
	require
		p /= void
	do
		place := p
	end

	set_money(i:INTEGER)
	require
		i > -1
	do
		money := i
	ensure
		money > -1
	end

	set_package(p:detachable PACKAGE)
	do
		package := p
	end

	set_continue(b: BOOLEAN)
	do
		continue := b
	end

feature -- Invariant
	frozen the_instance:PERSON
	once
		Result := Current
	end

invariant
	only_one_instance: the_instance = Current
	no_debt: money > -1
	is_somewhere: place /= void
	going_somewhere: destination /= void
end
