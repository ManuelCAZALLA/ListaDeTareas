//
//  ContentView.swift
//  TodoList
//
//  Created by Manuel Cazalla Colmenero on 11/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var description: String = ""
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Añade una tarea")
                    .underline()
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16)
                TextEditor(text: $description)
                    .foregroundColor(.gray)
                    .frame(height: 100)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(.green, lineWidth: 2)
                    )
                    .padding(.horizontal, 12)
                    .cornerRadius(3.0)
                
                Button("Crear") {
                    viewModel.saveNote(description: description)
                    description = ""
                }
                .buttonStyle(.bordered)
                .tint(.green)
                Spacer()
                List {
                    ForEach($viewModel.notes, id: \.id) { $note in
                        HStack {
                            if note.isFavorite {
                                Text("⭐️")
                            }
                            Text(note.description)
                        }
                        .swipeActions(edge: .trailing) {
                            Button {
                                viewModel.updateFavoriteNote(note: $note)
                            }label: {
                                Label( "Favorito", systemImage: "start.fill")
                            }
                            .tint(.yellow)
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                viewModel.removeNote(withId: note.id)
                            }label: {
                                Label( "Borrar", systemImage: "trash.fill")
                            }
                            .tint(.red)
                            
                        }
                    }
                }
                .navigationTitle("Lista de Tareas")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Text(viewModel.getNumberOfNotes())
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
