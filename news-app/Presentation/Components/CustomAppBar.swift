import SwiftUI

struct CustomAppBar: View {
    var body: some View {
        HStack {
            Button(action: {
                // TODO: Handle menu action
            }) {
                Image(systemName: "line.3.horizontal")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(AppColors.maroon)
            }
            
           // Spacer()
            
            Text("NEWSWIRE")
                .font(.system(size: 28, weight: .heavy, design: .default))
                .italic()
                .foregroundColor(AppColors.maroon)
            
            Spacer()
            
            Button(action: {
                // TODO: Handle notification action
            }) {
                Image(systemName: "bell")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(AppColors.maroon)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            Color.white
                .shadow(color: .black.opacity(0.15), radius: 4, y: 2)
        )
    }
}

#Preview {
    VStack {
        CustomAppBar()
        Spacer()
    }
}
