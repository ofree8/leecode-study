package sort

// BubbleSort 冒泡排序
func BubbleSort(input []int) []int {
	for i := len(input) - 1; i >= 0; i-- {
		for j := 0; j < i; j++ {
			if input[j] > input[j+1] {
				input[j], input[j+1] = input[j+1], input[j]
			}
		}
	}
	return input
}

// SelectSort 选择排序
func SelectSort(input []int) []int {
	for i := 0; i < len(input); i++ {
		for j := i + 1; j < len(input); j++ {
			if input[i] > input[j] {
				input[i], input[j] = input[j], input[i]
			}
		}
	}
	return input
}

// InsertSort 插入排序
func InsertSort(input []int) []int {
	for i := 1; i < len(input); i++ {
		for j := i; j > 0 && input[j-1] > input[j]; j-- {
			input[j-1], input[j] = input[j], input[j-1]
		}
	}
	return input
}

// InsertSort1 插入排序优化版
func InsertSort1(input []int) []int {
	insertSort1(input, 0, len(input)-1)
	return input
}

func insertSort1(input []int, left, right int) {
	var j int
	for i := left + 1; i <= right; i++ {
		current := input[i]
		for j = i; j > left && current < input[j-1]; j-- {
			input[j] = input[j-1]
		}
		input[j] = current
	}
}
