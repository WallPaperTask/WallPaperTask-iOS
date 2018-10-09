//
//  WallPaperViewController.swift
//  壁紙タスクン
//
//  Created by 築山朋紀 on 2018/10/06.
//  Copyright © 2018 築山朋紀. All rights reserved.
//

import UIKit

class WallPaperViewController: UIViewController {
	
	
	let pageControl = UIPageControl()
	let scrollView = UIScrollView()
	let returnButton = UIButton()
	let saveButton = UIButton()
	let colorEditButton = UIButton()
	let wallPaper1View = WallPaper1View()
	let wallPaper2View = WallPaper2View()
	let wallPaper3View = WallPaper3View()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = UIColor.gray
		
		scrollView.showsVerticalScrollIndicator = false
		scrollView.showsHorizontalScrollIndicator = false
		scrollView.isPagingEnabled = true
		scrollView.delegate = self
		scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
		scrollView.contentSize = CGSize(width: view.frame.width * 4, height: scrollView.frame.height)
		view.addSubview(scrollView)
		
		wallPaper1View.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scrollView.frame.height)
		scrollView.addSubview(wallPaper1View)
		
		wallPaper2View.frame = CGRect(x: view.frame.width, y: 0, width: view.frame.width, height: scrollView.frame.height)
		scrollView.addSubview(wallPaper2View)
		
		wallPaper3View.frame = CGRect(x: view.frame.width * 2, y: 0, width: view.frame.width, height: scrollView.frame.height)
		scrollView.addSubview(wallPaper3View)
		
		returnButton.frame = CGRect(x: 10, y: 30, width: 50, height: 25)
		returnButton.setTitle("戻る", for: .normal)
		returnButton.setTitleColor(UIColor.white, for: .normal)
		returnButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
		returnButton.addTarget(self, action: #selector(WallPaperViewController.returunButtonAction), for: .touchUpInside)
		view.addSubview(returnButton)
		
		saveButton.frame = CGRect(x: (view.frame.width - 70) / 2, y: view.frame.height - 100, width: 70, height: 70)
		saveButton.setTitle("保存", for: .normal)
		saveButton.layer.borderColor = UIColor.white.cgColor
		saveButton.layer.borderWidth = 1
		saveButton.layer.cornerRadius = 35
		saveButton.clipsToBounds = true
		saveButton.addTarget(self, action: #selector(WallPaperViewController.save), for: .touchUpInside)
		view.addSubview(saveButton)
		
		pageControl.frame = CGRect(x: 0, y: saveButton.frame.maxY + 10, width: view.frame.width, height: 10)
		pageControl.numberOfPages = 4
		pageControl.currentPage = 0
		pageControl.isUserInteractionEnabled = false
		view.addSubview(pageControl)
		
		colorEditButton.frame = CGRect(x: view.frame.width * 2 - 110, y: 30, width: 100, height: 25)
		colorEditButton.setTitle("カラー変更", for: .normal)
		colorEditButton.addTarget(self, action: #selector(WallPaperViewController.colorEdit), for: .touchUpInside)
		scrollView.addSubview(colorEditButton)
    }
	
	@objc func save(){
		let button = self.saveButton
		UIView.animate(withDuration: 0.05, animations: {[weak button] in
			button?.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
			}, completion: { _ in
				UIView.animate(withDuration: 0.03) {[weak button] in
					button?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
				}
		})
		
		let views: [UIView] = [wallPaper1View, wallPaper2View, wallPaper3View, wallPaper1View]
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
			self.returnButton.isHidden = true
			self.saveButton.isHidden = true
			self.pageControl.isHidden = true
			self.colorEditButton.isHidden = true
			let myImage = views[Int(self.scrollView.contentOffset.x / self.scrollView.frame.maxX)].getImage() as UIImage
			UIImageWriteToSavedPhotosAlbum(myImage, nil, nil, nil)
			self.returnButton.isHidden = false
			self.saveButton.isHidden = false
			self.pageControl.isHidden = false
			self.colorEditButton.isHidden = false
		}
	}
	
	@objc func returunButtonAction() {
		dismiss(animated: true, completion: nil)
	}
	
	@objc func colorEdit() {
		wallPaper2View.labelColor()
	}
}

extension WallPaperViewController: UIScrollViewDelegate {
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		if fmod(scrollView.contentOffset.x, scrollView.frame.maxX) == 0 {
			pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX)
		}
	}
}
