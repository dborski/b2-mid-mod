require 'rails_helper'

describe "Movie Show Page" do
  describe "When I visit '/movies/:movie_id'" do
    it "I see that movies info and I do not see any of the other movies" do
      
      studio1 = Studio.create!(name: "studio1", location: "location1")
      movie1 = Movie.create!(title: "movie1", creation_year: "year1", genre: "genre1", studio_id: "#{studio1.id}")
      movie2 = Movie.create!(title: "movie2", creation_year: "year2", genre: "genre2", studio_id: "#{studio1.id}")
      movie3 = Movie.create!(title: "movie3", creation_year: "year3", genre: "genre3", studio_id: "#{studio1.id}")

      visit "/movies/#{movie3.id}"

      expect(page).to have_content(movie3.title)
      expect(page).to have_content(movie3.creation_year)
      expect(page).to have_content(movie3.genre)
      expect(page).to_not have_content(movie1.title)
      expect(page).to_not have_content(movie2.title)
    end
  end
end