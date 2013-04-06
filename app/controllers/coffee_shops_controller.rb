class CoffeeShopsController < ApplicationController
  # GET /coffee_shops
  # GET /coffee_shops.json
  def index
    @coffee_shops = CoffeeShop.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coffee_shops }
    end
  end

  # GET /coffee_shops/1
  # GET /coffee_shops/1.json
  def show
    @coffee_shop = CoffeeShop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coffee_shop }
    end
  end

  # GET /coffee_shops/new
  # GET /coffee_shops/new.json
  def new
    @coffee_shop = CoffeeShop.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coffee_shop }
    end
  end

  # GET /coffee_shops/1/edit
  def edit
    @coffee_shop = CoffeeShop.find(params[:id])
  end

  # POST /coffee_shops
  # POST /coffee_shops.json
  def create
    @coffee_shop = CoffeeShop.new(params[:coffee_shop])

    respond_to do |format|
      if @coffee_shop.save
        format.html { redirect_to @coffee_shop, notice: 'Coffee shop was successfully created.' }
        format.json { render json: @coffee_shop, status: :created, location: @coffee_shop }
      else
        format.html { render action: "new" }
        format.json { render json: @coffee_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coffee_shops/1
  # PUT /coffee_shops/1.json
  def update
    @coffee_shop = CoffeeShop.find(params[:id])

    respond_to do |format|
      if @coffee_shop.update_attributes(params[:coffee_shop])
        format.html { redirect_to @coffee_shop, notice: 'Coffee shop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coffee_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffee_shops/1
  # DELETE /coffee_shops/1.json
  def destroy
    @coffee_shop = CoffeeShop.find(params[:id])
    @coffee_shop.destroy

    respond_to do |format|
      format.html { redirect_to coffee_shops_url }
      format.json { head :no_content }
    end
  end
end
