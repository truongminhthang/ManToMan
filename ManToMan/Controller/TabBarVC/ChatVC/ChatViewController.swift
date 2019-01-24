//
//  ChatViewController.swift
//  ManToMan
//
//  Created by Toan on 1/10/19.
//  Copyright © 2019 Thang Hoa. All rights reserved.
//

import ApiAI
import UIKit
import JSQMessagesViewController
protocol SpeechManagerDelegate
{
    func didReceiveText(text:String)
//    func didStartedListening(status:Bool)
}


enum ChatWindowState {
    case minimised
    case maximised
}


class ChatViewController: JSQMessagesViewController {
    
    lazy var outgoingBubbleImageView: JSQMessagesBubbleImage = self.setupOutgoingBubble()
    lazy var incomingBubbleImageView: JSQMessagesBubbleImage = self.setupOutgoingBubble()
    lazy var speechSynthesizer = AVSpeechSynthesizer()
    lazy var botImageView = UIImageView()
    
    var chatWindowStatus: ChatWindowState = .maximised
    var botImageTapGesture: UITapGestureRecognizer?
    var messages = [JSQMessage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.senderId = "some ID"
        self.senderDisplayName = "some userName"
        
        // SpeechManager.swift
//        SpeechManager.shared.delegate = self as! SpeechManagerDelegate
        
        let swipeGesture = UITapGestureRecognizer(target: self, action: #selector(handleSwipe(gesture:)))
        
        self.view.addGestureRecognizer(swipeGesture)
//        self.addMicButton()
        
        // No avatar
        collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
        
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
            self.populateWithWelcomeMessage()
        })
        
    }
    

    
//    func addMicButton()
    
    func populateWithWelcomeMessage()
    {
        self.addMessage(withId: "MantoMan", name: "Bot", text: "Hi I am MantoMan")
        self.finishReceivingMessage()
        
        self.addMessage(withId: "MantoMan", name: "Bot", text: "I am here to help you about anything related to the job requirements")
        /*
        self.addMessage(withId: "BotId", name: "Bot", text: "Do you want to contact with our real supporters")
         */
        self.finishReceivingMessage()
    }
    private func addMessage(withId id: String, name: String, text: String) {
        if let message = JSQMessage(senderId: id, displayName: name, text: text) {
            messages.append(message)
        }
    }
    
    func minimiseBot() {
        if chatWindowStatus == .maximised {
            self.inputToolbar.contentView.textView.resignFirstResponder()
            UIView.animate(withDuration: 0.35, animations: {
                let rect = CGRect(x: 300, y: 50, width: 70, height: 70)
                self.view.frame = rect
                self.view.clipsToBounds = true
                self.view.layer.cornerRadius = rect.width / 2
                
            },completion: {[unowned self] (complete) in
                self.inputToolbar.isUserInteractionEnabled = false
                self.botImageView.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
                self.botImageView.image = #imageLiteral(resourceName: "chat_bot")
                
                self.botImageView.clipsToBounds = true
                self.botImageView.layer.cornerRadius = self.botImageView.frame.width / 2
                self.view.addSubview(self.botImageView)
                self.chatWindowStatus = .minimised
                self.botImageTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(gesture: )))
                self.view.addGestureRecognizer(self.botImageTapGesture!)
                
            })
        }
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        minimiseBot()
    }
    
    @objc func handleTap(gesture: UITapGestureRecognizer)
    {
        if chatWindowStatus == .minimised
        {
            botImageView.removeFromSuperview()
            UIView.animate(withDuration: 0.5, animations: {
                let rect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                self.view.frame = rect
                self.view.clipsToBounds = true
                self.view.layer.cornerRadius = 0
                self.chatWindowStatus = .maximised
            }, completion: { (completed) in
                self.inputToolbar.isUserInteractionEnabled = true
                self.view.removeGestureRecognizer(self.botImageTapGesture!)
            })
        }
    }
    func performQuery(senderId:String,name:String,text:String) {
        let request = ApiAI.shared()?.textRequest()
        
        if text != "" {
            request?.query = text
        } else {
            return
        }
        
        request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
            if response.result.action == "bot.quit" {
                if let parameters = response.result.parameters as? [String: AIResponseParameter] {
                    if let quit = parameters["quit"]?.stringValue {
                        let deadlineTime = DispatchTime.now() + .seconds(1)
                        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
                            self.minimiseBot()
                        })
                    }
                    
                }
                
            }
            // speech :
        }, failure: {request, error in
            print(error as Any)
            
        })
        ApiAI.shared()?.enqueue(request)
    }
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    private func setupOutgoingBubble() -> JSQMessagesBubbleImage {
        let bubbleImageFactory = JSQMessagesBubbleImageFactory()
        return bubbleImageFactory!.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
    }
    
    private func setupIncomingBubble() -> JSQMessagesBubbleImage {
        let bubbleImageFactory = JSQMessagesBubbleImageFactory()
        return bubbleImageFactory!.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleLightGray())
    }
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        let message = messages[indexPath.item] // 1
        if message.senderId == senderId { // 2
            return outgoingBubbleImageView
        } else { // 3
            return incomingBubbleImageView
        }
    }
    
    //removing avatars
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! JSQMessagesCollectionViewCell
        let message = messages[indexPath.item]
        
        if message.senderId == senderId {
            cell.textView?.textColor = UIColor.white
        } else {
            cell.textView?.textColor = UIColor.black
        }
        return cell
    }
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        addMessage(withId: senderId, name: senderDisplayName, text: text!)
        //
        
        finishSendingMessage()
        performQuery(senderId: senderId, name: senderDisplayName, text: text!)
    }
    
    override func didPressAccessoryButton(_ sender: UIButton!) {
        performQuery(senderId: senderId, name: senderDisplayName, text: "Mutimedia")
        
    }
    
    
    
    //    @objc func




}
//extension ChatViewController : SpeechManagerDelegate {
//    func didReceiveText(text: String) {
//        self.inputToolbar.contentView.textView.text = text
//        
//        if text != "Say something, please. Im listening" {
//            self.inputToolbar.contentView.rightBarButtonItem.isEnabled = true
//        }
//    }
//    
//    func didStartedListening(status: Bool) {
//        if status {
//            self.inputToolbar.contentView.textView.text = "Say something, please. Im listening"
//            
//        }
//    }
//}






