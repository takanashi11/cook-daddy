class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '朝食' },
    { id: 3, name: '昼食' },
    { id: 4, name: '夕食' },
  ]

  include ActiveHash::Associations
  has_many :recipes
  end