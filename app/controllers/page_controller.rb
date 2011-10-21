class PageController < ApplicationController
  before_filter :require_login, :only => :about

  def home
  end

  def about
  end
end
