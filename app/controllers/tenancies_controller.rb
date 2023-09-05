class TenanciesController < ApplicationController
  def create
    @tenancy = Tenancy.new(tenancy_params)
    @property = Property.find(params[:property_id])
    @tenancy.property = @property

    @user = User.where(email: params[:tenancy][:email]).first
    @tenancy.user = @user

    if @tenancy.save
      redirect_to property_path(@property)
    else
      render property_path(@property), status: :unprocessable_entity
    end
  end

  def index
    @properties = Property.where("user_id = ?", current_user.id)
  end

  private

  def tenancy_params
    params.require(:tenancy).permit(:start_date, :end_date)
  end
end
