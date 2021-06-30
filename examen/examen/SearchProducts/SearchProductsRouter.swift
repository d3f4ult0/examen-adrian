//
//  SearchProductsRouter.swift
//  examen
//
//  Created BE-006 on 29/06/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class SearchProductsRouter: SearchProductsWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = SearchProductsViewController(nibName: "SearchProductsViewController", bundle: nil)
        let interactor = SearchProductsInteractor()
        let router = SearchProductsRouter()
        let presenter = SearchProductsPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}