require 'rails_helper'

describe "user sees all studios" do
  describe "they visit /studios" do
    it "displays all studios" do

      studio1 = Studio.create!(name: "studio1", location: "location1")
      studio2 = Studio.create!(name: "studio2", location: "location2")

      movie1 = Movie.create!(title: "movie1", creation_year: "year1", genre: "genre1", studio_id: "#{studio1.id}")
      movie2 = Movie.create!(title: "movie2", creation_year: "year2", genre: "genre2", studio_id: "#{studio1.id}")
      movie3 = Movie.create!(title: "movie3", creation_year: "year3", genre: "genre3", studio_id: "#{studio2.id}")

      visit '/studios'

      within "#studio-#{studio1.id}" do
        expect(page).to have_content(studio1.name)
        expect(page).to have_content(studio1.location)
        expect(page).to have_content(movie1.title)
        expect(page).to have_content(movie2.title)
      end

      within "#studio-#{studio2.id}" do
        expect(page).to have_content(studio2.name)
        expect(page).to have_content(studio2.location)
        expect(page).to have_content(movie3.title)
      end
    end
  end
end