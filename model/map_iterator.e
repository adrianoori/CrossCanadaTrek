note
	description: "Summary description for {MAP_ITERATOR}."
	author: "Adrian Noori"
	date: "$Date$"
	revision: "$Revision$"

class
	MAP_ITERATOR

inherit
	ITERATOR[MAP]
	redefine target
	end

create
	make

feature{NONE} -- Representation
	target: MAP

feature{CONTROLLER} -- Initialization

	make
	do
		create target.make
	end

feature{CONTROLLER} -- Implementation

	set_index(i:INTEGER)
	require
		get_index > -1
		get_index < count + 2
	do
		target.list.go_i_th(i)
	ensure
		target.list.index = i
	end

	get_index:INTEGER
	do
		Result := target.list.index
	end

	item: LOCATION
	-- returns item at index position
	require
		item_exists: not allDone
	do
		Result := target.list.item
	end

	start
	-- moves index to first item
	require
		count > 0
	do
		target.list.start
	end

	next
	-- moves index to next item
	require
		count > 0
		item_exists: not allDone
	do
		target.list.forth
	ensure
		index_moved: target.list.index = old target.list.index + 1
	end

	allDone: BOOLEAN
	-- returns true if no more item at current position (or beyond)
	do
		Result := target.list.after
	end

	add(location:LOCATION)
	require
		location /= void
		name_not_void: location.get_name /= void
		name_not_empty: location.get_name.count > 0
	do
		target.add(location)
	ensure
		added_to_map: target.exist (location.get_name)
	end

	list:LINKED_LIST[LOCATION]
	do
		result := target.list
	end

	count:INTEGER
	do
		result := target.count
	end

feature{NONE} -- Hidden

	do_until (action: PROCEDURE [ANY, TUPLE [MAP]]; test: FUNCTION [ANY, TUPLE [MAP], BOOLEAN])
	do
	end

	do_while (action: PROCEDURE [ANY, TUPLE [MAP]]; test: FUNCTION [ANY, TUPLE [MAP], BOOLEAN])
	do
	end

	until_do (action: PROCEDURE [ANY, TUPLE [MAP]]; test: FUNCTION [ANY, TUPLE [MAP], BOOLEAN])
	do
	end

	while_do (action: PROCEDURE [ANY, TUPLE [MAP]]; test: FUNCTION [ANY, TUPLE [MAP], BOOLEAN])
	do
	end

	there_exists (test: FUNCTION [ANY, TUPLE [MAP], BOOLEAN]): BOOLEAN
	do
	end

	for_all (test: FUNCTION [ANY, TUPLE [MAP], BOOLEAN]): BOOLEAN
	do
	end

invariant
	map_exists: target /= void
	index_nonnegative: target.list.index >= 0
end
