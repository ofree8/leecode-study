package sort

import "math/rand"

func QuickSort(input []int) {
	if len(input) < 3 {
		insertSort1(input, 0, len(input)-1)
		return
	}
	pIndex := rand.Intn(len(input) - 1)
	input[0], input[pIndex] = input[pIndex], input[0]
	// qSort2Internal(input, 0, len(input)-1)
	qSort3Internal(input, 0, len(input)-1)
}

func qSort2Internal(input []int, left, right int) {
	if right <= left+15 {
		insertSort1(input, left, right)
		return
	}
	l := left + 1
	r := right
	for {
		for l <= r && input[l] < input[left] {
			l++
		}
		for r > l && input[r] > input[left] {
			r--
		}
		if l > r {
			break
		}
		input[l], input[r] = input[r], input[l]
		l++
		r--
	}
	input[left], input[r] = input[r], input[left]
	qSort2Internal(input, left, r-1)
	qSort2Internal(input, r+1, right)
}

func qSort3Internal(input []int, left, right int) {
	if right <= left+15 {
		insertSort1(input, left, right)
		return
	}
	lt := left
	gt := right
	i := left + 1
	for i <= gt {
		if input[i] < input[left] {
			input[i], input[lt+1] = input[lt+1], input[i]
			lt++
			i++
		} else if input[i] == input[left] {
			i++
		} else {
			input[i], input[gt] = input[gt], input[i]
			gt--
		}
	}
	input[left], input[lt] = input[lt], input[left]
	qSort3Internal(input, left, lt-1)
	qSort3Internal(input, gt+1, right)
}
