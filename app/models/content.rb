class Content < ApplicationRecord
  belongs_to :contentable, polymorphic: true
  enum :state, { draft: 0, in_review: 1, published: 2 } do
    event :submit_to_review do
      transition :draft => :in_review
    end

    event :approved do
      transition :in_review => :published
    end

    event :reject do
      transition :in_review => :draft
    end
  end
  validate :no_forbidden_words_in_title

  private
  def no_forbidden_words_in_title
    forbidden_words = load_forbidden_words

    forbidden_words.each do |word|
        if title&.include?(word)
        errors.add(:title, "cannot contain forbidden word")
        end
    end
  end

  def load_forbidden_words
    csv_path = Rails.root.join('config', 'f_word.csv')
    return [] unless File.exist?(csv_path)

    CSV.read(csv_path).flatten.compact.map(&:strip)
    rescue CSV::MalformedCSVError => e
      Rails.logger.error "Error reading forbidden words CSV: #{e.message}"
      []
  end
end
