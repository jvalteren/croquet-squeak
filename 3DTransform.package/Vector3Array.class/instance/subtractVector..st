math functions
subtractVector: vec
	1 to: self size do:[:i | self at: i put: (self at: i)-vec.].