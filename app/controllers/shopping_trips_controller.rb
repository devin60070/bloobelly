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
    @shopping_trip = ShoppingTrip.new(params[:shopping_trip])

    respond_to do |format|
      if @shopping_trip.save
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
