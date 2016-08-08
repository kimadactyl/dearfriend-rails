class StaticPagesController < ApplicationController
  def index
    @events = Event.count > 0 ? true : false
  end
end
