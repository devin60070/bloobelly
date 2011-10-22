class ShoppingTripsController < ApplicationController
  # GET /shopping_trips
  # GET /shopping_trips.json
  def index
    @shopping_trips = ShoppingTrip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shopping_trips }
    end
  end

  # GET /shopping_trips/1
  # GET /shopping_trips/1.json
  def show
    @shopping_trip = ShoppingTrip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shopping_trip }
    end
  end

  # GET /shopping_trips/new
  # GET /shopping_trips/new.json
  def new
    @shopping_trip = ShoppingTrip.new
    1.times do
      question = @shopping_trip.food_items.build
    end
    @food_names = {}
    @foods = []
    Food.all.each do |food|
      @food_names["#{food.name}"] = food.id
      @foods << food
    end
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shopping_trip }
    end
  end

  # GET /shopping_trips/1/edit
  def edit
    @shopping_trip = ShoppingTrip.find(params[:id])
  end

  # POST /shopping_trips
  # POST /shopping_trips.json
  def create
   # p = {"utf8"=>"✓", "authenticity_token"=>"jIcGQitXLtNukZjxCh11VITNOtZ09Xn5o31zRPMcuVw=",
   #    "shopping_trip"=>{"food_items_attributes"=>{"1319287074347"=>{"food"=>"rice - Small Bag", "number"=>"9"}}},
   #     "commit"=>"Create Shopping trip"}
   # 
   #@shopping_trip = ShoppingTrip.create()
   #@shopping_trip = ShoppingTrip.create()
   #@shopping_trip.food_items.create(params[:shopping_trip][:food_items_attributes])
    #params[:shopping_trip][:food_items_attributes].each do |item|
    #  @shopping_trip.food_items.create(:food_id => item[1], :number => item[2])
    #end
    
    @shopping_trip = ShoppingTrip.new({:user_id=>current_user.id},:total=>1230)
   
    respond_to do |format|
      if @shopping_trip.save
	totalusage=0
	params[:shopping_trip][:food_items_attributes].each do |item|
	  item=item[1]
	  FoodItem.create(:food_id => item['id'], :number => item['number'],:shopping_trip_id=>@shopping_trip.id)
	end
	total=0
	@shopping_trip.food_items.each do |fooditem|
	  total=total + fooditem.food.water_usage.to_i*fooditem.number.to_i
	end
	ShoppingTrip.update(@shopping_trip.id,:total=>total)
        format.html { redirect_to @shopping_trip, notice: 'Shopping trip was successfully created.' }
        format.json { render json: @shopping_trip, status: :created, location: @shopping_trip }
      else
        format.html { render action: "new" }
        format.json { render json: @shopping_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shopping_trips/1
  # PUT /shopping_trips/1.json
  def update
    @shopping_trip = ShoppingTrip.find(params[:id])

    respond_to do |format|
      if @shopping_trip.update_attributes(params[:shopping_trip])
        format.html { redirect_to @shopping_trip, notice: 'Shopping trip was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @shopping_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_trips/1
  # DELETE /shopping_trips/1.json
  def destroy
    @shopping_trip = ShoppingTrip.find(params[:id])
    @shopping_trip.destroy

    respond_to do |format|
      format.html { redirect_to shopping_trips_url }
      format.json { head :ok }
    end
  end
end
