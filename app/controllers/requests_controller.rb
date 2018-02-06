class RequestsController < ApplicationController
  before_action :authenticate_worker, {only:[:index_request, :detail_request, :send_picture, :upload_picture]}
  
  def detail_request
    @request = Request.find_by(id: params[:id])
  end
  
  def input_screen
    @request = Request.new
  end

  def create
    @request = Request.new(
      genre: params[:genre], 
      place: params[:place], 
      date: params[:date], 
      name: params[:name], 
      phone: params[:phone],
      user_id: @current_user.id
      )

    if @request.save
      flash[:notice] = "お申し込みを受け付けました"
      redirect_to("/mypage/#{@request.user_id}")
    else
      render("requests/input_screen")
    end
  end

  def index_request
    @requests = Request.all.order("date DESC")   #日付で並べ替え
  end
  
  def send_pictures
    @request = Request.find_by(id: params[:id])
  end
  
  def upload
    @request = Request.find_by(id:params[:id])
    
    FileUtils.mkdir_p("public/pictures/#{@request.date.year}/#{@request.date.month}/#{@request.date.day}/#{@request.name}") unless FileTest.exist?("public/pictures/#{@request.date.year}/#{@request.date.month}/#{@request.date.day}/#{@request.name}")
    
    if params[:pic1]
      @request.pic1 = "#{@request.date}_1.jpg"
      pic1 = params[:pic1]
      File.binwrite("public/pictures/#{@request.date.year}/#{@request.date.month}/#{@request.date.day}/#{@request.name}/#{@request.pic1}", pic1.read)
    end
    if params[:pic2]
      @request.pic2="#{@request.date}_2.jpg"
      pic2 = params[:pic2]
      File.binwrite("public/pictures/#{@request.date.year}/#{@request.date.month}/#{@request.date.day}/#{@request.name}/#{@request.pic2}", pic2.read)
    end
    if params[:pic3]
      @request.pic3="#{@request.date}_3.jpg"
      pic3 = params[:pic3]
      File.binwrite("public/pictures/#{@request.date.year}/#{@request.date.month}/#{@request.date.day}/#{@request.name}/#{@request.pic3}", pic3.read)
    end
    if params[:pic4]
      @request.pic4="#{@request.date}_4.jpg"
      pic4 = params[:pic4]
      File.binwrite("public/pictures/#{@request.date.year}/#{@request.date.month}/#{@request.date.day}/#{@request.name}/#{@request.pic4}", pic4.read)
    end
    if params[:pic5]
      @request.pic5="#{@request.date}_5.jpg"
      pic5 = params[:pic5]
      File.binwrite("public/pictures/#{@request.date.year}/#{@request.date.month}/#{@request.date.day}/#{@request.name}/#{@request.pic5}", pic5.read)
    end
    if params[:pic6]
      @request.pic6 = "#{@request.date}_6.jpg"
      pic6 = params[:pic6]
      File.binwrite("public/pictures/#{@request.date.year}/#{@request.date.month}/#{@request.date.day}/#{@request.name}/#{@request.pic6}", pic6.read)
    end
    if params[:pic7]
      @request.pic7="#{@request.date}_7.jpg"
      pic7 = params[:pic7]
      File.binwrite("public/pictures/#{@request.date.year}/#{@request.date.month}/#{@request.date.day}/#{@request.name}/#{@request.pic7}", pic7.read)
    end
    if params[:pic8]
      @request.pic8="#{@request.date}_8.jpg"
      pic8 = params[:pic8]
      File.binwrite("public/pictures/#{@request.date.year}/#{@request.date.month}/#{@request.date.day}/#{@request.name}/#{@request.pic8}", pic8.read)
    end
    if params[:pic9]
      @request.pic9="#{@request.date}_9.jpg"
      pic9 = params[:pic9]
      File.binwrite("public/pictures/#{@request.date.year}/#{@request.date.month}/#{@request.date.day}/#{@request.name}/#{@request.pic9}", pic9.read)
    end
    if params[:pic10]
      @request.pic10="#{@request.date}_10.jpg"
      pic10 = params[:pic10]
      File.binwrite("public/pictures/#{@request.date.year}/#{@request.date.month}/#{@request.date.day}/#{@request.name}/#{@request.pic10}", pic10.read)
    end
    
    if @request.save
      flash[:notice] = "画像を登録しました"
      redirect_to("/requests/detail/#{@request.id}")
    else
      render("requests/send_picture")
    end  
  end
  
  def cancel
    @request = Request.find_by(id: params[:id])
    @request.destroy
    flash[:notice] = "予定をキャンセルしました"
    redirect_to("/mypage/#{@current_user.id}")
      
  end
  
end
