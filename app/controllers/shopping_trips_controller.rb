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
