json.extract! workout, :id, :name, :description, :training_days, :user_id, :created_at, :updated_at
json.url admin_user_workout_url(worout.user, workout, format: :json)
