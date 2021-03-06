//
//  72_EditDistance.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-25.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:72 Edit Distance
	URL: https://leetcode.com/problems/edit-distance/
	Space: O(NM)
	Time: O(NM)
*/

class EditDistance_Solution {
  func minDistance(_ word1: String, _ word2: String) -> Int {
    let word1Characters = [Character](word1.characters)
		let word2Characters = [Character](word2.characters)
		let word1Len = word1Characters.count
		let word2Len = word2Characters.count
		
		var dp = Array(repeating: Array(repeating: 0, count: word2Len + 1), count: word1Len + 1)
		
		for i in 0...word1Len {
			for j in 0...word2Len {
				if i == 0 {
					dp[i][j] = j
				} else if j == 0{
					dp[i][j] = i
				} else if word1Characters[i - 1] == word2Characters[j - 1] {
					dp[i][j] = dp[i - 1][j - 1]
				} else {
					dp[i][j] = min(dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1]) + 1
				}
			}
		}
		return dp[word1Len][word2Len]
  }
	
	func test() {
		let test1 = minDistance("abc", "cfb")
		print(test1)
	}
}
