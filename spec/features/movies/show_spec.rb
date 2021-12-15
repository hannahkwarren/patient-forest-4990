require 'rails_helper'

RSpec.describe "Movies show" do
    
    # As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors

    it "provides movie's title, creation year, and genre w/ actors" do
    
        studio1 = Studio.create!(name: "MGM", location: "Hollywood Hills, CA")
        movie1 = studio1.movies.create!(title: "West Side Story", creation_year: 1961, genre: "Musical drama")
        movie2 = studio1.movies.create!(title: "The Princess Bride", creation_year: 1987, genre: "Comedy")
        
        rita = movie1.actors.create!(name: "Rita Moreno", age: 75)
        natalie = movie1.actors.create!(name: "Natalie Wood", age: 43)

        visit "/movies/#{movie1.id}"

        expect(page).to have_content("#{movie1.title}")
        expect(page).to have_content("#{movie1.creation_year}")
        expect(page).to have_content("#{movie1.genre}")
        expect(page).to have_content("Average Actor Age: 59")
        expect(natalie.name).to appear_before(rita.name)

        expect(page).to_not have_content("#{movie2.title}")
        expect(page).to_not have_content("#{movie2.creation_year}")
        expect(page).to_not have_content("#{movie2.genre}")
    end
end
