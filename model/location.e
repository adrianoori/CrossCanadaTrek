note
	description: "Summary description for {LOCATION}."
	author: "Adrian Noori"
	date: "$Date$"
	revision: "$Revision$"

class
	LOCATION

create
	make, make_package

feature{CONTROLLER} -- Representation
	name:STRING
	weight: INTEGER
	north: detachable LOCATION
	east: detachable LOCATION
	south: detachable LOCATION
	west: detachable LOCATION
	package:detachable PACKAGE -- only some locations will contain a package

feature{CONTROLLER} -- Initialization

	make(location_name:STRING; location_weight: INTEGER)
	require
		location_name /= void
		location_name.count > 0
		location_weight > 0
	do
		name := location_name
		weight := location_weight
	ensure
		name /= void
		name.count > 0
		weight > 0
		package = void --??
	end

	make_package(location_name:STRING; location_weight: INTEGER; location_package:PACKAGE)
	require
		location_name /= void
		location_name.count > 0
		location_weight > 0
		location_package /= void
	do
		name := location_name
		weight := location_weight
		package := location_package
	ensure
		name /= void
		name.count > 0
		weight > 0
		package /= void
	end
feature{CONTROLLER, MAP_ITERATOR, MAP} -- Access

	get_name: STRING
	do
		Result := name
	end

	get_weight: INTEGER
	do
		Result := weight
	end

	get_north: detachable LOCATION
	do
		Result := north
	end

	get_east: detachable LOCATION
	do
		Result := east
	end

	get_south: detachable LOCATION
	do
		Result := south
	end

	get_west: detachable LOCATION
	do
		Result := west
	end

feature{CONTROLLER}--Modifiers

	set_north(loc: LOCATION)
	require
		loc /= void
	do
		north := loc
	ensure
		north = loc
	end

	set_east(loc: LOCATION)
	require
		loc /= void
	do
		east := loc
	ensure
		east = loc
	end

	set_south(loc: LOCATION)
	require
		loc /= void
	do
		south := loc
	ensure
		south = loc
	end

	set_west(loc: LOCATION)
	require
		loc /= void
	do
		west := loc
	ensure
		west = loc
	end

invariant
	has_name:name /= void AND THEN name.is_empty = False

end
