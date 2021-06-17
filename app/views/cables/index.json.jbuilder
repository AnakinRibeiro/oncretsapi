json.array! @cables do |c|
    json.merge! c.attributes
    json.elongations c.elongations.reverse do |e|
        json.merge! e.attributes
        #json.cables_review_type do
        #    json.merge! e.cables_reviews_type.attributes
        #end
    end
end  