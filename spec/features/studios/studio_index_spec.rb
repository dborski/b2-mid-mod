require 'rails_helper'

describe "user sees all studios" do
  describe "they visit /studios" do
    it "displays all studios" do

      studio1 = Studio.new(name: "studio1", location: "location1")
      studio2 = Studio.new(name: "studio2", location: "location2")

      movie1 = Movie.new(title: "movie1", creation_year: "year1", genre: "genre1", studio_id: "#{studio1.id}")
      movie2 = Movie.new(title: "movie2", creation_year: "year2", genre: "genre2", studio_id: "#{studio1.id}")
      movie3 = Movie.new(title: "movie3", creation_year: "year3", genre: "genre3", studio_id: "#{studio2.id}")

      visit "/studios"

      within("#studio-#{studio1.id}") do
        expect(page).to have_content(studio1.name)
        expect(page).to have_content(studio1.location)
        expect(page).to have_content(movie1.name)
        expect(page).to have_content(movie2.name)
      end

      within("#studio-#{studio2.id}") do
        expect(page).to have_content(studio2.name)
        expect(page).to have_content(studio2.location)
        expect(page).to have_content(movie3.name)
      end
    end
  end
end