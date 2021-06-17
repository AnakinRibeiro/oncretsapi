json.extract! company, :id, :name, :email, :user_id, :document_number, :is_active, :created_at, :updated_at
json.url company_url(company, format: :json)
