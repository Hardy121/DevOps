#!/bin/bash

function myfunction {
	
	echo "This is the first function with block scope"
	
}

myfunction


secondFunction(){
	
	echo "This is the second function"

}
secondFunction
