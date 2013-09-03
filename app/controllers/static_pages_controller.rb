class StaticPagesController < ApplicationController
  def home
  end

  def services
  end

  def customers
  end

  def about
  end

  def contact
    

    @json = Gmaps4rails.geocode("5328 Tate Ave 75093").to_json
  end
end
