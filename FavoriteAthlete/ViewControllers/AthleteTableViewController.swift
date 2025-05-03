import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
    }

    var athletes: [Athlete] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    @IBAction func unwindToAthleteTableViewController(segue: UIStoryboardSegue) {
        guard let viewController = segue.source as? AthleteFormViewController, let athlete = viewController.athlete else { return }
        if let indexPath = tableView.indexPathForSelectedRow {
            athletes[indexPath.row] = athlete
        } else {
            athletes.append(athlete)
        }
        
    }

    @IBSegueAction func addAthlete(_ coder: NSCoder) -> AthleteFormViewController? {
        return AthleteFormViewController(coder: coder, athlete: nil)
    }
    
    @IBSegueAction func editAthlete(_ coder: NSCoder, sender: Any?) -> AthleteFormViewController? {
        var athlete: Athlete?
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else{ return AthleteFormViewController(coder: coder)}
        athlete = athletes[indexPath.row]
        return AthleteFormViewController(coder: coder, athlete: athlete)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = athlete.name
        content.secondaryText = athlete.description
        cell.contentConfiguration = content
        
        return cell
    }
}
