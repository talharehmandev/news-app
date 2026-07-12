import SwiftUI

struct FrameDemoView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                Text("width: 200, height: 80")
                    .font(.caption)
                    .foregroundColor(.gray)
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 200, height: 80)
                // Always exactly 200x80, no matter what.
                
                Divider()
                
                Text("maxWidth: .infinity, height: 80")
                    .font(.caption)
                    .foregroundColor(.gray)
                Rectangle()
                    .fill(Color.green)
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                // Stretches to fill full screen width, but height stays locked at 80.
                
                Divider()
                
                Text("maxWidth: 200, maxHeight: 150")
                    .font(.caption)
                    .foregroundColor(.gray)
                Rectangle()
                    .fill(Color.orange)
                    .frame(maxWidth: 200, maxHeight: 150)
                // Width CAN grow up to 200, height CAN grow up to 150.
                // Since Rectangle has no natural size, it'll shrink small unless something forces it bigger.
                
                Divider()
                
                Text("maxWidth: .infinity, maxHeight: 200")
                    .font(.caption)
                    .foregroundColor(.gray)
                Rectangle()
                    .fill(Color.purple)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                // Fills all available width, capped at 200 tall.
                
            }
            .padding()
        }
    }
}

#Preview {
    FrameDemoView()
}
