#!/bin/awk -f

BEGIN{
	print "Hello world"
	name = "Paul"
	age = 20
	
	#array
	arr1[0] = 1
	arr1[1] = 2
	
	marks["English"] = 50
	marks["math"] = 40

	# For loop
	for (subject in marks)
	   print marks[subject]
	exit
}
{}

END {

	print name, age
}

