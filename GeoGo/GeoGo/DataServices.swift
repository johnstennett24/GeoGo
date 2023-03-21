//
// Created by John Stennett on 2/27/23.
//

import Foundation
import SwiftyJSON
import Alamofire
import MapKit

class DataServices {
    // Get Locations and return a dictionary with locations
    // link: "https://run.mocky.io/v3/183eabc1-0d3d-4b2b-9bff-a0c7fcff6789"

    func getPoint() async throws -> [GeoPoint] {
        var points: [GeoPoint] = []
        guard let url = URL(string: "https://run.mocky.io/v3/183eabc1-0d3d-4b2b-9bff-a0c7fcff6789") else {
            fatalError("No URL given")
        }

        let decoder = JSONDecoder()

        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let data = data {
                do {
                    let tasks = try decoder.decode([GeoPoint].self, from: data)
                    tasks.forEach{
                        i in
                        points.insert(contentsOf: tasks, at: 0)
                    }
                } catch {
                    print(error)
                }
            }
        }
        return points
    }
}