class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @properties = Property.geocoded.map
    @properties = Property.all
    if params[:query].present?
      sql_subquery = "city ILIKE :query OR prefecture ILIKE :query"
      @properties = @properties.where(sql_subquery, query: "%#{params[:query]}%")
    end
    if params[:bedrooms].present?
      @properties = @properties.where("bedrooms >= ?", params[:bedrooms])
    end
    if params[:min_price].present?
      @properties = @properties.where("price >= ?", params[:min_price].to_f)
    end
    if params[:max_price].present?
      @properties = @properties.where("price <= ?", params[:max_price].to_f)
    end

    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {property: property}),
        marker_html: render_to_string(partial: "marker", locals: {property: property})
      }
    end
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      redirect_to user_properties_path, notice: 'Property was successfully created.'
    else
      render :new
    end
  end

  def destroy
    property = Property.find(params[:id])
    property.destroy
    redirect_to user_properties_path, status: :see_other
  end

  def user_properties
    @properties = Property.where(user: current_user)
  end

  def show
    @property = Property.find(params[:id])
    current_view_count = @property.views.nil? ? 0 : @property.views
    @property.update(views: current_view_count + 1)
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    @property.update(property_params) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to user_properties_path(@property)
  end

  def favourite
    binding.break
  end

  private

  def property_params
    params.require(:property).permit(:price, :age, :city, :prefecture, :address, :bedrooms, :size_building, :size_land, :bathrooms, :description, photos: [])
  end
end
