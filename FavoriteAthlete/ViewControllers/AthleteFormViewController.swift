//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Федор Завьялов on 28.04.2025.
//

import UIKit

final class AthleteFormViewController: UIViewController {
    var athlete: Athlete?
    
    @IBOutlet weak var athleteName: UITextField!
    
    @IBOutlet weak var athleteAge: UITextField!
    
    @IBOutlet weak var athleteLeague: UITextField!
    
    @IBOutlet weak var athleteTeam: UITextField!
    
    
    init?(coder: NSCoder, athlete: Athlete?) {
        self.athlete = athlete
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveAthlete(_ sender: Any) {
        
        guard let name = athleteName.text,
              let ageString = athleteAge.text,
              let age = Int(ageString),
              let league = athleteLeague.text,
              let team = athleteTeam.text else { return }
        let athlete = Athlete(name: name, age: age, league: league, team: team)
    }
    
    
    private func updateView(){
        guard let athlete = athlete else { return }
        athleteName.text = athlete.name
        athleteAge.text = String(athlete.age)
        athleteLeague.text = athlete.league
        athleteTeam.text = athlete.team
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
