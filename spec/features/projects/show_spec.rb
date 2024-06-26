require "rails_helper"

RSpec.describe "A Projects Show Page" do
    before(:each) do
        @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000,)

        @news_chic = Project.create(name: "News Chic", material: "Newspaper", challenge_id: @recycled_material_challenge.id)
        @boardfit = Project.create(name: "Boardfit", material: "Cardboard Boxes", challenge_id: @recycled_material_challenge.id)

        @upholstery_tux = Project.create(name: "Upholstery Tuxedo", material: "Couch", challenge_id: @furniture_challenge.id)
        @lit_fit = Project.create(name: "Litfit", material: "Lamp", challenge_id: @furniture_challenge.id)

        @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
        @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
        @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)


        ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
        ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
        ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
        ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
        ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
        ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
    end

    describe "As a visitor" do
        describe "when I visit a project's show page" do
            describe "I see that project's name and material" do
                it "can show project's name and material" do

                    visit "/projects/#{@news_chic.id}"
                    
                    expect(page).to have_content("#{@news_chic.name}")
                    expect(page).to have_content("#{@news_chic.material}")
                end
            end

            describe "and I see the theme of the challenge that this project belongs to" do
                it "can show theme of the challenge that project belongs to" do

                    visit "/projects/#{@news_chic.id}"

                    expect(page).to have_content("#{@news_chic.challenge.theme}")
                end
            end
        end
    end
end

