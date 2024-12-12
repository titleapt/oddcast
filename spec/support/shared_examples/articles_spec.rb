RSpec.shared_examples "article test" do |parameter|
  # Same behavior is triggered also with either `def something; 'some value'; end`
  # or `define_method(:something) { 'some value' }`
  let(:something) { parameter }
  it "allows creating an articles" do
    visit "/admin/articles"
    click_link("New article")
    fill_in("Title", with: "sometext")
    fill_in("Description", with: "desjuju")
    fill_in("Image url", with: "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg")
    click_button("Create Article")
    expect(page).to have_content "Article was successfully created."
  end
end
