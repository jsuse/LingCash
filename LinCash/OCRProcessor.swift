import Vision
import UIKit

class OCRProcessor {
    func processImage(_ image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        
        let request = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            for observation in observations {
                let topCandidate = observation.topCandidates(1).first
                print(topCandidate?.string ?? "")
            }
        }
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        try? handler.perform([request])
    }
} 