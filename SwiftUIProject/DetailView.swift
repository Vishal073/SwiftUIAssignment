//
//  DetailView.swift
//  SwiftUIProject
//
//  Created by Vishal  on 19/02/25.
//

import SwiftUI
// Detail
struct DetailView: View {
    let roverPhoto: RoverPhotoObject // Use RoverPhotoObject type for Realm compatibility
    
    var body: some View {
        VStack {
            // Display the image
            ImageView(imageUrl: roverPhoto.imgSrc)
                .frame(height: 300)
            
            // Display camera and earth date information
            VStack(alignment: .leading) {
                Text("Rover: \(roverPhoto.roverName)")
                    .font(.headline)
                Text("Landing Date: \(roverPhoto.landingDate)")
                    .font(.subheadline)
                Text("Launch Date: \(roverPhoto.launchDate)")
                    .font(.subheadline)
                Text("Status: \(roverPhoto.status.capitalized)")
                    .font(.subheadline)
            }
            .padding()
            Spacer()
        }
        .navigationTitle("Photo Details")
    }
}
