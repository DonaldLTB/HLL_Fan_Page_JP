class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :test ]
  def home
  end
end
