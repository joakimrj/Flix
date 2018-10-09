//
//  DetailViewController.swift
//  Flix
//
//  Created by Joakim Jorde on 16.09.2018.
//  Copyright © 2018 Joakim Jorde. All rights reserved.
//

import UIKit

enum MovieKeys{
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
    static let releaseDate = "release_date"
    static let overview = "overview"
    static let rate = "vote_average"
}
class DetailViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titlelable: UILabel!
    @IBOutlet weak var releaseDateLable: UILabel!
    @IBOutlet weak var overviewLable: UILabel!
    @IBOutlet weak var rateLable: UILabel!
    
    //var movie: [String: Any]?
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie{
            titlelable.text = movie.title
            releaseDateLable.text = movie.releaseDate
            overviewLable.text = movie.overview
            rateLable.text = movie.rate
            
            let placeholderImage = UIImage(named: "placeholder")!
            posterImageView.af_setImage(withURL: movie.posterUrl!, placeholderImage: placeholderImage)
            backDropImageView.af_setImage(withURL: movie.backdropUrl!, placeholderImage: placeholderImage)
        }
     /*   if let movie = movie {
            titlelable.text = movie[MovieKeys.title] as? String
            releaseDateLable.text = movie[MovieKeys.releaseDate] as? String
            if let rate = movie[MovieKeys.rate] as? NSNumber{
                let nf = NumberFormatter()
                nf.numberStyle = .decimal
                nf.minimumFractionDigits = 1
                nf.maximumFractionDigits = 1
                let rater = nf.string(from: rate)!
                rateLable.text = "Rate: \(rater)/10"
            }
            overviewLable.text = movie[MovieKeys.overview] as? String
            let backdropPathString = movie[MovieKeys.backdropPath] as! String
            let posterPathString = movie[MovieKeys.posterPath] as! String
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            
            let backdropURL = URL(string: baseURLString + backdropPathString)!
            backDropImageView.af_setImage(withURL: backdropURL)
            let posterURL = URL(string: baseURLString + posterPathString)!
            posterImageView.af_setImage(withURL: posterURL)
            
        }
        // Do any additional setup after loading the view.*/
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
