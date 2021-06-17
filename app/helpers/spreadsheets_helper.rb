module SpreadsheetsHelper
    def get_status(status)
        if status == 0
            'Awaiting prestressing'
        elsif status == 1
            'Prestressing in progress'
        elsif status == 2
            'Awaiting calculating approval'
        elsif status == 3
            'Finished prestressing'
        else
            ''
        end
    end
end
