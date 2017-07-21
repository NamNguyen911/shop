class GuestsController < ApplicationController
  load_and_authorize_resource

  def index
    @guests = Guest.all
  end
end
