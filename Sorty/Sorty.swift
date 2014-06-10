//
//  Sorty.swift
//  Sorty
//
//  Created by Stefan Herold on 10/06/14.
//  Copyright (c) 2014 Stefan Herold. All rights reserved.
//

import Foundation

class Sorty {

	func insertionSort<T: Comparable>(array: T[]) -> T[] {
		for var i:Int = 1; i<array.count; i++ {
			var j = i;
			var m = array[i] // Marker
			
			// for all elements left of the marker field
			while j > 0 && array[j-1] > m {
				// move all larger elements to the back
				array[j] = array[j-1]
				j--
			}
			// set the empty field to 'm'
			array[j] = m
		}
		return array;
	}
	
	func selectionSort<T: Comparable>(array: T[]) -> T[] {
		var m = array.count-1;
		while m >= 0 {
			// search largest element
			var max = 0
			for var i=1; i<=m; i++ {
				if array[i] > array[max] {
					max = i
				}
			}
			// swap array[m] with the largest element
			self.swap(array, idx1: m, idx2: max)
			m--
		}
		return array;
	}
	
	func bubbleSort<T: Comparable>(array: T[]) -> T[] {
		var swapped: Bool;
		do {
			swapped = false
			for var i=0; i<array.count-1; i++ {
				if array[i] > array[i+1] {
					self.swap(array, idx1: i, idx2: i+1)
					swapped = true
				}
			}
		} while swapped
		return array;
	}
	
	func mergeSort<T: Comparable>(inout array: T[], initValue: T, leftIdx: Int, rightIdx: Int) {
		var i, j, k:Int
		var b = Array(count: array.count, repeatedValue: initValue)
		
		if rightIdx > leftIdx {
			// Find mid point of array to sort
			var midIdx = (rightIdx + leftIdx) / 2
			
			// Sort left and right array parts seperately
			mergeSort(&array, initValue: initValue, leftIdx: leftIdx, rightIdx: midIdx)
			mergeSort(&array, initValue: initValue, leftIdx: midIdx+1, rightIdx: rightIdx)
			
			// Build helper array
			for k = leftIdx; k <= midIdx; k++ {
				b[k] = array[k]
			}
			for k = midIdx; k < rightIdx; k++ {
				b[rightIdx + midIdx - k] = array[k + 1]
			}
			
			// Merge results via helper array 'b'
			i = leftIdx
			j = rightIdx
			for k = leftIdx; k <= rightIdx; k++ {
				if b[i] < b[j] {
					array[k] = b[i++]
				} else {
					array[k] = b[j--]
				}
			}
		}
	}
	
	func quickSort<T: Comparable>(inout array: T[], initValue: T, leftIdx: Int, rightIdx: Int) {
		var lo = leftIdx
		var hi = rightIdx
		
		if hi > lo {
			// Get pivot element
			var mid = array[(lo + hi) / 2]
			while lo <= hi {
				// Find first element that is greater or equal than the pivot element. Beginning from left index
				while lo < rightIdx && array[lo] < mid {
					++lo
				}
				
				// Find first element that is less or equal than the pivot element. Beginning from right index
				while hi > leftIdx && array[hi] > mid {
					--hi
				}
				
				if lo <= hi {
					self.swap(array, idx1: lo, idx2: hi)
					++lo
					--hi
				}
			}
			
			// Sort left partition
			if leftIdx < hi {
				quickSort(&array, initValue: initValue, leftIdx: leftIdx, rightIdx: hi)
			}
			
			// Sort right partition
			if lo < rightIdx {
				quickSort(&array, initValue: initValue, leftIdx: lo, rightIdx: rightIdx)
			}
		}
	}
	
	// Helper
	
	func swap<T>(array: T[], idx1: Int, idx2: Int) {
		let tmp = array[idx1]
		array[idx1] = array[idx2]
		array[idx2] = tmp
	}
}

