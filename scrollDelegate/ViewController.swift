//
//  ViewController.swift
//  scrollDelegate
//
//  Created by Yolanda H. on 2019/5/20.
//  Copyright © 2019 Yolanda H. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet var detailScroll: [UIScrollView]!
    @IBOutlet var imageView: [UIImageView]!
    @IBOutlet weak var pageScroll: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0...11{
            detailScroll[i].delegate = self
            detailScroll[i].maximumZoomScale = 5
            detailScroll[i].minimumZoomScale = 1
            detailScroll[i].zoomScale = 1
        }
    }
    @IBAction func pageControlFunc(_ sender: UIPageControl) {
        pageScroll.contentOffset.x = detailScroll[sender.currentPage].frame.origin.x
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let frameWidth = Int(pageScroll.frame.size.width)
        let contentOffsetX = Int(pageScroll.contentOffset.x) + frameWidth / 3
        let currentPage = contentOffsetX / frameWidth
        pageControl.currentPage = currentPage
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        pageScroll.contentOffset.x = detailScroll[pageControl.currentPage].frame.origin.x
        return imageView[pageControl.currentPage]
    }
}

