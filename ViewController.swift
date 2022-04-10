//
//  ViewController.swift
//  Email Test
//
//  Created by Aarush malik on 3/27/22.
//
import MessageUI
import SafariServices
import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
// this script basically makes a button and i choose bACKROUND and location
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 50))
        view.addSubview(button)
        button.setTitle("Contact Us",
                        for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.center = view.center
        button.addTarget(self,
                         action: #selector(didTapButton),
                         for: .touchUpInside)
    }

@objc private func didTapButton() {
    if MFMailComposeViewController.canSendMail() {
        let vc = MFMailComposeViewController()
        vc.delegate = self
        vc.setSubject("Contact Us / Feedback")
        //here is where i set the email to send to
        vc.setToRecipients(["malikaarush07@gmail.com"])
        vc.setMessageBody("<h1>Hello World</h1>", isHTML: true)
        present(UINavigationController(rootViewController: vc),
                animated: true)
     
    }
    else{
        guard let url = URL(string: "https://malikaarush07.wixsite.com/coding") else{
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
}
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}

