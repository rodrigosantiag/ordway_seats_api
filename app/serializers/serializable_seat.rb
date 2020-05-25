class SerializableSeat < JSONAPI::Serializable::Resource
  type 'seats'

  attributes :row, :column, :status

  belongs_to :layout
end