module ConstructionsHelper
    def get_image_activity(activities_type_id)
        if activities_type_id == 1
            return '<span class="fa-stack"><em class="icon-layers fa-stack-2x text-purple"></em><em class="fas fa-cloud-upload-alt fa-stack-1x fa-inverse text-white"></em></span>'.html_safe
        elsif activities_type_id == 2
            return '<span class="fa-stack"><em class="fa fa-circle fa-stack-2x text-info"></em><em class="far fa-file-alt fa-stack-1x fa-inverse text-white"></em></span>'.html_safe
        end
    end
end
