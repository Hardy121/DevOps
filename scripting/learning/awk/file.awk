BEGIN{
	print "Start of the file"	
}
{
if($NF>50000)
	$7="High"
else
	$7="Low"
print $0

}
END{
	print "End of the file"	
}
