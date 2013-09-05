class MakeTimezoneDefaultToUtc < ActiveRecord::Migration
  def up
    change_column :availabilities, :timezone, :string, { default:
      "UTC" }
  end

  def down
    change_column :availabilities, :timezone, :string, { default: nil }
  end

end
