import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack() {
            ZStack(alignment: .bottomTrailing){
                Image("profileimg") // Add your image to Assets
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 6)
                                ) .shadow(radius: 8)
                Button{
                    
                }label: {
                    Image(systemName: "pencil").foregroundColor(.white)
                        .frame(width: 35, height: 35)
                        .background(.red)
                        .clipShape(Circle())
                        .overlay(
                                                Circle()
                                                    .stroke(Color.white, lineWidth: 3)
                                            )
                    
                    
                }
            }.padding(.bottom,10)
            
            Text("Talha Rehman").font(.system(size: 20,weight: .bold))
            Text("Senior Editor • London, UK").font(.system(size: 16)).padding(.bottom,10)
            
            Text("Premium Member").foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Capsule().fill(.red)).padding(.bottom,10)
           
                
            
            HStack{
                StatCard(
                              value: "124",
                              title: "Bookmarks",
                              valueColor: .red
                          )
                Spacer()
                StatCard(
                              value: "8.2k",
                              title: "Points",
                              valueColor: .green
                          )
            }.padding(.bottom, 10)
            
            Text("Genral").frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 19,weight: .bold))
            
            VStack{
                
                SettingsRow(
                               icon: "person.fill",
                               iconColor: .red,
                               iconBackground: Color.red.opacity(0.12),
                               title: "Account",
                               trailingText: "Verified"
                           )

            }
            
            Spacer()
        }
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.background.ignoresSafeArea())
    }
}

#Preview {
    ProfileView()
}


struct StatCard: View {
    let value: String
    let title: String
    let valueColor: Color

    var body: some View {
        VStack(spacing: 1) {
            Text(value)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(valueColor)

            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.black)
                .tracking(2)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 6)
    }
}


struct SettingsRow: View {

    let icon: String
    let iconColor: Color
    let iconBackground: Color
    let title: String
    let trailingText: String?

    var body: some View {

        HStack {

            // Icon
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(iconBackground)
                    .frame(width: 56, height: 56)

                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(iconColor)
            }

            // Title
            Text(title)
                .font(.title3)

            Spacer()

            // Right Text
            if let trailingText = trailingText {
                Text(trailingText)
                    .font(.title3)
                    .foregroundColor(.brown)
            }

            Image(systemName: "chevron.right")
                .font(.title3)
                .foregroundColor(.brown)
        }
        .padding(.horizontal, 24)
        .frame(height: 90)
    }
}
