class LovegraphController < ApplicationController
  def top
  end
  def about
  end
  def flow
  end
  def photos
    @requests = Request.all.order("updated_at ASC")
  end
  def detail_photos
    @request = Request.find_by(id: params[:id])
  end
  def staffs
    @workers=Worker.all
  end
  def login
  end
end
