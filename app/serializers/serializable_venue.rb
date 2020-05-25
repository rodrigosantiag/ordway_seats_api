class SerializableVenue < JSONAPI::Serializable::Resource
  type 'venues'

  attributes :name

  has_one :layout do
    data do
      @object.layout.seats unless @object.layout.blank?
    end
  end
end