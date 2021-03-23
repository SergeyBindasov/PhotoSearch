//
//  ViewController.swift
//  Photo Search
//
//  Created by Sergey on 20.02.2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    private lazy var searchView: SearchView = {
        let searchView = SearchView()
        return searchView
    }()
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        searchView.searchButtontapped = {
            self.showGallery()
        }
        searchView.screenTapped = {
            self.hideKeyBoard()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
    }
}

extension SearchViewController {
    func showGallery() {
        let gallery = GalleryViewController()
        guard let searchText = self.searchView.textField.text else {return}
        gallery.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New search", style: .plain, target: self, action: #selector(dismissGallery))
        gallery.navigationItem.title = "\(searchText)"
        navigationController?.pushViewController(gallery, animated: true)
           gallery.fetchPhotos(query: searchText)
    }
    
    func hideKeyBoard() {
        view.endEditing(true)
    }
    
    @objc func dismissGallery() {
        let vc = SearchViewController()
        show(vc, sender: nil)
        searchView.textField.text = ""
    }
}


