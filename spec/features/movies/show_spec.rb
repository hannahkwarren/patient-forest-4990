require 'rails_helper'

RSpec.describe "Movies show" do
    
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

#     Story 3
# Add an Actor to a Movie

# As a user,
# When I visit a movie show page,
# I do not see any actors listed that are not part of the movie
# And I see a form to add an actor to this movie
# When I fill in the form with the name of an actor that exists in the database
# And I click submit
# Then I am redirected back to that movie's show page
# And I see the actor's name is now listed
# (You do not have to test for a sad path, for example if the name submitted is not an existing actor)

    it 'associates searched actors with a movie' do 
        studio1 = Studio.create!(name: "MGM", location: "Hollywood Hills, CA")
        movie1 = studio1.movies.create!(title: "West Side Story", creation_year: 1961, genre: "Musical drama")

        rita = movie1.actors.create!(name: "Rita Moreno", age: 75)
        natalie = Actor.create!(name: "Natalie Wood", age: 43)

        visit "/movies/#{movie1.id}"
        expect(page).to have_content(@rita.name)
        expect(page).to_not have_content(@natalie.name)

        fill_in :search, with: "Nat"
        expect(page).to have_content(@natalie.name)

        click_link "Add"

    end
end
