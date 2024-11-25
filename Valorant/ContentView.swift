//
//  ContentView.swift
//  Valorant
//
//  Created by Jatin Singh on 25/11/24.
//

import SwiftUI

@MainActor
class AgentsViewModel: ObservableObject {
    @Published var agents: [Agent] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchAgents() async {
        isLoading = true
        errorMessage = nil
        
        do {
            guard let url = URL(string: "https://valorant-api.com/v1/agents") else {
                throw URLError(.badURL)
            }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON:", jsonString)
            }
            
            let decoder = JSONDecoder()
            let response = try decoder.decode(ApiResponse.self, from: data)
            agents = response.data.filter { $0.isPlayableCharacter }
            
        } catch {
            errorMessage = error.localizedDescription
            print("Decoding Error:", error)
        }
        
        isLoading = false
    }
}



struct ContentView: View {
    @StateObject private var viewModel = AgentsViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    VStack {
                        Text("Error")
                            .font(.title)
                            .foregroundColor(.red)
                        Text(error)
                            .foregroundColor(.secondary)
                    }
                } else {
                    List(viewModel.agents) { agent in
                        NavigationLink {
                            AgentDetailView(agent: agent)
                        } label: {
                            AgentRow(agent: agent)
                        }
                    }
                }
            }
            .navigationTitle("Valorant Agents")
        }
        .task {
            await viewModel.fetchAgents()
        }
    }
}

#Preview {
    ContentView()
}
