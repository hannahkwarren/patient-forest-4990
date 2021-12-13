universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

studio1 = Studio.create!(name: "MGM", location: "Hollywood Hills, CA")

studio1.movies.create!(title: "West Side Story", creation_year: 1961, genre: "Musical drama")
studio1.movies.create!(title: "The Princess Bride", creation_year: 1987, genre: "Comedy")

studio2 = Studio.create!(name: "Warner Brothers", location: "Los Angeles, CA")

studio2.movies.create!(title: "Harry Potter and the Sorcerer's Stone", creation_year: 2001, genre: "Drama")
studio2.movies.create!(title: "Aquaman", creation_year: 2018, genre: "Superhero Flick")
studio2.movies.create!(title: "Dune", creation_year: 2021, genre: "Drama")

