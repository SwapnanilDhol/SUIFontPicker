import UIKit
import SwiftUI

public struct SUIFontPicker: UIViewControllerRepresentable {

    @Environment(\.presentationMode) var presentationMode
    private let onFontPick: (UIFontDescriptor) -> Void

    public init(onFontPick: @escaping (UIFontDescriptor) -> Void) {
        self.onFontPick = onFontPick
    }

    public func makeUIViewController(context: UIViewControllerRepresentableContext<SUIFontPicker>) -> UIFontPickerViewController {
        let configuration = UIFontPickerViewController.Configuration()
        configuration.includeFaces = true
        configuration.displayUsingSystemFont = true

        let vc = UIFontPickerViewController(configuration: configuration)
        vc.delegate = context.coordinator
        return vc
    }

    public func makeCoordinator() -> SUIFontPicker.Coordinator {
        return Coordinator(self, onFontPick: self.onFontPick)
    }

    public class Coordinator: NSObject, UIFontPickerViewControllerDelegate {

        var parent: SUIFontPicker
        private let onFontPick: (UIFontDescriptor) -> Void


        init(_ parent: SUIFontPicker, onFontPick: @escaping (UIFontDescriptor) -> Void) {
            self.parent = parent
            self.onFontPick = onFontPick
        }

        public func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
            guard let descriptor = viewController.selectedFontDescriptor else { return }
            onFontPick(descriptor)
            parent.presentationMode.wrappedValue.dismiss()
        }

        public func fontPickerViewControllerDidCancel(_ viewController: UIFontPickerViewController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    public func updateUIViewController(_ uiViewController: UIFontPickerViewController,
                                       context: UIViewControllerRepresentableContext<SUIFontPicker>) {

    }
}
