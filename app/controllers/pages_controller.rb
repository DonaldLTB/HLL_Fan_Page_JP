class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :test ]
  def home
  end

  def test
    our_input_text = " test"
    @test = %x{python3 lib/assets/python/test.py "#{our_input_text}"}
  end
end
