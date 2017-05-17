class GenreSerializer < ActiveModel::Serializer
  attributes :id, :name

  embeds :ids
  has_many :books
end
