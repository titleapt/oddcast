require "rails_helper"

describe "validates f word", type: :system do
  before do
    @content = Content.new(
      title: "fdsfdsSxxxfdsff",
      contentable: Article.new
    )
    @content1 = Content.new(
      title: "Bxxxx",
      contentable: Article.new
    )
    @content2 = Content.new(
      title: "Fxxx",
      contentable: Article.new
    )
  end
  it "is Sxxx word in sentence must not save to data" do
    expect(@content).to_not be_valid
  end
  it "is Bxxxx word in sentence must not save data" do
    expect(@content1).to_not be_valid
  end
  it "is Fxxx word in sentence must not save data" do
    expect(@content2).to_not be_valid
  end
end
