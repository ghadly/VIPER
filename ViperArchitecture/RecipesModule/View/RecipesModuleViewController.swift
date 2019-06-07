//
//  AuthenticationModuleAuthenticationModuleViewController.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

import UIKit

class RecipesModuleViewController: UIViewController {

    @IBOutlet weak var recipesList: UITableView!
    var viewToPresenterProtocol: RecipesModuleViewOutput!
    
    private var recipes: Recipes? = nil {
        didSet {
            recipesList.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewToPresenterProtocol.viewIsReady()
    }
}

extension RecipesModuleViewController: RecipesModuleViewInput {
    func showRecipes(recipes: Recipes) {
        self.recipes = recipes
    }
    
    func showErrorMessage() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching recipes", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension RecipesModuleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewToPresenterProtocol.showDetailsScreen(for: recipes!.data[indexPath.row])
    }
}

extension RecipesModuleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let recipe = recipes?.data[indexPath.row]
        cell.textLabel?.text = recipe?.name
        cell.detailTextLabel?.text = recipe?.subtitle
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes?.data.count ?? 0
    }
}
