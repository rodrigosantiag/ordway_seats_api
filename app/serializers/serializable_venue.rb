class SerializableVenue < JSONAPI::Serializable::Resource
  type 'venues'

  attributes :name

  has_one :layout

  attribute :layout do
    unless @object.layout.blank?
      {
          rows: @object.layout.rows,
          columns: @object.layout.columns,
          seats: @object.layout.seats
      }
    end
  end
end