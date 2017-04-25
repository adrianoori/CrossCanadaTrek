note
	description: "Summary description for {MAP}."
	author: "Adrian Noori"
	date: "$Date$"
	revision: "$Revision$"

class
	MAP

inherit
	TRAVERSABLE[MAP]

create
	make

feature -- Representation
	list: LINKED_LIST [LOCATION]

feature {MAP_ITERATOR} -- Implementation

	make
	do
		create list.make
	ensure
		count_zero: list.count = 0
	end

	add (put_loc: LOCATION)
	require
		loc_not_void: put_loc /= void
		name_not_void: put_loc.get_name /= void
		name_not_empty: put_loc.get_name.count > 0
	local
		replaced: INTEGER -- use as flag for location replaced
	do
		-- if list is empty, put in front
		if list.is_empty then
			list.put_front (put_loc)
		else
			-- iterate through list
			from
				list.start -- move cursor to index = 1
			invariant
				-- list index is always between 1 and list count+1
				1 <= list.index and list.index <= list.count + 1
			until
				list.after -- until there is nothing to right of cursor
			loop
				-- if location name exists in list, just replace it, and flag as replaced
				if list.i_th (list.index).get_name.is_equal (put_loc.get_name) then
					list.replace (put_loc)
					replaced := replaced + 1 -- flag as replaced
				end
				list.forth -- move cursor one position to the right
			variant
				-- ensures index is one more than count, point to empty node
				list.count + 1 - list.index
			end
			if replaced = 0 then -- if name is unique, then insert to list
				list.put_left (put_loc)
			end
		end

	ensure
		field_count_accurate: count = list.count
		exists_in_list: exist (put_loc.get_name)
		name_is_unique: has1 (put_loc.get_name)
		count_equal_or_one_more: (list.count = old list.count) or
								 (list.count = old list.count + 1)
	end

	remove (name: STRING)
	require
		--begin added
		name_not_void: name /= void
		name_not_empty: name.count > 0
	do
		-- iterate through list
		from
			list.start
		invariant
			-- list index is always between 1 and list count+1
			1 <= list.index and list.index <= list.count + 1
		until
			list.after
		loop
			-- find item that matches given key, and remove it
			if list.item.get_name.is_equal (name) then
				Current.list.remove
			else
				list.forth -- move cursor only if item not removed
			end
		variant
				-- ensures index is one more than count, point to empty node
			list.count + 1 - list.index
		end

	ensure
		field_count_accurate: count = list.count
		count_one_less: (list.count = old list.count - 1) or (list.count = old list.count)
		index_one_less: (list.index = old list.index - 1) or (list.count = old list.count)
		name_not_in_list: (not exist (name)) or (list.count = old list.count)
	end

feature {MAP_ITERATOR}-- Quantifiers

	exist (name: STRING): BOOLEAN
		--checks if given location exists in the map
	require
		name_not_void: name /= void
		name_not_empty: name.count > 0
	do
		-- iterate through list
		from
			list.start -- move cursor to index = 1
		invariant
			-- list index is always between 1 and list count+1
			1 <= list.index and list.index <= list.count + 1
		until
			list.after -- until there is nothing to right of cursor
		loop
			if list.item.get_name.is_equal (name) then
				Result := true
			end
			list.forth -- move cursor one position to the right
		variant
			-- ensures index is one more than count, point to empty node
			list.count + 1 - list.index
		end
		if Result /= true then
			Result := false
		end
	ensure
		field_count_accurate: count = list.count
		equal_list_count: list.count = old list.count
	end

	has1 (name: STRING): BOOLEAN
	--checks if there is only one location with given name
	require
		name_not_void: name /= void
		name_not_empty: name.count > 0
	local
		name_found: INTEGER -- flag for name found
	do
		-- iterate through list
		from
			list.start -- move cursor to index = 1
		invariant
			-- list index is always between 1 and list count+1
			1 <= list.index and list.index <= list.count + 1
		until
			list.after -- until there is nothing to right of cursor
		loop
			if list.item.get_name.is_equal (name) then
				name_found := name_found + 1
			else
				Result := false
			end
			list.forth -- move cursor one position to the right
		variant
			-- ensures index is one more than count, point to empty node
			list.count + 1 - list.index
		end

		-- true only if one item was found
		if name_found = 1 then
			Result := true
		end
	ensure
		field_count_accurate: count = list.count
		equal_list_count: list.count = old list.count
	end

	count:INTEGER
	do
		Result := list.count
	end

feature{NONE} -- Hidden

	item: MAP
	local
		m: MAP
	do
		create m.make
		Result := m
	end

	off: BOOLEAN
	do
	end

	start
	do
	end

	has (v: MAP): BOOLEAN
	do
	end

	is_empty: BOOLEAN
	do
	end

	linear_representation: LINEAR [MAP]
	local
		--m: MAP
		lin: LINKED_LIST[MAP]
	do
		create lin.make
		Result := lin
	end

invariant
	count: count >= 0
end
