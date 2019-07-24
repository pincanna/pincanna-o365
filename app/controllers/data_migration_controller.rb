class DataMigrationController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = current_user
    if @user.data_migration
      redirect_to root_path, notice: 'You have already requested a data migration.'
    else
      @user.create_data_migration
      redirect_to root_path, notice: 'You have successfully requested a data migration.'
    end
  end
end
