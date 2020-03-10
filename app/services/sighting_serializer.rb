class SightingSerializer
  def initialize(sighting_object)
    @sighting = sighting_object
  end

  def to_serialized_jsom
    options = {
      include: {
        bird: { only: [:name, :species] },
        location: { only: [:latitude, :longitude]}
      },
      except: [:updated_at],
    }
    @sighting.to_json(options)

    
    # TO_JSON too messy
    # @sighting.to_json(:include => {
    #   :bird => {
    #     :only =>[:name, :species]
    #   }, 
    #   :location => {
    #     :only =>[:latitude, :longitude]
    #   }
    # }, :except => [:updated_at])
    
  end
end