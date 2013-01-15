class CreatePostAds < ActiveRecord::Migration
  def change
    create_table :post_ads do |t|

      t.timestamps
    end
  end
end
