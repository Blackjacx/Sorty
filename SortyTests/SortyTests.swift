//
//  SortyTests.swift
//  SortyTests
//
//  Created by Stefan Herold on 10/06/14.
//  Copyright (c) 2014 Stefan Herold. All rights reserved.
//

import XCTest
import Sorty

class SortyTests: XCTestCase {
	
	var sequence:Array<Double> = []
	var randomness:UInt32 = 2048
	let sorter = Sorty()
	
    override func setUp() {
        super.setUp()

		sequence = []
		
		for idx in (0..300) {
			sequence.append(Double( arc4random_uniform(randomness) ) / Double(randomness));
		}
    }
	
	func testInsertionSortPerformance() {
		self.measureBlock() {
			let out = self.sorter.insertionSort(self.sequence)
		}
	}
	
	func testAPPLEInsertionSortPerformance() {
		self.measureBlock() {
			var sequenceToSort = self.sequence.copy()
			insertionSort(&sequenceToSort, (0..sequenceToSort.count))
		}
	}
	
	func testSelectionSortPerformance() {
		self.measureBlock() {
			var sequenceToSort = self.sequence.copy()
			let out = self.sorter.selectionSort(sequenceToSort)
		}
	}
	
	func testBubbleSortPerformance() {
		self.measureBlock() {
			var sequenceToSort = self.sequence.copy()
			let out = self.sorter.bubbleSort(sequenceToSort)
		}
	}
	
	func testMergeSortPerformance() {
		self.measureBlock() {
			var sequenceToSort = self.sequence.copy()
			self.sorter.mergeSort(&sequenceToSort, initValue: DBL_MIN, leftIdx: 0, rightIdx: sequenceToSort.count-1)
		}
	}
	
	func testQuickSortPerformance() {
		self.measureBlock() {
			var sequenceToSort = self.sequence.copy()
			self.sorter.quickSort(&sequenceToSort, initValue: DBL_MIN, leftIdx: 0, rightIdx: sequenceToSort.count-1)
		}
	}
	
	func testAPPLEQuickSortPerformance() {
		self.measureBlock() {
			var sequenceToSort = self.sequence.copy()
			quickSort(&sequenceToSort, (0..sequenceToSort.count))
		}
	}
	
	func testAPPLESortPerformance() {
		self.measureBlock() {
			var sequenceToSort = self.sequence.copy()
			sort(sequenceToSort)
		}
	}
}
