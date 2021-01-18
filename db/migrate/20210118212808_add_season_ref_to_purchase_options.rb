class AddSeasonRefToPurchaseOptions < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchase_options, :season
    add_reference :purchase_options, :movie
  end
end
