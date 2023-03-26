//
//  MockData.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 26.03.2023.
//

import Foundation

final class MockData {
    let imageUrls = [
        MockModel(imageName: "https://www.hdwallpapers.in/download/star_wars_art_hd-HD.jpg"),
        MockModel(imageName: "https://images2.alphacoders.com/683/683733.png"),
        MockModel(imageName: "https://is5-ssl.mzstatic.com/image/thumb/PurpleSource122/v4/d2/7d/c3/d27dc362-1312-0f69-3c36-0041cc2f175f/f892ab6f-f0de-491c-b70c-9e866d30093c_Simulator_Screen_Shot_-_AppStore_iPhone_6s_Plus_-_2022-05-07_at_23.44.46.png/406x228bb.png"),
        MockModel(imageName: "https://is5-ssl.mzstatic.com/image/thumb/PurpleSource122/v4/32/50/95/32509559-5216-b557-946f-479c6eb1d55a/f702d374-cdb3-4275-b865-d464571fff52_Simulator_Screen_Shot_-_AppStore_iPhone_6s_Plus_-_2022-05-07_at_23.45.18.png/406x228bb.png"),
        MockModel(imageName: "https://is5-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/c2/13/2a/c2132a37-97e0-62f6-454f-406373998307/c939422d-0d57-4b63-baa5-160e74771f86_Simulator_Screen_Shot_-_AppStore_iPhone_6s_Plus_-_2022-05-07_at_23.45.49.png/406x228bb.png"),
        MockModel(imageName: "https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
        MockModel(imageName: "https://is4-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/3d/9c/f0/3d9cf01a-e8a3-e8cd-d40b-f74bbdb9ee01/6702d7a4-6da1-4231-b0cd-a1b323ec1db3_Simulator_Screen_Shot_-_AppStore_iPhone_6s_Plus_-_2022-05-07_at_23.46.15.png/406x228bb.png"),
        MockModel(imageName: "https://is5-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/d9/74/a0/d974a06d-54c6-34ca-52d9-427e67664a60/1eee1263-11b8-4f52-abfb-90fa3b04eb6c_Simulator_Screen_Shot_-_AppStore_iPhone_6s_Plus_-_2022-05-07_at_23.46.25.png/406x228bb.png"),
        MockModel(imageName: "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource112/v4/5a/65/c6/5a65c66f-05c2-3858-d819-66500b03f60d/5f38afef-625e-4f28-a7f6-491669326973_Simulator_Screen_Shot_-_AppStore_iPhone_6s_Plus_-_2022-05-07_at_23.50.32.png/406x228bb.png"),
        MockModel(imageName: "https://is3-ssl.mzstatic.com/image/thumb/PurpleSource122/v4/06/db/9a/06db9abe-feb5-19ad-fbcb-8e4fae2ceb61/dca39fb6-a7c6-456a-befa-f0f63ffcb44f_Simulator_Screen_Shot_-_AppStore_iPhone_6s_Plus_-_2022-05-07_at_23.50.54.png/406x228bb.png"),
        MockModel(imageName: "https://images.pexels.com/photos/2397652/pexels-photo-2397652.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
        MockModel(imageName: "https://is3-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/34/a7/3c/34a73cbc-52ef-f7f2-4a5e-65ed77857a51/c63c7b53-d564-4a04-8bf0-4dcb0377cf6d_Simulator_Screen_Shot_-_AppStore_iPhone_6s_Plus_-_2022-05-07_at_23.51.02.png/406x228bb.png"),
        MockModel(imageName: "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource112/v4/49/74/f9/4974f9a7-f289-4914-82e7-f40d16f1a1da/3effe4ae-6c7f-41aa-bcb7-4fc7d6033e2e_Simulator_Screen_Shot_-_AppStore_iPhone_6s_Plus_-_2022-05-07_at_23.51.11.png/406x228bb.png"),
        MockModel(imageName: "https://is4-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/7d/07/87/7d0787f2-71f9-907c-4082-b5f1abc7a0bb/b5cd170c-ba67-4858-8f73-e0493e699367_Simulator_Screen_Shot_-_AppStore_iPhone_6s_Plus_-_2022-05-07_at_23.51.34.png/406x228bb.png"),
        MockModel(imageName: "https://images.pexels.com/photos/1906794/pexels-photo-1906794.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
        MockModel(imageName: "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/03/39/92/0339920a-10cd-c31d-1245-eb00d0e57a85/cdfcf0fc-0f88-4237-9e9d-a1afb08724e3_iOS-5.5-in_1.jpg/392x696bb.jpg"),
        MockModel(imageName: "https://is4-ssl.mzstatic.com/image/thumb/Purple126/v4/6e/d7/70/6ed77072-6454-bff8-3391-e6d199fbb996/f3b103d9-206a-43be-8cf5-c9e907471b04_iOS-5.5-in_3.jpg/392x696bb.jpg"),
        MockModel(imageName: "https://is3-ssl.mzstatic.com/image/thumb/Purple126/v4/b9/33/2d/b9332d62-4437-116d-2c11-d240c2ceb8ca/3e7991f1-3174-48fe-bdd6-463f5113d1a1_iOS-5.5-in_5.jpg/392x696bb.jpg"),
        MockModel(imageName: "https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
    ]
}
