//
//  ViewController.swift
//  randon_photo_genrator
//
//  Created by Philo Samuel on 03/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    //here we added an image view with white background
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        return imageView
    }()
    
    //added a new button, white bg, font color black
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Press Here to get your photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
 //an array of colors to chose from for the bg
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemCyan,
        .systemGray,
        .systemGreen,
        .systemMint,
        .systemPurple,
        .systemOrange
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        //we call the imgView here
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        //here we call the button
        view.addSubview(button)
        //here we call the randomphoto func
        getRandomPhoto()
        //button
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    //we write this so we can call it in viewDidLoad ig
    @objc func didTapButton(){
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    //this func is to place the button at the buttom
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
         
    }
    //get photo from the internet
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }


}

