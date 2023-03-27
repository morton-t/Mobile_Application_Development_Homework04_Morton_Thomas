//
//  TableViewController.swift
//  Ind03_Morton_Thomas
//
//  Created by Thomas Morton on 3/27/23.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet var activitySpinner: UIActivityIndicatorView!
    
    var stateNames: [String] = []
    var stateNicknames: [String] = []
    var stateData: [(name: String, nickname: String)] = []
    
    var isLoaded: Bool = false
    
    /*
    let stateArea: Dictionary =
        [
            "Alaska" : "571,951",
            "Texas" : "261,797",
            "California" : "155,959",
            "Montana" : "145,552",
            "New Mexico" : "121,356",
            "Arizona" : "113,635",
            "Nevada" : "109,826",
            "Colorado" : "103,718",
            "Wyoming" : "97,100",
            "Oregon" : "95,997",
            "Idaho" : "82,747",
            "Utah" : "82,144",
            "Kansas" : "81,815",
            "Minnesota" : "79,610",
            "Nebraska" : "76,872",
            "South Dakota" : "75,885",
            "North Dakota" : "68,976",
            "Missouri" : "68,886",
            "Oklahoma" : "68,667",
            "Washington" : "66,544",
            "Georgia" : "57,906",
            "Michigan" : "56,804",
            "Iowa" : "55,869",
            "Illinois" : "55,584",
            "Wisconsin" : "54,310",
            "Florida" : "53,927",
            "Arkansas" : "52,068",
            "Alabama" : "50,744",
            "North Carolina" : "48,711",
            "New York" : "47,214",
            "Mississippi" : "46,907",
            "Pennsylvania" : "44,817",
            "Louisiana" : "43,562",
            "Tennessee" : "41,217",
            "Ohio" : "40,948",
            "Kentucky" : "39,728",
            "Virginia" : "39,594",
            "Indiana" : "35,867",
            "Maine" : "30,862",
            "South Carolina" : "30,109",
            "West Virginia" : "24,078",
            "Maryland" : "9,774",
            "Vermont" : "9,250",
            "New Hampshire" : "8,968",
            "Massachusetts" : "7,840",
            "New Jersey" : "7,417",
            "Hawaii" : "6,423",
            "Connecticut" : "4,845",
            "Delaware" : "1,954",
            "Rhode Island" : "1,045",
        ]
    
    let stateNickname: Dictionary =
        [
            "Alaska" : "The Last Frontier",
            "Texas" : "The Lone Star State",
            "California" : "The Golden State",
            "Montana" : "The Treasure State",
            "New Mexico" : "The Land of Enchantment",
            "Arizona" : "The Grand Canyon State",
            "Nevada" : "The Silver State",
            "Colorado" : "The Centennial State",
            "Wyoming" : "The Equality or Cowboy State",
            "Oregon" : "The Beaver State",
            "Idaho" : "The Gem State",
            "Utah" : "The Beehive State",
            "Kansas" : "The Sunflower State",
            "Minnesota" : "The North Star State",
            "Nebraska" : "The Cornhusker State",
            "South Dakota" : "Mount Rushmore State",
            "North Dakota" : "The Peace Garden State",
            "Missouri" : "The Show Me State",
            "Oklahoma" : "The Sooner State",
            "Washington" : "The Evergreen State",
            "Georgia" : "The Peach State",
            "Michigan" : "The Great Lakes State",
            "Iowa" : "The Hawkeye State",
            "Illinois" : "Prairie State",
            "Wisconsin" : "The Badger State",
            "Florida" : "The Sunshine State",
            "Arkansas" : "The Natural State",
            "Alabama" : "Yellowhammer State",
            "North Carolina" : "The Tar Heel State",
            "New York" : "The Empire State",
            "Mississippi" : "The Magnolia State",
            "Pennsylvania" : "The Keystone State",
            "Louisiana" : "The Pelican State",
            "Tennessee" : "The Volunteer State",
            "Ohio" : "The Buckeye State",
            "Kentucky" : "The Bluegrass State",
            "Virginia" : "The Old Dominion State",
            "Indiana" : "The Hoosier State",
            "Maine" : "The Pine Tree State",
            "South Carolina" : "The Palmetto State",
            "West Virginia" : "The Mountain State",
            "Maryland" : "The Old Line State",
            "Vermont" : "The Green Mountain State",
            "New Hampshire" : "The Granite State",
            "Massachusetts" : "The Bay State",
            "New Jersey" : "The Garden State",
            "Hawaii" : "The Aloha State",
            "Connecticut" : "The Constitution State",
            "Delaware" : "The First State",
            "Rhode Island" : "The Ocean State",
        ]
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create a delay using DispatchQueue
        if !isLoaded {
            DispatchQueue.main.async(qos: .userInitiated) {
                self.fetchDB()
                
                //while self.stateNames.count < 50 {}
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    self.buildStatesArray()
                    self.activitySpinner.stopAnimating()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    self.tableView.reloadData()
                    self.isLoaded = true
                }
            }
        }
            
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stateNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath)
            
        //Set the title and subtitle equal to statename and nickname respectively
        cell.textLabel?.text = stateData[indexPath[1]].0
        cell.detailTextLabel?.text = stateData[indexPath[1]].1

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        /*
        let stateData = segue.destination as! ViewController
        let index: Int? = tableView.indexPathForSelectedRow?.row
        
        //Set Strings to store state name and area
        let stateName: String = stateNames[index!]
        let area: String = stateArea[stateName]!
        
        //Use state name to fill in for the state flag and map image names
        let flagImageName: String = "\(stateName)_flag.jpg"
        let outlineImageName: String = "\(stateName).jpg"
        
        //Set the text on the next screen to display the state name and area
        stateData.stateName = stateName
        stateData.stateArea = "\(area) Square Miles"
        
        //Set the flag and map based on the given image names
        stateData.flagImage = UIImage(named: flagImageName)!
        stateData.outlineImage = UIImage(named: outlineImageName)!
        */
    }

    func buildStatesArray() {
        //Populate the array with tuples with our data
        for i in 0...stateNames.count - 1 {
            let currentName = stateNames[i]
            let currentNickname = stateNicknames[i]
            
            stateData.append((name: currentName, nickname: currentNickname))
        }
    }
    
    func fetchDB() {
        // Set up HTTP request
        let url = URL(string: "https://cs.okstate.edu/~tlmorto/71772aabb/fetch.php")
        var request = URLRequest(url: url!)
        var responseString: String?
        request.httpMethod = "GET"

        print("In fetch method")
        // Send request
        let task = URLSession.shared.dataTask(with: request) { [self](data, response, error) in
            guard let data = data, error == nil else {
                print("Data failed")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Response failed!")
                return
            }

            //Check if we received a valid response - else print the status code we received instead
            if httpResponse.statusCode == 200 {
                // Store response to a string
                responseString = String(data: data, encoding: .utf8)
                
                //delimit the response by newline and store it as a an array of strings
                let rows: [String] = responseString!.components(separatedBy: "\n")
                
                //iterate through each row of data
                for row in rows {
                    //delimit the data by comma
                    let index = row.components(separatedBy: ",")
                    
                    //append to each respective array depending on the index position
                    if row != "" {
                        stateNames.append(index[0])
                        stateNicknames.append(index[1])
                    }
                }
            }
            else {
                print("httpResponse failed: Received \(httpResponse.statusCode)")
            }
        }
        //initialize the task
        task.resume()
    }
}
