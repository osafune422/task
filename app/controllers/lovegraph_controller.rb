class LovegraphController < ApplicationController
  def top
  end
  def about
  end
  def flow
  end
  def photos
    @requests = Request.all
  end
  def detail_photos
    @request = Request.find_by(id: params[:id])
  end
  def staffs
  end
  def login
  end
end
