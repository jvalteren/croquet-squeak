math functions
normalize

	1 to: self size do:[:i | self at: i put: (self at: i) / (self at: i)length.].