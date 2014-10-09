proc trimSpace {arg} {

	regsub  "^ +" $arg {} arg
	regsub  " +$" $arg {} arg
	
	regsub  "^	+" $arg {} arg
	regsub  "	+$" $arg {} arg	
	
	regsub "^ +" $arg {} arg
	regsub " +$" $arg {} arg

	return $arg	
}