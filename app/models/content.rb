class Content < ApplicationRecord
  belongs_to :contentable, polymorphic: true
end
