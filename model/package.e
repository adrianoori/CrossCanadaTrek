note
	description: "Summary description for {PACKAGE}."
	author: "Adrian Noori"
	date: "$Date$"
	revision: "$Revision$"

class
	PACKAGE

create
	make

feature{CONTROLLER} -- Representation
	destination:LOCATION -- Where player needs to go to win
	value:INTEGER -- How much money to add when arrive at destination

feature{NONE} -- Initialization
	make(destination_location:LOCATION; money_for_delivering:INTEGER)
	require
		destination_location /= void
		money_for_delivering > 0
	do
		destination := destination_location
		value := money_for_delivering
	ensure
		destination /= void
		value > 0
		destination = destination_location
		value = money_for_delivering
	end

invariant
	package_value_not_negative: value > -1
	location_exists: destination /= void
end
