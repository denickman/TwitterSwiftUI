//
//  ImagePicker.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 5/4/21.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }
 
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
                parent.mode.wrappedValue.dismiss()
            } 
        }
    }
    
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var mode

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
        // help to communicate viewcontroller with swift UI
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
}


//extension ImagePicker {
//    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//
//        let imgPicker: ImagePicker
//
//        init(_ parent: ImagePicker) {
//            self.imgPicker = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            guard let image = info[.originalImage] as? UIImage else { return }
//
//            imgPicker.image = image
//            imgPicker.mode.wrappedValue.dismiss()
//            print("Dismiss")
//        }
//    }
//}
