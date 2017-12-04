class AddSocialLoginColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :provider, :string
    add_column :usuarios, :uid, :string
    add_column :usuarios, :name, :string
  end
end
