class CategorySerializer < ActiveModel::Serializer
  attributes :name, :artists, :songs

end
