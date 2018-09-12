//
//  TopRatedViewController.swift
//  Flix
//
//  Created by Joakim Jorde on 12.09.2018.
//  Copyright © 2018 Joakim Jorde. All rights reserved.
//

import UIKit

class TopRatedViewController: UIViewController, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [[String: Any]] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let cellsPerLine: CGFloat = 2
        let interItemSpaceingTotal = layout.minimumInteritemSpacing * (cellsPerLine-1)
        let width = collectionView.frame.size.width / cellsPerLine - interItemSpaceingTotal/cellsPerLine
        layout.itemSize = CGSize(width: width, height: width * 3/2)
        
        
        fetchMovies()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let movie = movies[indexPath.item]
        if let posterPathString = movie["poster_path"] as? String{
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string: baseURLString + posterPathString)!
            let placeholderImage = UIImage(named: "placeholder")!
            cell.posterImageView.af_setImage(withURL: posterURL, placeholderImage: placeholderImage)
           
        }
        return cell
    }
    
    func fetchMovies(){
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
              //  self.present(self.alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
               // }
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                //Get the array of movies
                let movies = dataDictionary["results"] as! [[String: Any]]
                //Store the movies in a property to use elsewhere
                self.movies = movies
                
                
                
                
                //Reload your table view data
                self.collectionView.reloadData()
                //self.refreshControl.endRefreshing()
                //self.activityIndicator.stopAnimating()
                
            }
            
            
        }
        task.resume()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
