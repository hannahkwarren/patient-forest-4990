require 'rails_helper'

RSpec.describe "Studios Index" do
    

    it "lists each studio's name and location, with all movie titles" do
        
        studio1 = Studio.create!(name: "MGM", location: "Hollywood Hills, CA")

        movie1 = studio1.movies.create!(title: "West Side Story", creation_year: 1961, genre: "Musical drama")
        movie2 = studio1.movies.create!(title: "The Princess Bride", creation_year: 1987, genre: "Comedy")

        studio2 = Studio.create!(name: "Warner Brothers", location: "Los Angeles, CA")

        movie3 = studio2.movies.create!(title: "Harry Potter and the Sorcerer's Stone", creation_year: 2001, genre: "Drama")
        movie4 = studio2.movies.create!(title: "Aquaman", creation_year: 2018, genre: "Superhero Flick")
        movie5 = studio2.movies.create!(title: "Dune", creation_year: 2021, genre: "Drama")

        visit "/studios"

        expect(page).to have_content("MGM")
        expect(page).to have_content("Warner Brothers")
        expect(page).to have_content("West Side Story")
        expect(page).to have_content("The Princess Bride")
        expect(page).to have_content("Harry Potter and the Sorcerer's Stone")
        expect(page).to have_content("Aquaman")
        expect(page).to have_content("Dune")
    end
end
