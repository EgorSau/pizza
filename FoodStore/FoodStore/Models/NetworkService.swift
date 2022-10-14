//
//  NetworkService.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 14.10.2022.
//

import UIKit

class NetworkService {
    func urlRequest(completion: @escaping (UIImage) -> Void) {
//        var imagesArray = [UIImage]()
        let stringUrl = "https://aws.random.cat/meow"
        guard let url = URL(string: stringUrl) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        DispatchQueue.global(qos: .background).async {
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else { return }
                do  {
                    let response = try JSONDecoder().decode(CatModel.self, from: data)
                    print("SUCCESS: \(response)")
                    //MARK: Pictures data
                    guard let pictureName = response.file else { return }
                    guard let url = URL(string: pictureName)
                    else {
                        print("Unable to create URL")
                        return
                    }
                    do {
                        let data = try Data(contentsOf: url, options: [])
                        guard let image = UIImage(data: data) else { return }
//                        imagesArray.append(image)
//                        print("++++++++++++++++++")
//                        print(imagesArray)
//                        print("++++++++++++++++++")
                        completion(image)
                    }
                    catch {
                        print(error.localizedDescription)
                    }
//                    completion(imagesArray)
                }
                catch {
                    print(error)
                }
            }
            task.resume()
        }
    }
}
