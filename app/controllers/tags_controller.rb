class Tag < ApplicationController
  before_action :require_user, except: [:index]
  
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end