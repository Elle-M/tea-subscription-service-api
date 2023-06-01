class ChangeStatusColumnTypeInSubscriptions < ActiveRecord::Migration[7.0]
  def change
    change_column :subscriptions, :status, 'integer USING status::integer'
  end
end
