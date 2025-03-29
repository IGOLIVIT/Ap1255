//
//  GuidesViewModel.swift
//  Ap1255
//
//  Created by IGOR on 29/03/2025.
//

import SwiftUI

final class GuidesViewModel: ObservableObject {
    
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isSettings: Bool = false
    
    @Published var selectedGuide: GuidesModel?
    
    @Published var guides: [GuidesModel] = [
        
        GuidesModel(number: "Guide 1", name: "1.Dribbling Training ⚽🔥", text: """

Keep the ball close to your feet – Control is key for quick movements.

Use both feet – Train your weaker foot to improve balance.

Practice quick direction changes – Try zig-zag dribbling drills.

Look up while dribbling – Always be aware of your surroundings.

Increase speed gradually – Start slow, then build up pace

""", read: false),
        
        GuidesModel(number: "Guide 2", name: "2.Passing and Ball Control 🎯", text: """
Practice one-touch passes – Improves speed and decision-making.

Master long passes with the instep – Helps with switching play.

Control the ball before passing – A good first touch is crucial.

Communicate with teammates – Clear signals improve teamwork.
""", read: false),
        
        GuidesModel(number: "Guide 3", name: "3.Shooting and Finishing 🎯⚡", text: """
Keep your head over the ball – Helps with accuracy.

Use your laces for power shots – More force and speed.

Aim for the corners – Harder for goalkeepers to save.

Follow through after striking – Ensures a controlled shot.

Practice under pressure – Simulate real match situations.
""", read: false),

        GuidesModel(number: "Guide 4", name: "4. Defensive Skills 🛑💪", text: """
Stay on your toes – Be ready to react quickly.

Use your body positioning – Keep attackers away from goal.

Time your tackles – Avoid fouls, go for the ball.

Track your opponent’s movements – Anticipate their next move.

Communicate with defenders – Organize the defensive line.
""", read: false),
        
        GuidesModel(number: "Guide 5", name: "5.Speed and Stamina 🏃‍♂️⚡", text: """
Do sprint intervals – Helps with quick bursts of speed.

Train endurance with long runs – Improves match stamina.

Improve agility with ladder drills – Enhances footwork speed.

Use resistance training – Strengthens leg muscles for explosive runs.

Stay hydrated and eat well – Proper nutrition boosts energy.
""", read: false),
    ]
}
