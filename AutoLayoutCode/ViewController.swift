//
//  ViewController.swift
//  AutoLayoutCode
//
//  Created by Warren Hansen on 7/11/21.
//

import UIKit

class ViewController: UIViewController {

//    let parrentView: UIImageView = {
//       let imageView = UIImageView(image: UIImage(named: "warren"))
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
    let instructText: UITextView = {
        let textView = UITextView()
        textView.text = " TURN HEAD LEFT"
        textView.font = UIFont.boldSystemFont(ofSize: 21)
        textView.textAlignment  = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    let iconImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "certente"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return imageView
    }()
    
    let parrentView = UIImageView(image: UIImage(named: "warren"))
    
    let stackView   = UIStackView()
        
    //var squareImage = UIImage()
    
    var childView = UIView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        style()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
        let width = parrentView.frame.width * 0.55
        let height = parrentView.frame.height * 0.5

        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        childView = DrawView(frame: frame)
        childView.backgroundColor = UIColor.clear
        childView.translatesAutoresizingMaskIntoConstraints = false
        parrentView.addSubview(childView)
        childView.center = CGPoint(x: parrentView.frame.size.width  / 2,
                                     y: parrentView.frame.size.height / 2)
    }
    
    func style() {
        parrentView.translatesAutoresizingMaskIntoConstraints = false
        parrentView.contentMode = .scaleAspectFit
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.spacing   = 43.0
    }
    

    
    func layout() {
        
        //Stack View
        stackView.addArrangedSubview(parrentView)
        stackView.addArrangedSubview(instructText)
        stackView.addArrangedSubview(iconImageView)
        self.view.addSubview(stackView)
  
        //Constraints
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
        ])
    }


}

