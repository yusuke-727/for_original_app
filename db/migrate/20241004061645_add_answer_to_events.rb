class AddAnswerToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :answer, :string
  end
end
