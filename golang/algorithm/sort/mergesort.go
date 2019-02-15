package sort

func MergeSort(input []int) []int {
	if len(input) <= 0 {
		insertSort1(input, 0, len(input)-1)
		return nil
	}
	mergeInternal(input, 0, len(input)-1)
	return input
}

func mergeInternal(input []int, left, right int) {
	if right-left <= 20 {
		insertSort1(input, left, right)
		return
	}
	mid := left + (right-left)/2
	mergeInternal(input, left, mid)
	mergeInternal(input, mid+1, right)
	if input[mid] > input[mid+1] {
		merge(input, left, mid, right)
	}

	return
}

func merge(input []int, left, middle, right int) {
	temp := make([]int, right-left+1)
	i := 0
	j := left
	k := middle + 1
	for ; j <= middle && k <= right; i++ {
		if input[j] <= input[k] {
			temp[i] = input[j]
			j++
		} else {
			temp[i] = input[k]
			k++
		}
	}
	for ; j <= middle; j++ {
		temp[i] = input[j]
		i++
	}
	for ; k <= right; k++ {
		temp[i] = input[k]
		i++
	}
	copy(input[left:], temp)
}
