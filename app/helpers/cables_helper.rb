module CablesHelper
    def get_status(status)
        if status == 0 
            "Waiting Prestessing"
        else
            "Postensionaded"
        end
    end
end
