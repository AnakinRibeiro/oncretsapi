module ApplicationHelper
    def value_to_show(value)
        return "#{number_with_precision(format('%.2f',value.to_f), :precision => 2, :delimiter => '.', :separator => ',')}"
    end

    def controller?(*controller)
        controller.include?(params[:controller])
    end

    def action?(*action)
        action.include?(params[:action])
    end

    def asset_exists?(subdirectory, filename)
        File.exists?(File.join(Rails.root, 'app', 'assets', subdirectory, filename))
    end

    def image_exists?(image)
        asset_exists?('images', image)
    end

    def javascript_exists?(script)
        extensions = %w(.coffee .erb .coffee.erb) + [""]
        extensions.inject(false) do |truth, extension|
            truth || asset_exists?('javascripts', "#{script}.js#{extension}")
        end
    end

    def stylesheet_exists?(stylesheet)
        extensions = %w(.scss .erb .scss.erb) + [""]
        extensions.inject(false) do |truth, extension|
            truth || asset_exists?('stylesheets', "#{stylesheet}.css#{extension}")
        end
    end

    def pack_exists?(filename)
        File.exists?(File.join(Rails.root, 'app', 'javascript', 'packs', "#{filename}.js"))
    end

    def flash_message
        messages = ""
        [:notice, :info, :warning, :error].each {|type|
            if flash[type]
                messages += "<p class=\"#{type}\">#{flash[type]}</p>"
            end
        }

        messages.html_safe
    end
end
