//
//  AuthenticationModuleRecipesModuleViewController.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

import NetworkLayer
import UIKit

class RecipesModuleViewController: UIViewController {

    @IBOutlet weak var recipesList: UITableView!
    var viewToPresenterProtocol: RecipesModuleViewToPresenter!

    private var recipes: Recipes? = nil {
        didSet {
            recipesList.reloadData()
        }
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        viewToPresenterProtocol.viewIsReady()
    }
}

extension RecipesModuleViewController: RecipesModulePresenterToView {
    func showRecipes(recipes: Recipes) {
        self.recipes = recipes
    }

    func showErrorMessage() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching recipes", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension RecipesModuleViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let recipe = recipes?.data[indexPath.row]
        cell.textLabel?.text = recipe?.name
        cell.detailTextLabel?.text = recipe?.subtitle
        return cell
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes?.data.count ?? 0
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewToPresenterProtocol.showDetailsScreen(for: recipes!.data[indexPath.row])
    }
}
