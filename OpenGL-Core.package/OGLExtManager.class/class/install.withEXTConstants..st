class initialization
install: extension withEXTConstants: list
	"Take a list of strings comprising open gl constants, and install them into GLEXTConstants.
	See also parseSpecConstants:."
	| code selector |
	selector := ('initialize', extension) asSymbol.
	code := String new writeStream.
	code nextPutAll: selector.
	code crtab; nextPutAll: '"This method was automatically generated by OGLExtManager"'.
	(self parseEXTConstants: list) do:[:binding|
		(GLExtConstants bindingOf: binding key) ifNil:[
			GLExtConstants addClassVarName: binding key.
		].
		code crtab; nextPutAll: binding key; nextPutAll: ' := '.
		code print: binding value; nextPutAll: '.'.
	].
	code := code contents.
	(GLExtConstants class sourceCodeAt: selector ifAbsent:['']) = code ifTrue:[^self]. "no change"
	GLExtConstants class compile: code classified: 'pool initialization'.