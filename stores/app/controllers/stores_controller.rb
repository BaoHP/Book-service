class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def delete
  end
end
