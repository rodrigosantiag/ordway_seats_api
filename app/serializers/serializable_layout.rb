class SerializableLayout < JSONAPI::Serializable::Resource
  type 'layouts'

  attributes :rows, :columns

  belongs_to :venue
  has_many :seats
end