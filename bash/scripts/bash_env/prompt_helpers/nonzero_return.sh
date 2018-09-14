function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo -e " error $RETVAL"
}

