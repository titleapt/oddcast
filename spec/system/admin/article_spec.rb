require "rails_helper"

describe "super articles management", type: :system do
  it_behaves_like "article test"
  before do
    @articles = create_list(:article, 4)
  end


  it "allows submit to review" do
    visit "/admin/articles"
    click_link("New article")
    fill_in("Title", with: "Fxxxsklfdsl")
    fill_in("Description", with: "desjuju")
    fill_in("Image url", with: "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg")
    click_button("Create Article")
    expect(page).to have_content "cannot contain forbidden word"
  end

  # it "allows submit to review" do
  #   visit "/admin/articles"
  #   click_link("Show this article")
  #   click_button("Submit")
  #   expect(page).to have_content "Article was successfully submitted to review"
  # end
end
