class CreateSocialAnalysts < ActiveRecord::Migration[5.0]
  def change
    create_table :social_analysts do |t|

      t.timestamps
    end
  end
end
