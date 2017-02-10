//
//  ViewController.swift
//  EzClosure
//
//  Created by iOS Student on 2/9/17.
//  Copyright © 2017 tek4fun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tbView: UITableView!

    var info: NSDictionary = ["http://news.xinhuanet.com/fashion/2012-12/19/124106746_131n.jpg":"Anna",
                "https://s-media-cache-ak0.pinimg.com/736x/3f/a1/62/3fa162dbd33effa671b5e5a820952c88.jpg":"LyLy", "http://top10for.com/wp-content/uploads/2015/02/Hottest-Victoria%E2%80%99s-Secret-Models1.jpg":"Jenny"]


    override func viewDidLoad() {
        super.viewDidLoad()

        tbView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "Cell")

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        let key = info.allKeys[indexPath.row] as! String
        if let url = URL(string: key)
        {
            if let data = try? Data(contentsOf: url)
            {
                cell.img.image = UIImage(data: data)
                cell.name.text = info.value(forKey: key) as! String?
            }
        }
        return cell
    }

    func loadData(completion: @escaping (_ data: Data, _ index: Int) -> ())
    {
        DispatchQueue.main.async (execute:{

            for stringUrl in self.info.allKeys
            {
                if let url = URL(string: stringUrl as! String)
                {
                    if let data = try? Data(contentsOf: url)
                    {
                        completion(data, self.info.index(ofAccessibilityElement: stringUrl)
                    )}
                }
            }
        })
    }

    @IBAction func a_Print(sender: AnyObject){
        print("techmaster")
    }

    @IBAction func a_play(sender: AnyObject)
    {
        tbView.delegate = self
        tbView.dataSource = self
        DispatchQueue.main.async {
            self.tbView.reloadData()
        }
    }
    
}

