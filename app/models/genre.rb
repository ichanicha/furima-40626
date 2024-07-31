class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '都道府県' },
    { id: 3, name: '都道府県' },
    { id: 4, name: '都道府県' },
    { id: 5, name: '都道府県' },
  ]
  include ActiveHash::Associations
  has_many :articles
end

