addPairwise' intList1 intList2
	= front ++ rear
	  where
	  minLength = min (length intList1) (length intList2)
	  front = addPairwise (take minLength intList1) (take minLength intList2)
	  rear = drop minLength intList1 ++ drop minLength intList2

addPairwise'' intList1 intList2
	= front ++ rear
	  where
	  minLength = min (length intList1) (length intList2)
	  front = addPairwise front1 front2
	  rear = rear1 ++ rear2
	  (front1, rear1) = splitAt minLength intList1
	  (front2, rear2) = splitAt minLength intList2

