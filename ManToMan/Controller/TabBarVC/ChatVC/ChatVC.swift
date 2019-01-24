//
//  ChatVC.swift
//  ManToMan
//
//  Created by Toan on 1/16/19.
//  Copyright © 2019 Thang Hoa. All rights reserved.
//

import UIKit

@IBDesignable
class customTextField : UITextField {
    private var _cornerRadius : CGFloat = 0.0
    
    @IBInspectable
    var cornerRadius : CGFloat {
        set (newValue) {
            _cornerRadius = newValue
            setCornerRadius()
        } get {
            
            return _cornerRadius
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setCornerRadius()
        
    }
    func setCornerRadius() {
        if _cornerRadius == -1 {
            layer.cornerRadius = frame.height / 2
        } else {
            layer.cornerRadius = _cornerRadius
            
        }
    }
    
}

class ChatVC: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var textFieldChat: UITextField!
    @IBOutlet weak var contentButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bottomConstraints: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    var isKeyboardAppear = false
    var keyboardHeight : CGFloat!
    var activeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9333333333, blue: 0.831372549, alpha: 1)
        self.view.tintColor = #colorLiteral(red: 0.9960784314, green: 0.9333333333, blue: 0.831372549, alpha: 1)
        self.hideKeyboardWhenTappedAround()
        textFieldChat.delegate = self
        scrollView.delegate = self
        
        //        self.hideKeyboardWhenTappedAround()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let center: NotificationCenter = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    
    @objc func keyboardDidShow(_ notification: Notification) {
//        print("Keyboard will show: \(notification.name.rawValue)")
        
        guard let keyboardRect = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        var contentInset: UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = (keyboardRect.height - (tabBarController?.tabBar.frame.height)! + 6)
        scrollView.contentInset = contentInset
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
        }
    }
    @objc func keyboardWillHide( _ notification: Notification) {
        var contentInset: UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = 0
        scrollView.contentInset = contentInset
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
        }
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
            
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldChat.resignFirstResponder()
        return true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard(){
        UIView.animate(withDuration: 0.40) {
            self.view.endEditing(true)

        }
    }

}
