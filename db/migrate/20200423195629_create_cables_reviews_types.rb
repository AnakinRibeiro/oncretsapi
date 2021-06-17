class CreateCablesReviewsTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :cables_reviews_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
