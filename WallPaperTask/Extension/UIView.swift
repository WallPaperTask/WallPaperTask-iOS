//
//  UIView.swift
//  WallPaperTask
//
//  Created by 築山朋紀 on 2018/10/09.
//  Copyright © 2018 築山朋紀. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
	
	func getImage() -> UIImage {
		// キャプチャする範囲を取得.
		let rect = self.bounds
		
		// ビットマップ画像のcontextを作成.
		UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
		let context = UIGraphicsGetCurrentContext()
		
		// 対象のview内の描画をcontextに複写する.
		self.layer.render(in: context!)
		
		// 現在のcontextのビットマップをUIImageとして取得.
		let capturedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
		
		// contextを閉じる.
		UIGraphicsEndImageContext()
		
		return capturedImage
	}
}

enum BorderPosition {
	case top
	case left
	case right
	case bottom
}

extension UIView {
	/// 特定の場所にborderをつける
	///
	/// - Parameters:
	///   - width: 線の幅
	///   - color: 線の色
	///   - position: 上下左右どこにborderをつけるか
	func addBorder(width: CGFloat, color: UIColor, position: BorderPosition) {
		
		let border = CALayer()
		
		switch position {
		case .top:
			border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: width)
			border.backgroundColor = color.cgColor
			self.layer.addSublayer(border)
		case .left:
			border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.height)
			border.backgroundColor = color.cgColor
			self.layer.addSublayer(border)
		case .right:
			print(self.frame.width)
			
			border.frame = CGRect(x: self.frame.width - width, y: 0, width: width, height: self.frame.height)
			border.backgroundColor = color.cgColor
			self.layer.addSublayer(border)
		case .bottom:
			border.frame = CGRect(x: 0, y: self.frame.height - width, width: self.frame.width, height: width)
			border.backgroundColor = color.cgColor
			self.layer.addSublayer(border)
		}
	}
}

