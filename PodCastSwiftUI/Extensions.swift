//
//  Extensions.swift
//  PodCastSwiftUI
//
//  Created by Thet Htun on 9/6/20.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation

extension URL {
    func download(to directory: FileManager.SearchPathDirectory, using fileName: String? = nil, overwrite: Bool = false, completion: @escaping (URL?, Error?) -> Void) throws {
        let directory = try FileManager.default.url(for: directory, in: .userDomainMask, appropriateFor: nil, create: true)
        let destination: URL
        if let fileName = fileName {
            destination = directory
                .appendingPathComponent(fileName)
                .appendingPathExtension(self.pathExtension)
        } else {
            destination = directory
            .appendingPathComponent(lastPathComponent)
        }
        if !overwrite, FileManager.default.fileExists(atPath: destination.path) {
            completion(destination, nil)
            return
        }
        URLSession.shared.downloadTask(with: self) { location, _, error in
            guard let location = location else {
                completion(nil, error)
                return
            }
            do {
                if overwrite, FileManager.default.fileExists(atPath: destination.path) {
                    try FileManager.default.removeItem(at: destination)
                }
                try FileManager.default.moveItem(at: location, to: destination)
                completion(destination, nil)
            } catch {
                print(error)
            }
        }.resume()
    }
}
