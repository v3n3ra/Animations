//
//  ViewController.swift
//  Animations
//
//  Created by V K on 16.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertViewTopConstraint: NSLayoutConstraint!
    var isActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideAlert()
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
//        animateAlert(show: !isActive)
        springAnimate(show: !isActive)
    }
    
    private func animateAlert(show: Bool) {
        UIView.animate(withDuration: 1) { [weak self] in
            if show {
                self?.showAlert()
            } else {
                self?.hideAlert()
            }
            self?.view.layoutIfNeeded()
        }
    }
    
    private func springAnimate(show: Bool) {
        UIView.animate(withDuration: 1,
                       delay: 0.5,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0) { [weak self] in
            if show {
                self?.showAlert()
            } else {
                self?.hideAlert()
            }
            self?.view.layoutIfNeeded()
        } completion: { _ in
            print("animation completed")
        }
    }
    
    private func showAlert() {
        isActive = true
        alertViewTopConstraint.constant = 20
    }
    private func hideAlert() {
        isActive = false
        alertViewTopConstraint.constant = -(alertView.frame.origin.y) - alertView.frame.height
    }
}

